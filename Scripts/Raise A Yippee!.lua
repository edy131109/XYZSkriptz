local GUI = game:GetService("StarterGui")

GUI:SetCore("SendNotification", {
    Title = "XYZSkripts",
    Text = "Thanks for using XYZSkripts, the script is now loading!",
    Icon = "",
    Duration = 5
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local SynapseX = {
    SchemeColor = Color3.fromRGB(100,100,100),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(50, 50, 50),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(50, 50, 50)
}
local Window = Library.CreateLib("XYZSkriptz Raise A Yippee", SynapseX)

--Variables
local touchpart = game.Players.LocalPlayer.Character.Head

local autoclicker = false
local autobuyfood = false
local autousefood = false
local autocollect = false
local autocollectpoop = false
local noslip = false
local buycooldown = 0
local usecooldown = 0
local cleancooldown = 0
local triggerpercent = 50

--AutoFarm
local AutoFarmTab = Window:NewTab("AutoFarm")
local ClickSection = AutoFarmTab:NewSection("AutoClicker")
ClickSection:NewToggle("AutoClick", "Automatically Clicks your yippee", function(state)
    if state then
        autoclicker = true
    else
        autoclicker = false
    end
end)
local CollectSection = AutoFarmTab:NewSection("AutoCollector")
CollectSection:NewToggle("AutoCollect Money", "Automatically collects money off of the ground", function(state)
    if state then
        autocollect = true
    else
        autocollect = false
    end
end)
CollectSection:NewToggle("AutoCollect Poop", "Automatically cleans poop off of the ground", function(state)
    if state then
        autocollectpoop = true
    else
        autocollectpoop = false
    end
end)
local FoodSection = AutoFarmTab:NewSection("Food")
FoodSection:NewToggle("Auto Buy Food", "Buys food automatically, use with Auto Use food", function(state)
    if state then
        autobuyfood = true
    else
        autobuyfood = false
    end
end)
FoodSection:NewToggle("Auto Use Food", "Uses stored food, use with Auto Buy Food", function(state)
    if state then
        autousefood = true
    else
        autousefood = false
    end
end)
FoodSection:NewSlider("Hunger Needed", "Decides at what percentage to use food, for Auto Use Food", 100, 0, function(s)
    triggerpercent = s
end)
local MiscSection = AutoFarmTab:NewSection("Misc")
MiscSection:NewToggle("No Slip", "You can no longer slip on poop", function(state)
    if state then
        noslip = true
    else
        noslip = false
    end
end)

--Shop
local ShopTab = Window:NewTab("Shop")
local ShopSection = ShopTab:NewSection("Food")
ShopSection:NewButton("Buy Food", "Buys food", function()
    game:GetService("ReplicatedStorage").Events.ShopRemote:FireServer("Chip Flakes", false)
    firetouchinterest(touchpart, game.Workspace.Delivery:WaitForChild("Chip Flakes"), 0)
end)

--House
local HouseTab = Window:NewTab("House")
local HouseSection = HouseTab:NewSection("House")
HouseSection:NewButton("Unlock doors", "Unlocks all the doors from the house (Client only)", function()
    local success, fail = pcall(function()
        game:GetService("Workspace").Map.Doors:Destroy()
        game:GetService("Workspace").Map.Door:Destroy()
    end)
end)

--Player
local PlayerTab = Window:NewTab("Player")
local SpeedSection = PlayerTab:NewSection("WalkSpeed")
SpeedSection:NewSlider("Speed", "Change the Player's WalkSpeed", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

local JumpSection = PlayerTab:NewSection("JumpPower")
JumpSection:NewSlider("Jump", "Change the Player's JumpPower", 1000, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

--Credits
local CreditsTab = Window:NewTab("Credits")
local CreditsSection = CreditsTab:NewSection("Credits")
CreditsSection:NewLabel("edy")
CreditsSection:NewLabel("from XYZSkriptz")

while true do
    if autoclicker then
        fireclickdetector(game:GetService("Workspace").Creature.Tbh.ClickDetector)
    end
    if autocollect then
       local money = game:GetService("Workspace").Debris:FindFirstChild("Money")
       if money ~= nil then
            firetouchinterest(touchpart, money, 0)
        end
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