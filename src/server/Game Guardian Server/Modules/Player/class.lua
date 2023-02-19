--[[
    Player Class
    Framework for Player Data
    H4H 2023
    Owen Matejka
]]

local PlayerClass = {}
PlayerClass.__index = PlayerClass

PlayerClass.Data = {}

-- Constructor --
function PlayerClass.new(player)
    local self = setmetatable({}, PlayerClass)
    self.Player = player
    self.PlayerID = player.UserId

    self.Data = {
        AllowedMinutes = 60;
        CurrentSeconds = -1;
        PauseState = false;
        PauseMessage = "None Supplied.";
    }

    return self
end

-- Getters --
function PlayerClass:HasExceededTime()
    return self.Data.AllowedMinutes <= (self.Data.CurrentSeconds / 60)
end

function PlayerClass:GetTimeRemaining()
    return math.round(self.Data.AllowedMinutes - (self.Data.CurrentSeconds / 60))
end

function PlayerClass:GetTimePlayed()
    return self.Data.AllowedMinutes - self:GetTimeRemaining()
end

function PlayerClass:GetPauseState()
    return self.Data.PauseState
end

function PlayerClass:GetPauseMessage()
    return self.Data.PauseMessage
end

-- Setters --
function PlayerClass:UpdateTimePlayed(secs)
    self.Data.CurrentSeconds += secs
end

return PlayerClass