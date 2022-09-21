local Network = game:GetService("NetworkClient")
Network.ConnectionAccepted:Connect(function(Server, ReplicatorInstance)
    _G.Server = Server:gsub("|", ":")
end)

repeat game:GetService("RunService").Heartbeat:Wait() until _G.Server
local ip = _G.Server
