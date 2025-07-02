-- Version 9.5 - Final Webhooks & Chat Message
wait(1)

-- =============================================
-- SERVICES & REFERENCES
-- =============================================
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local localUsername = player.Name

-- =============================================
-- CONFIGURATION
-- =============================================
local APP_URL = "https://3ae7268a-ee7c-403b-a8f2-1fd351479dd3-00-5wimpzm11b3c.riker.replit.dev/" 
local RIFT_PATH = workspace.Rendered.Rifts
local MINIMUM_LUCK_MULTIPLIER = 25 

--- PING CONFIGURATION ---
local PING_ID_DONATOR = "1388299843973283850"
local PING_ID_BOOSTER = "1389570682400014428"
local PING_ID_LEVEL15 = "1387186611468374117"
local PING_ID_MEMBER = "1389179804988997702"

--- HUNT TARGETS ---
local RIFT_NAME = "gift-rift"
local RIFT_THUMBNAIL_URL = "https://media.discordapp.net/attachments/1371145746371579998/1387547415959179295/latest.png?ex=686303bb&is=6861b23b&hm=03a9b1ba1ee8fe38aa781f2580ba664d1be628313a5545a7f2b8baab64f3bb01&=&format=webp&quality=lossless&width=525&height=525"
local EVENT_EGG_NAME = "festival-rift-3"
local EVENT_THUMBNAIL_URL = "https://media.discordapp.net/attachments/1386970256978743407/1389169576998338630/july4th-egg.png?ex=6863a47c&is=686252fc&hm=28cbfd94053a9716ba1ed201a34709c2afc8412324e5fe9e720cfd8fefa785d8&=&format=webp&quality=lossless&width=462&height=462"
local BOUNTY_EGG_NAME = "lunar-egg"
local BOUNTY_THUMBNAIL_URL = "https://media.discordapp.net/attachments/1361022182951485571/1389407298732167240/lunar-egg.png?ex=686481e1&is=68633061&hm=09b1b6d4e0f6306cf786c7e7d56ac4dc4f6becc290d1e50057f816b3fd0e770a&=&format=webp&quality=lossless&width=525&height=525"
local ROYAL_CHEST_NAME = "royal-chest"
local ROYAL_CHEST_THUMBNAIL_URL = "https://media.discordapp.net/attachments/1389548143720271934/1389587574145941584/latest.png?ex=686529c6&is=6863d846&hm=595fd3033fcd40d3e1f15e4dc46e0f37fe82eee11967e467c64a439d6c54ee8d&=&format=webp&quality=lossless&width=963&height=963"
local DICE_RIFT_NAME = "dice-rift"
local DICE_RIFT_THUMBNAIL_URL = "https://media.discordapp.net/attachments/1389548143720271934/1389587782191546548/latest.png?ex=686529f8&is=6863d878&hm=b2a88172736672ec795eed13092754a1bdad8544022dc29a6af5f4f59fe05004&=&format=webp&quality=lossless&width=963&height=963"
local LUCK_RIFT_CONFIG = {
    ["rainbow-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592857882529802/rainbow-egg.png?ex=68652eb2&is=6863dd32&hm=74b63beddb92b61f68cae3c5e01ab24a37face0f6a09c94ba317419568c6c3fb&=&format=webp&quality=lossless&width=525&height=525",
    ["neon-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592845421379594/neon-egg.png?ex=68652eaf&is=6863dd2f&hm=d8e318018d7d1161f355d5fc3fa3f4af52d620118467bc0bfbe348f711b12fba&=&format=webp&quality=lossless&width=525&height=525",
    ["nightmare-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592835950510110/nightmare-egg.png?ex=68652ead&is=6863dd2d&hm=1e235ff8a69a8edbd71a09d78fed74e5cae6292de07b8a823beb9cc5a48c5af5&=&format=webp&quality=lossless&width=525&height=525",
    ["cyber-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592820217810965/cyber-egg.png?ex=68652ea9&is=6863dd29&hm=c1d6bcef289270627be976788f35c7905da2d50a85350ba10d34e398ea67d5d4&=&format=webp&quality=lossless&width=525&height=525",
    ["hell-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592807471317032/hell-egg.png?ex=68652ea6&is=6863dd26&hm=86a247a7f8bfa8e8d3ef68f66d065ec45113286d2c8f3e29a79ddbb9d4b27ce3&=&format=webp&quality=lossless&width=525&height=525",
    ["void-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592795777470526/void-egg.png?ex=68652ea3&is=6863dd23&hm=81e1a170e85e646484861cac36839d7ec14ba40bf2e3ac4343948d4dfb62975b&=&format=webp&quality=lossless&width=525&height=525",
    ["mining-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592781609107616/mining-egg.png?ex=68652ea0&is=6863dd20&hm=086d007ddac441432884696ea9a87bd1868e5c41e8f8e65b92360b37bad667ea&=&format=webp&quality=lossless&width=525&height=525",
    ["lunar-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592770632614051/lunar-egg.png?ex=68652e9d&is=6863dd1d&hm=bb1575cfdd7f6cd88e5a0d888d53296887445321d531bd63e5ee01f0cf19dc52&=&format=webp&quality=lossless&width=525&height=525",
    ["crystal-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592755088527381/crystal-egg.png?ex=68652e9a&is=6863dd1a&hm=5d92345851fdd68e2729793413716b6c92778541cca4f3f88ac9b128ab10bc55&=&format=webp&quality=lossless&width=525&height=525",
    ["magma-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592741545119895/magma-egg.png?ex=68652e96&is=6863dd16&hm=4d886730a09ac201a0afc64df2aac7d8f16628c1d2a7fe3db838de5cd618df11&=&format=webp&quality=lossless&width=525&height=525",
    ["spikey-egg"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592728056234107/spikey-egg.png?ex=68652e93&is=6863dd13&hm=46d9ab3653508d10d1b88118e12ba3064f56de607f2d66eb89ed993a8d671e2c&=&format=webp&quality=lossless&width=525&height=525",
    ["festival-rift-3"] = "https://media.discordapp.net/attachments/1389548143720271934/1389592711115444265/july4th-egg.png?ex=68652e8f&is=6863dd0f&hm=581d7045e58314d31c8d830c82654c7ce6876e3cfd89b986ef2ef4e34c6aaf37&=&format=webp&quality=lossless&width=525&height=525"
}

local presetServerList = "SERVER_LIST_PLACEHOLDER"

-- [[ ⭐️ MODIFIED: All webhooks updated to your latest links ⭐️ ]]
local w_main = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 49, 56, 56, 50, 50, 55, 53, 53, 57, 48, 50, 51, 53, 47, 70, 107, 95, 76, 103, 110, 67, 88, 82, 103, 97, 110, 56, 119, 100, 105, 115, 73, 110, 114, 73, 66, 105, 80, 118, 105, 113, 77, 56, 101, 67, 49, 65, 120, 48, 78, 56, 48, 56, 78, 79, 114, 74, 51, 54, 85, 100, 103, 76, 48, 56, 82, 51, 117, 122, 118, 56, 113, 119, 110, 100, 88, 53, 98, 72, 74, 88, 112}
local w_member = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 55, 51, 48, 51, 50, 52, 56, 53, 52, 52, 54, 54, 49, 53, 49, 52, 47, 66, 86, 109, 72, 114, 105, 65, 117, 104, 118, 52, 79, 89, 83, 107, 51, 67, 87, 75, 102, 65, 114, 109, 121, 87, 116, 110, 110, 90, 67, 67, 85, 108, 78, 89, 115, 112, 49, 85, 99, 76, 86, 52, 69, 113, 76, 53, 115, 65, 103, 101, 90, 108, 117, 99, 68, 95, 52, 117, 109, 50, 79, 114, 100, 86, 116, 98, 86}
local w_booster = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 49, 56, 56, 50, 51, 56, 48, 52, 52, 55, 55, 54, 52, 47, 107, 104, 87, 74, 83, 103, 50, 95, 73, 100, 49, 107, 65, 84, 114, 103, 56, 75, 78, 78, 66, 57, 120, 119, 82, 103, 88, 54, 57, 89, 50, 50, 70, 76, 116, 106, 71, 116, 107, 67, 95, 118, 110, 51, 121, 49, 79, 55, 55, 54, 100, 111, 85, 74, 85, 54, 55, 101, 101, 56, 106, 68, 70, 50, 56, 100, 72, 74}
local w_level15 = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 49, 56, 56, 49, 50, 52, 56, 49, 49, 54, 56, 49, 55, 47, 49, 65, 100, 52, 50, 70, 83, 122, 121, 48, 80, 98, 120, 95, 103, 116, 84, 84, 109, 50, 45, 48, 106, 120, 107, 74, 70, 72, 68, 51, 108, 104, 100, 82, 69, 100, 87, 86, 68, 79, 78, 88, 99, 104, 70, 66, 108, 116, 105, 112, 103, 117, 89, 115, 104, 77, 49, 114, 69, 84, 55, 106, 111, 122, 85, 88, 121, 104}
local w_donator = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 49, 56, 55, 52, 52, 50, 51, 55, 49, 56, 48, 54, 56, 47, 49, 55, 113, 85, 102, 103, 103, 111, 88, 117, 103, 102, 51, 78, 67, 107, 121, 102, 109, 89, 120, 52, 89, 65, 86, 76, 97, 57, 114, 122, 81, 113, 89, 65, 67, 109, 100, 104, 121, 83, 106, 65, 117, 106, 67, 107, 49, 111, 90, 107, 75, 55, 97, 119, 88, 56, 100, 95, 84, 75, 53, 88, 97, 104, 104, 79, 51, 119}
local w_notify = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 52, 51, 57, 51, 49, 48, 53, 53, 51, 53, 53, 48, 57, 50, 48, 47, 87, 57, 101, 110, 72, 78, 77, 51, 65, 83, 102, 114, 54, 100, 86, 66, 114, 79, 113, 114, 54, 112, 74, 114, 79, 75, 55, 102, 71, 55, 77, 48, 49, 83, 104, 120, 81, 71, 73, 85, 48, 98, 120, 95, 78, 106, 49, 95, 121, 82, 88, 70, 101, 80, 49, 54, 90, 86, 118, 97, 66, 57, 81, 50, 78, 70, 45, 67}
local w_event = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 50, 52, 49, 52, 51, 52, 51, 56, 57, 51, 49, 51, 51, 47, 98, 53, 119, 84, 111, 49, 117, 105, 109, 70, 117, 86, 86, 53, 121, 66, 76, 73, 105, 111, 88, 89, 71, 110, 108, 76, 49, 66, 45, 76, 52, 54, 110, 113, 90, 84, 72, 90, 71, 85, 45, 51, 103, 85, 110, 68, 72, 67, 108, 115, 120, 95, 45, 118, 49, 84, 122, 48, 48, 118, 101, 109, 81, 74, 107, 105, 69, 67}
local w_bounty = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 50, 52, 49, 50, 51, 48, 57, 54, 53, 49, 52, 53, 55, 47, 54, 48, 121, 51, 117, 102, 76, 68, 100, 81, 89, 97, 105, 112, 108, 99, 108, 72, 110, 115, 114, 78, 50, 121, 51, 117, 121, 114, 69, 54, 108, 51, 103, 73, 83, 51, 80, 53, 76, 105, 87, 108, 84, 115, 86, 102, 122, 65, 68, 85, 115, 100, 85, 56, 110, 89, 119, 86, 83, 97, 102, 78, 112, 95, 68, 117, 120, 76}
local w_royal = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 51, 57, 55, 52, 54, 55, 57, 53, 48, 51, 48, 57, 56, 47, 74, 117, 110, 66, 106, 113, 113, 90, 81, 68, 85, 53, 109, 111, 87, 49, 84, 117, 110, 99, 102, 82, 69, 49, 116, 119, 111, 85, 85, 77, 78, 99, 68, 69, 101, 48, 117, 54, 80, 67, 78, 101, 75, 86, 74, 73, 106, 55, 121, 51, 45, 109, 79, 71, 98, 107, 106, 103, 82, 101, 85, 51, 74, 103, 73, 108, 67, 80}
local w_dice = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 51, 57, 55, 50, 52, 49, 48, 53, 49, 57, 54, 56, 51, 47, 51, 77, 76, 66, 121, 106, 51, 86, 51, 81, 101, 100, 48, 116, 88, 86, 99, 85, 106, 115, 71, 95, 95, 70, 106, 111, 99, 89, 78, 45, 48, 110, 121, 117, 101, 66, 115, 117, 89, 100, 85, 97, 102, 78, 71, 71, 104, 68, 95, 97, 103, 73, 53, 53, 81, 111, 79, 95, 105, 89, 75, 51, 51, 69, 51, 122, 117, 102}
local w_25x_luck = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 55, 57, 49, 56, 56, 49, 53, 55, 48, 57, 52, 55, 49, 54, 50, 47, 45, 115, 104, 111, 104, 55, 98, 83, 118, 80, 108, 66, 73, 76, 109, 100, 48, 82, 82, 117, 84, 89, 87, 114, 82, 98, 80, 121, 106, 75, 69, 55, 79, 99, 112, 90, 82, 114, 68, 95, 97, 48, 117, 101, 97, 85, 100, 75, 111, 106, 69, 57, 70, 112, 72, 57, 52, 97, 66, 103, 73, 114, 104, 80, 73, 69, 97, 104}

