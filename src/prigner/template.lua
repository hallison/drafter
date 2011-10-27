module("prigner.template", package.seeall)

require("prigner.utils")

----------------------------------------------------------------------------
-- Template Processor.
--
-- This module is responsible to build a projecto from template.
----------------------------------------------------------------------------

local input, output, open = io.input, io.output, io.open
local insert = table.insert
local gsub, gmatch = string.gsub, string.gmatch

local check_path_to = function(path)
  if io.open(path) then
    return path
  else
    error("unable to open template directory '"..path.."'.", 2)
  end
end

local spec = { ipairs }
local rootdir = nil
local skeldir = nil
local specfile = nil

local function loadspec(specfile)
  local file = open(specfile)
  local code = file:read("*a")
  local block, message = loadstring(code)
  if not block then return nil, message end
  setfenv(block, spec)
  return pcall(block)
end

skelfiles = function()
  return lfs.find(skeldir)
end

-- Base information
name = nil
path = nil
skels = {}

-- Only information
author = nil
version = nil

init = function(dir)
  rootdir  = check_path_to(dir)
  specfile = check_path_to(rootdir .. "/specfile")
  skeldir  = check_path_to(rootdir .. "/skels")
  loadspec(specfile)
  name    = spec.name
  path    = rootdir
  author  = spec.author
  version = spec.version
  for skel in skelfiles() do
    local path = skel
    path = gsub(path, skeldir.."/", "")
    path = gsub(path, "/.*", "")
    if skels[path] then
      insert(skels[path], skel)
    else
      skels[path] = { skel }
    end
  end
end

---- Get a template skeleton file that will be used to parse source file of the
---- project.
---- @param template Template name.
---- @param name Skeleton File name.
---- @return Skeleton file.
--function skeleton(template, name)
--  return open(template.path .. "/skels/" .. name, "r")
--end
--
---- Set and create full path to target file.
---- @param filename File path name.
--function target(filename)
--  local mode = "a+"
--  local file = open(filename, mode)
--  if not file then
--    mkdir_p(filename)
--    return open(filename, mode)
--  else
--    return file
--  end
--end
--
--local function mkdir_p(pathname)
--  -- Windows path incompatibility workaround.
--  pathname = gsub(pathname, "\\", "/")
--  local dirname = ""
--  for dir in gmatch(pathname, ".-/") do
--    dirname = dirname .. dir
--    lfs.mkdir(dirname)
--  end
--end
--
--function parse()
--  local code = 
--  return compile(cache)
--end
--

