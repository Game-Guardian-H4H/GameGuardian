local DefaultHook = {}

local RemotesFolder = Instance.new("Folder")
RemotesFolder.Name = "Remotes"
RemotesFolder.Parent = script.Parent.Parent

local PauseRemote = Instance.new("RemoteEvent")
PauseRemote.Name = "Pause Remote"
PauseRemote.Parent = RemotesFolder

local TimeRemote = Instance.new("RemoteEvent")
TimeRemote.Name = "Time Remote"
TimeRemote.Parent = RemotesFolder

DefaultHook["PauseEvent"] = function(player, state, message)
    PauseRemote:FireClient(player, state, message)
end

DefaultHook["TimeEvent"] = function(player, timeRemaining)
    TimeRemote:FireClient(player, timeRemaining)
end

return DefaultHook