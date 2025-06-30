-- Version 5.19 - Testing Webhook
wait(1)

-- =============================================
-- SERVICES & REFERENCES
-- =============================================
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local localUsername = player.Name
local remoteEvent = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("RemoteEvent")

-- =============================================
-- CONFIGURATION
-- =============================================
-- !!! IMPORTANT: REPLACE WITH YOUR REPLIT APP URL !!!
local APP_URL = "https://be31aba3-c401-464e-9084-f2b02e3cf599-00-23cpv2oivnb6o.spock.replit.dev/"
-- !!! IMPORTANT: REPLACE WITH YOUR REPLIT APP URL !!!

local RIFT_NAME = "gift-rift"
local RIFT_PATH = workspace.Rendered.Rifts
local PING_ROLE_ID = "1387110078695473242"
local THUMBNAIL_URL = "https://media.discordapp.net/attachments/1371145746371579998/1387547415959179295/latest.png?ex=686303bb&is=6861b23b&hm=03a9b1ba1ee8fe38aa781f2580ba664d1be628313a5545a7f2b8baab64f3bb01&=&format=webp&quality=lossless&width=525&height=525"
local presetServerList = "SERVER_LIST_PLACEHOLDER" -- REMEMBER: This needs to be filled.
-- Webhook URLs
-- MODIFIED: w_main has been updated to your testing URL.
local w_main = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 55, 49, 56, 49, 53, 50, 52, 55, 52, 54, 55, 54, 52, 52, 49, 56, 47, 55, 121, 101, 112, 55, 122, 112, 113, 68, 102, 86, 83, 122, 81, 54, 55, 71, 74, 81, 112, 97, 97, 86, 84, 69, 84, 86, 72, 86, 76, 89, 75, 51, 88, 98, 102, 65, 82, 90, 56, 73, 121, 77, 79, 101, 45, 48, 69, 85, 81, 53, 56, 122, 122, 86, 69, 84, 108, 114, 95, 105, 71, 110, 100, 48, 81, 119, 122}
local w_notify = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 56, 54, 52, 56, 55, 50, 49, 55, 53, 48, 54, 56, 55, 55, 55, 52, 47, 51, 105, 100, 104, 89, 99, 106, 79, 106, 122, 55, 98, 50, 50, 79, 80, 51, 101, 84, 73, 120, 69, 86, 55, 49, 71, 117, 86, 56, 86, 110, 86, 110, 80, 70, 57, 115, 48, 71, 84, 78, 48, 113, 97, 112, 120, 48, 120, 49, 103, 70, 114, 101, 72, 73, 49, 120, 108, 73, 119, 121, 75, 51, 103, 108, 88, 86, 111}

-- =============================================
-- STATE VARIABLES
-- =============================================
local tweenController = { active = false, currentTween = nil }
local isHatching = false
local isTeleporting = false
getgenv().autoPressR = false

-- =============================================
-- UTILITY FUNCTIONS
-- =============================================
local function decodeWebhookURL(tbl) 
    local url = "" 
    for i,v in ipairs(tbl) do 
        url = url .. string.char(v) 
    end 
    return url 
end

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
-- RIFT REPORTING (MODIFIED FOR SECURE AUTH)
-- =============================================
local function sendRiftReport(riftInstance)
    local luckValue, expiresValue, height = "", "", math.floor(riftInstance.Display.Position.Y)
    local gameId, jobId = game.PlaceId, game.JobId
    
    -- This now creates the single, secure link that points to your Replit app.
    local secureJoinUrl = string.format("%s/join?id=%s", APP_URL, jobId)

    local iconPart = riftInstance.Display:FindFirstChild("Icon")
    if iconPart and iconPart:FindFirstChild("Luck") then luckValue = iconPart.Luck.Text end

    local surfaceGui = riftInstance.Display:FindFirstChild("SurfaceGui")
    if surfaceGui and surfaceGui:FindFirstChild("Timer") then
        local timerText = surfaceGui.Timer.Text
        local minutes, seconds = tonumber(string.match(timerText, "(%d+) ?m")) or 0, tonumber(string.match(timerText, "(%d+) ?s")) or 0
        if (minutes + seconds) > 0 then expiresValue = string.format("<t:%d:R>", os.time() + (minutes * 60) + seconds) end
    end
    
    local riftDetails = ""
    if luckValue ~= "" then riftDetails = riftDetails .. "Luck Multi: **" .. luckValue .. "**\n" end
    if expiresValue ~= "" then riftDetails = riftDetails .. "Expires: " .. expiresValue .. "\n" end
    riftDetails = riftDetails .. "Height: **" .. tostring(height) .. "**"

    local payload = {
        content = "🚨 **EMERGENCY RIFT INVASION!** 🚨",
        embeds = {
            {
                color = 13631488,
                title = "🚨 BRUH RIFT INVASION DETECTED! 🛸",
                description = "A new rift has been discovered. Click the button below to verify your role and join the server.",
                fields = {
                    { name = "👾 Server ID", value = "`" .. jobId .. "`", inline = true },
                    { name = "🎮 Game ID", value = "`" .. tostring(gameId) .. "`", inline = true },
                    { name = "📋 Rift Details", value = riftDetails, inline = false },
                    { name = "🔗 Secure Join Link", value = "[**Click Here to Login & Join**]("..secureJoinUrl..")", inline = false }
                },
                thumbnail = {
                    url = THUMBNAIL_URL 
                }
            }
        }
    }
    
    local decoded_w_main = decodeWebhookURL(w_main)
    sendWebhook(decoded_w_main, payload)
