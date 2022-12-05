local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local touchpart = game.Players.LocalPlayer.Character.Head
local autocollect = false
local autocollecthoops = false

function die()
    local c = game.Players.LocalPlayer.Character
    if c ~= nil then
       local h = c:FindFirstChild("Humanoid")
       if h ~= nil then
           if h.Health > 0 then
               if autopass then
                   wait(1)
                end
               h.Health = 100
                h.Health = 0
            end
       end
    end
end

local Window = Rayfield:CreateWindow({
   Name = "Legends of speed | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "LOS"
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

local MainTab = Window:CreateTab("AutoFarm") -- Title, Image
local AutoFarmSection = MainTab:CreateSection("AutoFarm")
local AutoCollectOrbsGems = MainTab:CreateToggle({
   Name = "AutoCollect Orbs/Gems",
   CurrentValue = false,
   Flag = "AutoCollectToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autocollect = Value
   end,
})
local AutoFireHoops = MainTab:CreateToggle({
   Name = "AutoCollect Hoops",
   CurrentValue = false,
   Flag = "AutoCollectHoopsToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autocollecthoops = Value
   end,
})
local Info = MainTab:CreateLabel("The more zones you have unlocked the better the autofarm works.")

local CreditsTab = Window:CreateTab("Credits") -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits")
local EdyLabel = CreditsTab:CreateLabel("by edy")
local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

function autocollectloop()
    while true do
        pcall(function()
            if autocollect then
       for i,v in ipairs(game.Workspace.orbFolder:GetChildren()) do
           for _,o in ipairs(v:GetChildren()) do
               if o.Name == "Gem" then
                   firetouchinterest(touchpart, o.outerGem, 0)
                else
                    firetouchinterest(touchpart, o.outerOrb, 0)
                end
              end
        end
    end
        end)
   game:GetService("RunService").Stepped:wait()
end
end

function autocollecthoopsloop()
    while true do
   if autocollecthoops then
       for i,v in ipairs(game.Workspace.Hoops:GetChildren()) do
           firetouchinterest(touchpart, v, 0)
           firetouchinterest(touchpart, v, 1)
       end
    end
   game:GetService("RunService").Stepped:wait()
end
end

task.spawn(autocollectloop)
task.spawn(autocollecthoopsloop)