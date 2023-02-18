--[[
    GameSafe Server Init
]]


-- Directories --
local Network = require(script.Parent.Modules.Http)
local Player = require(script.Parent.Modules.Player)
local Control = require(script.Parent.Modules.Control)

local MasterTable = {
    ProjectData = {
        Name = "";
        Description = "";
        API_Key = "";
    };
}

local GameSafe = {}
--GameSafe.__index = GameSafe

function GameSafe.Init(dataTable)
    --[[MasterTable.ProjectData.Name = dataTable.Name
    MasterTable.ProjectData.Description = dataTable.Description
    MasterTable.ProjectData.API_Key = dataTable.API_Key]]
end

function GameSafe:Start()
    warn("[GameSafe] Starting...")
    assert(Network:CheckForConnection(), "Failed to Connect to GameSafe Server. Terminating!")
    Player:UpdateAll()
    Control:Start()
    warn("[GameSafe] Loaded Successfully!")
end

GameSafe.PlayerAdded = game.Players.PlayerAdded:Connect(function(player)
    Player:Create(player)
    Control:HandlePause()
end)

GameSafe.PlayerRemoving = game.Players.PlayerRemoving:Connect(function(player)
    Player:Destroy(player)
end)

GameSafe.MasterLoop = task.spawn(function()
    while true do
        task.wait(10)
        --Control:RunAllChecks()
    end
end)

return GameSafe