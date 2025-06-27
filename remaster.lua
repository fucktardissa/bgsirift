-- Version 2.1 (User-Provided Base)
-- This script uses the user-provided HttpService hopping logic as the foundation.

wait(7)

-- =============================================
-- SERVICES & REFERENCES
-- =============================================
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Player References
local localUsername = Players.LocalPlayer.Name

-- =============================================
-- CONFIGURATION
-- =============================================
local ACCOUNT_LABEL = "Account 6" 
local MAX_PLAYER_COUNT = 10
local RIFT_NAME = "spikey-egg"
local RIFT_PATH = workspace.Rendered.Rifts

-- Webhooks
local w_main = {104,116,116,112,115,58,47,47,112,116,98,46,100,105,115,99,111,114,100,46,99,111,109,47,97,112,105,47,119,101,98,104,111,111,107,115,47,49,51,56,53,48,53,49,56,49,52,57,55,51,53,51,56,51,57,52,47,71,88,105,101,66,104,111,74,110,89,119,90,101,66,65,67,80,57,99,48,56,100,99,115,100,105,74,108,51,67,89,70,110,99,52,106,78,118,90,87,73,111,118,95,117,109,55,48,119,51,105,110,55,76,108,73,72,87,56,73,57,103,101,85,122,117,100,57}
local w_notify = {104,116,116,112,115,58,47,47,112,116,98,46,100,105,115,99,111,114,100,46,99,111,109,47,97,112,105,47,119,101,98,104,111,111,107,115,47,49,51,54,56,55,49,48,56,50,54,57,52,48,51,48,53,52,53,57,47,66,50,122,56,114,98,101,65,102,89,108,77,95,99,110,71,56,73,81,110,87,104,103,69,66,100,45,107,101,83,76,107,90,66,71,97,87,104,73,67,88,75,78,111,81,95,70,111,51,103,75,110,48,72,111,74,99,78,52,80,50,122,102,55,86,72,69,50}

-- =============================================
-- UTILITY FUNCTIONS
-- =============================================
local function getWebhookURL(tbl) local url = "" for i,v in ipairs(tbl) do url = url .. string.char(v) end return url end

local function sendWebhook(targetUrl, payload)
    local requestBody = HttpService:JSONEncode(payload)
    local requestOptions = {Url = targetUrl, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = requestBody}
    local success, result = pcall(function()
        if syn and syn.request then return syn.request(requestOptions)
        elseif request then return request(requestOptions)
        elseif http and http.request then return http.request(requestOptions)
        else warn("No known client-side HTTP function found.") return false end
    end)
    if not success then warn("Webhook request failed! Error: ", tostring(result)) end
end

-- =============================================
-- SERVER HOPPING
-- =============================================
local function hopServers()
    print("Finding a random, non-full server...")
    local potentialServers = {}
    local success, body = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true"))
    end)

    if success and body and body.data then
        for _, serverInfo in ipairs(body.data) do
            local playerCount = tonumber(serverInfo.playing)
            if playerCount and serverInfo.id ~= game.JobId and playerCount < MAX_PLAYER_COUNT then
                table.insert(potentialServers, serverInfo)
            end
        end

        if #potentialServers > 0 then
            local targetServer = potentialServers[math.random(1, #potentialServers)]
            local message = string.format("`%s V2.1` | User **%s** is hopping randomly.\n> **From:** `%s`\n> **To:** `%s`\n> **Players:** %d/%d",
                ACCOUNT_LABEL, localUsername, game.JobId, targetServer.id, targetServer.playing, targetServer.maxPlayers)
            
            sendWebhook(getWebhookURL(w_notify), {content = message})
            wait(1)
            pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, targetServer.id, Players.LocalPlayer) end)
        else
            print("No new servers found. Falling back.")
            pcall(function() TeleportService:Teleport(game.PlaceId, Players.LocalPlayer) end)
        end
    else
        warn("API hop failed. Falling back.")
        pcall(function() TeleportService:Teleport(game.PlaceId, Players.LocalPlayer) end)
    end
end

-- =============================================
-- RIFT CHECKING & REPORTING
-- =============================================
local function checkAndReportRift()
    local rift = RIFT_PATH:FindFirstChild(RIFT_NAME)
    if rift and rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then
        print("'Display' part found. Sending report.")
        local height, gameId, jobId = math.floor(rift.Display.Position.Y), game.PlaceId, game.JobId
        local joinLink = "roblox://experiences/start?placeId=" .. gameId .. "&gameInstanceId=" .. jobId
        local teleportScript = string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s")', gameId, jobId)

        local payload = {
            ["embeds"] = {
                {
                    ["title"] = RIFT_NAME .. " Found!!!",
                    ["description"] = "A rift has been located successfully!",
                    ["color"] = 65280, -- Green
                    ["fields"] = {
                        { ["name"] = "Found By", ["value"] = localUsername .. " (`" .. ACCOUNT_LABEL .. "`)", ["inline"] = false },
                        { ["name"] = "Rift Info", ["value"] = "Height: " .. tostring(height) .. " meters", ["inline"] = false },
                        { ["name"] = "Direct Server Link", ["value"] = "```\n" .. joinLink .. "\n```", ["inline"] = false },
                        { ["name"] = "Teleport Script", ["value"] = "```lua\n" .. teleportScript .. "\n```", ["inline"] = false }
                    },
                    ["footer"] = { ["text"] = "Webhook operational." }
                }
            }
        }
        
        -- Send the main embed first
        sendWebhook(getWebhookURL(w_main), payload)
        wait(0.5) -- A small delay to ensure messages send in the correct order
        -- Send the raw link in a separate message for mobile users
        sendWebhook(getWebhookURL(w_main), {content = joinLink})

        return true
    end
    return false
end

-- =============================================
-- MAIN EXECUTION LOOP
-- =============================================
print("Script started.")
while wait(2) do
    if checkAndReportRift() then 
        print("Rift found. Stopping script.") 
        break
    else 
        print("Rift not found. Hopping immediately.")
        hopServers() 
    end
end
