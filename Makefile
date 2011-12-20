SHELL = /bin/bash

LUA_PATH = "$(shell lua -l luarocks.loader -e 'print(package.path..";src/?.lua")')"
lunit = $(shell command -v lunit)
files = $(shell git ls-files)
tasks = $(shell sed -run "s/^(\w+):(.*)/\1/p" Makefile)

.SILENT:

help:
	echo "Tasks:"
	$(foreach task, $(tasks), echo "  - $(task)";)
	echo
	echo "Sources:"
	$(foreach file, $(files), echo "  - $(file)";)

test: test/test_*.lua
	$(foreach test, $^, LUA_PATH=$(LUA_PATH) $(lunit) $(test);)

