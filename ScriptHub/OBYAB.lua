local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

--Variables
local autoskip = false

local Window = Rayfield:CreateWindow({
   Name = "Obby but you're a ball | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "OBYAB"
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
local SkipSection = Tab:CreateSection("Skip")
local Button = Tab:CreateButton({
   Name = "Skip Stage",
   Info = "Takes you to the next stage.",
   Interact = 'Skip',
   Callback = function()
       if game.Players.LocalPlayer.leaderstats.Stage.Value ~= 121 then
            local nextCheckpoint = game.Workspace.Checkpoints:FindFirstChild(tostring(game.Players.LocalPlayer.leaderstats.Stage.Value + 1)).Checkpoint.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nextCheckpoint
            game.Players.LocalPlayer.Character.Sphere.CFrame = nextCheckpoint
        end
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "AutoSkip",
   Info = "Automatically skips to the next stage.", -- Speaks for itself, Remove if none.
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        autoskip = Value
   end,
})

local CreditsTab = Window:CreateTab("Credits") -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits")
local EdyLabel = CreditsTab:CreateLabel("by edy")
local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

function AutoSkip()
    while true do
        if autoskip then
            if game.Players.LocalPlayer.leaderstats.Stage.Value ~= 121 then
            local nextCheckpoint = game.Workspace.Checkpoints:FindFirstChild(tostring(game.Players.LocalPlayer.leaderstats.Stage.Value + 1)).Checkpoint.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nextCheckpoint
            game.Players.LocalPlayer.Character.Sphere.CFrame = nextCheckpoint
        end
        end
       
        game:GetService("RunService").Stepped:wait()
    end
end

task.spawn(AutoSkip)