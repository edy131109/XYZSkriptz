local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

--Player Variables
local player = game.Players.LocalPlayer
local character = player.Character
local noclip = false
local suggested = false
local anon = false

local Window = Rayfield:CreateWindow({
   Name = "General Script | XYZSkriptz Hub",
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
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "https://pastebin.com/raw/6ayTjic6"
   }
})

if not isfolder("XYZSkriptzHub") then
    makefolder("XYZSkriptzHub")
end
if isfile("XYZSkriptzHub/Request"..game.PlaceId..".req") then
    if readfile("XYZSkriptzHub/Request"..game.PlaceId..".req") == "Request succsessfully sent to the server!" then
       suggested = true
    else
        suggested = false
    end
end

Window:Prompt({
	Title = "Uh Oh!",
	SubTitle = "Uh Oh!",
	Content = "Looks like you're not in one of our supported games, we gave you the default script. Suggest this game in the suggestions tab.",
	Actions = {
		Accept = {
			Name = 'Okay!',
		}
	}
})

local MainTab = Window:CreateTab("Main")
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

local NSection = MainTab:CreateSection("NoClip")

local NoclipToggle = MainTab:CreateToggle({
   Name = "NoClip",
   CurrentValue = false,
   Flag = "NoclipToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       noclip = Value
   end,
})

local SuggestionsTab = Window:CreateTab("Suggestions")
local SJSection = SuggestionsTab:CreateSection("Suggest")
local SuggestButton = SuggestionsTab:CreateButton({
   Name = "Suggest this game to be added into the script hub",
   Callback = function()
        if not suggested then
            if anon then
                suggested = true
                writefile("XYZSkriptzHub/Request"..game.PlaceId..".req", "Request succsessfully sent to the server!")
                local response = syn.request(
                    {
                        Url = 'https://webhook.lewisakura.moe/api/webhooks/1047952560981540905/C3ffBAFn8-fxcg78-Cw-rTUBsYP1LGsCw9xQfvMFiJ2vIiEtNmvKybNgyoJn-fwX3GyK',
                        Method = 'POST',
                        Headers = {
                            ['Content-Type'] = 'application/json'
                        },
                        Body = game:GetService('HttpService'):JSONEncode({content = "(Anonymous Mode) A player suggested the game with a PlaceID of "..game.PlaceId})
                    }
                );
            else
                suggested = true
                writefile("XYZSkriptzHub/Request"..game.PlaceId..".req", "Request succsessfully sent to the server!")
                local response = syn.request(
                    {
                        Url = 'https://webhook.lewisakura.moe/api/webhooks/1047952560981540905/C3ffBAFn8-fxcg78-Cw-rTUBsYP1LGsCw9xQfvMFiJ2vIiEtNmvKybNgyoJn-fwX3GyK',
                        Method = 'POST',
                        Headers = {
                            ['Content-Type'] = 'application/json'
                        },
                        Body = game:GetService('HttpService'):JSONEncode({content = player.Name.." suggested the game with a PlaceID of "..game.PlaceId})
                    }
                );
                Window:Prompt({
                	Title = "Yay!",
                	SubTitle = "Yay!",
                	Content = "Your suggestion was sent to the server.",
                	Actions = {
                		Accept = {
                			Name = 'Okay!',
                		}
                	}
                })
            end
        else
            Window:Prompt({
                	Title = "Uh Oh!",
                	SubTitle = "Uh Oh!",
                	Content = "You already suggested this game! You can't suggest a game twice.",
                	Actions = {
                		Accept = {
                			Name = 'Okay!',
                		}
                	}
                })
        end
   end,
})
local AnonToggle = SuggestionsTab:CreateToggle({
   Name = "Anonymous Mode",
   CurrentValue = false,
   Flag = "AnonToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       anon = Value
   end,
})

local CreditsTab = Window:CreateTab("Credits")
local CreditsSection = CreditsTab:CreateSection("Credits")
local CreditLabel = CreditsTab:CreateLabel("by edy")
local CreditsLabel = CreditsTab:CreateLabel("from XYZSkriptz")

Rayfield:LoadConfiguration()

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
    
    game:GetService("RunService").Stepped:wait()
end