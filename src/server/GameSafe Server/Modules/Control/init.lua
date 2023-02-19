--[[
    Control Functions
    These handle overtime, pausing, etc.
]]

local Player = require(script.Parent.Player)
local HookManager = require(game:GetService("ReplicatedStorage").Common["GameSafe Shared"].Hooks)

local Signals = {}

local Control = {}

local Events = {
    ["PauseEvent"] = Instance.new("BindableEvent")
}

function Control:HandleTimeRestrictions()
    for _, player in (Player:GetAllPlayers()) do
        if player:HasExceededTime() then
            player.Player:Kick("Time exceeded.")
        end
    end
end

function Control:HandlePause()
    for _, player in (Player:GetAllPlayers()) do
        local pauseState = player:GetPauseState()
        Events["PauseEvent"]:Fire(player.Player, pauseState)
    end
end



function Control:RunAllChecks()
    print("yoo")
    self:HandleTimeRestrictions()
end

function Control:Start()
    HookManager.Init(Events)
    HookManager:Start()
    self:HandlePause()
end

return Control