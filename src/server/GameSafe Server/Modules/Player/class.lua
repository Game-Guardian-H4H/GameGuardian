local PlayerClass = {}
PlayerClass.__index = PlayerClass

PlayerClass.Data = {}

function PlayerClass.new(player)
    local self = setmetatable({}, PlayerClass)
    self.Player = player
    self.PlayerID = player.UserId

    self.Data = {
        AllowedMinutes = 10;
        CurrentMinutes = 20;
        PauseState = "Idle";
    }

    return self
end

function PlayerClass:HasExceededTime()
    return self.Data.AllowedMinutes <= self.Data.CurrentMinutes
end

return PlayerClass