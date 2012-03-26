----------------------------------------------------------------------------
-- Drafter for your projects using templates.
--
-- This module is responsible to build a draft project using a template of
-- specification.
--
-- That is, it is a tool which builds your projects using templates.
-- @copyright 2010-2012 Hallison Batista
----------------------------------------------------------------------------

_COPYRIGHT = "Copyright (c) 2010-2012 Hallison Batista"
_DESCRIPTION = "Drafter for your projects using templates."
_VERSION = "Drafter 0.1.0"

-- 3rd part libraries
require("posix")

-- Internal requirements
require("drafter.utils")
require("drafter.snippet")
require("drafter.template")

-- Main drafter module
module("drafter")

