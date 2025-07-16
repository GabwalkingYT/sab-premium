-- LocalScript in StarterGui or Executor
local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Holder Frame (Start hidden and offscreen)
local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Size = UDim2.new(0, 0, 0, 0) -- Start small
holder.Position = UDim2.new(0.5, 0, 0.5, 0)
holder.AnchorPoint = Vector2.new(0.5, 0.5)
holder.BackgroundTransparency = 1
holder.BorderSizePixel = 0
holder.Active = true
holder.Draggable = true
holder.Parent = gui

-- Animate rainbow background
local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 127, 0)),
	ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
	ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
	ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 0, 211)),
})
bgGradient.Rotation = 0
bgGradient.Parent = holder

-- Animate rotation
task.spawn(function()
	while true do
		bgGradient.Rotation = (bgGradient.Rotation + 1) % 360
		RunService.RenderStepped:Wait()
	end
end)

-- Tween in (scale up + fade in + move to center)
TweenService:Create(holder, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 300, 0, 220),
	BackgroundTransparency = 0
}):Play()

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

-- Create Animated Rainbow Button with Hover Glow
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

	-- Rainbow Gradient
	local btnGradient = bgGradient:Clone()
	btnGradient.Rotation = math.random(0, 360)
	btnGradient.Parent = button

	task.spawn(function()
		while true do
			btnGradient.Rotation = (btnGradient.Rotation + 2) % 360
			RunService.RenderStepped:Wait()
		end
	end)

	-- Glow Effect
	local glow = Instance.new("UIStroke")
	glow.Thickness = 1.5
	glow.Transparency = 1
	glow.Color = Color3.new(1, 1, 1)
	glow.Parent = button

	-- Hover Effects
	button.MouseEnter:Connect(function()
		TweenService:Create(glow, TweenInfo.new(0.3), { Transparency = 0 }):Play()
		TweenService:Create(button, TweenInfo.new(0.3), { TextSize = 17 }):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(glow, TweenInfo.new(0.3), { Transparency = 1 }):Play()
		TweenService:Create(button, TweenInfo.new(0.3), { TextSize = 16 }):Play()
	end)

	button.MouseButton1Click:Connect(callback)
end

-- Defi Script Button
createRainbowButton("DefiButton", "Defi Script's Op Gui", 80, function()
	loadstring(game:HttpGet("https://pastefy.app/44Il7q8s/raw"))()
end)

-- Infinite Yield Button
createRainbowButton("IYButton", "Infinite Yield FE", 140, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
