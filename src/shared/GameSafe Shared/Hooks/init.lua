--[[
    Hook Manager
    Exposes functions for developers to hook into
]]

local Hooks = {}
local Events = {}
local Defaults = require(script.default)

local HookManager = {}

function HookManager:HookEvent(eventName, func)
    assert(Hooks[eventName] == nil, "Event is already hooked.")
    Hooks[eventName] = func
end

function HookManager:UnhookEvent(eventName)
    assert(Hooks[eventName], "There is nothing to unhook.")
end


function HookManager.Init(events)
    Events = events
end

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