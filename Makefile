lua = LUA_PATH="src/?.lua" lua -l testutils

none:
	@echo "None"

test: test/test_*.lua
	@$(foreach test, $^, $(lua) $(test);)
