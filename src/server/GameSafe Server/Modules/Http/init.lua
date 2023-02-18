--[[
    Http Functions
]]

local HttpService = game:GetService("HttpService")
local Config = require(script.config)
local URL = Config.URL

local Http = {}

function Http:FetchUserData(playerID)

end

function Http:SendResponse(playerID)

end

function Http:CheckForConnection()
    return true
end

return Http