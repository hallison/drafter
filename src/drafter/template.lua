----------------------------------------------------------------------------
-- Template specification.
--
-- This module is responsible to handle a template specification.
--
-- @copyright 2010-2012 Hallison Batista
----------------------------------------------------------------------------

-- Initialization of local access to external functions
local open = io.open
local setfenv = setfenv
local loadstring = loadstring
local pcall = pcall
local error = error
local pathto = pathto

module("drafter.template")

-- Local variables and constants
local template = _M

-- Basic information
author   = nil
version  = nil
specfile = nil
-- Base information
files    = {}

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

------------------------------------------------------------------------------
-- Initialize a template by specification file path.
--
-- @param   specfile  Template specification file.
------------------------------------------------------------------------------
template.init = function(specfile)
  sandbox = {}
  template.specfile = pathto(specfile)
  local loaded, message = loadspec(specfile, sandbox) 
  if loaded then
    template.author = sandbox.author
    template.version = sandbox.version
    template.files = sandbox.files
  else
    error(specfile..":"..message, 2)
  end
end

