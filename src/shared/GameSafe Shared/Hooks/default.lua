local DefaultHook = {}

local RemotesFolder = Instance.new("Folder")
RemotesFolder.Name = "Remotes"
RemotesFolder.Parent = script.Parent.Parent

local PauseRemote = Instance.new("RemoteEvent")
PauseRemote.Name = "Pause Remote"
PauseRemote.Parent = RemotesFolder

DefaultHook["PauseEvent"] = function(player, state)
    PauseRemote:FireClient(player, state == "Enabled")
end

return DefaultHook