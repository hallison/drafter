require("lunit")
require("drafter")

module("drafter.test_snippet", package.seeall, lunit.testcase)

function setup()
  fixtures = "test/fixtures/drafts"
  snippet  = drafter.snippet
end

function test_find_to_snippet_file()
  assert_error("snippet should be not found", function()
    snippet.init(fixtures.."/lua/not/found")
  end)
  assert_pass("snippet should be found", function()
    snippet.init(fixtures.."/lua/snippets/script")
  end)
  assert_equal(107, #snippet.content)
  assert_pass("snippet should be found", function()
    snippet.init(fixtures.."/ruby/snippets/sinatra/webapp.rb")
  end)
  assert_equal(0, #snippet.content)
end

