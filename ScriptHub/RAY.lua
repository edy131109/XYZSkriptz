local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

--Variables
local touchpart = game.Players.LocalPlayer.Character.Head
local player = game.Players.LocalPlayer
local character = player.Character

local autoclicker = false
local autobuyfood = false
local autousefood = false
local autocollect = false
local autocollectpoop = false
local noslip = false
local noclip = false
local buycooldown = 0
local usecooldown = 0
local cleancooldown = 0
local triggerpercent = 50

local Window = Rayfield:CreateWindow({
   Name = "Raise A Yippee | XYZSkriptz Hub",
   LoadingTitle = "XYZSkriptz Hub",
   LoadingSubtitle = "by XYZSkriptz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XYZSkriptzHub", -- Create a custom folder for your hub/game
      FileName = "GS"
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
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "XYZHubFREE"
   }
})

local AutoFarmTab = Window:CreateTab("AutoFarm")
local ClickSection = AutoFarmTab:CreateSection("AutoClicker")
local AutoClicker = AutoFarmTab:CreateToggle({
   Name = "AutoClicker",
   CurrentValue = false,
   Flag = "AutoClicker", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        autoclicker = Value
   end,
})

local CollectSection = AutoFarmTab:CreateSection("AutoCollector")
local AutoCollectorM = AutoFarmTab:CreateToggle({
   Name = "AutoCollect Money",
   CurrentValue = false,
   Flag = "AutoCollectorM", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        autocollect = Value
   end,
})
local AutoCollectorP = AutoFarmTab:CreateToggle({
   Name = "AutoCollect Poop",
   CurrentValue = false,
   Flag = "AutoCollectorP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        autocollectpoop = Value
   end,
})
local FoodSection = AutoFarmTab:CreateSection("Food")
local AutoBuyFood = AutoFarmTab:CreateToggle({
   Name = "Auto Buy Food",
   CurrentValue = false,
   Flag = "AutoBuyFood", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        autobuyfood = Value
   end,
})
local AutoUseFood = AutoFarmTab:CreateToggle({
   Name = "Auto Use Food",
   CurrentValue = false,
   Flag = "AutoUseFood", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        autousefood = Value
   end,
})
local HungerSlider = AutoFarmTab:CreateSlider({
   Name = "Hunger Needed",
   Range = {0, 100},
   Increment = 5,
   Suffix = "Hunger",
   CurrentValue = 50,
   Flag = "HungerNeeded", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   triggerpercent = Value
   end,
})
local MiscSection = AutoFarmTab:CreateSection("Misc")
local NoSlip = AutoFarmTab:CreateToggle({
   Name = "NoSlip",
   CurrentValue = false,
   Flag = "NoSlip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        noslip = Value
   end,
})
local NoClip = AutoFarmTab:CreateToggle({
   Name = "NoClip",
   CurrentValue = false,
   Flag = "NoClip", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        noclip = Value
   end,
})

local ShopTab = Window:CreateTab("Shop") -- Title, Image
local ShopSection = ShopTab:CreateSection("Food")
local BuyButton = ShopTab:CreateButton({
   Name = "Buy Food",
   Callback = function()
   game:GetService("ReplicatedStorage").Events.ShopRemote:FireServer("Chip Flakes", false)
    firetouchinterest(touchpart, game.Workspace.Delivery:WaitForChild("Chip Flakes"), 0)
   end,
})

local HouseTab = Window:CreateTab("House") -- Title, Image
local HouseSection = HouseTab:CreateSection("House")
local UnlockButton = HouseTab:CreateButton({
   Name = "Unlock Doors",
   Callback = function()
   local success, fail = pcall(function()
        game:GetService("Workspace").Map.Doors:Destroy()
        game:GetService("Workspace").Map.Door:Destroy()
    end)
   end,
})

local CreditsTab = Window:CreateTab("Credits") -- Title, Image
local CreditsSection = CreditsTab:CreateSection("Credits")
local EdyLabel = CreditsTab:CreateLabel("by edy")
local XYZLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

function whileDo()
   while true do
       player = game.Players.LocalPlayer
    character = player.Character
    
    for _, v in pairs(character:GetDescendants()) do
        pcall(function()
            if v.Name == "Head" or v.Name == "Torso" then
                v.CanCollide = not noclip
            end
        end)
    end
    
    if autocollect then
       local money = game:GetService("Workspace").Debris:FindFirstChild("Money")
       if money ~= nil then
           firetouchinterest(touchpart, money, 0)
            else
           money = game:GetService("Workspace").Debris:FindFirstChild("MoneBag")
           if money ~= nil then
               firetouchinterest(touchpart, money, 0)
            end
        end
    end
    
    game:GetService("RunService").Stepped:wait()
    end
end

task.spawn(whileDo)

while true do
    if autoclicker then
        fireclickdetector(game:GetService("Workspace").Creature.Tbh.ClickDetector)
    end
    if autocollectpoop then
        if cleancooldown <= 0 then
           local poop = game:GetService("Workspace").Debris:FindFirstChild("Poop")
           if poop ~= nil then
               local poop = poop.Poop
              local currentposition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                local poopposition = poop.CFrame
                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = poopposition
                wait(0.15)
                fireproximityprompt(poop.ProximityPrompt, 0)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentposition
              cleancooldown = 0.15
            end
        else
            cleancooldown = cleancooldown - 0.01
        end
    end
    if noslip then
       game.Players.LocalPlayer.Character.Humanoid.Sit = false 
    end
    if autobuyfood then
        if buycooldown <= 0 then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Chip Flakes") == nil then
                game:GetService("ReplicatedStorage").Events.ShopRemote:FireServer("Chip Flakes", false)
                firetouchinterest(touchpart, game.Workspace.Delivery:WaitForChild("Chip Flakes"), 0)
                buycooldown = 0.3
            end
        else
           buycooldown = buycooldown - 0.01
        end
    end
    if autousefood then
        if buycooldown <= 0 then
            local percent = string.gsub(game.Players.LocalPlayer.PlayerGui.ScreenGui.Status.Hunger.Percentage.Text, "[%p%c%s]", "")
            if game:GetService("Workspace").Assets.Food.Meat.Size ~= Vector3.new(2.503, 0.741, 2.516) and tonumber(percent) <= triggerpercent then
               local food = game.Players.LocalPlayer.Backpack:FindFirstChild("Chip Flakes")
                if food ~= nil then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(food)
                    local currentposition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    local bowlposition = game:GetService("Workspace").Assets.Food.bowl.CFrame
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = bowlposition
                    wait(0.15)
                    fireproximityprompt(game:GetService("Workspace").Assets.Food.bowl.Fill, 0)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentposition
                    usecooldown = 0.6
                end
            end
        else
           usecooldown = usecooldown - 0.01
        end
    end
    wait(0.01)
end