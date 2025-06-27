wait(1)

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local localUsername = player.Name

local ACCOUNT_LABEL = "yay" 
local MAX_PLAYER_COUNT = 12
local RIFT_NAME = "bruh-egg"
local RIFT_PATH = workspace.Rendered.Rifts
local MAIN_LOOP_DELAY = 5
local TWEEN_SPEED = 200

getgenv().autoPressR = false

local w_main = "https://ptb.discord.com/api/webhooks/1385051814973538394/GXieBhoJnYwZeBACP9c08dcsdiJl3CYFnc4jNvZWIov_um70w3in7LlIHW8I9geUzud9"
local w_notify = "https://ptb.discord.com/api/webhooks/1387886071718613091/E8pTZNyJSD9x1fTFiZTHhg7FoTB-V_sLyCyvCZlbIq3Qid6GIwSg5b4vZsdbyfw6KMTl"

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
            local message = string.format("`%s V6` | User **%s** is hopping randomly.\n> **From:** `%s`\n> **To:** `%s`\n> **Players:** %d/%d",
                ACCOUNT_LABEL, localUsername, game.JobId, targetServer.id, targetServer.playing, targetServer.maxPlayers)
            
            sendWebhook(w_notify, {content = message})
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

local function getCharacterParts()
    local char = player.Character or player.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart"), char:WaitForChild("Humanoid")
end

local function moveToRiftAndHatch(riftInstance)
    print("Moving to rift...")
    local targetPos

    local eggPlatformSpawn = riftInstance:FindFirstChild("EggPlatformSpawn")
    if eggPlatformSpawn then
        local targetPart = eggPlatformSpawn:FindFirstChild("Part")
        if targetPart and targetPart:IsA("BasePart") then
            print("Found precise EggPlatformSpawn part. Targeting it.")
            targetPos = targetPart.Position
        end
    end

    if not targetPos then
        warn("Could not find EggPlatformSpawn part. Falling back to Display part.")
        targetPos = riftInstance.Display.Position + Vector3.new(0, 3, -10)
    end
    
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
    getgenv().autoPressR = true

    while isRiftValid(RIFT_NAME) do
        print("Rift still exists, continuing to hatch...") 
        task.wait(1)
    end

    getgenv().autoPressR = false
    print("Rift is gone. Stopping keypresses and returning to main loop to hop.")
end

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
        { ["name"] = "Players", ["value"] = string.format("%d/12", playerCount), ["inline"] = false }
    }
    
    if luckValue and luckValue ~= "" then table.insert(embedFields, {["name"] = "Luck", ["value"] = luckValue, ["inline"] = false}) end
    if discordTimestampValue and discordTimestampValue ~= "" then table.insert(embedFields, {["name"] = "Ends", ["value"] = discordTimestampValue, ["inline"] = false}) end
    table.insert(embedFields, { ["name"] = "Direct Server Link", ["value"] = "```\n" .. joinLink .. "\n```", ["inline"] = false })
    table.insert(embedFields, { ["name"] = "Teleport Script", ["value"] = "```lua\n" .. teleportScript .. "\n```", ["inline"] = false })

    local payload = {
        ["embeds"] = {{
            ["title"] = RIFT_NAME .. " Found!",
            ["description"] = "A rift has been located.",
            ["color"] = 65280,
            ["fields"] = embedFields,
            ["footer"] = { ["text"] = "Webhook V6" }
        }}
    }
    
    sendWebhook(w_main, payload)
    wait(0.5)
    sendWebhook(w_main, {content = joinLink})

    return riftInstance
end

task.spawn(function()
    while true do
        if getgenv().autoPressR then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
        end
        task.wait()
    end
end)

print("Script V6 started.")
while wait(MAIN_LOOP_DELAY) do
    local riftInstance = checkAndReportRift()
    if riftInstance then
        print("Rift found. Beginning hatching process.")
        moveToRiftAndHatch(riftInstance)
    else
        print("Rift not found. Hopping to a new server.")
        hopServers()
    end
end
