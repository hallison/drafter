require("prigner.utils")

test = { case = {} }

local check = function(pass, message)
  if assert(pass, message) then
    printf("%s", ".")
  else
    printf("%s", "!")
  end
end

assert_failure = function(func, ...)
  check(not pcall(func, ...))
end

assert_success = function(func, ...)
  check(pcall(func, ...))
end

assert_not_nil = function(var)
  check(var)
end

assert_equal = function(value, test, msg)
  check(value == test)
end

test.setup = function()
  return "setup not implemented"
end

test.teardown = function()
  return
end

test.run = function()
  for title, case in pairs(test.case) do
    test.setup()
    printf("** %s: ", title)
    case()
    test.teardown()
    print()
  end
end

