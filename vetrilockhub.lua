local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/coastified/src.lua"))()
local Window = Lib:Window("vetri's lock hub", "Lock Scripts", Enum.KeyCode.RightShift)
local earth = Window:Tab("Earth Streamable v2")
local astro = Window:Tab("Astro Dot")
local tenaki = Window:Tab("Tenaki Aimbot 2.0.0")
local customslock = Window:Tab("Hood Customs Lock")
earth:Toggle('Execute',function(state)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diamondmonakara/diamondmonakara/3bedbf6cb93a6e350d77def4cd165cddb9aaf389/earthsstreamablev2"))()
    DaHoodSettings.Prediction = 0.11983
    Aiming.TargetPart = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart", "RightFoot", "LeftFoot"}
    Aiming.FOV = 45
    Aiming.FOVSides = 99
    Aiming.HitChance = 110
    Aiming.ShowFOV = false
    if Aiming.ShowFOV == false then
        print("Worked")
    else
        print("Failed")
    end
end)

astro:Toggle('Execute',function(state)
        local CC = game:GetService"Workspace".CurrentCamera
        local Plr
        local enabled = false
        local accomidationfactor = 0.127
        local mouse = game.Players.LocalPlayer:GetMouse()
        local placemarker = Instance.new("Part", game.Workspace)
    
        function makemarker(Parent, Adornee, Color, Size, Size2)
            local e = Instance.new("BillboardGui", Parent)
            e.Name = "PP"
            e.Adornee = Adornee
            e.Size = UDim2.new(Size, Size2, Size, Size2)
            e.AlwaysOnTop = true
            local a = Instance.new("Frame", e)
            a.Size = UDim2.new(1, 0, 1, 0)
            a.BackgroundTransparency = 0
            a.BackgroundColor3 = Color
            local g = Instance.new("UICorner", a)
            g.CornerRadius = UDim.new(50, 50)
            return(e)
        end
    
        
        local data = game.Players:GetPlayers()
        function noob(player)
            local character
            repeat wait() until player.Character
            local handler = makemarker(guimain, player.Character:WaitForChild("HumanoidRootPart"), Color3.fromRGB(107, 184, 255), 0.3, 3)
            handler.Name = player.Name
            player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild("HumanoidRootPart") end)
    
    
            spawn(function()
                while wait() do
                    if player.Character then
                        TextLabel.Text = player.Name..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
                    end
                end
            end)
        end
    
        for i = 1, #data do
            if data[i] ~= game.Players.LocalPlayer then
                noob(data[i])
            end
        end
    
        game.Players.PlayerAdded:connect(function(Player)
            noob(Player)
        end)
    
        spawn(function()
            placemarker.Anchored = true
            placemarker.CanCollide = false
            placemarker.Size = Vector3.new(7, 7, 7)
            placemarker.Transparency = 1
            makemarker(placemarker, placemarker, Color3.fromRGB(255, 183, 197), 0.40, 0)
        end)    
    
    mouse.KeyDown:Connect(function(k)
        if k ~= "q" then return end
        if enabled then
            enabled = false
            guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            enabled = true 
            Plr = getClosestPlayerToCursor()
            guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end    
    end)
    
        function getClosestPlayerToCursor()
            local closestPlayer
            local shortestDistance = math.huge
    
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
                    local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                    if magnitude < shortestDistance then
                        closestPlayer = v
                        shortestDistance = magnitude
                    end
                end
            end
            return closestPlayer
        end
    
        game:GetService"RunService".Stepped:connect(function()
            if enabled and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
                placemarker.CFrame = CFrame.new(Plr.Character.UpperTorso.Position+(Plr.Character.UpperTorso.Velocity*accomidationfactor))
            else
                placemarker.CFrame = CFrame.new(0, 9999, 0)
            end
        end)
    
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character.UpperTorso.Position+(Plr.Character.UpperTorso.Velocity*accomidationfactor)
                return old(unpack(args))
            end
            return old(...)
        end)

end)


