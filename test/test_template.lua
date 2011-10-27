require("prigner.template")

template = prigner.template

assert_failure(template.init, "test/fixtures/.prigner/templates/notfound")

assert_success(template.init, "test/fixtures/.prigner/templates/myproj")

assert_not_nil(template.author)
assert_equal("Hallison Batista", template.author)

assert_not_nil(template.version)
assert_equal("0.1.0", template.version)

assert_not_nil(template.path)
assert_equal("test/fixtures/.prigner/templates/myproj", template.path)

assert_equal(2, #template.skels.bin)
assert_equal(3, #template.skels.src)
assert_equal(1, #template.skels.test)