-- =============================================
-- STATE MANAGEMENT
-- =============================================
local isTeleporting = false
local reportedRiftsInServer = {}

-- =============================================
-- UTILITY FUNCTIONS
-- =============================================
local function decodeWebhookURL(tbl)
    local url = ""
    for i,v in ipairs(tbl) do url = url .. string.char(v) end
    return url
end

local function sendWebhook(targetUrl, payload)
    local requestBody = HttpService:JSONEncode(payload)
    local requestOptions = {Url = targetUrl, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = requestBody}
    pcall(function() if syn and syn.request then return syn.request(requestOptions) elseif request then return request(requestOptions) elseif http and http.request then return http.request(requestOptions) else warn("No known client-side HTTP function found.") end end)
end

local function chatMessage(message)
    local isLegacyChat = (TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService)
    pcall(function()
        if isLegacyChat then
            ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
        else
            TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral"):SendAsync(message)
        end
    end)
end

local function isRiftValid(riftName)
    local rift = RIFT_PATH:FindFirstChild(riftName)
    if rift and rift:FindFirstChild("Display") and rift.Display:IsA("BasePart") then return rift end
    return nil
end

local function getEggLuck(eggInstance)
    local luckValue = 0
    local luckText = ""
    local surfaceGui = eggInstance.Display:FindFirstChild("SurfaceGui")
    if surfaceGui then
        local icon = surfaceGui:FindFirstChild("Icon")
        if icon then
            local luckLabel = icon:FindFirstChild("Luck")
            if luckLabel and luckLabel:IsA("TextLabel") then
                luckText = luckLabel.Text
                local numString = string.gsub(luckText, "[^%d%.%-]", "")
                luckValue = tonumber(numString) or 0
            end
        end
    end
    return luckValue, luckText
