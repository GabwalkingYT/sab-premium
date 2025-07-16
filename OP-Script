-- LocalScript in StarterGui or Executor
local player = game.Players.LocalPlayer
local tweenService = game:GetService("TweenService")

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Holder Frame (Start Invisible & Offscreen)
local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Size = UDim2.new(0, 300, 0, 200)
holder.Position = UDim2.new(0.5, -150, 1.2, 0) -- Start offscreen bottom
holder.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
holder.BorderSizePixel = 0
holder.Active = true
holder.Draggable = true
holder.BackgroundTransparency = 1 -- Start fully transparent
holder.Parent = gui

-- Tween in (slide up + fade in)
local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
tweenService:Create(holder, tweenInfo, {
	Position = UDim2.new(0.5, -150, 0.4, 0),
	BackgroundTransparency = 0
}):Play()

-- Rainbow Gradient Background
local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211)),
})
bgGradient.Rotation = 90
bgGradient.Parent = holder

-- Title Label
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 60)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundTransparency = 1
label.Text = "Steal A Brainrot FE OP Gui (V7) Premium"
label.Font = Enum.Font.GothamBlack
label.TextSize = 18
label.TextColor3 = Color3.new(1, 1, 1)
label.TextStrokeTransparency = 0
label.TextWrapped = true
label.Parent = holder

-- Defi Script Button
local button1 = Instance.new("TextButton")
button1.Name = "DefiButton"
button1.Size = UDim2.new(0.85, 0, 0, 40)
button1.Position = UDim2.new(0.075, 0, 0, 70)
button1.Text = "Defi Script's Op Gui"
button1.Font = Enum.Font.GothamBold
button1.TextSize = 16
button1.TextColor3 = Color3.new(1, 1, 1)
button1.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
button1.BorderSizePixel = 0
button1.Parent = holder

local btnGradient1 = bgGradient:Clone()
btnGradient1.Rotation = 45
btnGradient1.Parent = button1

button1.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://pastefy.app/44Il7q8s/raw'))()
end)

-- Infinite Yield Button
local button2 = Instance.new("TextButton")
button2.Name = "IYButton"
button2.Size = UDim2.new(0.85, 0, 0, 40)
button2.Position = UDim2.new(0.075, 0, 0, 120)
button2.Text = "Infinite Yield FE"
button2.Font = Enum.Font.GothamBold
button2.TextSize = 16
button2.TextColor3 = Color3.new(1, 1, 1)
button2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
button2.BorderSizePixel = 0
button2.Parent = holder

local btnGradient2 = bgGradient:Clone()
btnGradient2.Rotation = -45
btnGradient2.Parent = button2

button2.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
