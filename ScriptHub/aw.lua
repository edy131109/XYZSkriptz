local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

--Variables
local punchaura = false
local antifall = false

local Window = Rayfield:CreateWindow({
   Name = "Ability Wars | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "AW"
   },
   Discord = {
      Enabled = true,
      Invite = "gTKwY3pZxJ", -- The Discord invite code, do not include discord.gg/
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "XYZSkriptz Hub",
      Subtitle = "FREE",
      Note = "Join the discord for key (discord.gg/gTKwY3pZxJ)",
      FileName = "XYZKey",
      SaveKey = true,
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "https://pastebin.com/raw/6ayTjic6"
   }
})

local Tab = Window:CreateTab("Main") -- Title, Image
local Section = Tab:CreateSection("Section Example")
local Toggle = Tab:CreateToggle({
   Name = "Punch Aura",
   Info = "Punches everyone around you.", -- Speaks for itself, Remove if none.
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       slapaura = Value
   end,
})
local AntiToggle = Tab:CreateToggle({
   Name = "Anti Fall",
   Info = "You can't fall off the map.", -- Speaks for itself, Remove if none.
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       antifall = Value
   end,
})
local SJSection = Tab:CreateSection("Speed / Jump")

local SpeedSlider = Tab:CreateSlider({
   Name = "Speed",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local JumpSlider = Tab:CreateSlider({
   Name = "Jump",
   Range = {0, 1000},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 50,
   Flag = "JumpSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local CreditsTab = Window:CreateTab("Credits") -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits")
local EdyLabel = CreditsTab:CreateLabel("by edy")
local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

function PunchAura()
    while true do
        if slapaura then
            for i,v in ipairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    if game.Workspace:FindFirstChild(v.Name) then
                        if game.Workspace[v.Name]:FindFirstChild("Right Leg") then
                            if game.Players.LocalPlayer.Character:FindFirstChild("Right Leg") then
                                if (game.Players.LocalPlayer.Character["Right Leg"].Position - game.Workspace[v.Name]["Right Leg"].Position).Magnitude <= 10 then
                                    game:GetService("ReplicatedStorage")["Remote Events"].Punch:FireServer(game.Workspace[v.Name], game.Workspace[v.Name].HumanoidRootPart.Position, 1, game.Workspace[v.Name]["Right Leg"])
                                end
                            end
                        end
                    end
                end
            end
        end
       
        wait(0.10)
    end
end

---38.7443428, -5.17293787, 9.49456215, -0.760476768, 6.94317359e-09, 0.649365127, -7.26975316e-08, 1, -9.58289164e-08, -0.649365127, -1.20082916e-07, -0.760476768

function AntiFall()
    while true do
        if antifall then
            pcall(function()
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < 10 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.0447578, 24.62323, 34.0477448, 0.981627107, -7.45108508e-08, -0.190809265, 5.88603903e-08, 1, -8.76891235e-08, 0.190809265, 7.48469162e-08, 0.981627107)
                end
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z > 160 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.0447578, 24.62323, 34.0477448, 0.981627107, -7.45108508e-08, -0.190809265, 5.88603903e-08, 1, -8.76891235e-08, 0.190809265, 7.48469162e-08, 0.981627107)
                end
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z < -160 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.0447578, 24.62323, 34.0477448, 0.981627107, -7.45108508e-08, -0.190809265, 5.88603903e-08, 1, -8.76891235e-08, 0.190809265, 7.48469162e-08, 0.981627107)
                end
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X < -160 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.0447578, 24.62323, 34.0477448, 0.981627107, -7.45108508e-08, -0.190809265, 5.88603903e-08, 1, -8.76891235e-08, 0.190809265, 7.48469162e-08, 0.981627107)
                end
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X > 160 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12.0447578, 24.62323, 34.0477448, 0.981627107, -7.45108508e-08, -0.190809265, 5.88603903e-08, 1, -8.76891235e-08, 0.190809265, 7.48469162e-08, 0.981627107)
                end
            end)
        end
       
        game:GetService("RunService").Stepped:wait()
    end
end

task.spawn(PunchAura)
task.spawn(AntiFall)