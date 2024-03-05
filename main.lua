local reloadCharacters = {}

local InsertService = game:GetService("InsertService")

function loadCharacter(player)
    print("Loading "..player.Name)
    local character = player.Character or player.CharacterAdded:Wait()

    local HL = Instance.new("Highlight", character)
    local GUI = Instance.new("BillboardGui", character:WaitForChild("Head"))
    local TextLabel = Instance.new("TextLabel", GUI)
    local UIStroke = Instance.new("UIStroke", TextLabel)

    GUI.AlwaysOnTop = true
    GUI.Size = UDim2.fromScale(10,5)
    GUI.StudsOffset = Vector3.new(0,2,0)

    TextLabel.Size = UDim2.fromScale(0.7,0.5)
    TextLabel.AnchorPoint = Vector2.new(0.5,0.5)
    TextLabel.Position = UDim2.fromScale(0.5,0.5)
    TextLabel.Text = player.DisplayName .." (@"..player.Name..")"
    TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextScaled = true

    if reloadCharacters[player] then
        print("Character for: "..player.Name.." found.")
    end
end

game.Players.PlayerAdded:Connect(function(player)
    loadCharacter(player)
end)

for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    loadCharacter(player)
end
