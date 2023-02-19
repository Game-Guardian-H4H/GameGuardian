--[[
    Control Functions
    These handle overtime, pausing, etc.
    H4H 2023
    Owen Matejka
]]

-- Directories --
local Player = require(script.Parent.Player)
local HookManager = require(game:GetService("ReplicatedStorage").Common["Game Guardian Shared"].Hooks)

local Control = {}

local Events = {
    ["PauseEvent"] = Instance.new("BindableEvent");
    ["TimeEvent"] = Instance.new("BindableEvent")
}

-- Function --

-- Time Played Updator
local prevTime = tick()
function Control:UpdateTimePlayed()
    local changeInTime = tick() - prevTime
        for _, player in (Player:GetAllPlayers()) do
            player:UpdateTimePlayed(changeInTime)
        end
        prevTime = tick()
end

-- Kicks Overtime Individuals
function Control:HandleTimeRestrictions()
    for _, player in (Player:GetAllPlayers()) do
        if player:HasExceededTime() then
            player.Player:Kick("[GAME GUARDIAN] Maximum Daily Time Reached. Come Back Tomorrow!")
        end
    end
end

-- Executes Pause Command
function Control:HandlePause()
    for _, player in (Player:GetAllPlayers()) do
        local pauseState = player:GetPauseState()
        local pauseMessage = player:GetPauseMessage()
        Events["PauseEvent"]:Fire(player.Player, pauseState, pauseMessage)
    end
end

-- Handles Notification of Low Remaining Time & Updates Server
function Control:HandleTime()
    for _, player in (Player:GetAllPlayers()) do
        local timeRemaining = player:GetTimeRemaining()
        Player:UpdateServer(player.Player)
        
        Events["TimeEvent"]:Fire(player.Player, timeRemaining)
    end
end


-- Runs all checks
local lastTime = tick()
function Control:RunAllChecks()
    if (tick() - lastTime) > 60 then
        lastTime = tick()
        self:HandleTime()
    end
    Player:UpdateAll()
    self:UpdateTimePlayed()
    self:HandleTimeRestrictions()
    self:HandlePause()
end

-- Starts the Service
function Control:Start()
    HookManager.Init(Events)
    HookManager:Start()
    self:HandlePause()
end

return Control