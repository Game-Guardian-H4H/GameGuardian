--[[
    Game Guardian Client
    H4H 2023
    Owen Matejka
]]

-- Directories --
local Remotes = game:GetService("ReplicatedStorage").Common["Game Guardian Shared"]:WaitForChild("Remotes")
local PauseRemote = Remotes:WaitForChild("Pause Remote")
local TimeRemote = Remotes:WaitForChild("Time Remote")
local LocalPlayer = game:GetService("Players").LocalPlayer


-- UI Creator --
local PauseUI = require(script.Parent.Parent:WaitForChild("UI"):WaitForChild("pause"))
local TimeUI = require(script.Parent.Parent:WaitForChild("UI"):WaitForChild("timeAlert"))
PauseUI:Create()
TimeUI:Create()

-- Listeners --

-- Pause
PauseRemote.OnClientEvent:Connect(function(state, message)
    local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
    PauseUI:Render(state, message)

    if state then
        Controls:Disable()
    else
        Controls:Enable()
    end
end)

-- Time
TimeRemote.OnClientEvent:Connect(function(timeRemaining)
    if timeRemaining == 1 or timeRemaining == 5 or timeRemaining == 10 or timeRemaining == 20 or timeRemaining == 30 or timeRemaining == 60 then
        TimeUI:Render(timeRemaining)
    end
end)

return {}