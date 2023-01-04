local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Gay Boys Forever:[Project dookie]"})

local CurrentField = workspace.FlowerZones:GetChildren()[math.random(1, #workspace.FlowerZones:GetChildren())]

local Player = game:GetService("Players").LocalPlayer
local Gui = Player.PlayerGui.ScreenGui
local pos = Vector3.new()

local Parts = {
	[1] = {
		CFrame.new(304.60907, 98.4717712, -84.5116272, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(4.98794556, 66.9435425, 111.30645)
	},
	[2] = {
		CFrame.new(331.816223, 98.4717712, -101.591553, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(3.80868721, 66.9435425, 77.1465988)
	},
	[3] = {
		CFrame.new(103.857475, 40.3274307, 227.253098, 0.999999821, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(2.35845327, 49.1448593, 59.8768463)
	},
	[4] = {
		CFrame.new(101.276001, 24.000885, 174.331497, 0.999999821, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(8.18131256, 16.4917679, 1.09000003)
	},
	[5] = {
		CFrame.new(58.8752441, 9.24588394, 224.201752, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(8.18131256, 16.4917679, 1.09000003)
	},
	[6] = {
		CFrame.new(100.946045, 24.000885, 186.318161, 0.999999821, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(8.18131256, 16.4917679, 1.09000003)
	},
	[7] = {
		CFrame.new(103.857475, 40.3274307, 148.176331, 0.999999821, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(2.35845327, 49.1448593, 29.9195709)
	},
	[8] = {
		CFrame.new(-24.7021675, 27.73386, 113.28109, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(4, 53.46772, 101.029312)
	},
	[9] = {
		CFrame.new(19.7105713, 27.73386, 113.28109, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(4, 53.46772, 101.029312)
	},
	[10] = {
		CFrame.new(57.8807678, 9.24588394, 212.234894, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(8.18131256, 16.4917679, 1.09000003)
	},
	[11] = {
		CFrame.new(250.233582, 89.2679291, -0.885555267, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		Vector3.new(8.67437744, 81.9857025, 70.7786865)
	}
}

for _,v in ipairs(Parts) do
	local Part = Instance.new("Part")
	Part.CFrame = v[1]
	Part.Size = v[2]
	Part.CanCollide = false
	Part.Anchored = true
	Part.Parent = workspace
	Part.Transparency = 1
	
	local PathfindingModifier = Instance.new("PathfindingModifier")
	PathfindingModifier.PassThrough = false
	PathfindingModifier.Parent = Part
end

local Char = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Char:WaitForChild("HumanoidRootPart")
local Humanoid = Char:WaitForChild("Humanoid")
local PathfindingService = game:GetService("PathfindingService")

local path = PathfindingService:CreatePath()

local IsWalkingToPoint = false

coroutine.wrap(function()
	while task.wait(0.5) do
		if (Humanoid.MoveDirection.Magnitude <= 0.1) then
			IsWalkingToPoint = false
		end

		if Char:FindFirstChildOfClass("Tool") and Char:FindFirstChildOfClass("Tool"):FindFirstChild("ClickEvent") then
			Char:FindFirstChildOfClass("Tool").ClickEvent:FireServer()
		end
	end
end)()

local Tab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Enable",
	Default = true,
	Callback = function(Value)
		
	end
})

local FieldBounds = {}

for _,v in ipairs(workspace:WaitForChild("Decorations"):WaitForChild("Misc"):GetDescendants()) do
	if v:IsA("BasePart") then
		local PathfindingModifier = Instance.new("PathfindingModifier")
		PathfindingModifier.PassThrough = true
		PathfindingModifier.Parent = v
		v.CanCollide = false
		v.Transparency = 0.5
	end
end

for _,v in ipairs(workspace:WaitForChild("FieldDecos"):GetDescendants()) do
	if v:IsA("BasePart") then
		local PathfindingModifier = Instance.new("PathfindingModifier")
		PathfindingModifier.PassThrough = true
		PathfindingModifier.Parent = v
		v.CanCollide = false
		v.Transparency = 0.5
	end
end

for _,v in ipairs(workspace:WaitForChild("Gates"):GetDescendants()) do
	if v:IsA("BasePart") and v.CanCollide == false then
		local PathfindingModifier = Instance.new("PathfindingModifier")
		PathfindingModifier.PassThrough = true
		PathfindingModifier.Parent = v
	end
end

for _,v in ipairs(workspace:WaitForChild("FlowerZones"):GetChildren()) do
	local FieldToCpou = v
	local NewFuekd = Instance.new("Part")
	local PathfindingMod = Instance.new("PathfindingModifier")

	NewFuekd.Anchored = true
	NewFuekd.CastShadow = false
	NewFuekd.CanCollide = false
	NewFuekd.Transparency = 0.5
	NewFuekd.Position = (FieldToCpou.Position + Vector3.new(0,15,0))
	NewFuekd.Size = (FieldToCpou.Size + Vector3.new(0,15*2,0))
	NewFuekd.Name = v.Name
	NewFuekd.Parent = workspace

	PathfindingMod.PassThrough = true
	PathfindingMod.Parent = NewFuekd

	FieldBounds[v.Name] = NewFuekd
end

local Zones = {}
local LCZones = {}

for _,v in ipairs(workspace.FlowerZones:GetChildren()) do
	Zones[v.Name] = v
	LCZones[#LCZones+1] = v.Name
end

local Visuals = {}
local waypoints
local currentWaypointIndex = 1

function Visulize()
	for n, x in pairs(Visuals) do x:Destroy() end

	local Att = Instance.new("Attachment")
	local Bem = Instance.new("Beam")
	Bem.FaceCamera = true
	Att.Visible = true

	for n, x in ipairs(waypoints) do
		local Point = Att:Clone()
		Point.Parent = workspace.Terrain
		Point.Position = (x.Position + Vector3.new(0,5,0))
		if n ~= 1 then
			local Con = Bem:Clone()
			Con.Attachment1 = Point
			Con.Attachment0 = Visuals[n-1]
			Con.Parent = Point
		end
		Visuals[n] = Point
	end
end

local function followPath(destinationObject)
	path:ComputeAsync(Char:WaitForChild("HumanoidRootPart").Position, destinationObject)
	waypoints = {}

	if path.Status == Enum.PathStatus.Success then
		IsWalkingToPoint = true
		waypoints = path:GetWaypoints()

		currentWaypointIndex = 1
		Humanoid:MoveTo(waypoints[currentWaypointIndex].Position)
	else
		IsWalkingToPoint = false
		Humanoid:MoveTo(Char:WaitForChild("HumanoidRootPart").Position)
	end
end

local HomePos

Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = LCZones,
	Callback = function(Value)
		CurrentField = Zones[Value]
		pos = (CurrentField.CFrame * CFrame.new((math.random() - 0.5) * CurrentField.Size.X, (math.random() - 0.5) * CurrentField.Size.Y, (math.random() - 0.5) * CurrentField.Size.Z)).Position
		followPath(pos)
		Visulize()
		OrionLib:MakeNotification({
			Name = "Walking",
			Content = Value,
			Time = 5
		})
	end    
})

Player.CharacterAdded:Connect(function(newchar)
	Char = newchar
	IsWalkingToPoint = false
end)

for _,H in ipairs(workspace.Honeycombs:GetChildren()) do
	if H:WaitForChild("Display"):WaitForChild("Gui"):WaitForChild("Frame"):WaitForChild("OwnerName") then
		if H.Display.Gui.Frame.OwnerName.Text == Player.Name then
			for _,v in ipairs(workspace:WaitForChild("HivePlatforms"):GetChildren()) do
				if v:WaitForChild("Hive") and v.Hive.Value == H then
					HomePos = v.Platform
				end
			end
		end
	end
end
local TransferingHoney = false

local function onWaypointReached(reached)
	if reached and currentWaypointIndex < #waypoints then
		currentWaypointIndex = currentWaypointIndex + 1
		Humanoid:MoveTo(waypoints[currentWaypointIndex].Position)
		IsWalkingToPoint = true
	else
		IsWalkingToPoint = false
	end
end

coroutine.wrap(function()
	while task.wait(1) do
		local Result = workspace:GetPartsInPart(FieldBounds[CurrentField.Name])

		for _,v in ipairs(Result) do
			if v:IsA("BasePart") and v:FindFirstChild("BackDecal") and v.Parent == workspace:WaitForChild("Collectibles") and v.BackDecal.Texture == "rbxassetid://1629547638" and (v:FindFirstChildOfClass("ParticleEmitter") or v.Transparency == 0) and not IsWalkingToPoint and not TransferingHoney then
				pos = v.Position

				followPath(pos)
				Visulize()
			end
		end

		for _,v in ipairs(Result) do
			if v:IsA("BasePart") and v:FindFirstChild("BackDecal") and v.Parent == workspace:WaitForChild("Collectibles") and (v:FindFirstChildOfClass("ParticleEmitter") or v.Transparency == 0) and not IsWalkingToPoint and not TransferingHoney then
				pos = v.Position

				followPath(pos)
				Visulize()
			end
		end

		if not TransferingHoney and not IsWalkingToPoint then
			pos = (CurrentField.CFrame * CFrame.new((math.random() - 0.5) * CurrentField.Size.X, (math.random() - 0.5) * CurrentField.Size.Y, (math.random() - 0.5) * CurrentField.Size.Z)).Position
			followPath(pos)
			Visulize()
		end

		if Gui.MeterHUD.PollenMeter.Bar.FillBar.Size.X.Scale >= 1 and not TransferingHoney then
			TransferingHoney = true

			pos = HomePos.Position
			followPath(pos)
			Visulize()

			OrionLib:MakeNotification({
				Name = "Walking To Hive",
				Content = "Wating To Convert Honey",
				Image = "rbxassetid://4483345998",
				Time = 5
			})

		elseif TransferingHoney and Gui.ActivateButton.Visible then
			if Gui.ActivateButton.BackgroundColor3 == Color3.fromRGB(50, 131, 255) and Gui.ActivateButton.TextBox.Text == "Make Honey" then
				game:GetService("ReplicatedStorage").Events.PlayerHiveCommand:FireServer("ToggleHoneyMaking")
				task.wait(5)
			end

			OrionLib:MakeNotification({
				Name = "Converting Honey",
				Content = ". . .",
				Image = "rbxassetid://4483345998",
				Time = 5
			})

			if Gui.MeterHUD.PollenMeter.Bar.FillBar.Size.X.Scale <= 0 then
				OrionLib:MakeNotification({
					Name = "Finished Converting",
					Content = ". . .",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
				task.wait(5)
				TransferingHoney = false
			end
		end
	end
end)()

local function onPathBlocked(blockedWaypointIndex)
	if blockedWaypointIndex > currentWaypointIndex then

	end
end


path.Blocked:Connect(onPathBlocked)
Humanoid.MoveToFinished:Connect(onWaypointReached)
