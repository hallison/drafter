------------------------------------------------------------------------------
-- Snippet file handler.
--
-- This module is a representation of the raw snippet file for new source
-- code.
--
-- Attributes:
--    * file
--    * content
--
-- @copyright 2010-2012 Hallison Batista
------------------------------------------------------------------------------

local open = io.open
local pathto = pathto

module("drafter.snippet")

local snippet = _M

------------------------------------------------------------------------------
-- Initialize a snippet code by file path.
--
-- @param file Path to snippet file.
-- @usage drafter.snippet.init("/path/to/snippet/file")
-- @return table of draft with file and content attributes.
------------------------------------------------------------------------------
snippet.init = function(file)
  snippet.file = pathto(file)
  snippet.content = open(snippet.file):read("*a")
end

