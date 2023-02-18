local ServerScriptService = game:GetService("ServerScriptService")
--[[
    Loads and runs the GameSafe Libary
]]
local GameSafe = game:GetService("ServerScriptService").Server["GameSafe Server"]

local Runner = require(GameSafe.runner)
Runner.Init()
Runner:Start()