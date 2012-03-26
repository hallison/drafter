require("lunit")
require("drafter")

module("drafter.test_snippet", package.seeall, lunit.testcase)

function setup()
  fixtures = "test/fixtures/snippets"
  snippet  = drafter.snippet
  snippet.init(fixtures, "lua", "script")
end

function test_find_to_snippet_file()
  assert_error("snippet not found", function()
    snippet.init(fixtures, "lua", "notfound")
  end)
  assert_pass("snippet found", function()
    snippet.init(fixtures, "lua", "script")
  end)
end

function test_template_attributes()
  assert_equal("lua", snippet.group)
  assert_equal("script", snippet.entry)
  assert_pass("snippet exist", function()
    snippet.init(fixtures, "ruby", "sinatra/webapp.rb")
  end)
end

