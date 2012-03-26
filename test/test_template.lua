require("lunit")
require("drafter")

module("drafter.tests", package.seeall, lunit.testcase)

function setup()
  fixtures = "test/fixtures/templates"
  template = drafter.template
  template.init(fixtures, "lua", "rock.spec")
end

function test_should_check_template_directory()
  assert_error("template should not be found", function()
    template.init(fixtures, "lua", "not/found")
  end)

  assert_pass("template should be found", function()
    template.init(fixtures, "lua", "rock.spec")
  end)
end

function test_should_check_template_attributes()
  assert_equal("Hallison Batista", template.spec.author)
  assert_equal("0.1.0", template.spec.version)
  assert_equal(fixtures.."/lua/rock.spec", template.spec.file)
end

function test_should_check_template_snippets()
  assert_not_nil(template.spec.builder)
  for key, value in pairs(template.spec.builder) do
    assert_not_nil(key)
  end
end

