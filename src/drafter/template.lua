----------------------------------------------------------------------------
-- Template specification.
--
-- This module is responsible to handle a template specification.
--
-- @copyright 2010-2012 Hallison Batista
----------------------------------------------------------------------------

-- Initialization of local access to external functions
local input, output, open = io.input, io.output, io.open
local insert = table.insert
local gsub, gmatch = string.gsub, string.gmatch
local setfenv, loadstring, pcall = setfenv, loadstring, pcall
local pathto = pathto

module("drafter.template")

-- Local variables and constants
local template = _M
local rootdir = "%s/%s/%s"

template.spec = {
-- Base information
  name = nil,
  file = nil,
  builder = {},
-- Only information
  author  = nil,
  version = nil,
}

--
-- Load specification file.
--
-- @param  specfile Path to specfile.
--
local function loadspec(file, sandbox)
  local source = open(pathto(file))
  local code, message = loadstring(source:read("*a"), file)
  source:close()
  if code then
    setfenv(code, sandbox)
    return pcall(code)
  else
    return nil, message
  end
end

template.spec.build = function(options)
  template.spec.builder[options.file] = options.source
end

------------------------------------------------------------------------------
-- Initialize a template by path, group name and specification file.
--
-- @param   path      Path to directory of templates.
-- @param   group     Template group, like a prefix.
-- @param   specfile  Template specification file.
------------------------------------------------------------------------------
template.init = function(path, group, specfile)
  local file = rootdir:format(path, group, specfile)
  local loaded, message = loadspec(file, template.spec) 
  if loaded then
    template.spec.file = file
    template.spec.name = file:gsub(".*/(%d?%w+)", "%1")
  else
    error(file..":"..message, 2)
  end
end

