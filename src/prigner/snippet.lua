module("prigner.snippet", package.seeall)

require("prigner.utils")

----------------------------------------------------------------------------
-- Snippet file.
--
-- This module is a representation of the raw snippet file for new source
-- code.
----------------------------------------------------------------------------

local input, output, open = io.input, io.output, io.open
local insert = table.insert
local gsub, gmatch = string.gsub, string.gmatch

local rootdir = "%s/%s/%s"
local file = nil

local snippet = _M

snippet.group = nil
snippet.entry = nil
snippet.file  = nil

-- Initialize a template by path
-- @param skelpat Skeleton file path placed in
-- /path/to/prigner/snippets/<group>/<snippet|subgroup>[/snippet].
-- @return Skeleton file.
snippet.init = function(snippet_path, group, entry)
  snippet.file = path_to(rootdir:format(snippet_path, group, entry))
  if snippet.file then
    snippet.group, snippet.entry = group, entry
  end
end

-- Just print the information about the template.
snippet.inspect = function()
  local inspect = "%s:%s"
  return inspect:format(group, entry)
end

