lua = LUA_PATH="src/?.lua" lua -l testutils
files = $(shell git ls-files)
tasks = $(shell sed -run "s/^(\w+):(.*)/\1/p" Makefile)

.SILENT:

help:
	echo "Tasks:"
	$(foreach task, $(tasks), echo "  - $(task)";)
	echo
	echo "Sources:"
	$(foreach file, $(files), echo "  - $(file)";)

tests: test/test_*.lua
	$(foreach test, $^, $(lua) $(test);)

