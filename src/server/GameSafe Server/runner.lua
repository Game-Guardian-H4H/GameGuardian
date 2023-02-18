--[[
    GameSafe Server Init
]]


-- Directories --
local Network = require(script.Parent.Modules.Http)
local Player = require(script.Parent.Modules.Player)

local MasterTable = {
    ProjectData = {
        Name = "";
        Description = "";
        API_Key = "";
    };
}

local GameSafe = {}
GameSafe.__index = GameSafe

function GameSafe.Init(dataTable)
    --[[MasterTable.ProjectData.Name = dataTable.Name
    MasterTable.ProjectData.Description = dataTable.Description
    MasterTable.ProjectData.API_Key = dataTable.API_Key]]
end

function GameSafe:Start()
    warn("[GameSafe] Starting...")
    assert(Network:CheckForConnection(), "Failed to Connect to GameSafe Server. Terminating!")
    Player:UpdateAll()
    warn("[GameSafe] Loaded Successfully!")
end

GameSafe.PlayerAdded = game.Players.PlayerAdded:Connect(function(player)
    Player:Create(player)
end)

return GameSafe