SHELL     = /bin/bash
LUA_PATH  = LUA_PATH="$(shell lua -l luarocks.loader -e 'print(package.path..";src/?.lua")')"
LUA_CPATH = LUA_CPATH="$(shell lua -l luarocks.loader -e 'print(package.cpath)')"
module    = drafter
files     = $(shell git ls-files)
targets   = $(shell sed -run "s/^(\w+):(.*)/\1/p" Makefile)
docdir    = doc
test  	 	= *

lunit    = $(LUA_PATH) $(LUA_CPATH) $(shell command -v lunit)
luadoc   = $(LUA_PATH) $(LUA_CPATH) $(shell command -v luadoc) -d $(docdir)

.SILENT:
.PHONY: doc

help:
	echo "Targets:"
	$(foreach target, $(targets), echo "  - $(target)";)
	echo
	echo "Sources:"
	$(foreach file, $(files), echo "  - $(file)";)

check: test/test_$(test).lua
	$(foreach test, $^, $(lunit) $(test);)

doc: src/$(module)/*
	$(luadoc) $^
