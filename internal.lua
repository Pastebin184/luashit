local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Internal", 5013109572)
local Network = game:GetService("NetworkClient")
Network.ConnectionAccepted:Connect(function(Server, ReplicatorInstance)
    _G.Server = Server:gsub("|", ":")
end)

repeat game:GetService("RunService").Heartbeat:Wait() until _G.Server
local ip = _G.Server
print(ip)
-- themes
local themes = {
Background = Color3.fromRGB(255, 24, 24),
Glow = Color3.fromRGB(255, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Main", 5012544693)
local section1 = page:addSection("Scripts")


section1:addButton("Get Session ID", function()
local a = game.JobId
setclipboard(a)
end)

section1:addButton("Copy IP & Port", function()
setclipboard(ip)
end)

section1:addToggle("Auto Leave Protected",false, function(enabled)
while wait(0.1) do
    if enabled == true then
        print("aaaasda")
        if string.find(ip,".254") then
            game:GetService('Players').LocalPlayer:Kick("Unsupported Server Detected!")
            
        end
end
end
end)

section1:addButton("Copy Command", function()
setclipboard("/attack target:"..string.gsub(_G.Server, ":", " port:").." duration:60 method:roblox")
end)

section1:addTextbox("Goto session","Session ID",function(value, focusLost)
    if focusLost then
    local jobID = value

    local RL = game:GetService("ReplicatedStorage")
    local Req = RL.Requests
    local SM = Req.StartMenu
    local PS = SM.PickServer
    
    PS:FireServer(jobID)

end
end)


-- load
venyx:SelectPage(venyx.pages[1], true)
