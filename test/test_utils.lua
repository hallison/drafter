require("prigner.utils")

assert_success(lfs.find, "test/fixtures")

files = {}

for file in lfs.find("test/fixtures") do
  table.insert(files, file)
end

assert_equal(7, #files)
