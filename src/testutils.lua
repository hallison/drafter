local printf = function(head, txt)
  io.stdout:write(string.format("** %s ... ", head, txt))
end

local check = function(pass, message)
  if assert(pass, message) then
    print("ok")
  else
    print("fail")
  end
end

local test = function(msg, func, ...)
  printf(msg)
  return pcall(func, ...)
end

assert_failure = function(func, ...)
  check(not test("assert failure", func, ...))
end

assert_success = function(func, ...)
  check(test("assert success", func, ...))
end

assert_not_nil = function(var)
  printf("assert not nil")
  check(var, "variable '"..var.."' is nil")
end

assert_equal = function(value, test, msg)
  printf("assert equal")
  check(value == test, value.." not equal to "..test)
end

print("Test utilities loaded")
