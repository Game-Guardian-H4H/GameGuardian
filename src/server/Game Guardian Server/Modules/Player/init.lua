--[[
    Player Service
    Manages Player State
    H4H 2023
    Owen Matejka
]]

-- Services --
local PlayerService = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Http = require(script.Parent.Http)

local Class = require(script.class)
local Player = {}

-- Functions --
local Players = {}

-- Forcefully Updates All Players
function Player:UpdateAll()
    for _, player in (PlayerService:GetPlayers()) do
        if self:GetPlayer(player) then
            self:UpdatePlayer(player)
        else
            self:Create(player)
        end
    end
end

-- Updates Specified Player
function Player:UpdatePlayer(player)
    pcall(function() -- pcall prevents errors if player is kicked suddenly
        local data = Http:FetchUserData(player.UserId)
        self:GetPlayer(player).Data.AllowedMinutes = data.maxTimeAllowed
        self:GetPlayer(player).Data.PauseState = data.isPaused
        self:GetPlayer(player).Data.PauseMessage = data.pauseMessage

        if self:GetPlayer(player).Data.CurrentSeconds < 0 then
            self:GetPlayer(player).Data.CurrentSeconds = data.currentTime
        end
    end)
end

-- Updates Database
function Player:UpdateServer(player)
    Http:UpdateUserData(player.UserId, Players[player]:GetTimePlayed())
end

-- Fetches Player Data
function Player:GetPlayer(player)
    return Players[player]
end

-- Fetches Full Player Table
function Player:GetAllPlayers()
    return Players
end

-- Creates a New Player Object
local debounce = {}
function Player:Create(player)
    if debounce[player] then return end
    debounce[player] = true
    pcall(function()
        print("Player Joined: " .. player.Name)
        print(HttpService:JSONEncode(Http:FetchUserData(player.UserId)))

        Players[player] = Class.new(player) 
    end)
    debounce[player] = nil
end

-- Destroy Player on Exit
function Player:Destroy(player)
    Players[player] = nil
end

return Player