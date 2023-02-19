--[[
    Hook Manager
    Exposes functions for developers to hook into
    H4H 2023
    Owen Matejka
]]

-- Variables --
local Hooks = {}
local Events = {}
local Defaults = require(script.default)


-- Functions --
local HookManager = {}

-- Hook Event to Override Default
function HookManager:HookEvent(eventName, func)
    assert(Hooks[eventName] == nil, "Event is already hooked.")
    Hooks[eventName] = func
end

-- Unhook Event to Restore Default
function HookManager:UnhookEvent(eventName)
    assert(Hooks[eventName], "There is nothing to unhook.")
    Hooks[eventName] = nil
end


function HookManager.Init(events)
    Events = events
end

-- Listens to all events and calls appropriate functions
function HookManager:Start()
    for name, event in Events do
        event.Event:Connect(function(...)
            if Hooks[name] then
                Hooks[name](...)
            else
                Defaults[name](...)
            end
        end)
    end
end

return HookManager