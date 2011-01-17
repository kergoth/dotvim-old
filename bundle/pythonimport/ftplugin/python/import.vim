" python_import v0.1
"
" copyright 2007 Jason Lunz <lunz@falooley.org>
"
" This program is free software; you can redistribute it and/or
" modify it under the terms of the GNU General Public License
" as published by the Free Software Foundation; either version 2
" of the License, or (at your option) any later version.
"
" 
" This plugin defines two mappings for automatically cleaning up the imports
" in a python module or program. This means:
"
" - removing unused imports
" - sorting and formatting the remaining imports
"
" This function is mapped to <LocalLeader>i (for "import") in two contexts.
" In Normal mode, it operates on the current paragraph.
" In Visual mode, it operates on the selected range.

if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

if exists("loaded_PyImport")
	finish
endif
let loaded_PyImport = 1

if !hasmapto('<Plug>PyImportCleanup', 'v')
	vmap <unique> <LocalLeader>i <Plug>PyImportCleanup
endif

if !hasmapto('<Plug>PyImportCleanup', 'n')
	nmap <unique> <LocalLeader>i Vapt<LocalLeader>i
endif

noremap <unique> <script> <Plug>PyImportCleanup :call Cleanup()<CR>

function Cleanup() range
:'<,'> python << ENDPY
from copy import deepcopy
from itertools import chain
from optparse import OptionParser
from sys import argv
from token import NAME
from tokenize import generate_tokens
from unittest import main as test, TestCase
from vim import current

class ImportParseException(Exception):
    pass

def parse_import(line):
    try:
        from_, module, import_, rest = line.split(None, 3)
    except ValueError:
        raise ImportParseException(line)

    if (from_, import_) != ('from', 'import'):
        raise ImportParseException(line)

    symbols = [ s.strip() for s in rest.split(',') ]

    return module, symbols

def parse_splat_import(line):
    try:
        import_, rest = line.split(None, 1)
        assert import_ == 'import'
    except (ValueError, AssertionError):
        raise ImportParseException(line)

    return set((s.strip() for s in rest.split(',')))

class DefaultDict(dict):
    def __init__(self, default=None):
        self.default = default

    def __getitem__(self, key):
        if key in self:
            return self.get(key)
        else:
            return self.setdefault(key, deepcopy(self.default))

def gather_imports(lines):
    imports = DefaultDict(set())
    splats = set()

    prev = ''
    for line in lines:
        if prev:
            line = prev + line
            prev = ''

        if line.endswith('\\'):
            prev = line[:-1]
            continue

        if not line.strip():
            continue

        try:
            module, symbols = parse_import(line)
        except ImportParseException:
            splats |= parse_splat_import(line)
        else:
            for s in symbols:
                imports[module].add(s)

    return imports, splats

def used_symbols(lines, bskip, eskip):
    liter = iter(lines)
    def readline():
        return liter.next() + '\n'

    # always consider '*' a valid import
    used = set(('*'))
    for ttype, token, begin, end, line in generate_tokens(readline):
	row = begin[0] - 1
	if bskip <= row <= eskip:
		continue

        if ttype == NAME:
            used.add(token)

    return used

def split_import(imp):
    '''
    Given a set of individual symbol imports, iterate over the locally-bound
    name for each one. eg:

    'foo as bar' -> 'bar'
    'os.path' -> 'os'
    'baz' -> 'baz'
    '''

    try:
        dummy, as_, symbol = imp.split(None, 2)
        yield symbol
    except ValueError:
        yield imp.split('.')[0]

def cull_unused(used, imports):
    remove = set()
    for imp in imports:
        for s in split_import(imp):
            if s not in used:
                remove.add(imp)
                break

    imports -= remove

def add_wrapped_import(output, module, symbols, maxlen=78):
    lower_syms = []
    upper_syms = []
    other_syms = []

    for s in symbols:
        if s.islower():
            lower_syms.append(s)
        elif s.isupper():
            upper_syms.append(s)
        else:
            other_syms.append(s)

    line = 'from %s import ' % module

    stricmp = lambda a, b: cmp(a.lower(), b.lower())
    for s in chain(sorted(lower_syms), sorted(other_syms, stricmp), sorted(upper_syms)):
        line = line or 'from %s import ' % module
        if len(line) + len(s) > maxlen:
            output.append(line[:-2])
            line = 'from %s import %s, ' % (module, s)
        else:
            line += s + ', '

    if line:
        output.append(line[:-2])

def format_imports(imports, splats):
    new = [ 'import ' + s for s in sorted(splats) ]
    for module, symbols in sorted(imports.iteritems()):
        if symbols:
            add_wrapped_import(new, module, symbols)
    return new

def main():
    used_tokens = used_symbols(current.buffer, current.range.start, current.range.end)
    imports, splats = gather_imports(current.range) 

    cull_unused(used_tokens, splats)
    for i in imports.itervalues():
        cull_unused(used_tokens, i)

    current.range[:] = format_imports(imports, splats)

if __name__ == '__main__':
    main()

ENDPY
endfunction