tenaki:Dropdown("Part",{'Head',"UpperTorso","HumanoidRootPart","LowerTorso"}, function(tenakiobjective)
    print("objective changed to ".. tenakiobjective)
    
end)
tenaki:Toggle('Execute',function(state)
        getgenv().AimingSettings = {
        Aimbot = {
            Radius = 900,
            Hitbox = "UpperTorso",
            CameraMode = true,
            MouseMode = false,
            HitAirshots = true,
            AutoPrediction = false,
            NotificationMode = false,
            Keybind = Enum.KeyCode.Q,
            PredictionAmount = 0.165,
    
    
    
            Smoothing = {
            Enabled = true,
            Amount = 0.030
        },
     }
    }
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tenakii/tenaaki/main/genericaimbot.v.2.0.0"))()
end)
tenaki:Toggle('Execute',function(state)
    getgenv().Prediction = 0.1248710929171	
    getgenv().AimPart = "HumanoidRootPart"	
    getgenv().Key = "Q"	
    getgenv().DisableKey = "P"	
    	
    getgenv().FOV = true	
    getgenv().ShowFOV = false	
    getgenv().FOVSize = 55	
    	
    --// Variables (Service)	
    	
    local Players = game:GetService("Players")	
    local RS = game:GetService("RunService")	
    local WS = game:GetService("Workspace")	
    local GS = game:GetService("GuiService")	
    local SG = game:GetService("StarterGui")	
    	
    --// Variables (regular)	
    	
    local LP = Players.LocalPlayer	
    local Mouse = LP:GetMouse()	
    local Camera = WS.CurrentCamera	
    local GetGuiInset = GS.GetGuiInset	
    	
    local AimlockState = true	
    local Locked	
    local Victim	
    	
    local SelectedKey = getgenv().Key	
    local SelectedDisableKey = getgenv().DisableKey	
    	
    --// Notification function	
    	
    function Notify(tx)	
        SG:SetCore("SendNotification", {	
            Title = "Evan's Camlock",	
            Text = tx,	
    Duration = 5	
        })	
    end	
    	
    --// Check if aimlock is loaded	
    	
    if getgenv().Loaded == true then	
        Notify("Aimlock is already loaded!")	
        return	
    end	
    	
    getgenv().Loaded = true	
    	
    --// FOV Circle	
    	
    local fov = Drawing.new("Circle")	
    fov.Filled = false	
    fov.Transparency = 1	
    fov.Thickness = 1	
    fov.Color = Color3.fromRGB(255, 255, 0)	
    fov.NumSides = 1000	
    	
    --// Functions	
    	
    function update()	
        if getgenv().FOV == true then	
            if fov then	
    fov.Radius = getgenv().FOVSize * 2	
                fov.Visible = getgenv().ShowFOV	
    fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)	
    	
                return fov	
            end	
        end	
    end	
    	
    function WTVP(arg)	
        return Camera:WorldToViewportPoint(arg)	
    end	
    	
    function WTSP(arg)	
        return Camera.WorldToScreenPoint(Camera, arg)	
    end	
    	
    function getClosest()	
        local closestPlayer	
        local shortestDistance = math.huge	
    	
        for i, v in pairs(game.Players:GetPlayers()) do	
            local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true	
            local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil	
            	
    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(getgenv().AimPart) and notKO and notGrabbed then	
                local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)	
    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude	
                	
                if (getgenv().FOV) then	
                    if (fov.Radius > magnitude and magnitude < shortestDistance) then	
                        closestPlayer = v	
                        shortestDistance = magnitude	
                    end	
                else	
                    if (magnitude < shortestDistance) then	
                        closestPlayer = v	
                        shortestDistance = magnitude	
                    end	
                end	
            end	
        end	
        return closestPlayer	
    end	
    	
    --// Checks if key is down	
    	
    Mouse.KeyDown:Connect(function(k)	
        SelectedKey = SelectedKey:lower()	
        SelectedDisableKey = SelectedDisableKey:lower()	
        if k == SelectedKey then	
            if AimlockState == true then	
                Locked = not Locked	
                if Locked then	
                    Victim = getClosest()	
    	
                    Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))	
                else	
                    if Victim ~= nil then	
                        Victim = nil	
    	
                        Notify("Unlocked!")	
                    end	
                end	
            else	
                Notify("Aimlock is not enabled!")	
            end	
        end	
        if k == SelectedDisableKey then	
            AimlockState = not AimlockState	
        end	
    end)	
    	
    --// Loop update FOV and loop camera lock onto target	
    	
    RS.RenderStepped:Connect(function()	
        update()	
        if AimlockState == true then	
            if Victim ~= nil then	
                Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity*getgenv().Prediction)	
            end	
        end	
    end)	
    	while wait() do
            if getgenv().AutoPrediction == true then	
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()	
            local split = string.split(pingvalue,'(')	
    local ping = tonumber(split[1])	
    if ping < 225 then	
    getgenv().Prediction = 1.4	
    elseif ping < 215 then	
    getgenv().Prediction = 1.2	
    	elseif ping < 205 then
    getgenv().Prediction = 1.0	
    	elseif ping < 190 then
    getgenv().Prediction = 0.10	
    elseif ping < 180 then	
    getgenv().Prediction = 0.12	
    	elseif ping < 170 then
    getgenv().Prediction = 0.15	
    	elseif ping < 160 then
    getgenv().Prediction = 0.18	
    	elseif ping < 150 then
    getgenv().Prediction = 0.110	
    elseif ping < 140 then	
    getgenv().Prediction = 0.113	
    elseif ping < 130 then	
    getgenv().Prediction = 0.116	
    elseif ping < 120 then	
    getgenv().Prediction = 0.120	
    elseif ping < 110 then	
    getgenv().Prediction = 0.124	
    elseif ping < 105 then	
    getgenv().Prediction = 0.127	
    elseif ping < 90 then	
    getgenv().Prediction = 0.130	
    elseif ping < 80 then	
    getgenv().Prediction = 0.133	
    elseif ping < 70 then	
    getgenv().Prediction = 0.136	
    elseif ping < 60 then	
    getgenv().Prediction = 0.140	
    elseif ping < 50 then	
    getgenv().Prediction = 0.143	
    elseif ping < 40 then	
    getgenv().Prediction = 0.145	
    elseif ping < 30 then	
    getgenv().Prediction = 0.155	
    elseif ping < 20 then	
    getgenv().Prediction = 0.157	
            end	
            end	
    	end
end)
