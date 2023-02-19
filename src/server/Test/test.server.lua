--[[
    Loads and runs the Game Guardian Libary
    H4H 2023
    Owen Matejka
]]

-- Directories --
local GameGuardian = game:GetService("ServerScriptService").Server["Game Guardian Server"]

-- Runner --
local Runner = require(GameGuardian.runner)
Runner:Start()

-- Example Hook Usage --
-- This demonstrates how a developer can override the defaulte events

--[[
local HookManager = require(game:GetService("ReplicatedStorage").Common["Game Guardian Shared"].Hooks)

HookManager:HookEvent("PauseEvent", function(player)
    player:Kick("Example Override")
end)]]