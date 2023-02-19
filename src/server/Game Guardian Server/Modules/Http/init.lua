--[[
    Http Functions
    Enables Simple Access to External Server
]]

-- Directories --
local HttpService = game:GetService("HttpService")
local Config = require(script.config)
local URL = Config.URL

-- Functions --
local Http = {}

-- Fetch Specified User's Data
function Http:FetchUserData(playerID)
    local response = HttpService:RequestAsync({
        Url = URL.."/api/v1/users/"..playerID;
        Method = "GET";
    })

    if response.StatusCode == 404 then
        HttpService:RequestAsync({
            Url = URL.."/api/v1/users/create";
            Method = "POST";
            Headers = {
                ["Content-Type"] = "application/json";
            };
            Body = HttpService:JSONEncode({ userId = tostring(playerID) })
        })

        return HttpService:JSONDecode(response.Body)
        
    elseif response.StatusCode == 200 then
        return HttpService:JSONDecode(response.Body)
    end
end

-- Update Specified User's Data
function Http:UpdateUserData(playerID, minutesPlayed)
    HttpService:RequestAsync({
        Url = URL.."/api/v1/users/"..playerID.."/pause/currentTime";
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = HttpService:JSONEncode({ currentTime = minutesPlayed })
    })
end

-- Check for Server Connection Success
function Http:CheckForConnection()
    local response = HttpService:GetAsync(URL.."/api/v1/server/healthCheck")
    response = HttpService:JSONDecode(response)
    return response["health_status"] == "green"
end

return Http