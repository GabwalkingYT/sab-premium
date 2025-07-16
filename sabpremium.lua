local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Holder Frame (initially small & transparent)
local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Size = UDim2.new(0, 0, 0, 0)
holder.Position = UDim2.new(0.5, 0, 0.5, 0)
holder.AnchorPoint = Vector2.new(0.5, 0.5)
holder.BackgroundTransparency = 1
holder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
holder.BorderSizePixel = 0
holder.Active = true
holder.Draggable = true
holder.Parent = gui

-- Rainbow BG Gradient
local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 127, 0)),
	ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128)),
})
bgGradient.Rotation = 0
bgGradient.Parent = holder

-- Animate gradient
task.spawn(function()
	while true do
		bgGradient.Rotation = (bgGradient.Rotation + 1) % 360
		RunService.RenderStepped:Wait()
	end
end)

-- Tween Entrance Animation
TweenService:Create(holder, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 320, 0, 230),
	BackgroundTransparency = 0,
}):Play()

-- Sparkle Particles
local particle = Instance.new("ParticleEmitter")
particle.Texture = "rbxassetid://243660364"
particle.LightEmission = 1
particle.Rate = 50
particle.Lifetime = NumberRange.new(0.5)
particle.Speed = NumberRange.new(2)
particle.Rotation = NumberRange.new(0, 360)
particle.RotSpeed = NumberRange.new(50)
particle.Size = NumberSequence.new(1)
particle.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(1, 1)
})
particle.EmissionDirection = Enum.NormalId.Top
particle.Parent = holder
particle:Emit(100)

-- Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118823105" -- Replace with any sound you like
sound.Volume = 1
sound.PlayOnRemove = true
sound.Parent = holder
sound:Destroy() -- plays immediately on Destroy

-- Title
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

-- Rainbow Button Creator with Glow
local function createRainbowButton(name, text, posY, callback)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = UDim2.new(0.85, 0, 0, 40)
	button.Position = UDim2.new(0.075, 0, 0, posY)
	button.Text = text
	button.Font = Enum.Font.GothamBold
	button.TextSize = 16
	button.TextColor3 = Color3.new(1, 1, 1)
	button.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.Parent = holder

	-- Gradient
	local grad = bgGradient:Clone()
	grad.Rotation = math.random(0, 360)
	grad.Parent = button

	task.spawn(function()
		while true do
			grad.Rotation = (grad.Rotation + 1) % 360
			RunService.RenderStepped:Wait()
		end
	end)

	-- Glow
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1.5
	stroke.Transparency = 1
	stroke.Color = Color3.new(1, 1, 1)
	stroke.Parent = button

	-- Hover Effects
	button.MouseEnter:Connect(function()
		TweenService:Create(stroke, TweenInfo.new(0.3), { Transparency = 0 }):Play()
		TweenService:Create(button, TweenInfo.new(0.2), { TextSize = 17 }):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(stroke, TweenInfo.new(0.3), { Transparency = 1 }):Play()
		TweenService:Create(button, TweenInfo.new(0.2), { TextSize = 16 }):Play()
	end)

	button.MouseButton1Click:Connect(callback)
end

-- Defi Button
createRainbowButton("DefiButton", "Defi Script's Op Gui", 80, function()
	loadstring(game:HttpGet("https://pastefy.app/44Il7q8s/raw"))()
end)

-- Infinite Yield Button
createRainbowButton("IYButton", "Infinite Yield FE", 140, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
