local ServerScriptService = game:GetService("ServerScriptService")
--[[
    Loads and runs the GameSafe Libary
]]
local GameSafe = game:GetService("ServerScriptService").Server["GameSafe Server"]

local Runner = require(GameSafe.runner)
Runner.Init()
Runner:Start()

local HookManager = require(game:GetService("ReplicatedStorage").Common["GameSafe Shared"].Hooks)

HookManager:HookEvent("PauseEvent", function(player)
    player:Kick("Example Override")
end)