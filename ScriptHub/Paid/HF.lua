local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

--Variables
local autosubmit = false
local autosubmithid = false
local autosubmitmob = false

local Window = Rayfield:CreateWindow({
   Name = "Holiday Frenzy | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "HF"
   },
   Discord = {
      Enabled = true,
      Invite = "gTKwY3pZxJ", -- The Discord invite code, do not include discord.gg/
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "XYZSkriptz Hub",
      Subtitle = "PAID",
      Note = "Join the discord for key (discord.gg/gTKwY3pZxJ)",
      FileName = "XYZKey",
      SaveKey = true,
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "https://pastebin.com/raw/cvWpRfsM"
   }
})

local WhiteList = {""}
local player = game.Players.LocalPlayer.Name
local whitelisted = false

for i = 1, i < #WhiteList do
   if WhileList[i] == player then
       whitelisted = true
   end
end

if whitelisted then
    local Tab = Window:CreateTab("Main") -- Title, Image
    local Section = Tab:CreateSection("AutoFarm")
    local Button = Tab:CreateButton({
       Name = "Give present",
       Info = "Gives you a present.", -- Speaks for itself, Remove if none.
       Interact = 'Button',
       Callback = function()
            game:GetService("ReplicatedStorage").NetworkEvents.RemoteEvent:FireServer("FinishedWrapping")
       end,
    })
    local Toggle = Tab:CreateToggle({
       Name = "AutoFarm",
       Info = "Automatically makes and delivers presents.", -- Speaks for itself, Remove if none.
       CurrentValue = false,
       Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
       Callback = function(Value)
           autosubmit = Value
       end,
    })
    local Toggle2 = Tab:CreateToggle({
       Name = "AutoFarm (Hidden)",
       Info = "Automatically makes and delivers presents. Hidden Version", -- Speaks for itself, Remove if none.
       CurrentValue = false,
       Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
       Callback = function(Value)
           autosubmithid = Value
       end,
    })
    local Toggle2 = Tab:CreateToggle({
       Name = "AutoFarm (Mobile)",
       Info = "Automatically makes and delivers presents, while near the sleigh.", -- Speaks for itself, Remove if none.
       CurrentValue = false,
       Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
       Callback = function(Value)
           autosubmitmob = Value
       end,
    })
    
    local CreditsTab = Window:CreateTab("Credits") -- Title, Image
    local CreditsSection = CreditsTab:CreateSection("Credits")
    local EdyLabel = CreditsTab:CreateLabel("by edy")
    local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")
    
    Rayfield:LoadConfiguration()
    
    function AutoSubmit()
        while true do
            if autosubmit then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-426.982147, 134.999954, 185.332291, -0.671954989, -5.90662053e-09, 0.740592003, -3.58763286e-09, 1, 4.72040318e-09, -0.740592003, 5.14926268e-10, -0.671954989)
                game:GetService("ReplicatedStorage").NetworkEvents.RemoteEvent:FireServer("FinishedWrapping")
                fireproximityprompt(game:GetService("Workspace").ImportantParts.SleighSubmit.ProximityPrompt, 1)
            end
           
            game:GetService("RunService").Stepped:wait()
        end
    end
    function AutoSubmitHid()
        while true do
            if autosubmithid then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-438.085724, 137.259293, 193.508698, -0.993153632, -3.60249288e-08, 0.116815582, -4.53581315e-08, 1, -7.72385107e-08, -0.116815582, -8.2008242e-08, -0.993153632)
                game:GetService("ReplicatedStorage").NetworkEvents.RemoteEvent:FireServer("FinishedWrapping")
                fireproximityprompt(game:GetService("Workspace").ImportantParts.SleighSubmit.ProximityPrompt, 1)
            end
           
            game:GetService("RunService").Stepped:wait()
        end
    end
    function AutoSubmitMob()
        while true do
            if autosubmitmob then
                game:GetService("ReplicatedStorage").NetworkEvents.RemoteEvent:FireServer("FinishedWrapping")
                fireproximityprompt(game:GetService("Workspace").ImportantParts.SleighSubmit.ProximityPrompt, 1)
            end
           
            game:GetService("RunService").Stepped:wait()
        end
    end
    
    task.spawn(AutoSubmit)
    task.spawn(AutoSubmitHid)
    task.spawn(AutoSubmitMob)
else
    local Tab = Window:CreateTab("Main")
    local Section = Tab:CreateSection("Welcome")
    local Label = Tab:CreateLabel("Welcome "..player..", it looks like you haven't bought the paid script hub. This script is premium only.")
    
    local CreditsTab = Window:CreateTab("Credits") -- Title, Image
    local CreditsSection = CreditsTab:CreateSection("Credits")
    local EdyLabel = CreditsTab:CreateLabel("by edy")
    local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")
    
    Window:Prompt({
                	Title = "Hello!",
                	SubTitle = "Premium",
                	Content = "This script is premium only, but it seems like you don't have premium. If you want to use this script as well as other scripts, go buy our paid version of the script hub.",
                	Actions = {
                		Accept = {
                			Name = 'Okay!',
                		}
                	}
                })
end