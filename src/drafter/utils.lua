posix.findfiles = function(dirname)
  assert(dirname and dirname ~= "", "directory parameter is missing or empty")
  dirname = dirname:gsub("/$", "")

  local function isnotperiod(entry)
    return entry and entry ~= "." and entry ~= ".."
  end

  local function findentries(dir)
    for entry in posix.files(dir) do
      if isnotperiod(entry) then
        entry = dir.."/"..entry
        if posix.stat(entry, "type") == "directory" then
          findentries(entry)
        else
          coroutine.yield(entry)
        end
      end
    end
  end

  local function find()
    findentries(dirname)
  end

  return coroutine.wrap(find)
end

_G.printf = function(...)
  io.stdout:write(string.format(...))
end

_G.pathto = function(entry)
  if io.open(entry) then
    return entry
  else
    error("file or directory '"..entry.."' not found.", 2)
  end
end

