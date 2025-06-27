-- Version 6.6 - Keypress Hatching
-- This version replaces the remote-based hatching with a VirtualInputManager
-- to simulate keypresses for a more reliable interaction.

wait(1)

-- =============================================
-- SERVICES & REFERENCES
-- =============================================
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Player References
local player = Players.LocalPlayer
local localUsername = player.Name

-- =============================================
-- CONFIGURATION
-- =============================================
local ACCOUNT_LABEL = "Account 6" 
local MAX_PLAYER_COUNT = 10
local RIFT_NAME = "spikey-egg"
local RIFT_PATH = workspace.Rendered.Rifts
local MAIN_LOOP_DELAY = 10 -- Seconds between checks when not hatching
local TWEEN_SPEED = 200

-- Global flag to control the keypress simulation
getgenv().autoPressR = false

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
    pcall(function() if syn and syn.request then return syn.request(requestOptions) elseif request then return request(requestOptions) elseif http and http.request then return http.request(requestOptions) else warn("No known client-side HTTP function found.") end end)
end

local function isRiftValid(riftName)
    local rift = RIFT_PATH:FindFirstChild(riftName)
    if rift and rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then
        return rift
    end
    return nil
end

-- =============================================
-- SERVER HOPPING (USER-PROVIDED LOGIC)
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
            local message = string.format("`%s V3.1B` | Hopping randomly.\n> **From:** `%s`\n> **To:** `%s`\n> **Players:** %d/%d",
                ACCOUNT_LABEL, game.JobId, targetServer.id, targetServer.playing, targetServer.maxPlayers)
            
            sendWebhook(getWebhookURL(w_notify), {content = message})
            wait(1)
            pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, targetServer.id, Players.LocalPlayer) end)
        else
            print("No new servers found with space. Falling back to random join.")
            pcall(function() TeleportService:Teleport(game.PlaceId, Players.LocalPlayer) end)
        end
    else
        warn("API hop failed. Falling back to random join.")
        pcall(function() TeleportService:Teleport(game.PlaceId, Players.LocalPlayer) end)
    end
end

-- =============================================
-- TWEENING & HATCHING (KEYPRESS METHOD)
-- =============================================
local function getCharacterParts()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart"), char:WaitForChild("Humanoid")
end

local function moveToRiftAndHatch(riftInstance)
    print("Moving to rift...")
    local targetPos = riftInstance.Display.Position + Vector3.new(0, 3, -10)
    
    local humanoidRootPart, humanoid = getCharacterParts()
    if not humanoidRootPart or not humanoid then
        warn("Character parts not found, cannot move to rift.")
        return
    end

    local tweenInfo = TweenInfo.new((humanoidRootPart.Position - targetPos).Magnitude / TWEEN_SPEED, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(humanoidRootPart, tweenInfo, {Position = targetPos})
    tween:Play()
    tween.Completed:Wait()
    
    print("Arrived at rift. Starting keypress hatch loop.")
    getgenv().autoPressR = true -- Enable the keypress loop

    -- This loop just waits until the rift is gone. The background thread handles the keypresses.
    while isRiftValid(RIFT_NAME) do
        task.wait(1) -- Check every second if the rift is still there
    end

    getgenv().autoPressR = false -- Disable the keypress loop
    print("Rift is gone. Stopping keypresses and returning to main loop to hop.")
end

-- =============================================
-- RIFT REPORTING (ENHANCED)
-- =============================================
local function checkAndReportRift()
    local riftInstance = isRiftValid(RIFT_NAME)
    if not riftInstance then return nil end

    print("'Display' part found. Preparing enhanced report.")
    
    local discordTimestampValue = ""
    local luckValue = ""

    local surfaceGui = riftInstance.Display:FindFirstChild("SurfaceGui")
    local timerGui = surfaceGui and surfaceGui:FindFirstChild("Timer")
    if timerGui and timerGui:IsA("TextLabel") then
        local timerText = timerGui.Text
        local minutes = tonumber(string.match(timerText, "(%d+) ?m")) or 0
        local seconds = tonumber(string.match(timerText, "(%d+) ?s")) or 0
        if (minutes + seconds) > 0 then
            discordTimestampValue = string.format("<t:%d:R>", os.time() + (minutes * 60) + seconds)
        end
    end
    
    local iconPart = riftInstance.Display:FindFirstChild("Icon")
    local luckLabel = iconPart and iconPart:FindFirstChild("Luck")
    if luckLabel and luckLabel:IsA("TextLabel") then
        luckValue = luckLabel.Text
    end

    local height, gameId, jobId = math.floor(riftInstance.Display.Position.Y), game.PlaceId, game.JobId
    local joinLink = "roblox://experiences/start?placeId=" .. gameId .. "&gameInstanceId=" .. jobId
    local teleportScript = string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s")', gameId, jobId)
    local playerCount = #Players:GetPlayers()
    
    local embedFields = {
        { ["name"] = "Found By", ["value"] = localUsername .. " (`" .. ACCOUNT_LABEL .. "`)", ["inline"] = false },
        { ["name"] = "Rift Height", ["value"] = tostring(height) .. " meters", ["inline"] = false },
        { ["name"] = "Players", ["value"] = string.format("%d/%d", playerCount, MAX_PLAYER_COUNT), ["inline"] = false }
    }
    
    if luckValue and luckValue ~= "" then table.insert(embedFields, {["name"] = "Luck", ["value"] = luckValue, ["inline"] = false}) end
    if discordTimestampValue and discordTimestampValue ~= "" then table.insert(embedFields, {["name"] = "Ends", ["value"] = discordTimestampValue, ["inline"] = false}) end
    table.insert(embedFields, { ["name"] = "Direct Server Link", ["value"] = "```\n" .. joinLink .. "\n```", ["inline"] = false })
    table.insert(embedFields, { ["name"] = "Teleport Script", ["value"] = "```lua\n" .. teleportScript .. "\n```", ["inline"] = false })

    local payload = {
        ["embeds"] = {{
            ["title"] = RIFT_NAME .. " Found!",
            ["description"] = "A rift has been located.",
            ["color"] = 65280, -- Green
            ["fields"] = embedFields,
            ["footer"] = { ["text"] = "Hybrid Webhook V3.1B" }
        }}
    }
    
    sendWebhook(getWebhookURL(w_main), payload)
    wait(0.5)
    sendWebhook(getWebhookURL(w_main), {content = joinLink})

    return riftInstance
end

-- =============================================
-- KEYPRESS BACKGROUND THREAD
-- =============================================
task.spawn(function()
    while true do
        if getgenv().autoPressR then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
        end
        task.wait() -- A small delay to prevent the loop from running too fast when idle
    end
end)

-- =============================================
-- MAIN EXECUTION LOOP
-- =============================================
print("Hybrid script V3.1B started.")
while wait(MAIN_LOOP_DELAY) do
    local riftInstance = checkAndReportRift()
    if riftInstance then
        print("Rift found. Beginning hatching process.")
        -- This is a blocking call. The script will stay in this function until the rift is gone.
        moveToRiftAndHatch(riftInstance)
    else
        print("Rift not found. Hopping to a new server.")
        hopServers()
    end
end
