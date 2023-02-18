--[[
    Control Functions
    These handle overtime, pausing, etc.
]]

local Player = require(script.Parent.Player)
Control = {}
--Control.__index = Control

function Control:HandleTimeRestrictions()
    for _, player in (Player:GetAllPlayers()) do
        if player:HasExceededTime() then
            player.Player:Kick("Time exceeded.")
        end
    end
end



function Control:RunAllChecks()
    print("yoo")
    self:HandleTimeRestrictions()
end

return Control