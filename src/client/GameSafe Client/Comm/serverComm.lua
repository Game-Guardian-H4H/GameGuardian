local Remotes = game:GetService("ReplicatedStorage").Common["GameSafe Shared"]:WaitForChild("Remotes")
local PauseRemote = Remotes:WaitForChild("Pause Remote")
local LocalPlayer = game:GetService("Players").LocalPlayer


local PauseUI = require(script.Parent.Parent:WaitForChild("UI"):WaitForChild("pause"))
PauseUI:Create()

PauseRemote.OnClientEvent:Connect(function(state)
    local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()

    PauseUI:Render(state)
    Controls:Disable()

end)


return {}