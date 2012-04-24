require("lunit")
require("drafter")

module("drafter.tests", package.seeall, lunit.testcase)

function setup()
  fixtures = "test/fixtures/drafts"
  template = drafter.template
  template.init(fixtures.."/lua/templates/rock.spec")
end

function test_should_initialize_template()
  assert_error("template should not be found", function()
    template.init(fixtures.."/lua/not/found")
  end)

  assert_pass("template should be found", function()
    template.init(fixtures.."/lua/templates/rock.spec")
  end)
end

function test_should_check_template_attributes()
  assert_equal("Hallison Batista", template.author)
  assert_equal("0.1.0", template.version)
  assert_equal(fixtures.."/lua/templates/rock.spec", template.specfile)
end

function test_should_check_template_snippet_files()
  assert_equal("table", type(template.files))
  assert_equal(4, #template.files)
end

