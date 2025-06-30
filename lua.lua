-- =============================================
-- STANDALONE DONATOR WEBHOOK TEST SCRIPT
-- =============================================
print("Webhook Test Script Initialized. Please wait...")
wait(3) -- Wait a few seconds for game services to load

-- =============================================
-- SERVICES & REFERENCES
-- =============================================
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- =============================================
-- CONFIGURATION
-- =============================================
-- The donator webhook URL you provided, encoded as a table.
local w_donator = {104, 116, 116, 112, 115, 58, 47, 47, 112, 116, 98, 46, 100, 105, 115, 99, 111, 114, 100, 46, 99, 111, 109, 47, 97, 112, 105, 47, 119, 101, 98, 104, 111, 111, 107, 115, 47, 49, 51, 56, 57, 49, 51, 55, 48, 55, 56, 54, 53, 56, 52, 48, 52, 51, 53, 50, 47, 67, 73, 84, 90, 82, 104, 67, 113, 117, 82, 113, 49, 56, 67, 99, 49, 55, 104, 74, 121, 86, 103, 105, 69, 90, 56, 79, 104, 45, 53, 102, 116, 72, 66, 50, 111, 105, 49, 105, 50, 99, 86, 75, 53, 69, 87, 72, 77, 55, 77, 65, 99, 50, 67, 65, 69, 68, 49, 45, 111, 98, 79, 113, 84, 70, 65, 118, 57}
local RIFT_THUMBNAIL_URL = "https://media.discordapp.net/attachments/1371145746371579998/1387547415959179295/latest.png?ex=686303bb&is=6861b23b&hm=03a9b1ba1ee8fe38aa781f2580ba664d1be628313a5545a7f2b8baab64f3bb01&=&format=webp&quality=lossless&width=525&height=525"

-- =============================================
-- UTILITY FUNCTIONS
-- =============================================
-- Decodes the table of numbers back into a URL string.
local function decodeWebhookURL(tbl)
    local url = ""
    for i,v in ipairs(tbl) do url = url .. string.char(v) end
    return url
end

-- Sends the final data to the Discord webhook URL.
local function sendWebhook(targetUrl, payload)
    local requestBody = HttpService:JSONEncode(payload)
    local requestOptions = {Url = targetUrl, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = requestBody}
    
    -- This pcall will prevent errors from stopping the script.
    local success, response = pcall(function()
        if syn and syn.request then return syn.request(requestOptions)
        elseif request then return request(requestOptions)
        elseif http and http.request then return http.request(requestOptions)
        else
            warn("No known client-side HTTP function found.")
            return false, "No HTTP function available."
        end
    end)

    if success then
        print("Webhook request sent successfully.")
    else
        warn("Webhook request failed! Reason: " .. tostring(response))
    end
end

-- Generates the test embed with current server information.
local function generateTestPayload()
    local jobId = game.JobId
    local placeId = game.PlaceId
    local playerCount = #Players:GetPlayers()

    local payload = {
        embeds = {{
            color = 15158332, -- Red color from the original rift embed
            title = "🛸 Donator Webhook Test 🛸",
            description = "This is a test message to confirm the donator webhook is configured correctly.",
            fields = {
                { name = "Game ID", value = "`" .. tostring(placeId) .. "`", inline = true },
                { name = "Server ID", value = "`" .. jobId .. "`", inline = true },
                { name = "Players", value = "`" .. playerCount .. " / 12`", inline = true},
                { name = "Initiated By", value = "`" .. localPlayer.Name .. "`", inline = false},
                { name = "Status", value = "Test message sent.", inline = false}
            },
            thumbnail = { url = RIFT_THUMBNAIL_URL }
        }}
    }
    return payload
end

-- =============================================
-- MAIN EXECUTION
-- =============================================
print("--- Starting Donator Webhook Test ---")

-- 1. Generate the test data payload
local testPayload = generateTestPayload()
print("Test payload generated.")

-- 2. Decode the donator webhook URL
local donatorWebhookURL = decodeWebhookURL(w_donator)
print("Target URL decoded.")

-- 3. Send the webhook
print("Sending test message to donator webhook...")
sendWebhook(donatorWebhookURL, testPayload)

print("--- Webhook Test Complete ---")
print("A message should have been sent to your Discord channel. If not, the webhook URL is likely invalid or there is an issue with the HttpService in your environment.")