end

-- =============================================
-- PAYLOAD & BROADCASTING
-- =============================================
local function generatePayload(reportType, targetInstance)
    local jobId = game.JobId
    local placeId = game.PlaceId
    local playerCount = #Players:GetPlayers()
    local secureJoinUrl = string.format("%s/join?id=%s", APP_URL, jobId)
    local expiresValue, height = "", math.floor(targetInstance.Display.Position.Y)
    local surfaceGui = targetInstance.Display:FindFirstChild("SurfaceGui")
    if surfaceGui and surfaceGui:FindFirstChild("Timer") then
        local timerText = surfaceGui.Timer.Text
        local minutes, seconds = tonumber(string.match(timerText, "(%d+) ?m")) or 0, tonumber(string.match(timerText, "(%d+) ?s")) or 0
        if (minutes + seconds) > 0 then expiresValue = string.format("<t:%d:R>", os.time() + (minutes * 60) + seconds) end
    end
    
    local details = ""
    local luckTextForEmbed = ""

    local _, rawLuckText = getEggLuck(targetInstance)
    luckTextForEmbed = rawLuckText

    if luckTextForEmbed ~= "" then details = details .. "Luck Multi: **" .. luckTextForEmbed .. "**\n" end
    if expiresValue ~= "" then details = details .. "Expires: " .. expiresValue .. "\n" end
    details = details .. "Height: **" .. tostring(height) .. "**"

    local payload = {
        embeds = {{
            fields = {
                { name = "Game ID", value = "`" .. tostring(placeId) .. "`", inline = true },
                { name = "Server ID", value = "`" .. jobId .. "`", inline = true },
                { name = "Players", value = "`" .. playerCount .. " / 12`", inline = true},
                { name = "Details", value = details, inline = false },
                { name = "🔗Game Link", value = "[**Click Here to Login & Join**]("..secureJoinUrl..")", inline = false }
            }
        }}
    }
    
    if reportType == "RIFT" then
        payload.embeds[1].color = 15158332
        payload.embeds[1].title = "🛸 BRUH RIFT INVASION DETECTED! 🛸"
        payload.embeds[1].description = "The main rift has been discovered!"
        payload.embeds[1].thumbnail = { url = RIFT_THUMBNAIL_URL }
    elseif reportType == "EVENT_EGG" then
        payload.embeds[1].color = 5814783
        payload.embeds[1].title = "🥚 EVENT EGG FOUND 🥚"
        payload.embeds[1].description = "An event egg has been discovered! Click the button below to verify and join."
        payload.embeds[1].thumbnail = { url = EVENT_THUMBNAIL_URL }
    elseif reportType == "BOUNTY_EGG" then
        payload.embeds[1].color = 8421504 
        payload.embeds[1].title = "🥚 BOUNTY EGG FOUND 🥚"
        payload.embeds[1].description = "A bounty egg has been discovered! Click the button below to verify and join."
        payload.embeds[1].thumbnail = { url = BOUNTY_THUMBNAIL_URL }
    elseif reportType == "ROYAL_CHEST" then
        payload.embeds[1].color = 16776960 
        payload.embeds[1].title = "👑 ROYAL CHEST FOUND 👑"
        payload.embeds[1].description = "A royal chest has been discovered! Click the button below to verify and join."
        payload.embeds[1].thumbnail = { url = ROYAL_CHEST_THUMBNAIL_URL }
    elseif reportType == "DICE_RIFT" then
        payload.embeds[1].color = 16711680 
        payload.embeds[1].title = "🎲 DICE RIFT FOUND 🎲"
        payload.embeds[1].description = "A dice rift has been discovered! Click the button below to verify and join."
        payload.embeds[1].thumbnail = { url = DICE_RIFT_THUMBNAIL_URL }
    elseif reportType == "LUCK_RIFT" then
        local riftName = targetInstance.Name
        local cleanName = string.upper(string.gsub(riftName, "-", " "))
        payload.embeds[1].color = 16711935 -- Magenta
        payload.embeds[1].title = "🍀 25x LUCK RIFT: " .. cleanName .. " 🍀"
        payload.embeds[1].description = "A 25x luck rift has been found!"
        payload.embeds[1].thumbnail = { url = LUCK_RIFT_CONFIG[riftName] or "" }
    end
    return payload
