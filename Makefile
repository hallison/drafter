lua = LUA_PATH="src/?.lua" lua -l testutils

none:
	@echo "None"

tests: test/test_*.lua
	@$(foreach test, $^, echo "Start test suite $(test)"; $(lua) $(test);)