end

-- =============================================
-- TWEENING & HATCHING SYSTEM (UNCHANGED)
-- =============================================
local function getCharacterParts() local char = player.Character or player.CharacterAdded:Wait() return char:WaitForChild("HumanoidRootPart"), char:WaitForChild("Humanoid") end
local function startHatchingLoop()
    print("Arrived at rift. Starting to press 'R' to hatch.")
    getgenv().autoPressR = true
end
local function teleportToRift(targetPosition, onComplete, riftName) tweenController.active = true local humanoidRootPart, humanoid = getCharacterParts() if not humanoidRootPart or not humanoid then warn("Character parts not found, cannot tween.") tweenController.active = false if onComplete then onComplete(riftName) end return end local originalState = { WalkSpeed = humanoid.WalkSpeed, AutoRotate = humanoid.AutoRotate, JumpPower = humanoid.JumpPower, Gravity = workspace.Gravity } humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = 0, false, 0, 0 print("Attempting initial remote teleport to get close to the rift zone...") pcall(function() remoteEvent:FireServer("Teleport", "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn") task.wait(1.5) humanoidRootPart, humanoid = getCharacterParts() print("Initial teleport complete. Starting tween for final positioning.") end) task.spawn(function() while tweenController.active and humanoidRootPart and humanoidRootPart.Parent do if (humanoidRootPart.Position - targetPosition).Magnitude < 5 then print("Reached target position via tween.") break end if not (tweenController.currentTween and tweenController.currentTween.PlaybackState == Enum.PlaybackState.Playing) then local time = (humanoidRootPart.Position - targetPosition).Magnitude / math.max(1, TWEEN_SPEED) tweenController.currentTween = TweenService:Create(humanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)}) tweenController.currentTween:Play() end task.wait(0.1) end if tweenController.currentTween then tweenController.currentTween:Cancel() end if humanoid and humanoid.Parent then humanoid.WalkSpeed, humanoid.AutoRotate, humanoid.JumpPower, workspace.Gravity = originalState.WalkSpeed, originalState.AutoRotate, originalState.JumpPower, originalState.Gravity end tweenController.active = false if onComplete then onComplete(riftName) end end) end

-- =============================================
-- MAIN TELEPORT & HOPS LOGIC (UNCHANGED)
-- =============================================
local function attemptHop()
    if isTeleporting then
        warn("Hop cancelled: A teleport is already in progress.")
        return
    end
    if type(presetServerList) ~= "table" or #presetServerList == 0 then 
        warn("Cannot hop: Server list is empty!")
        return 
    end
    isTeleporting = true
    print("Picking a random server from the preset list...")
    local serverId = presetServerList[math.random(1, #presetServerList)]
    local message = string.format("`V5.19` | User **%s** is hopping.\n> **From:** `%s`\n> **To:** `%s`", localUsername, game.JobId, serverId)
    
    local decoded_w_notify = decodeWebhookURL(w_notify)
    sendWebhook(decoded_w_notify, {content = message})

    task.wait(1)
    print("Initiating teleport now...")
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, player) end)
end

if not _G.TeleportHandlerConnected then
    _G.TeleportHandlerConnected = true
    TeleportService.TeleportInitFailed:Connect(function(_, teleportResult, errorMessage)
        warn("Teleport failed! Resetting lock. Reason: " .. errorMessage)
        isTeleporting = false
        local failMessage = string.format("`V5.19` | **%s** teleport failed.\n> **Reason:** `%s`", localUsername, errorMessage)
        
        local decoded_w_notify = decodeWebhookURL(w_notify)
        sendWebhook(decoded_w_notify, {content = failMessage})
    end)
end

-- =============================================
-- MAIN EXECUTION FLOW (UNCHANGED)
-- =============================================
print("Script V5.19 started. Looking for rift...")

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

task.spawn(function()
    while task.wait(5) do
        if isHatching then
            if not isRiftValid(RIFT_NAME) then
                print("Rift is no longer valid. Stopping hatching and preparing to hop.")
                isHatching = false
                getgenv().autoPressR = false 
            end
        elseif isTeleporting then
            print("Waiting for current teleport to complete...")
        else
            local riftInstance = isRiftValid(RIFT_NAME)
            if riftInstance then
                isHatching = true 
                print("RIFT FOUND! State locked. Reporting once and moving...")
                
                sendRiftReport(riftInstance) -- This now calls our new secure function
                
                local decoded_w_notify = decodeWebhookURL(w_notify)
                
                local simpleNotifyMessage = {content = RIFT_NAME .. " found!!!"}
                sendWebhook(decoded_w_notify, simpleNotifyMessage)
                
                local targetPos = riftInstance.Display.Position + Vector3.new(0, 3, -10)
                teleportToRift(targetPos, startHatchingLoop, RIFT_NAME)
                
                local startMessage = string.format("`V5.19` | User **%s** found a "..RIFT_NAME.."! Moving to hatch.", localUsername)
                sendWebhook(decoded_w_notify, {content = startMessage})
            else
                print("No valid rift found. Attempting to hop.")
                attemptHop()
            end
        end
    end
end)