end

local function broadcastRiftFoundAndWait(riftInstance)
    local payload = generatePayload("RIFT", riftInstance)
    print("Broadcasting MAIN RIFT and waiting for staggered pings to complete...")
    
    -- Send to main webhook (no ping)
    payload.content = "A new `bruh-egg` has been found!"
    sendWebhook(decodeWebhookURL(w_main), payload)
    
    -- Send to Donator
    task.wait(1)
    payload.content = "<@&"..PING_ID_DONATOR..">"
    sendWebhook(decodeWebhookURL(w_donator), payload)
    
    -- Send to Booster
    task.wait(2) -- Total 3s
    payload.content = "<@&"..PING_ID_BOOSTER..">"
    sendWebhook(decodeWebhookURL(w_booster), payload)
    
    -- Send to Level 15
    task.wait(1) -- Total 4s
    payload.content = "<@&"..PING_ID_LEVEL15..">"
    sendWebhook(decodeWebhookURL(w_level15), payload)
    
    -- Send to Member
    task.wait(5) -- Total 9s
    payload.content = "<@&"..PING_ID_MEMBER..">"
    sendWebhook(decodeWebhookURL(w_member), payload)
    
    print("Staggered broadcast for main rift complete.")
end

local function broadcastEventEggFound(eventEggInstance)
    local payload = generatePayload("EVENT_EGG", eventEggInstance)
    print("Broadcasting EVENT EGG found immediately...")
    sendWebhook(decodeWebhookURL(w_event), payload)
