local PlayerClass = {}
PlayerClass.__index = PlayerClass

PlayerClass.Data = {}

function PlayerClass.new(player)
    local self = setmetatable({}, PlayerClass)
    self.Player = player
    self.PlayerID = player.UserId

    return self
end

return PlayerClass