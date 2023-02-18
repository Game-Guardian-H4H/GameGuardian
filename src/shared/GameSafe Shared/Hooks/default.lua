local DefaultHook = {}

DefaultHook["PauseEvent"] = function(player)
    player:Kick("Pause Event")
end

return DefaultHook