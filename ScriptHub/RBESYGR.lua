local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local autoclicker = false
local autospamboost = false
local autorebirth = false

local Window = Rayfield:CreateWindow({
   Name = "Roblox But You Get Richer Every Second | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "RBUGRES"
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
local Section = Tab:CreateSection("AutoFarm")
local AutoClickerToggle = Tab:CreateToggle({
   Name = "AutoClicker",
   CurrentValue = false,
   Flag = "AutoclickerToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autoclicker = Value
   end,
})
local AutoRebirthToggle = Tab:CreateToggle({
   Name = "AutoRebirth",
   CurrentValue = false,
   Flag = "AutoRebirthToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autorebirth = Value
   end,
})
local MiscSection = Tab:CreateSection("Misc")
local Button = Tab:CreateButton({
   Name = "Give Boosts",
   Callback = function()
       game:GetService("ReplicatedStorage").RemoteEvents.StarterBoosts:FireServer()
   end,
})
local SpamToggle = Tab:CreateToggle({
   Name = "Spam Give Boosts",
   CurrentValue = false,
   Flag = "SpamGiveToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autospamboost = Value
   end,
})
local ZoneButton = Tab:CreateButton({
   Name = "Give Zone Boosts",
   Callback = function()
       game:GetService("ReplicatedStorage").RemoteEvents.ZoneMulti:FireServer("Zone7")
   end,
})
local RemoveButton = Tab:CreateButton({
   Name = "Remove Zone Walls",
   Callback = function()
       for i,v in ipairs(game.Workspace["Zone Walls"]:GetChildren()) do
        v:Destroy()
       end
   end,
})

local MainTab = Window:CreateTab("Other")
local SJSection = MainTab:CreateSection("Speed / Jump")

local SpeedSlider = MainTab:CreateSlider({
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

local JumpSlider = MainTab:CreateSlider({
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
local InfoLabel = Tab:CreateLabel("Please disable popups in the game's settings.")

local CreditsTab = Window:CreateTab("Credits") -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits")
local EdyLabel = CreditsTab:CreateLabel("by edy")
local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

function AutoClicker()
    while true do
        if autoclicker then
            game:GetService("ReplicatedStorage").RemoteEvents.TargetClick:FireServer()
        end
       
        game:GetService("RunService").Stepped:wait()
    end
end

function AutoRebirth()
    while true do
        if autorebirth then
            game:GetService("ReplicatedStorage").RemoteEvents.Rebirth:FireServer(1)
        end
       
        game:GetService("RunService").Stepped:wait()
    end
end

function AutoSpamBoost()
    while true do
        if autospamboost then
            game:GetService("ReplicatedStorage").RemoteEvents.StarterBoosts:FireServer()
        end
       
        game:GetService("RunService").Stepped:wait()
    end
end

task.spawn(AutoClicker)
task.spawn(AutoRebirth)
task.spawn(AutoSpamBoost)