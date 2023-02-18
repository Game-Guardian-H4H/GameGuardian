local Players = game:GetService("Players")
--[[
    Player Service
]]

local PlayerService = game:GetService("Players")
local Class = require(script.class)
local Player = {}

local Players = {}

function Player:UpdateAll()
    for _, player in (PlayerService:GetPlayers()) do
        if self:GetPlayer(player) then
            self:UpdatePlayer(player)
            print("Player updated!")
        else
            self:Create(player)
            print("Player created!")
        end
    end
end

function Player:UpdatePlayer(player)

end

function Player:GetPlayer(player)
    return Players[player]
end

function Player:GetAllPlayers()
    return Players
end

function Player:Create(player)
    print("Player Created from Create Function")
    Players[player] = Class.new(player)
    print(Players[player]:HasExceededTime())
end

function Player:Destroy(player)
    
end

return Player