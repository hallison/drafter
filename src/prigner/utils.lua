module("prigner.util", package.seeall)

require("lfs")

-- Code by David Kastrup and improved to use in Prigner project.
lfs.find = function(dirname)
  assert(dirname and dirname ~= "", "directory parameter is missing or empty")
  dirname = string.gsub(dirname, "/$", "")

  local function yieldtree(dir)
    for entry in lfs.dir(dir) do
      if entry and entry ~= "." and entry ~= ".." then
        entry = dir.."/"..entry
        local attr = lfs.attributes(entry)
        if attr.mode == "directory" then
          yieldtree(entry)
        elseif attr.mode == "file" then
          coroutine.yield(entry, attr)
        end
      end
    end
  end

  return coroutine.wrap(function() yieldtree(dirname) end)
end