end

local function broadcastBountyEggFound(bountyEggInstance)
    local payload = generatePayload("BOUNTY_EGG", bountyEggInstance)
    print("Broadcasting BOUNTY EGG found immediately...")
    sendWebhook(decodeWebhookURL(w_bounty), payload)
end

local function broadcastRoyalChestFound(chestInstance)
    local payload = generatePayload("ROYAL_CHEST", chestInstance)
    print("Broadcasting ROYAL CHEST found immediately...")
    sendWebhook(decodeWebhookURL(w_royal), payload)
end

local function broadcastDiceRiftFound(riftInstance)
    local payload = generatePayload("DICE_RIFT", riftInstance)
    print("Broadcasting DICE RIFT found immediately...")
    sendWebhook(decodeWebhookURL(w_dice), payload)
end

local function broadcastLuckRiftFound(riftInstance)
    local payload = generatePayload("LUCK_RIFT", riftInstance)
    print("Broadcasting LUCK RIFT ("..riftInstance.Name..") found immediately...")
    sendWebhook(decodeWebhookURL(w_25x_luck), payload)
end

-- =============================================
-- MAIN TELEPORT & HOPS LOGIC
-- =============================================
local function attemptHop()
    if isTeleporting then warn("Hop cancelled: A teleport is already in progress.") return end
    if type(presetServerList) ~= "table" or #presetServerList == 0 then
        print("Hop Cancelled: 'presetServerList' is not a table or is empty. Please add server Job IDs to the script.")
        task.wait(60) 
        return
    end
    isTeleporting = true
    
    reportedRiftsInServer = {}
    print("Server hopping. Reported rifts have been cleared for this server.")

    print("Sending pre-hop chat message...")
    chatMessage("gg/hYTNYhqXaH BRUH RIFT & EVENT EGG RIFTS")
    task.wait(2)
    print("Picking a random server from the preset list...")
    local serverId = presetServerList[math.random(1, #presetServerList)]
    local message = string.format("`V9.5` | User **%s** is hopping.\n> **From:** `%s`\n> **To:** `%s`", localUsername, game.JobId, serverId)
    sendWebhook(decodeWebhookURL(w_notify), {content = message})
    task.wait(1)
    print("Initiating teleport now...")
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, player) end)
end

