local ToCopy = {
	"Name",
	"Size",
	"CFrame",
	"ClassName",
	"Parent",
	"Zubdex",
	"Texture",
	"position",
	"Color3",
	"Color",
	"Material",
	"Face",
	"CanCollide",
	"CanTouch",
	"CanCastShadow",
	"Anchored",
	"Enabled",
	"BackgroundColor3",
	"Text",
	"Visible",
	"TextTransparency",
	"TextColor3",
	"BorderSizePixel",
	"Image",
	"Transparency"
}

local Models = workspace.Map.Buildings.RedHQ

local Porps = {}

local NameLookUp = {}

for i,Model in ipairs(Models:GetDescendants()) do
	NameLookUp[Model.Parent] = "v"..i
	Porps[i] = {}

	for _,v in ipairs(ToCopy) do
		pcall(function()
			if v == "Parent" then
				Porps[i][v] = NameLookUp[Model.Parent] or workspace
			else
				Porps[i][v] = Model[v]
			end
		end)
	end
end


function Convert(numberSequence: NumberSequence)
	local Caacaa = {"NumberSequence.new{"}
	
	for i,Keypoints in ipairs(numberSequence.Keypoints) do
		if typeof(Keypoints) == "ColorSequenceKeypoint" then
			if i ~= #numberSequence.Keypoints then
				table.insert(Caacaa, `\nColorSequenceKeypoint.new({Keypoints.Time}, Color3.new({Keypoints.Value}),`)
			else
				table.insert(Caacaa, `\nColorSequenceKeypoint.new({Keypoints.Time}, Color3.new({Keypoints.Value})`)
			end
		else
			if i ~= #numberSequence.Keypoints then
				table.insert(Caacaa, `\nNumberSequenceKeypoint.new({Keypoints.Time}, {Keypoints.Value}, {Keypoints.Envelope}),`)
			else
				table.insert(Caacaa, `\nNumberSequenceKeypoint.new({Keypoints.Time}, {Keypoints.Value},  {Keypoints.Envelope})`)
			end
		end
	end

	table.insert(Caacaa, "\n}\n")
	return table.concat(Caacaa)
end

local Blacklist = {
	"ClassName",
	"position"
}
local UITypes = {
	"Frame",
	"TextLabel",
	"TextButton",
	"TextBox",
	"ImageLabel",
	"ImageButton",
	"ImageButton",
	"ScrollingFrame",
}

local Script = {}
for i,Data in pairs(Porps) do
	if not Data.ClassName then continue end

	table.insert(Script, `local v{i} = Instance.new("{Data.ClassName}")\n`)

	for _, Porp in ipairs(ToCopy) do
		if table.find(Blacklist, Porp) or not Data[Porp] then continue end
		
		if Porp == "Name" then
			table.insert(Script, `v{i}.{Porp} = "{Data[Porp]}"\n`)
		elseif Porp == "Texture" then
			table.insert(Script, `v{i}.{Porp} = "{Data[Porp]}"\n`)
		elseif Porp == "Image" then
			table.insert(Script, `v{i}.{Porp} = "{Data[Porp]}"\n`)
		elseif Data.ClassName == "ParticleEmitter" then
			if Porp == "Size" then
				table.insert(Script, `v{i}.{Porp} = {Convert(Data[Porp])}`)
			elseif Porp == "Transparency" then
				table.insert(Script, `v{i}.{Porp} = {Convert(Data[Porp])}`)
			elseif Porp == "Color" then
				table.insert(Script, `v{i}.{Porp} = {Convert(Data[Porp])}`)
			else
				table.insert(Script, `v{i}.{Porp} = {Data[Porp]}\n`)
			end
		elseif table.find(UITypes, Data.ClassName) then
			if Porp == "Size" then
				table.insert(Script, `v{i}.{Porp} = UDim2.new({Data[Porp].X.Scale},{Data[Porp].X.Offset}, {Data[Porp].Y.Scale},{Data[Porp].Y.Offset})`)
			elseif Porp == "CFrame" then
				table.insert(Script, `v{i}.position = UDim2.new({Data[Porp].X.Scale},{Data[Porp].X.Offset}, {Data[Porp].Y.Scale},{Data[Porp].Y.Offset})`)
			elseif Porp == "Texture" then
				table.insert(Script, `v{i}.{Porp} = "{Data[Porp]}"\n`)
			elseif Porp == "BackgroundColor3" then
				table.insert(Script, `v{i}.{Porp} = "Color3.new({Data[Porp]})"\n`)
			elseif Porp == "TextColor3" then
				table.insert(Script, `v{i}.{Porp} = "Color3.new({Data[Porp]})"\n`)
			else
				table.insert(Script, `v{i}.{Porp} = {Data[Porp]}\n`)
			end
		else
			if Porp == "CFrame" then
				table.insert(Script, `v{i}.{Porp} = CFrame.new({Data[Porp]})\n`)
			elseif Porp == "Size" then
				table.insert(Script, `v{i}.{Porp} = Vector3.new({Data[Porp]})\n`)
			elseif Porp == "Texture" then
				table.insert(Script, `v{i}.{Porp} = "{Data[Porp]}"\n`)
			elseif Porp == "Color" then
				table.insert(Script, `v{i}.{Porp} = Color3.new({Data[Porp]})\n`)
			elseif Porp == "Color3" then
				table.insert(Script, `v{i}.{Porp} = Color3.new({Data[Porp]})\n`)
			else
				table.insert(Script, `v{i}.{Porp} = {Data[Porp]}\n`)
			end
		end
	end
end

game:HttpPost("http://caca.onthewifi.com:8080/copy", game.HttpService:JSONEncode({content = table.concat(Script), output = "test"}), "application/json")
