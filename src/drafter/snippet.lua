------------------------------------------------------------------------------
-- Snippet file handler.
--
-- This module is a representation of the raw snippet file for new source
-- code.
--
-- @copyright 2010-2012 Hallison Batista
------------------------------------------------------------------------------

local format = string.format
local pathto = pathto

module("drafter.snippet")

local rootdir = "%s/%s/%s"
local file = nil
local snippet = _M

snippet.group = nil
snippet.entry = nil
snippet.file  = nil

------------------------------------------------------------------------------
-- Initialize a snippet code by path.
--
-- @param   path  Path to directory of snippets.
-- @param   group Snippet group like a prefix name.
-- @param   entry Snippet name.
-- @usage   drafter.snippet.init("/path/to/snippets", "lua", "script")
------------------------------------------------------------------------------
snippet.init = function(path, group, entry)
  snippet.file = pathto(rootdir:format(path, group, entry))
  if snippet.file then
    snippet.group, snippet.entry = group, entry
  end
end

------------------------------------------------------------------------------
-- Just print the information about the template.
------------------------------------------------------------------------------
snippet.inspect = function()
  return format("%s:%s", group, entry)
end