if not _G.TeleportHandlerConnected then
    _G.TeleportHandlerConnected = true
    TeleportService.TeleportInitFailed:Connect(function(_, _, errorMessage)
        warn("Teleport failed! Resetting lock. Reason: " .. errorMessage)
        isTeleporting = false
        local failMessage = string.format("`V9.5` | **%s** teleport failed.\n> **Reason:** `%s`", localUsername, errorMessage)
        sendWebhook(decodeWebhookURL(w_notify), {content = failMessage})
    end)
end

-- =============================================
-- MAIN EXECUTION FLOW (Simplified)
-- =============================================
print("Script V9.4 started. Hunting all targets...")

task.spawn(function()
    while task.wait(5) do
        if isTeleporting then
            print("Waiting for current teleport to complete...")
        else
            local mainRiftFound = false
            -- Step 1: Check for all report-only targets
            local eventEggInstance = isRiftValid(EVENT_EGG_NAME)
            if eventEggInstance and not reportedRiftsInServer[EVENT_EGG_NAME] then
                local luck, _ = getEggLuck(eventEggInstance)
                if luck >= MINIMUM_LUCK_MULTIPLIER then
                    print("VALID EVENT EGG FOUND! Reporting...")
                    broadcastEventEggFound(eventEggInstance)
                    reportedRiftsInServer[EVENT_EGG_NAME] = true
                end
            end
            local bountyEggInstance = isRiftValid(BOUNTY_EGG_NAME)
            if bountyEggInstance and not reportedRiftsInServer[BOUNTY_EGG_NAME] then
                local luck, _ = getEggLuck(bountyEggInstance)
                if luck >= MINIMUM_LUCK_MULTIPLIER then
                    print("VALID BOUNTY EGG FOUND! Reporting...")
                    broadcastBountyEggFound(bountyEggInstance)
                    reportedRiftsInServer[BOUNTY_EGG_NAME] = true
                end
            end
            local royalChestInstance = isRiftValid(ROYAL_CHEST_NAME)
            if royalChestInstance and not reportedRiftsInServer[ROYAL_CHEST_NAME] then
                print("ROYAL CHEST FOUND! Reporting...")
                broadcastRoyalChestFound(royalChestInstance)
                reportedRiftsInServer[ROYAL_CHEST_NAME] = true
            end
            local diceRiftInstance = isRiftValid(DICE_RIFT_NAME)
            if diceRiftInstance and not reportedRiftsInServer[DICE_RIFT_NAME] then
                print("DICE RIFT FOUND! Reporting...")
                broadcastDiceRiftFound(diceRiftInstance)
                reportedRiftsInServer[DICE_RIFT_NAME] = true
            end

            -- Step 2: Check for the main "bruh-egg" rift
            local riftInstance = isRiftValid(RIFT_NAME)
            if riftInstance and not reportedRiftsInServer[RIFT_NAME] then
                print("Original Rift ('"..RIFT_NAME.."') FOUND! Reporting and waiting...")
                reportedRiftsInServer[RIFT_NAME] = true
                broadcastRiftFoundAndWait(riftInstance) -- This now pauses the script
                mainRiftFound = true
            end

            -- Step 3: Perform the "all-around" luck check for any other configured rifts
            for _, rift in ipairs(RIFT_PATH:GetChildren()) do
                if rift:IsA("Model") and rift:FindFirstChild("Display") and not reportedRiftsInServer[rift.Name] then
                    if LUCK_RIFT_CONFIG[rift.Name] then
                        local luckValue, _ = getEggLuck(rift)
                        if luckValue >= MINIMUM_LUCK_MULTIPLIER then
                            print("HIGH LUCK RIFT FOUND! Name: " .. rift.Name .. ", Luck: " .. luckValue .. "x. Reporting...")
                            broadcastLuckRiftFound(rift)
                            reportedRiftsInServer[rift.Name] = true
                        end
                    end
                end
            end
            
            -- Step 4: After all checks, if the main rift wasn't found, hop.
            -- If it WAS found, this will be skipped, and the script will wait here for the next 5-second check.
            if not mainRiftFound then
                print("No main rift found on this server. Hopping...")
                attemptHop()
            else
                 print("Main rift was found. Holding on this server until it disappears.")
            end
        end
    end
end)
