--[[
    Game Guardian Server Init
    Initializes the Library
    H4H 2023
    Owen Matejka
]]


-- Directories --
local Network = require(script.Parent.Modules.Http)
local Player = require(script.Parent.Modules.Player)
local Control = require(script.Parent.Modules.Control)

-- Main Functions --
local GameGuardian = {}

-- Loads & Starts the Library
function GameGuardian:Start()
    warn("[GAME GUARDIAN] Starting...")
    assert(Network:CheckForConnection(), "[GAME GUARDIAN] Failed to Connect to the Server. Terminating!")
    Player:UpdateAll()
    Control:Start()
    Control:HandlePause()
    warn("[GAME GUARDIAN] Loaded Successfully!")
end

-- Join Event
GameGuardian.PlayerAdded = game.Players.PlayerAdded:Connect(function(player)
    if not Player:GetPlayer(player) then
        Player:Create(player)
    end
    Control:HandlePause()
end)

-- Remove Event
GameGuardian.PlayerRemoving = game.Players.PlayerRemoving:Connect(function(player)
    Player:Destroy(player)
end)

-- Master Loop --
-- Due to lack of Web sockets, this is the only way to quickly check for data changes on the server
GameGuardian.MasterLoop = task.spawn(function()
    while true do
        task.wait(1)
        Control:RunAllChecks()
    end
end)

return GameGuardian