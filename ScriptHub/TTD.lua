local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

local autopass = false

function die()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end

local Window = Rayfield:CreateWindow({
   Name = "Try To Die | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "TTD"
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

local MainTab = Window:CreateTab("Main") -- Title, Image
local AutoPassSection = MainTab:CreateSection("AutoPass")
local AutoPass = MainTab:CreateToggle({
   Name = "AutoPass",
   CurrentValue = false,
   Flag = "AutoPass", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       autopass = Value
   end,
})
local AutoPassSection = MainTab:CreateSection("Tools")
local Button = MainTab:CreateButton({
   Name = "Die",
   Callback = function()
       die()
   end,
})

local CreditsTab = Window:CreateTab("Credits") -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits")
local EdyLabel = CreditsTab:CreateLabel("by edy")
local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

while true do
   if autopass and game.Players.LocalPlayer.leaderstats.Level.Value < 50 then
       die()    
   end
   wait(0.001) 
end