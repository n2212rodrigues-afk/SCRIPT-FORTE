-- Ninja Hub UI (Delta) - janela retangular, abas 1-5, minimizar em bola flutuante

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- ======= CONFIG =======
-- Coloque aqui o ID do ninjadeltateach.png depois de enviar ao Roblox (ex: "rbxassetid://123456789")
local ICON_ID = ""
local YOUTUBE = "https://youtube.com/@xxtheinfinityxx"
local COPY_LOADSTRING = 'loadstring(game:HttpGet(""))()'

local SCRIPTS = {
	{"Delta Teach", "https://gist.githubusercontent.com/ab0967284121-png/bf114699ffec0d5bca14a037afe51859/raw/14b01997b7e247852e2371bfafb17581180c76e1/gistfile1.txt"},
	{"NicolasHub", "https://pastefy.app/zwbY7fpw/raw"},
	{"Aimbot", "https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"},
	{"Aimbot 2", "https://scriptblox.com/raw/Universal-Script-Hans-Mobile-Aimbot-64537"},
	{"Turbo Lite", "https://raw.githubusercontent.com/TurboLite/Script/main/FixLag.lua"},
	{"Build a Boat", "https://raw.githubusercontent.com/kode-sec/Butter/refs/heads/main/main.lua"},
	{"Airplane and Helicopter", "https://pastefy.app/mPtTSfEP/raw"},
	{"Nameless Admin", "https://scriptblox.com/raw/Universal-Script-nameless-admin-NEWESTWORKINGBEST-232306"},
	{"InfYield", "https://scriptblox.com/raw/Universal-Script-Infinite-Yield-95978"},
	{"Side Dash", "https://scriptblox.com/raw/The-Strongest-Battlegrounds-SIDE-DASH-*IST-CRAZY-OP-TSB-77642"},
	{"Hitbox Expander", "https://raw.githubusercontent.com/Cyborg883/HitboxExpander/refs/heads/main/Release"},
	{"Combat GUI", "https://raw.githubusercontent.com/Cyborg883/CombatGUI/refs/heads/main/TSBCombatGUI"},
	{"Candy Farm", "https://scriptblox.com/raw/HALLOWEEN-The-Strongest-Battlegrounds-candy-farm-KEYLESS-open-src-234768"},
	{"Cryptic", "https://scriptblox.com/raw/Universal-Script-Cryptic-204798"},
	{"Doors", "https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Loader.luau"},
	{"TrollingGUI", "https://scriptblox.com/raw/Universal-Script-ULTIMATE-TROLLING-GUI-BY-FANCYKID-91109"},
	{"Blox Fruits", "https://raw.githubusercontent.com/bloxfruitsnokey/Redz-Hub/refs/heads/main/Ravz/v3.luau"},
	{"Toolbox", "https://scriptblox.com/raw/Universal-Script-Toolboxs-Godmod-save-spot-Noclip-Fullbright-Etc-56399"},
	{"Meme Sea", "https://rawscripts.net/raw/UPDATE-4-Meme-Sea-Auto-Farm-Open-Source-16107"},
	{"MinhNhat", "https://raw.githubusercontent.com/minhnhatdepzai8-cloud/MinhNhat-HUB-V5/refs/heads/main/MinhNhatDZ.lua.txt"},
	{"RTX Shader", "https://scriptblox.com/raw/Universal-Script-RTX-High-46489"},
	{"Gumball Hub", "https://raw.githubusercontent.com/JaozinScripts/Gumball-Hub/refs/heads/main/GumballHubRetorn2.1.1.1.lua"},
	{"Dark Hub", "https://rawscripts.net/raw/Brookhaven-RP-Dark-Hub-214104"},
	{"Mod Menu", "https://rawscripts.net/raw/Universal-Script-Mod-menu-23236"},
	{"Ultra Mod Menu", "https://scriptblox.com/raw/Universal-Script-All-47779"},
	{"Ghost Hub", "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"},
}
-- ======================

local BG = Color3.fromRGB(28, 28, 38)
local TOP = Color3.fromRGB(20, 20, 28)
local BTN = Color3.fromRGB(52, 52, 72)
local ACCENT = Color3.fromRGB(60, 120, 200)

local parent = (gethui and gethui()) or game:GetService("CoreGui")
pcall(function()
	local old = parent:FindFirstChild("NinjaHubUI")
	if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NinjaHubUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = parent

local function toast(text)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Ninja Hub", Text = text, Duration = 2})
	end)
end

local function copy(text)
	if setclipboard then
		setclipboard(text)
		toast("Copiado!")
	else
		toast("Seu executor nao suporta copiar")
	end
end

local locked = false

local function round(obj, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r)
	c.Parent = obj
end

local function makeDraggable(handle, target)
	local dragging, startPos, startInput
	handle.InputBegan:Connect(function(input)
		if locked then return end
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			startInput = input.Position
			startPos = target.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
			local d = input.Position - startInput
			target.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
end

-- Janela principal (retangulo vertical, bordas retas)
local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 230, 0, 330)
main.Position = UDim2.new(0.5, -86, 0.5, -124)
main.BackgroundColor3 = BG
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui
round(main, 12)

-- UI pequenininha (mude o numero para ajustar o tamanho: 0.6 = menor, 1 = normal)
local uiScale = Instance.new("UIScale")
uiScale.Scale = 0.75
uiScale.Parent = main

-- Topbar
local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 32)
top.BackgroundTransparency = 1
top.BorderSizePixel = 0
top.Active = true
top.Parent = main
makeDraggable(top, main)

local function topButton(text, color, xOffset)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 28, 0, 24)
	b.Position = UDim2.new(1, xOffset, 0, 4)
	b.BackgroundColor3 = color
	b.BorderSizePixel = 0
	b.Text = text
	b.TextColor3 = Color3.new(1, 1, 1)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	b.Parent = top
	round(b, 8)
	return b
end
local closeBtn = topButton("X", Color3.fromRGB(200, 55, 55), -32)
local minBtn = topButton("-", ACCENT, -64)

-- Cadeado: trava/destrava o arrasto da janela
local lockBtn = topButton("🔓", BTN, -96)
lockBtn.TextSize = 13
lockBtn.MouseButton1Click:Connect(function()
	locked = not locked
	lockBtn.Text = locked and "🔒" or "🔓"
	lockBtn.BackgroundColor3 = locked and ACCENT or BTN
	toast(locked and "Janela travada" or "Janela destravada")
end)

-- Abas (arrastaveis para os lados)
local tabBar = Instance.new("ScrollingFrame")
tabBar.Size = UDim2.new(1, -104, 0, 24)
tabBar.Position = UDim2.new(0, 4, 0, 4)
tabBar.BackgroundTransparency = 1
tabBar.BorderSizePixel = 0
tabBar.ScrollBarThickness = 0
tabBar.ScrollingDirection = Enum.ScrollingDirection.X
tabBar.CanvasSize = UDim2.new(0, 6 * 30, 0, 0)
tabBar.Parent = top

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 2)
tabLayout.Parent = tabBar

local pages, tabButtons = {}, {}

local function selectTab(i)
	for n, p in pairs(pages) do p.Visible = (n == i) end
	for n, b in pairs(tabButtons) do b.BackgroundColor3 = (n == i) and ACCENT or BTN end
end

local function newButton(parentFrame, text, callback)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, -8, 0, 34)
	b.BackgroundColor3 = BTN
	b.BorderSizePixel = 0
	b.Text = text
	b.TextColor3 = Color3.new(1, 1, 1)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.Parent = parentFrame
	round(b, 8)
	b.MouseButton1Click:Connect(callback)
	return b
end

for i = 1, 6 do
	local tb = Instance.new("TextButton")
	tb.Size = UDim2.new(0, 28, 0, 24)
	tb.BackgroundColor3 = BTN
	tb.BorderSizePixel = 0
	tb.Text = tostring(i)
	tb.TextColor3 = Color3.new(1, 1, 1)
	tb.Font = Enum.Font.GothamBold
	tb.TextSize = 13
	tb.Parent = tabBar
	round(tb, 8)
	tabButtons[i] = tb

	local page = Instance.new("ScrollingFrame")
	page.Size = UDim2.new(1, -8, 1, -40)
	page.Position = UDim2.new(0, 4, 0, 36)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 3
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.CanvasSize = UDim2.new(0, 0, 0, 0)
	page.Visible = false
	page.Parent = main
	local l = Instance.new("UIListLayout")
	l.Padding = UDim.new(0, 5)
	l.Parent = page
	pages[i] = page

	tb.MouseButton1Click:Connect(function() selectTab(i) end)
end

-- Aba 1
newButton(pages[1], "Copy Loadstring", function() copy(COPY_LOADSTRING) end)
newButton(pages[1], "Copiar link do YouTube", function() copy(YOUTUBE) end)
newButton(pages[1], "Delta Executor", function() copy("https://deltaexploits.gg/delta-executor-android") end)
newButton(pages[1], "Arceus X", function() copy("https://spdmteam.com/index") end)
newButton(pages[1], "GitHub", function() copy("https://github.com/?locale=pt-br") end)
newButton(pages[1], "ScriptBlox", function() copy("https://scriptblox.com/") end)
newButton(pages[1], "RScripts", function() copy("https://rscripts.net") end)
newButton(pages[1], "Pastefy", function() copy("https://pastefy.app") end)
newButton(pages[1], "Pastebin", function() copy("https://pastebin.com") end)

-- Aba 2
for _, s in ipairs(SCRIPTS) do
	newButton(pages[2], s[1], function()
		local ok, err = pcall(function()
			loadstring(game:HttpGet(s[2]))()
		end)
		if not ok then toast("Erro: " .. tostring(err):sub(1, 60)) end
	end)
end

-- Car Boost (codigo embutido)
local CAR_BOOST_CODE = [==[
--[[ Universal Car Boost Script made by R_MP6
     Editado: TextBox sem limite de valor
]]

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "CarBoost loaded!",
    Text = "Made by R_MP6",
    Button1 = "Thanks",
    Duration = 5
})

local DEFAULTS = {
    MAX_BOOST_FORCE = 150,
    BOOST_INCREMENT = 3,
    BOOST_INTERVAL = 0.05,
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local boosting = false
local currentForce = 0
local boostConnection = nil
local currentSeat = nil

local boostConfig = table.clone(DEFAULTS)

local function getVehicleMainPart(seat)
    local model = seat:FindFirstAncestorOfClass("Model")
    if model and model.PrimaryPart then return model.PrimaryPart end
    for _, p in ipairs(model:GetDescendants()) do
        if p:IsA("BasePart") and p.Name:lower():find("chassis") then return p end
    end
    return seat
end

local function startBoost(seat)
    if boosting then return end
    boosting = true
    local part = getVehicleMainPart(seat)
    if not part then return end

    local trail = Instance.new("ParticleEmitter")
    trail.Texture = "rbxassetid://242830270"
    trail.Color = ColorSequence.new(Color3.new(1, 1, 1))
    trail.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0)})
    trail.Rate = 50
    trail.Speed = NumberRange.new(5, 10)
    trail.Lifetime = NumberRange.new(0.3)
    trail.Transparency = NumberSequence.new(0.2, 1)
    trail.VelocitySpread = 30
    trail.Name = "BoostTrail"
    trail.Parent = part

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://72642478827550"
    sound.Looped = true
    sound.Volume = 0.4
    sound.Name = "BoostSound"
    sound.Parent = part
    sound:Play()

    boostConnection = RunService.Heartbeat:Connect(function()
        if not boosting then return end
        local speed = part.AssemblyLinearVelocity.Magnitude
        local label = player.PlayerGui:WaitForChild("BoostGui"):FindFirstChild("SpeedLabel")
        if label then
            label.Text = "Speed: " .. math.floor(speed + 0.5)
            label.Visible = true
        end

        local currentVelocity = part.AssemblyLinearVelocity
        local forwardDir = seat.CFrame.LookVector
        local forwardSpeed = currentVelocity:Dot(forwardDir)
        local additionalSpeed = math.min(boostConfig.BOOST_INCREMENT, boostConfig.MAX_BOOST_FORCE - forwardSpeed)
        local newVelocity = currentVelocity + (forwardDir * additionalSpeed)

        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(newVelocity.X, currentVelocity.Y, newVelocity.Z)
        bv.MaxForce = Vector3.new(1e6, 0, 1e6)
        bv.P = 10000
        bv.Parent = part
        Debris:AddItem(bv, boostConfig.BOOST_INTERVAL)
    end)
end

local function stopBoost()
    boosting = false
    if boostConnection then boostConnection:Disconnect() end
    boostConnection = nil

    if currentSeat then
        local part = getVehicleMainPart(currentSeat)
        if part then
            local trail = part:FindFirstChild("BoostTrail")
            if trail then trail:Destroy() end
            local sound = part:FindFirstChild("BoostSound")
            if sound then sound:Stop() sound:Destroy() end
        end
    end

    local label = player.PlayerGui:FindFirstChild("BoostGui") and player.PlayerGui.BoostGui:FindFirstChild("SpeedLabel")
    if label then label.Visible = false end
end

local function createTextBox(name, default, onChanged)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 55)
    container.BackgroundTransparency = 1

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.4, 0, 1, 0)
    box.Position = UDim2.new(0.6, 0, 0, 0)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderText = tostring(default)
    box.Text = tostring(default)
    box.Font = Enum.Font.Gotham
    box.TextScaled = true
    box.ClearTextOnFocus = false
    box.Parent = container

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0.2, 0)
    boxCorner.Parent = box

    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = Color3.fromRGB(100, 100, 100)
    boxStroke.Thickness = 1
    boxStroke.Parent = box

    box.Focused:Connect(function()
        boxStroke.Color = Color3.fromRGB(255, 255, 255)
    end)
    box.FocusLost:Connect(function()
        boxStroke.Color = Color3.fromRGB(100, 100, 100)
        local num = tonumber(box.Text)
        if not num then
            box.Text = tostring(default)
            return
        end
        box.Text = tostring(num)
        onChanged(num)
    end)

    return container
end

local function createBoostGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "BoostGui"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local boostBtn = Instance.new("TextButton")
    boostBtn.Name = "BoostButton"
    boostBtn.Size = UDim2.new(0, 90, 0, 90)
    boostBtn.Position = UDim2.new(0.5, -100, 1, -120)
    boostBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    boostBtn.Text = "B"
    boostBtn.TextColor3 = Color3.new(1, 1, 1)
    boostBtn.TextScaled = true
    boostBtn.Font = Enum.Font.GothamBold
    boostBtn.Visible = false
    boostBtn.Parent = gui
    local boostCorner = Instance.new("UICorner", boostBtn)
    boostCorner.CornerRadius = UDim.new(1, 0)

    local settingsBtn = boostBtn:Clone()
    settingsBtn.Name = "SettingsButton"
    settingsBtn.Position = UDim2.new(0.5, 10, 1, -120)
    settingsBtn.Text = "S"
    settingsBtn.Parent = gui

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Name = "SpeedLabel"
    speedLabel.Size = UDim2.new(0, 120, 0, 40)
    speedLabel.Position = UDim2.new(0.5, -60, 1, -170)
    speedLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    speedLabel.TextColor3 = Color3.new(1, 1, 1)
    speedLabel.BackgroundTransparency = 0.3
    speedLabel.TextScaled = true
    speedLabel.Font = Enum.Font.GothamBold
    speedLabel.Text = "Speed: 0"
    speedLabel.Visible = false
    speedLabel.Parent = gui
    local corner2 = Instance.new("UICorner", speedLabel)
    corner2.CornerRadius = UDim.new(0.2, 0)

    local settingsPanel = Instance.new("Frame")
    settingsPanel.Name = "SettingsPanel"
    settingsPanel.Size = UDim2.new(0, 260, 0, 250)
    settingsPanel.Position = UDim2.new(0.5, -130, 0.5, -150)
    settingsPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    settingsPanel.Visible = false
    settingsPanel.Parent = gui
    local panelCorner = Instance.new("UICorner", settingsPanel)
    panelCorner.CornerRadius = UDim.new(0.1, 0)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = settingsPanel

    local resetBtn = Instance.new("TextButton")
    resetBtn.Name = "ResetButton"
    resetBtn.Size = UDim2.new(1, -20, 0, 40)
    resetBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    resetBtn.Text = "Reset to Defaults"
    resetBtn.TextColor3 = Color3.new(1, 1, 1)
    resetBtn.TextScaled = true
    resetBtn.Font = Enum.Font.GothamBold
    resetBtn.LayoutOrder = 0
    resetBtn.Parent = settingsPanel
    local resetCorner = Instance.new("UICorner", resetBtn)
    resetCorner.CornerRadius = UDim.new(1, 0)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "SETTINGS"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.LayoutOrder = 1
    title.Parent = settingsPanel

    local dragToggle, dragStart, startPos = nil, nil, nil
    local dragSpeed = 0.25

    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(settingsPanel, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end

    settingsPanel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = settingsPanel.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragToggle then
                updateInput(input)
            end
        end
    end)

    local boxes = {
        createTextBox("Max Force", boostConfig.MAX_BOOST_FORCE, function(v) boostConfig.MAX_BOOST_FORCE = v end),
        createTextBox("Increment", boostConfig.BOOST_INCREMENT, function(v) boostConfig.BOOST_INCREMENT = v end),
        createTextBox("Interval", boostConfig.BOOST_INTERVAL, function(v) boostConfig.BOOST_INTERVAL = v end),
    }

    for i, box in ipairs(boxes) do
        box.LayoutOrder = i + 1
        box.Parent = settingsPanel
    end

    resetBtn.MouseButton1Click:Connect(function()
        boostConfig = table.clone(DEFAULTS)
        for _, box in ipairs(boxes) do
            box:Destroy()
        end
        boxes = {
            createTextBox("Max Force", boostConfig.MAX_BOOST_FORCE, function(v) boostConfig.MAX_BOOST_FORCE = v end),
            createTextBox("Increment", boostConfig.BOOST_INCREMENT, function(v) boostConfig.BOOST_INCREMENT = v end),
            createTextBox("Interval", boostConfig.BOOST_INTERVAL, function(v) boostConfig.BOOST_INTERVAL = v end),
        }
        for i, box in ipairs(boxes) do
            box.LayoutOrder = i + 1
            box.Parent = settingsPanel
        end
    end)

    settingsBtn.MouseButton1Click:Connect(function()
        settingsPanel.Visible = not settingsPanel.Visible
    end)

    return gui, boostBtn, settingsBtn
end

local function setupBoost(character)
    local playerGui = player:WaitForChild("PlayerGui")
    if playerGui:FindFirstChild("BoostGui") then
        playerGui.BoostGui:Destroy()
    end

    local gui, boostBtn, settingsBtn = createBoostGui()

    local function monitorSeat(seat)
        if not seat:IsA("VehicleSeat") then return end
        seat:GetPropertyChangedSignal("Occupant"):Connect(function()
            local occupant = seat.Occupant
            if occupant and occupant.Parent == character then
                currentSeat = seat
                boostBtn.Visible = true
                settingsBtn.Visible = true
            elseif currentSeat == seat then
                currentSeat = nil
                boostBtn.Visible = false
                settingsBtn.Visible = false
                stopBoost()
            end
        end)
    end

    for _, s in ipairs(workspace:GetDescendants()) do monitorSeat(s) end
    workspace.DescendantAdded:Connect(monitorSeat)

    boostBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if currentSeat then startBoost(currentSeat) end
        end
    end)
    boostBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            stopBoost()
        end
    end)
end

repeat wait() until player.Character
setupBoost(player.Character)

player.CharacterAdded:Connect(function(char)
    repeat wait() until char:FindFirstChild("Humanoid")
    setupBoost(char)
end)
]==]

newButton(pages[2], "Car Boost", function()
	local ok, err = pcall(function()
		loadstring(CAR_BOOST_CODE)()
	end)
	if not ok then toast("Erro: " .. tostring(err):sub(1, 60)) end
end)

-- Auto Clicker (codigo embutido)
local AUTO_CLICKER_CODE = [==[
--[[
    AUTO CLICKER — WINDUI (Tema Verde)
    BY NICOLAS0Q0197
]]

local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local CoreGui   = game:GetService("CoreGui")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local UIS       = game:GetService("UserInputService")
local VIM       = game:GetService("VirtualInputManager")
local Camera    = workspace.CurrentCamera

local parent = PlayerGui
pcall(function() if CoreGui then parent = CoreGui end end)

local state = {
    clicking = false,
    cps      = 10,
}

local markers = {}

WindUI:AddTheme({
    Name        = "GreenClicker",
    Accent      = Color3.fromHex("#00C060"),
    Background  = Color3.fromHex("#101010"),
    Outline     = Color3.fromHex("#00C060"),
    Text        = Color3.fromHex("#00FF7F"),
    Placeholder = Color3.fromHex("#018141"),
    Button      = Color3.fromHex("#00C060"),
    Icon        = Color3.fromHex("#00FF7F"),
})
WindUI:SetTheme("GreenClicker")

for _, p in pairs({CoreGui, PlayerGui}) do
    for _, c in pairs(p:GetChildren()) do
        if c.Name == "AutoClickerMarkerGui" then
            pcall(function() c:Destroy() end)
        end
    end
end

local markerGui = Instance.new("ScreenGui")
markerGui.Name = "AutoClickerMarkerGui"
markerGui.ResetOnSpawn = false
markerGui.IgnoreGuiInset = true
markerGui.DisplayOrder = 2147483647
markerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
markerGui.Parent = parent

local function spawnMarker(pos)
    local gui = Instance.new("TextButton")
    gui.Name = "Marker"
    gui.Size = UDim2.fromOffset(64, 64)
    gui.AnchorPoint = Vector2.new(0.5, 0.5)
    gui.BackgroundTransparency = 1
    gui.Text = "🎯"
    gui.TextScaled = true
    gui.Visible = true
    gui.ZIndex = 100
    gui.AutoButtonColor = false
    gui.Position = UDim2.fromOffset(pos.X, pos.Y)
    gui.Parent = markerGui

    local stroke = Instance.new("UIStroke", gui)
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 1
    stroke.Transparency = 0.3

    local entry = { gui = gui, pos = pos }
    table.insert(markers, entry)

    local dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Touch
           and input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        dragStart = Vector2.new(input.Position.X, input.Position.Y)
        startPos  = entry.pos
    end)

    UIS.InputChanged:Connect(function(input)
        if not dragStart then return end
        if input.UserInputType ~= Enum.UserInputType.Touch
           and input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
        local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStart
        entry.pos = startPos + delta
        gui.Position = UDim2.fromOffset(entry.pos.X, entry.pos.Y)
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
           or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = nil
        end
    end)

    return entry
end

local Window = WindUI:CreateWindow({
    Title   = "Auto Clicker",
    Icon    = "crosshair",
    Author  = "BY NICOLAS0Q0197",
    Folder  = "AutoClicker",
    Size    = UDim2.fromOffset(480, 560),
    Theme   = "GreenClicker",
    Transparent  = true,
    SideBarWidth = 150,
})

local Tab = Window:Tab({ Title = "Principal", Icon = "home" })

Tab:Section({ Title = "Velocidade" })
Tab:Input({
    Title       = "CPS",
    Desc        = "Cliques por segundo POR ALVO",
    Value       = "10",
    Placeholder = "Ex: 10, 50, 100...",
    Callback    = function(text)
        local n = tonumber(text)
        if n and n > 0 then state.cps = n end
    end,
})

Tab:Section({ Title = "Alvo 🎯" })

Tab:Button({
    Title    = "Spawn Alvo 🎯",
    Desc     = "Cria um alvo no centro — arraste pra mover",
    Icon     = "crosshair",
    Callback = function()
        local vp = Camera.ViewportSize
        spawnMarker(Vector2.new(vp.X / 2, vp.Y / 2))
    end,
})

Tab:Button({
    Title    = "Spalnar Mais Alvos 🎯",
    Desc     = "Cada clique adiciona mais um alvo",
    Icon     = "plus",
    Callback = function()
        local vp = Camera.ViewportSize
        local n = #markers
        local angle  = n * 0.9
        local radius = 40 + n * 30
        local pos = Vector2.new(
            vp.X / 2 + math.cos(angle) * radius,
            vp.Y / 2 + math.sin(angle) * radius
        )
        pos = Vector2.new(
            math.clamp(pos.X, 40, vp.X - 40),
            math.clamp(pos.Y, 40, vp.Y - 40)
        )
        spawnMarker(pos)
    end,
})

Tab:Button({
    Title    = "Esconder Alvos",
    Desc     = "Esconde todos mas continua clicando",
    Icon     = "eye-off",
    Callback = function()
        for _, m in ipairs(markers) do m.gui.Visible = false end
    end,
})

Tab:Button({
    Title    = "Mostrar Alvos",
    Icon     = "eye",
    Callback = function()
        for _, m in ipairs(markers) do m.gui.Visible = true end
    end,
})

Tab:Button({
    Title    = "Remover Último Alvo",
    Desc     = "Remove só o último alvo criado",
    Icon     = "minus",
    Callback = function()
        local m = table.remove(markers)
        if m and m.gui then m.gui:Destroy() end
    end,
})

Tab:Button({
    Title    = "Remover Todos os Alvos",
    Desc     = "Remove todos e para de clicar",
    Icon     = "trash",
    Callback = function()
        for _, m in ipairs(markers) do
            if m.gui then m.gui:Destroy() end
        end
        markers = {}
    end,
})

Tab:Section({ Title = "Controle" })

Tab:Toggle({
    Title    = "Auto Clicker",
    Desc     = "Liga/desliga os cliques em todos os alvos",
    Value    = false,
    Callback = function(on)
        state.clicking = on
        if on then
            WindUI:Notify({
                Title    = "Ativado",
                Content  = #markers > 0
                    and ("Clicando em " .. #markers .. " alvo(s) 🎯")
                    or  "Spawne um alvo 🎯 primeiro!",
                Duration = 3,
            })
            task.spawn(function()
                local touchId = 4242
                while state.clicking do
                    if #markers > 0 then
                        local snapshot = {}
                        for i, m in ipairs(markers) do snapshot[i] = m end

                        for _, m in ipairs(snapshot) do
                            if not state.clicking then break end
                            if m.gui then
                                VIM:SendTouchEvent(touchId, 0, m.pos.X, m.pos.Y)
                                VIM:SendTouchEvent(touchId, 2, m.pos.X, m.pos.Y)
                                task.wait(0.01)
                            end
                        end

                        task.wait(1 / math.max(1, state.cps))
                    else
                        task.wait(0.1)
                    end
                end
            end)
        end
    end,
})

local CreditsTab = Window:Tab({ Title = "Credits", Icon = "info" })

CreditsTab:Section({ Title = "Créditos" })

CreditsTab:Paragraph({
    Title = "AUTO CLICKER FEITO POR NICOLAS0Q0197",
    Desc  = "BY NICOLAS0Q0197",
})

print("[Auto Clicker] WindUI carregado — BY NICOLAS0Q0197")
]==]

-- Primeira Pessoa (codigo embutido)
local PRIMEIRA_PESSOA_CODE = [==[
--[[
    Script: Primeira Pessoa — Só Mãos (sem cabelo)
    Plataforma: Delta Mobile
    Versão: 8.0 FINAL
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer
local Cam = Workspace.CurrentCamera

local ativo = false
local conexao = nil
local DEBUG = false

local NOMES_MAOS = {
    ["Left Arm"] = true, ["Right Arm"] = true,
    ["Left Hand"] = true, ["Right Hand"] = true,
    ["LeftUpperArm"] = true, ["RightUpperArm"] = true,
    ["LeftLowerArm"] = true, ["RightLowerArm"] = true,
    ["LeftHand"] = true, ["RightHand"] = true,
}

local NOMES_CABELO = {
    ["Hair"] = true, ["HairAccessory"] = true,
    ["HairAttachment"] = true, ["HairMesh"] = true,
    ["HairPart"] = true, ["Cabelo"] = true,
    ["Hat"] = true, ["HatAccessory"] = true,
    ["Face"] = true, ["FaceAccessory"] = true,
    ["Head"] = true, ["HeadMesh"] = true,
    ["Cabeça"] = true, ["Cabeca"] = true,
    ["HeadAccessory"] = true,
}

local function ehMao(o)
    if NOMES_MAOS[o.Name] then return true end
    local n = o.Name:lower()
    if n:find("head") or n:find("hair") or n:find("cabeca") 
       or n:find("cabelo") or n:find("face") then
        return false
    end
    return n:find("arm") ~= nil or n:find("hand") ~= nil
end

local function ehCabelo(o)
    if NOMES_CABELO[o.Name] then return true end
    local n = o.Name:lower()
    return n:find("hair") ~= nil or n:find("cabelo") ~= nil
        or n:find("hat") ~= nil or n:find("head") ~= nil
        or n:find("cabeca") ~= nil or n:find("face") ~= nil
end

local function aplicarFP()
    local c = LP.Character
    if not c then return end

    for _, o in ipairs(c:GetDescendants()) do
        if o:IsA("BasePart") or o:IsA("MeshPart") or o:IsA("Decal") then
            if ehMao(o) and not ehCabelo(o) then
                o.LocalTransparencyModifier = 0
            else
                o.LocalTransparencyModifier = 1
            end
        end
    end

    for _, acc in ipairs(c:GetChildren()) do
        if acc:IsA("Accessory") then
            local handle = acc:FindFirstChild("Handle")
            if handle then
                if ehCabelo(acc) or ehCabelo(handle) then
                    handle.LocalTransparencyModifier = 1
                end
            end
        end
    end

    if DEBUG then
        print("=== FP APLICADO ===")
        for _, o in ipairs(c:GetDescendants()) do
            if o:IsA("BasePart") or o:IsA("MeshPart") then
                local visivel = o.LocalTransparencyModifier == 0
                print(o.Name, "| visível:", visivel)
            end
        end
    end
end

local function parar()
    if conexao then conexao:Disconnect(); conexao = nil end
end

local function ativar()
    parar()
    pcall(function() LP.CameraMode = Enum.CameraMode.LockFirstPerson end)
    local c = LP.Character
    local h = c and c:FindFirstChildOfClass("Humanoid")
    if h then
        Cam.CameraType = Enum.CameraType.Custom
        Cam.CameraSubject = h
    end
    conexao = RunService.RenderStepped:Connect(function()
        if ativo then aplicarFP() end
    end)
end

local function desativar()
    parar()
    ativo = false
    pcall(function() LP.CameraMode = Enum.CameraMode.Classic end)
    if Cam then
        Cam.CameraType = Enum.CameraType.Custom
        local c = LP.Character
        local h = c and c:FindFirstChildOfClass("Humanoid")
        if h then Cam.CameraSubject = h end
    end
    local c = LP.Character
    if c then
        for _, o in ipairs(c:GetDescendants()) do
            if o:IsA("BasePart") or o:IsA("MeshPart") or o:IsA("Decal") then
                o.LocalTransparencyModifier = 0
            end
        end
    end
end

pcall(function()
    local cg = game:GetService("CoreGui")
    if cg:FindFirstChild("FPGui") then cg.FPGui:Destroy() end
end)

local sg = Instance.new("ScreenGui")
sg.Name = "FPGui"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.Parent = game:GetService("CoreGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 160)
main.Position = UDim2.new(0.5, -125, 0, 40)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg
local uc = Instance.new("UICorner")
uc.CornerRadius = UDim.new(0, 12)
uc.Parent = main

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1, 0, 0, 35)
t.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
t.BorderSizePixel = 0
t.Text = "👁️ Primeira Pessoa (só mãos)"
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.TextSize = 13
t.Font = Enum.Font.GothamBold
t.Parent = main
local uct = Instance.new("UICorner")
uct.CornerRadius = UDim.new(0, 12)
uct.Parent = t

local f = Instance.new("Frame")
f.Size = UDim2.new(1, -20, 0, 45)
f.Position = UDim2.new(0, 10, 0, 45)
f.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
f.BorderSizePixel = 0
f.Parent = main
local u1 = Instance.new("UICorner")
u1.CornerRadius = UDim.new(0, 8)
u1.Parent = f

local l = Instance.new("TextLabel")
l.Size = UDim2.new(0.68, 0, 1, 0)
l.Position = UDim2.new(0, 10, 0, 0)
l.BackgroundTransparency = 1
l.Text = "Ativar FP"
l.TextColor3 = Color3.fromRGB(230, 230, 230)
l.TextSize = 13
l.Font = Enum.Font.GothamSemibold
l.TextXAlignment = Enum.TextXAlignment.Left
l.Parent = f

local b = Instance.new("TextButton")
b.Size = UDim2.new(0, 50, 0, 26)
b.Position = UDim2.new(1, -60, 0.5, -13)
b.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
b.BorderSizePixel = 0
b.Text = ""
b.AutoButtonColor = false
b.Parent = f
local u2 = Instance.new("UICorner")
u2.CornerRadius = UDim.new(1, 0)
u2.Parent = b

local ci = Instance.new("Frame")
ci.Size = UDim2.new(0, 22, 0, 22)
ci.Position = UDim2.new(0, 2, 0.5, -11)
ci.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ci.BorderSizePixel = 0
ci.Parent = b
local u3 = Instance.new("UICorner")
u3.CornerRadius = UDim.new(1, 0)
u3.Parent = ci

local function vis()
    if ativo then
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 180, 100)}):Play()
        TweenService:Create(ci, TweenInfo.new(0.2), {Position = UDim2.new(1, -24, 0.5, -11), BackgroundColor3 = Color3.fromRGB(255,255,255)}):Play()
    else
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 80)}):Play()
        TweenService:Create(ci, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -11), BackgroundColor3 = Color3.fromRGB(200,200,200)}):Play()
    end
end

b.MouseButton1Click:Connect(function()
    ativo = not ativo
    vis()
    if ativo then ativar() else desativar() end
end)

local dbg = Instance.new("TextButton")
dbg.Size = UDim2.new(1, -20, 0, 28)
dbg.Position = UDim2.new(0, 10, 1, -36)
dbg.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
dbg.BorderSizePixel = 0
dbg.Text = "🔍 Debug (printar nomes)"
dbg.TextColor3 = Color3.fromRGB(255, 255, 255)
dbg.TextSize = 12
dbg.Font = Enum.Font.GothamBold
dbg.Parent = main
local ucd = Instance.new("UICorner")
ucd.CornerRadius = UDim.new(0, 8)
ucd.Parent = dbg

dbg.MouseButton1Click:Connect(function()
    DEBUG = not DEBUG
    print("=== DEBUG:", DEBUG and "ON" or "OFF", "===")
    local c = LP.Character
    if c then
        print("--- PARTES DO PERSONAGEM ---")
        for _, o in ipairs(c:GetDescendants()) do
            if o:IsA("BasePart") or o:IsA("MeshPart") then
                print(o.ClassName, "| Nome:", o.Name, "| Pai:", o.Parent and o.Parent.Name)
            end
        end
        print("--- ACESSÓRIOS ---")
        for _, o in ipairs(c:GetChildren()) do
            if o:IsA("Accessory") then
                print("Accessory | Nome:", o.Name)
                local h = o:FindFirstChild("Handle")
                if h then print("  Handle:", h.Name, "| Transp:", h.LocalTransparencyModifier) end
            end
        end
    end
end)

LP.CharacterAdded:Connect(function()
    task.wait(1)
    if ativo then ativar() end
end)

print("✅ Script FP v8.0 carregado")
]==]

local function runCode(code)
	local ok, err = pcall(function()
		loadstring(code)()
	end)
	if not ok then toast("Erro: " .. tostring(err):sub(1, 60)) end
end

newButton(pages[2], "Auto Clicker", function() runCode(AUTO_CLICKER_CODE) end)
newButton(pages[2], "Primeira Pessoa", function() runCode(PRIMEIRA_PESSOA_CODE) end)

-- Lanterna (codigo embutido)
local LANTERNA_CODE = [==[
-- Executor / Delta Mobile — Lanterna FORTE + Anti-Escuridão (restaura escuridão ao desligar)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local TOOL_NAME = "Lanterna"

-- ========= LIMPEZA =========
local bpOld = player:FindFirstChildOfClass("Backpack")
if bpOld then local o = bpOld:FindFirstChild(TOOL_NAME) if o then o:Destroy() end end
local chOld = player.Character
if chOld then local o = chOld:FindFirstChild(TOOL_NAME) if o then o:Destroy() end end
local pgOld = player:FindFirstChildOfClass("PlayerGui")
if pgOld then local g = pgOld:FindFirstChild("FlashlightUI") if g then g:Destroy() end end

-- Se um rerun anterior deixou a Lighting alterada, restaura
if _G.__FlashlightSavedLighting then
    local s = _G.__FlashlightSavedLighting
    Lighting.Brightness = s.Brightness
    Lighting.Ambient = s.Ambient
    Lighting.OutdoorAmbient = s.OutdoorAmbient
    Lighting.GlobalShadows = s.GlobalShadows
    Lighting.FogEnd = s.FogEnd
    _G.__FlashlightSavedLighting = nil
end

-- ========= CONFIG =========
local DEFAULT_RANGE = 60
local MIN_RANGE, MAX_RANGE = 5, 200
local currentRange = DEFAULT_RANGE
local isOn = false
local antiDark = false
local savedLighting = nil   -- snapshot tirado AO LIGAR o anti-escuro

-- ========= TOOL =========
local tool = Instance.new("Tool")
tool.Name = TOOL_NAME
tool.RequiresHandle = true
tool.CanBeDropped = false

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(0.6, 0.6, 1.4)
handle.Color = Color3.fromRGB(30, 30, 30)
handle.Material = Enum.Material.Metal
handle.TopSurface = Enum.SurfaceType.Smooth
handle.BottomSurface = Enum.SurfaceType.Smooth
handle.Parent = tool

-- ========= LENTE =========
local lens = Instance.new("Part")
lens.Name = "Lens"
lens.Size = Vector3.new(1, 1, 0.15)
lens.Material = Enum.Material.SmoothPlastic
lens.Color = Color3.fromRGB(255, 240, 180)
lens.Transparency = 0.6
lens.CanCollide = false
lens.CanTouch = false
lens.Massless = true
lens.Parent = handle

local lensWeld = Instance.new("Weld")
lensWeld.Part0 = handle
lensWeld.Part1 = lens
lensWeld.C0 = CFrame.new(0, 0, -handle.Size.Z/2 - 0.1)
lensWeld.Parent = handle

-- ========= FEIXE =========
local beam = Instance.new("Part")
beam.Name = "Beam"
beam.Size = Vector3.new(1, 1, currentRange)
beam.Material = Enum.Material.Neon
beam.Color = Color3.fromRGB(255, 255, 200)
beam.Transparency = 1
beam.CanCollide = false
beam.CanTouch = false
beam.CanQuery = false
beam.CastShadow = false
beam.Massless = true
beam.Parent = handle

local beamWeld = Instance.new("Weld")
beamWeld.Part0 = handle
beamWeld.Part1 = beam
beamWeld.C0 = CFrame.new(0, 0, -handle.Size.Z/2 - 0.15 - currentRange/2)
beamWeld.Parent = handle

-- ========= LUZ =========
local light = Instance.new("SurfaceLight")
light.Face = Enum.NormalId.Front
light.Range = currentRange
light.Brightness = 4
light.Shadows = true
light.Angle = 90
light.Enabled = false
light.Parent = lens

-- ========= UI =========
local gui = Instance.new("ScreenGui")
gui.Name = "FlashlightUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 180)
frame.Position = UDim2.new(0.5, -120, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Active = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local nameLabel = Instance.new("TextLabel", frame)
nameLabel.Size = UDim2.new(1, -12, 0, 26)
nameLabel.Position = UDim2.new(0, 6, 0, 6)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = tool.Name
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 17
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

local inputBox = Instance.new("TextBox", frame)
inputBox.Size = UDim2.new(1, -20, 0, 44)
inputBox.Position = UDim2.new(0, 10, 0, 36)
inputBox.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.Text = tostring(currentRange)
inputBox.PlaceholderText = "Forca (5-200)"
inputBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
inputBox.Font = Enum.Font.GothamBold
inputBox.TextSize = 20
inputBox.BorderSizePixel = 0
inputBox.ClearTextOnFocus = false
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(1, -20, 0, 34)
toggle.Position = UDim2.new(0, 10, 0, 92)
toggle.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
toggle.Text = "Lanterna: OFF"
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.BorderSizePixel = 0
toggle.AutoButtonColor = false
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 6)

local antiBtn = Instance.new("TextButton", frame)
antiBtn.Size = UDim2.new(1, -20, 0, 34)
antiBtn.Position = UDim2.new(0, 10, 0, 134)
antiBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
antiBtn.Text = "Anti-Escuridao: OFF"
antiBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiBtn.Font = Enum.Font.GothamBold
antiBtn.TextSize = 16
antiBtn.BorderSizePixel = 0
antiBtn.AutoButtonColor = false
Instance.new("UICorner", antiBtn).CornerRadius = UDim.new(0, 6)

-- Arrastar
local dragging, dragStart, startPos
frame.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = i.Position; startPos = frame.Position
    end
end)
UIS.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ========= SNAPSHOT / RESTORE =========
local function snapshotLighting()
    if savedLighting then return end
    savedLighting = {
        Brightness = Lighting.Brightness,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        GlobalShadows = Lighting.GlobalShadows,
        FogEnd = Lighting.FogEnd,
    }
    _G.__FlashlightSavedLighting = savedLighting
end

local function restoreLighting()
    if not savedLighting then return end
    Lighting.Brightness = savedLighting.Brightness
    Lighting.Ambient = savedLighting.Ambient
    Lighting.OutdoorAmbient = savedLighting.OutdoorAmbient
    Lighting.GlobalShadows = savedLighting.GlobalShadows
    Lighting.FogEnd = savedLighting.FogEnd
    savedLighting = nil
    _G.__FlashlightSavedLighting = nil
end

local function applyAntiDark()
    snapshotLighting()
    Lighting.Brightness = savedLighting.Brightness + 2
    Lighting.Ambient = Color3.fromRGB(150, 150, 150)
    Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
    Lighting.GlobalShadows = false
    if savedLighting.FogEnd > 0 then
        Lighting.FogEnd = 1e5
    end
end

-- ========= REFRESH =========
local function refresh()
    local active = isOn and antiDark
    local effectiveRange = active and math.max(currentRange, 150) or currentRange

    -- Luz da lanterna
    light.Enabled = isOn
    light.Range = effectiveRange
    light.Brightness = active and 10 or 4
    light.Angle = active and 120 or 90
    light.Shadows = not active

    -- Ambiente: se ativo aplica, senão restaura (escuridão volta)
    if active then
        applyAntiDark()
    else
        restoreLighting()
    end

    -- Feixe visual
    beam.Size = Vector3.new(1, 1, effectiveRange)
    beamWeld.C0 = CFrame.new(0, 0, -handle.Size.Z/2 - 0.15 - effectiveRange/2)
    beam.Transparency = isOn and 0.9 or 1
    lens.Transparency = isOn and 0.35 or 0.6
    lens.Material = isOn and Enum.Material.Neon or Enum.Material.SmoothPlastic

    -- Botões
    toggle.Text = isOn and "Lanterna: ON" or "Lanterna: OFF"
    toggle.BackgroundColor3 = isOn and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(255, 60, 60)
    antiBtn.Text = antiDark and "Anti-Escuridao: ON" or "Anti-Escuridao: OFF"
    antiBtn.BackgroundColor3 = antiDark and Color3.fromRGB(0, 170, 80) or Color3.fromRGB(255, 60, 60)
end

inputBox.FocusLost:Connect(function()
    local n = tonumber(inputBox.Text)
    if n and n >= MIN_RANGE and n <= MAX_RANGE then
        currentRange = n
        inputBox.Text = tostring(n)
        refresh()
    else
        inputBox.Text = tostring(currentRange)
    end
end)

toggle.MouseButton1Click:Connect(function()
    isOn = not isOn
    refresh()
end)

antiBtn.MouseButton1Click:Connect(function()
    antiDark = not antiDark
    refresh()
end)

tool.Equipped:Connect(function()
    frame.Visible = true
end)

tool.Unequipped:Connect(function()
    frame.Visible = false
    isOn = false
    antiDark = false
    refresh()   -- restaura a escuridão
end)

-- ========= ENTREGA (sem auto-equip) =========
local bp = player:FindFirstChildOfClass("Backpack") or player:WaitForChild("Backpack", 5)
if bp then tool.Parent = bp end
]==]

newButton(pages[2], "Lanterna", function() runCode(LANTERNA_CODE) end)

-- ===== Aba 2: novos scripts =====
local EXTRA2 = {
{"EXAGERED HUB", [==[
-- EXAGERED HUB|PAID v21 (Elerium v2 UI) - United Muscles - Arceus X Neo Mobile
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local lp = Players.LocalPlayer

-- ===== CONFIG =====
local TITLE = "EXAGERED HUB|PAID"
local OLD_TITLES = {"EXAGERED HUB|PAID", "United Muscles Hub | Auto Farm"}
local WINDOW_W, WINDOW_H = 0.80, 0.85
local TRAIN_SPEED = 20
local REBIRTH_SPEED = 3
local REBIRTH_TARGET = math.huge   -- alvo de rebirths (usado só pelo Auto Rebirth Target)
local BURST_CAP = 100
local RATE = {punch = 1/TRAIN_SPEED, weight = 1/TRAIN_SPEED, pushup = 1/TRAIN_SPEED,
              all = 1/TRAIN_SPEED, rock = 1/TRAIN_SPEED, rebirth = 1/REBIRTH_SPEED}
local SPEED_VALUE = 200
local TAP_ENABLED = true
local TAP_INTERVAL = 0.12
local REC_SECONDS = 8
local ROCK_KEYWORD = "rock"
local ONLY_AFFORDABLE = true
local ROCK_RESCAN = 4

local KEYWORDS = {
    punch = {"punch", "soco", "punho", "fist", "attack", "hit"},
    weight = {"weight", "dumbbell", "barbell", "halter", "haltere", "peso", "lift", "train", "workout"},
    pushup = {"pushup", "push up", "push-up", "flex", "flexao", "flexão"},
    rebirth = {"rebirth", "renasc"},
}
local TOOL_WORDS = {
    punch = {"punch", "soco", "punho", "fist"},
    weight = {"weight", "dumbbell", "barbell", "halter", "haltere", "peso"},
    pushup = {"pushup", "push up", "flex"},
}
local STATION_WORDS = {"train", "bench", "supino", "weight", "dumbbell", "barbell", "press", "pushup", "push up",
    "pull", "chin", "bar", "barra", "squat", "agach", "treadmill", "esteira", "punching", "saco", "bag",
    "lift", "workout", "flex", "muscle", "gym", "ginasio", "ginásio"}
local BLACKLIST = {"shop", "loja", "buy", "compra", "rebirth", "renasc", "trade", "troca", "gem", "code",
    "codigo", "teleport", "portal", "egg", "pack", "pacote", "fight", "luta", "claim", "reward",
    "elevator", "elevador", "rei dos"}
local NOISE = {"camera", "ping", "heartbeat", "mouse", "analytic", "chat", "walk", "jump"}

local state = {punch = false, weight = false, pushup = false, all = false,
               rebirth = false, rebirthTarget = false, rock = false,
               loop = false, speed = false, afk = false, kick = false}
local captured = {}
local ACTIONS = {"punch", "weight", "pushup"}
local recordedTrain, recordedRebirth = {}, {}
local recBuffer, recSeen, recTarget = nil, {}, nil
local replaying = false
local hookMethod, hookCalls = "nenhum", 0

-- Remove janelas antigas
pcall(function()
    for _, root in ipairs({gethui and gethui(), game:GetService("CoreGui"), lp:FindFirstChild("PlayerGui")}) do
        if root then
            for _, d in ipairs(root:GetDescendants()) do
                if d:IsA("TextLabel") then
                    for _, t in ipairs(OLD_TITLES) do
                        if d.Text == t then
                            local sg = d:FindFirstAncestorOfClass("ScreenGui")
                            if sg then sg:Destroy() end
                        end
                    end
                end
            end
        end
    end
end)

-- ===== UI (Elerium v2, vermelha e grande) =====
local cam0 = workspace.CurrentCamera
local vp = cam0 and cam0.ViewportSize or Vector2.new(800, 400)
local window = library:AddWindow(TITLE, {
    main_color = Color3.fromRGB(190, 30, 20),
    min_size = Vector2.new(math.floor(vp.X * WINDOW_W), math.floor(vp.Y * WINDOW_H)),
    can_resize = false,
})

local tabTreino = window:AddTab("Treino")
local tabRebirth = window:AddTab("Rebirth")
local tabRock = window:AddTab("Rock")
local tabJogador = window:AddTab("Jogador")
local tabGravar = window:AddTab("Gravar")

local statusLabels = {}
local function setStatus(text)
    for _, l in ipairs(statusLabels) do
        pcall(function() l.Text = text end)
    end
end
local function addStatus(tab)
    local l = tab:AddLabel("Status: pronto")
    table.insert(statusLabels, l)
end

-- ===== Barra vermelha: título no meio + "C" no lugar da seta (só na barra) =====
local function customizeUI()
    task.wait(0.8)
    local roots = {}
    pcall(function() if gethui then table.insert(roots, gethui()) end end)
    pcall(function() table.insert(roots, game:GetService("CoreGui")) end)
    local pg = lp:FindFirstChild("PlayerGui")
    if pg then table.insert(roots, pg) end

    for _, root in ipairs(roots) do
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA("TextLabel") and d.Text == TITLE then
                pcall(function()
                    d.TextXAlignment = Enum.TextXAlignment.Center
                    d.AnchorPoint = Vector2.new(0.5, d.AnchorPoint.Y)
                    d.Position = UDim2.new(0.5, 0, d.Position.Y.Scale, d.Position.Y.Offset)
                end)
                local top = d.AbsolutePosition.Y
                local bottom = top + d.AbsoluteSize.Y
                local win = d:FindFirstAncestorOfClass("ScreenGui") or d.Parent
                for _, b in ipairs(win:GetDescendants()) do
                    if (b:IsA("ImageButton") or b:IsA("TextButton")) and b ~= d then
                        local cy = b.AbsolutePosition.Y + b.AbsoluteSize.Y / 2
                        local inBar = cy >= top - 4 and cy <= bottom + 4
                        if inBar and b.AbsoluteSize.X <= 70 and b.AbsoluteSize.Y <= 70
                        and not b:FindFirstChild("UM_C") then
                            if b:IsA("ImageButton") then pcall(function() b.ImageTransparency = 1 end) end
                            for _, c in ipairs(b:GetChildren()) do
                                if c:IsA("ImageLabel") or c:IsA("ImageButton") then
                                    pcall(function() c.ImageTransparency = 1 end)
                                end
                            end
                            if b:IsA("TextButton") then
                                pcall(function()
                                    b.Text = "C"
                                    b.TextColor3 = Color3.new(1, 1, 1)
                                    b.Font = Enum.Font.GothamBold
                                    b.TextSize = 20
                                end)
                            else
                                local t = Instance.new("TextLabel")
                                t.Name = "UM_C"
                                t.Size = UDim2.new(1, 0, 1, 0)
                                t.BackgroundTransparency = 1
                                t.Text = "C"
                                t.TextColor3 = Color3.new(1, 1, 1)
                                t.Font = Enum.Font.GothamBold
                                t.TextSize = 20
                                t.ZIndex = (b.ZIndex or 1) + 1
                                t.Parent = b
                            end
                        end
                    end
                end
                return
            end
        end
    end
end

-- ===== Parser dos textboxes (ilimitado, max, inf, 1k, 1m...) =====
local MULT = {k = 1e3, m = 1e6, b = 1e9, t = 1e12}
local INF_WORDS = {max = true, maximo = true, ["máximo"] = true, inf = true, infinito = true, infinity = true}

local function parseNum(s)
    s = (tostring(s):lower():gsub("%s", ""):gsub(",", "."))
    if INF_WORDS[s] then return math.huge end
    local num, suf = s:match("^([%d%.e%+%-]+)([kmbt]?)$")
    if not num then return nil end
    local n = tonumber(num)
    if not n then return nil end
    if suf ~= "" then n = n * MULT[suf] end
    if n <= 0 then return nil end
    return n
end
local function fmt(n)
    if n == math.huge then return "INF" end
    if n >= 1e6 then return string.format("%.3g", n) end
    if n == math.floor(n) then return tostring(math.floor(n)) end
    return string.format("%.2f", n)
end

-- ===== Loop Position (posição + postura) =====
local lockCF, lockAnims, myTracks = nil, {}, {}

local function capturePose()
    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not (hrp and hum) then return false end
    lockCF = hrp.CFrame
    lockAnims = {}
    local animator = hum:FindFirstChildOfClass("Animator")
    if animator then
        for _, tr in ipairs(animator:GetPlayingAnimationTracks()) do
            if tr.Animation and tr.Animation.AnimationId ~= "" then
                table.insert(lockAnims, {id = tr.Animation.AnimationId, t = tr.TimePosition, prio = tr.Priority})
            end
        end
    end
    return true
end
local function clearTracks()
    for _, tr in ipairs(myTracks) do pcall(function() tr:Stop(0) tr:Destroy() end) end
    myTracks = {}
end
local function applyPose(char)
    local hum = char:WaitForChild("Humanoid", 10)
    local hrp = char:WaitForChild("HumanoidRootPart", 10)
    if not (hum and hrp) then return end
    local animator = hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator", 5)
    if not animator then return end
    local animate = char:FindFirstChild("Animate")
    if animate then pcall(function() animate.Disabled = true end) end
    hum.AutoRotate = false
    clearTracks()
    for _, a in ipairs(lockAnims) do
        local obj = Instance.new("Animation")
        obj.AnimationId = a.id
        local ok, tr = pcall(function() return animator:LoadAnimation(obj) end)
        if ok and tr then
            pcall(function() tr.Priority = a.prio end)
            tr:Play(0, 1, 0)
            tr.TimePosition = a.t
            tr:AdjustSpeed(0)
            table.insert(myTracks, tr)
        end
    end
end
local function releasePose()
    clearTracks()
    local char = lp.Character
    if char then
        local animate = char:FindFirstChild("Animate")
        if animate then pcall(function() animate.Disabled = false end) end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.AutoRotate = true end
    end
end

-- ===== Contador de rebirths (lê leaderstats / valores do jogador) =====
local rbObj, rbLastSearch = nil, 0
local function getRebirths()
    if rbObj and rbObj.Parent then
        local ok, v = pcall(function() return rbObj.Value end)
        if ok and type(v) == "number" then return v end
    end
    if os.clock() - rbLastSearch < 3 then return nil end
    rbLastSearch = os.clock()
    for _, root in ipairs({lp:FindFirstChild("leaderstats"), lp}) do
        if root then
            for _, v in ipairs(root:GetDescendants()) do
                if v:IsA("ValueBase") then
                    local n = string.lower(v.Name)
                    if string.find(n, "rebirth", 1, true) or string.find(n, "renasc", 1, true) then
                        local ok, val = pcall(function() return v.Value end)
                        if ok and type(val) == "number" then rbObj = v return val end
                    end
                end
            end
        end
    end
    return nil
end

-- ===== Durabilidade (para saber quais rochas você aguenta) =====
local durObj, durLastSearch = nil, 0
local function getMyDurability()
    if durObj and durObj.Parent then
        local ok, v = pcall(function() return durObj.Value end)
        if ok and type(v) == "number" then return v end
    end
    if os.clock() - durLastSearch < 3 then return nil end
    durLastSearch = os.clock()
    for _, root in ipairs({lp:FindFirstChild("leaderstats"), lp}) do
        if root then
            for _, v in ipairs(root:GetDescendants()) do
                if v:IsA("ValueBase") and string.find(string.lower(v.Name), "durab", 1, true) then
                    local ok, val = pcall(function() return v.Value end)
                    if ok and type(val) == "number" then durObj = v return val end
                end
            end
        end
    end
    return nil
end

-- ===== ABA TREINO =====
tabTreino:AddTextBox("Velocidade treino /s (max, inf, 1k)", function(text)
    local n = parseNum(text)
    if not n then setStatus("Valor inválido. Use número, 1k, 1m, 1e9, max ou inf.") return end
    TRAIN_SPEED = n
    local i = (n == math.huge) and 0 or (1 / n)
    RATE.punch, RATE.weight, RATE.pushup, RATE.all, RATE.rock = i, i, i, i, i
    setStatus(n == math.huge and ("Treino: MÁXIMO (" .. BURST_CAP .. "/frame)") or ("Treino: " .. fmt(n) .. " por segundo"))
end)

tabTreino:AddSwitch("Auto Punch Fast", function(b) state.punch = b end)
tabTreino:AddSwitch("Auto Weight Fast", function(b) state.weight = b end)
tabTreino:AddSwitch("Auto Flexões", function(b) state.pushup = b end)
tabTreino:AddSwitch("Auto Treinar Tudo", function(b) state.all = b end)
addStatus(tabTreino)

-- ===== ABA REBIRTH =====
tabRebirth:AddTextBox("Velocidade rebirth /s (max, inf, 1k)", function(text)
    local n = parseNum(text)
    if not n then setStatus("Valor inválido. Use número, 1k, 1m, 1e9, max ou inf.") return end
    REBIRTH_SPEED = n
    RATE.rebirth = (n == math.huge) and 0 or (1 / n)
    setStatus(n == math.huge and ("Rebirth: MÁXIMO (" .. BURST_CAP .. "/frame)") or ("Rebirth: " .. fmt(n) .. " por segundo"))
end)

tabRebirth:AddTextBox("Rebirth alvo (número total onde parar)", function(text)
    local n = parseNum(text)
    if not n then setStatus("Valor inválido. Use número, 1k, 1m, max ou inf.") return end
    REBIRTH_TARGET = n
    local cur = getRebirths()
    if n == math.huge then
        setStatus("Alvo infinito: o Auto Rebirth Target não vai disparar. Digite um número.")
    elseif cur then
        setStatus(("Rebirth alvo: %s (você tem %s)"):format(fmt(n), fmt(cur)))
    else
        setStatus("Alvo " .. fmt(n) .. " salvo, mas não achei o contador de rebirths do jogo.")
    end
end)

tabRebirth:AddButton("Ver rebirths atuais", function()
    local cur = getRebirths()
    setStatus(cur and ("Rebirths atuais: " .. fmt(cur)) or "Não achei o contador de rebirths do jogo.")
end)

local rebirthTargetSwitch = tabRebirth:AddSwitch("Auto Rebirth Target (para no alvo)", function(b)
    state.rebirthTarget = b
    if b then
        local cur = getRebirths()
        if REBIRTH_TARGET == math.huge then
            setStatus("Defina o Rebirth alvo (um número) antes de usar.")
        elseif cur then
            setStatus(("Indo de %s até %s rebirths"):format(fmt(cur), fmt(REBIRTH_TARGET)))
        end
    end
end)

local rebirthSwitch = tabRebirth:AddSwitch("Auto Max Rebirth (sem parar)", function(b) state.rebirth = b end)
addStatus(tabRebirth)

-- ===== ABA ROCK (sempre a rocha mais perto que dá pra bater) =====
local rockList, rockTarget, rockLastScan = {}, nil, 0
local needCache = {}

local function rockPartOf(o)
    if o:IsA("BasePart") then return o end
    if o:IsA("Model") then return o.PrimaryPart or o:FindFirstChildWhichIsA("BasePart", true) end
end
local function isPlayerStuff(o)
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character and o:IsDescendantOf(p.Character) then return true end
    end
    return false
end

local function rockNeed(o)
    local c = needCache[o]
    if c ~= nil then return c or nil end
    local found = false
    for _, v in ipairs(o:GetDescendants()) do
        if v:IsA("ValueBase") then
            local n = string.lower(v.Name)
            if string.find(n, "durab", 1, true) or string.find(n, "need", 1, true) or string.find(n, "requir", 1, true) then
                local ok, val = pcall(function() return v.Value end)
                if ok and type(val) == "number" then found = val break end
            end
        end
    end
    if not found then
        for name, val in pairs(o:GetAttributes()) do
            local n = string.lower(name)
            if type(val) == "number" and (string.find(n, "durab", 1, true) or string.find(n, "need", 1, true) or string.find(n, "requir", 1, true)) then
                found = val break
            end
        end
    end
    needCache[o] = found
    return found or nil
end

local function canPunch(o)
    if not ONLY_AFFORDABLE then return true end
    local need = rockNeed(o)
    local mine = getMyDurability()
    if need and mine then return mine >= need end
    return true
end

local function scanRocks()
    local kw = string.lower(ROCK_KEYWORD)
    local list, n = {}, 0
    for _, o in ipairs(workspace:GetDescendants()) do
        n += 1
        if n % 2000 == 0 then task.wait() end
        if (o:IsA("Model") or o:IsA("BasePart")) and string.find(string.lower(o.Name), kw, 1, true) then
            local par = o.Parent
            local parentMatches = par and par ~= workspace and string.find(string.lower(par.Name), kw, 1, true)
            if not parentMatches and not isPlayerStuff(o) and rockPartOf(o) then
                table.insert(list, o)
            end
        end
    end
    rockList = list
    rockLastScan = os.clock()
end

local function pickNearestRock()
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local best, bd
    for _, o in ipairs(rockList) do
        if o.Parent then
            local p = rockPartOf(o)
            if p and canPunch(o) then
                local d = (p.Position - hrp.Position).Magnitude
                if not bd or d < bd then best, bd = o, d end
            end
        end
    end
    rockTarget = best
    return best, bd
end

local function teleportToRock()
    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not (hrp and rockTarget and rockTarget.Parent) then return false end
    local p = rockPartOf(rockTarget)
    if not p then return false end
    local pos = p.Position
    local dist = (pos - hrp.Position).Magnitude
    if dist > 14 then
        local from = pos + Vector3.new(0, 2, 5)
        hrp.CFrame = CFrame.lookAt(from, Vector3.new(pos.X, from.Y, pos.Z))
    end
    return true
end

tabRock:AddTextBox("Filtro do nome da rocha (padrão: rock)", function(text)
    text = tostring(text):gsub("^%s+", ""):gsub("%s+$", "")
    if text == "" then setStatus("Digite uma palavra do nome da rocha.") return end
    ROCK_KEYWORD = text
    rockTarget = nil
    task.spawn(function()
        scanRocks()
        local r = pickNearestRock()
        setStatus(r and ("Rocha mais perto: " .. r.Name .. " (" .. #rockList .. " achadas)") or ("Nenhuma rocha batível com '" .. text .. "'."))
    end)
end)

local affordSwitch = tabRock:AddSwitch("Ignorar rochas fortes demais", function(b)
    ONLY_AFFORDABLE = b
    needCache = {}
end)
pcall(function() affordSwitch:Set(true) end)

tabRock:AddButton("Achar rocha mais perto", function()
    task.spawn(function()
        scanRocks()
        local r = pickNearestRock()
        setStatus(r and ("Rocha mais perto: %s (%d achadas)"):format(r.Name, #rockList) or "Nenhuma rocha batível achada.")
    end)
end)

tabRock:AddButton("Teleportar pra rocha mais perto", function()
    task.spawn(function()
        scanRocks()
        local r = pickNearestRock()
        setStatus((r and teleportToRock()) and ("Teleportado: " .. r.Name) or "Nenhuma rocha batível achada.")
    end)
end)

tabRock:AddSwitch("Auto Punch Rock (sempre a mais perto)", function(b)
    state.rock = b
    if b then
        task.spawn(function()
            scanRocks()
            local r = pickNearestRock()
            setStatus(r and ("Auto Punch Rock: " .. r.Name .. " (" .. #rockList .. " achadas)") or "Nenhuma rocha batível achada.")
        end)
    end
end)
addStatus(tabRock)

-- ===== ABA JOGADOR =====
tabJogador:AddSwitch("Loop Position (trava posição e pose)", function(b)
    if b then
        if not capturePose() then setStatus("Personagem não encontrado.") return end
        state.loop = true
        applyPose(lp.Character)
    else
        state.loop = false
        releasePose()
    end
end)

local defaultSpeed = 16
tabJogador:AddSwitch("Loop Speed " .. SPEED_VALUE, function(b)
    state.speed = b
    local hum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
    if b then
        if hum and hum.WalkSpeed ~= SPEED_VALUE then defaultSpeed = hum.WalkSpeed end
    elseif hum then
        hum.WalkSpeed = defaultSpeed
    end
end)
tabJogador:AddSwitch("Anti AFK", function(b) state.afk = b end)
tabJogador:AddSwitch("Anti Kick", function(b) state.kick = b end)
addStatus(tabJogador)

-- ===== ABA GRAVAR =====
local function namesOf(list)
    local names = {}
    for _, r in ipairs(list) do
        local ok, n = pcall(function() return r.remote.Name end)
        if ok then table.insert(names, n) end
    end
    return #names > 0 and table.concat(names, ", ") or "nenhum"
end
local function updateStatus()
    setStatus(("Hook: %s | Treino: %s | Rebirth: %s"):format(hookMethod, namesOf(recordedTrain), namesOf(recordedRebirth)))
end

local function startRecording(target, msg)
    if recTarget then return end
    recBuffer, recSeen, recTarget = {}, {}, target
    local startCalls = hookCalls
    setStatus(msg)
    task.spawn(function()
        while recTarget == target do
            setStatus(("%s | Capturado: %d | chamadas: %d"):format(msg, #recBuffer, hookCalls - startCalls))
            task.wait(0.4)
        end
    end)
    task.delay(REC_SECONDS, function()
        if target == "train" then recordedTrain = recBuffer else recordedRebirth = recBuffer end
        local got = #recBuffer
        recTarget, recBuffer = nil, nil
        if got > 0 then
            updateStatus()
        elseif hookMethod == "nenhum" then
            setStatus("Seu executor não aceitou nenhum hook. Use só Treinar Tudo (estação/toque).")
        elseif hookCalls - startCalls == 0 then
            setStatus("Hook ativo (" .. hookMethod .. ") mas 0 chamadas: o treino pode usar toque/ProximityPrompt.")
        else
            setStatus("Houve chamadas, mas só de remotes ignorados. Me mande o nome dos remotes.")
        end
    end)
end

tabGravar:AddButton("Gravar treino (" .. REC_SECONDS .. "s)", function()
    startRecording("train", "Treine manualmente agora (barra, supino...)")
end)
tabGravar:AddButton("Gravar rebirth (" .. REC_SECONDS .. "s)", function()
    startRecording("rebirth", "Abra RENASCIMENTO, escolha MÁXIMO e confirme.")
end)
addStatus(tabGravar)

-- ===== Hook: grava remotes + anti kick (3 métodos) =====
local function isNoise(name)
    local n = string.lower(name)
    for _, w in ipairs(NOISE) do
        if string.find(n, w, 1, true) then return true end
    end
    return false
end

local nameCache = {}
local function classify(name)
    local v = nameCache[name]
    if v ~= nil then return v end
    local n = string.lower(name)
    for key, list in pairs(KEYWORDS) do
        for _, k in ipairs(list) do
            if string.find(n, k, 1, true) then nameCache[name] = key return key end
        end
    end
    nameCache[name] = false
    return false
end

local function handle(self, method, ...)
    if replaying then return end
    if method ~= "FireServer" and method ~= "InvokeServer" then return end
    hookCalls += 1
    local ok, name = pcall(function() return self.Name end)
    if not ok or type(name) ~= "string" then return end
    if recTarget and recBuffer and not recSeen[self] and not isNoise(name) and #recBuffer < 12 then
        recSeen[self] = true
        table.insert(recBuffer, {remote = self, args = {...}})
    end
    local key = classify(name)
    if key then captured[key] = {remote = self, args = {...}} end
end

local function installHooks()
    if hookmetamethod and getnamecallmethod then
        local ok = pcall(function()
            local old
            old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if state.kick and self == lp and string.lower(method) == "kick" then return end
                handle(self, method, ...)
                if setnamecallmethod then setnamecallmethod(method) end
                return old(self, ...)
            end))
        end)
        if ok then return "hookmetamethod" end
    end
    if hookfunction then
        local ok = pcall(function()
            local re = Instance.new("RemoteEvent")
            local rf = Instance.new("RemoteFunction")
            local oldFS, oldIS
            oldFS = hookfunction(re.FireServer, newcclosure(function(self, ...)
                handle(self, "FireServer", ...)
                return oldFS(self, ...)
            end))
            oldIS = hookfunction(rf.InvokeServer, newcclosure(function(self, ...)
                handle(self, "InvokeServer", ...)
                return oldIS(self, ...)
            end))
        end)
        if ok then return "hookfunction" end
    end
    if getrawmetatable and getnamecallmethod then
        local ok = pcall(function()
            local mt = getrawmetatable(game)
            local old = mt.__namecall
            if setreadonly then setreadonly(mt, false) end
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if state.kick and self == lp and string.lower(method) == "kick" then return end
                handle(self, method, ...)
                if setnamecallmethod then setnamecallmethod(method) end
                return old(self, ...)
            end)
            if setreadonly then setreadonly(mt, true) end
        end)
        if ok then return "getrawmetatable" end
    end
    return "nenhum"
end

hookMethod = installHooks()
setStatus("Hook: " .. hookMethod .. (hookMethod == "nenhum" and " (gravação indisponível)" or " (OK)"))

-- ===== Helpers =====
local function fire(remote, args)
    pcall(function()
        if remote:IsA("RemoteEvent") then remote:FireServer(unpack(args))
        else remote:InvokeServer(unpack(args)) end
    end)
end

local fallback, lastSearch = {}, {}
local function findRemote(key)
    local f = fallback[key]
    if f and f.Parent then return f end
    if lastSearch[key] and os.clock() - lastSearch[key] < 5 then return nil end
    lastSearch[key] = os.clock()
    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            if classify(v.Name) == key then fallback[key] = v return v end
        end
    end
end

local function replay(key, times)
    local c = captured[key]
    local remote, args = nil, {}
    if c and c.remote.Parent then remote, args = c.remote, c.args
    else remote = findRemote(key) end
    if not remote then return false end
    replaying = true
    for _ = 1, times do fire(remote, args) end
    replaying = false
    return true
end

local function replayList(list)
    if #list == 0 then return false end
    local fired = false
    replaying = true
    for _, r in ipairs(list) do
        if r.remote.Parent then fire(r.remote, r.args) fired = true end
    end
    replaying = false
    return fired
end

local toolCache = {}
local function getTool(key)
    local t = toolCache[key]
    if t and t.Parent and (t.Parent == lp.Character or t.Parent == lp:FindFirstChild("Backpack")) then return t end
    for _, c in ipairs({lp.Character, lp:FindFirstChild("Backpack")}) do
        if c then
            for _, x in ipairs(c:GetChildren()) do
                if x:IsA("Tool") then
                    local n = x.Name:lower()
                    for _, k in ipairs(TOOL_WORDS[key]) do
                        if n:find(k, 1, true) then toolCache[key] = x return x end
                    end
                end
            end
        end
    end
end

local function equip(key)
    local char = lp.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local t = getTool(key)
    if hum and t and t.Parent ~= char then pcall(function() hum:EquipTool(t) end) end
    if t and t.Parent == char then pcall(function() t:Activate() end) end
end

local function clickRebirthUI()
    local pg = lp:FindFirstChild("PlayerGui")
    if not pg then return end
    for _, v in ipairs(pg:GetDescendants()) do
        if (v:IsA("TextButton") or v:IsA("ImageButton")) and v.Visible then
            local txt = (v.Name .. " " .. (v:IsA("TextButton") and v.Text or "")):lower()
            if txt:find("rebirth", 1, true) or txt:find("renasc", 1, true) then
                pcall(function()
                    for _, c in ipairs(getconnections(v.MouseButton1Click)) do c:Fire() end
                    for _, c in ipairs(getconnections(v.Activated)) do c:Fire() end
                end)
            end
        end
    end
end

-- ===== Loop principal =====
local acc = {punch = 0, weight = 0, pushup = 0, all = 0, rock = 0, rebirth = 0}
local equipKeys, equipIdx, equipTimer = {}, 1, 0
local lastWarn = 0

local function takeShots(key, dt)
    local iv = RATE[key]
    if iv <= 0 then acc[key] = 0 return BURST_CAP end
    acc[key] += dt
    local s = math.floor(acc[key] / iv)
    if s <= 0 then return 0 end
    if s > BURST_CAP then
        s = BURST_CAP
        acc[key] = 0
    else
        acc[key] -= s * iv
    end
    return s
end

local function warn(text)
    if os.clock() - lastWarn > 4 then
        lastWarn = os.clock()
        setStatus(text)
    end
end

RunService.Heartbeat:Connect(function(dt)
    equipTimer += dt
    if equipTimer >= 0.4 then
        equipTimer = 0
        equipKeys = {}
        for _, k in ipairs(ACTIONS) do if state[k] then table.insert(equipKeys, k) end end
        if #equipKeys > 0 then equipIdx = (equipIdx % #equipKeys) + 1 end
    end

    for _, k in ipairs(ACTIONS) do
        if state[k] then
            local shots = takeShots(k, dt)
            if shots > 0 then
                if equipKeys[equipIdx] == k then equip(k) end
                replay(k, shots)
            end
        end
    end

    if state.rock then
        local shots = takeShots("rock", dt)
        if shots > 0 then
            equip("punch")
            replay("punch", shots)
        end
    end

    if state.all then
        local shots = takeShots("all", dt)
        if shots > 0 then
            local char = lp.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if tool then pcall(function() tool:Activate() end) end
            for _ = 1, shots do
                replayList(recordedTrain)
                for _, k in ipairs(ACTIONS) do
                    if captured[k] then replay(k, 1) end
                end
            end
        end
    end

    -- Rebirth: "target" para ao chegar no alvo, "max" não para
    local rbMode = state.rebirthTarget and "target" or (state.rebirth and "max" or nil)
    if rbMode then
        local stop, hold = false, false
        if rbMode == "target" then
            if REBIRTH_TARGET == math.huge then
                hold = true
                warn("Auto Rebirth Target: digite um número no Rebirth alvo.")
            else
                local cur = getRebirths()
                if not cur then
                    hold = true
                    warn("Auto Rebirth Target: não achei o contador de rebirths do jogo.")
                elseif cur >= REBIRTH_TARGET then
                    stop = true
                    state.rebirthTarget = false
                    pcall(function() rebirthTargetSwitch:Set(false) end)
                    setStatus(("Rebirth alvo atingido: %s (alvo %s)"):format(fmt(cur), fmt(REBIRTH_TARGET)))
                end
            end
        end

        if not stop and not hold then
            local shots = takeShots("rebirth", dt)
            if shots > 0 then
                local fired = false
                for _ = 1, shots do
                    if replayList(recordedRebirth) then fired = true else break end
                end
                if not fired then
                    for _ = 1, shots do
                        if replay("rebirth", 1) then fired = true else break end
                    end
                end
                if not fired then clickRebirthUI() end
            end
        end
    end

    local char = lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")

    if state.speed and hum and hrp and not state.loop then
        local current = hum.WalkSpeed
        if current ~= SPEED_VALUE then
            hum.WalkSpeed = SPEED_VALUE
            if hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + hum.MoveDirection * (SPEED_VALUE - current) * dt
            end
        end
    end

    if state.loop and lockCF and hrp then
        hrp.CFrame = lockCF
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        local animator = hum and hum:FindFirstChildOfClass("Animator")
        if animator and #myTracks > 0 then
            local mine = {}
            for _, tr in ipairs(myTracks) do mine[tr] = true end
            for _, tr in ipairs(animator:GetPlayingAnimationTracks()) do
                if not mine[tr] then pcall(function() tr:Stop(0) end) end
            end
        end
    end
end)

lp.CharacterAdded:Connect(function(char)
    if state.loop and lockCF then
        task.wait(0.2)
        applyPose(char)
    end
end)

-- ===== Loop da rocha: re-escaneia, escolhe a mais perto, teleporta e toca =====
task.spawn(function()
    local lastName = nil
    while task.wait(0.2) do
        if state.rock and not state.loop then
            if os.clock() - rockLastScan > ROCK_RESCAN or #rockList == 0 then
                scanRocks()
            end
            local r = pickNearestRock()
            if r then
                if r.Name ~= lastName then
                    lastName = r.Name
                    setStatus("Rocha atual: " .. r.Name)
                end
                teleportToRock()
                local char = lp.Character
                local rp = rockPartOf(r)
                if char and rp and firetouchinterest then
                    for _, hn in ipairs({"RightHand", "LeftHand", "Right Arm", "Left Arm"}) do
                        local hand = char:FindFirstChild(hn)
                        if hand then
                            pcall(function()
                                firetouchinterest(hand, rp, 0)
                                firetouchinterest(hand, rp, 1)
                            end)
                        end
                    end
                end
            end
        end
    end
end)

-- Toque na tela (tap-to-train)
task.spawn(function()
    while task.wait(TAP_INTERVAL) do
        if state.all and TAP_ENABLED then
            local cam = workspace.CurrentCamera
            if cam then
                local v = cam.ViewportSize
                pcall(function() VirtualUser:ClickButton1(Vector2.new(v.X * 0.5, v.Y * 0.6), cam.CFrame) end)
            end
        end
    end
end)

-- ===== Estação mais próxima =====
local stations = {}
local function addStation(v)
    if v:IsA("ProximityPrompt") or v:IsA("ClickDetector") then stations[v] = true end
end
task.spawn(function()
    local n = 0
    for _, v in ipairs(workspace:GetDescendants()) do
        n += 1
        if n % 1500 == 0 then task.wait() end
        addStation(v)
    end
end)
workspace.DescendantAdded:Connect(addStation)
workspace.DescendantRemoving:Connect(function(v) stations[v] = nil end)

local function stationPos(s)
    local par = s.Parent
    if not par then return nil end
    if par:IsA("BasePart") then return par.Position end
    if par:IsA("Attachment") then return par.WorldPosition end
    if par:IsA("Model") then return par:GetPivot().Position end
end
local function stationText(s)
    local par = s.Parent
    local gp = par and par.Parent
    local t = (par and par.Name or "") .. " " .. (gp and gp.Name or "")
    if s:IsA("ProximityPrompt") then t = s.ActionText .. " " .. s.ObjectText .. " " .. t end
    return t:lower()
end
local function hasWord(txt, list)
    for _, w in ipairs(list) do if txt:find(w, 1, true) then return true end end
    return false
end
local function nearestStation(hrp)
    local best, bd
    for s in pairs(stations) do
        if s.Parent and (not s:IsA("ProximityPrompt") or s.Enabled) then
            local pos = stationPos(s)
            if pos then
                local txt = stationText(s)
                if not hasWord(txt, BLACKLIST) and hasWord(txt, STATION_WORDS) then
                    local d = (pos - hrp.Position).Magnitude
                    if not bd or d < bd then best, bd = s, d end
                end
            end
        end
    end
    return best, bd
end

task.spawn(function()
    while task.wait(3) do
        if state.all and not state.loop and not state.rock then
            local char = lp.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hrp and hum and not hum.Sit and #recordedTrain == 0 then
                local s, dist = nearestStation(hrp)
                if s then
                    local pos = stationPos(s)
                    local reach = s:IsA("ProximityPrompt") and math.max((s.MaxActivationDistance or 10) - 3, 3) or 8
                    if dist > reach and dist < 300 then
                        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 3))
                        task.wait(0.25)
                    end
                    if s:IsA("ProximityPrompt") then
                        pcall(function() s.HoldDuration = 0 end)
                        pcall(function() fireproximityprompt(s) end)
                    else
                        pcall(function() fireclickdetector(s) end)
                    end
                end
            end
        end
    end
end)

-- ===== Anti AFK =====
lp.Idled:Connect(function()
    if state.afk then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

-- ===== Mostrar a janela e personalizar =====
tabTreino:Show()
library:FormatWindows()
task.spawn(customizeUI)
]==]},
{"Toxic Hub", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ToxicHubV2/Toxic-Hub-Renewed/refs/heads/main/Main.lua"))()'},
{"Vehicle V2", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Vehicle-Script-V2-88610"))()'},
{"Vehicle Fly", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-fe-vehicle-fly-v3-32801"))()'},
{"TIGER X", 'loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Tiger-x-34229"))()'},
{"TIGER X V4", 'loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Tiger-hub-x-v4-42180"))()'},
{"EXECUTOR HUB", 'loadstring(game:HttpGet("https://pastebin.com/raw/kiYNE0sp"))()'},
{"Rochips", 'loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Rochips-emote-animation-panel-remake-33810"))()'},
{"FLY GUI V3", 'loadstring(game:HttpGet("https://luau.pro/storage/FLY-GUI.lua"))()'},
{"STEAL AN EGG", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/lennonxscripts/lennonfarmv2/refs/heads/main/stealanegg"))()'},
{"99 Nights", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWExtra/main/NightsInTheForest.lua", true))()'},
{"CALCULADORA DE REBIRTH", [==[
-- Calculadora Glitch Rebirth
local TITULO = "Glitch Rebirth"
local NIVEL_MAX = 20
local MAX_CARTOES = 20

-- xp = XP por nivel (pra subir do nivel L precisa de xp * L) | bonus = stats por nivel
local PETS = {
    { nome = "ÚNICO", xp = 1250, bonus = 5 },
    { nome = "ÉPICO", xp = 1000, bonus = 4 },
    { nome = "RARO", xp = 750, bonus = 3 },
    { nome = "AVANÇADO", xp = 500, bonus = 2 },
    { nome = "COMUM", xp = 250, bonus = 1 },
}
local petAtual = 1

-- XP por soco = (rebirths + 20) * valor
local ROCHAS = {
    { nome = "MUSCLE KING ROCK", curto = "KING ROCK", botao = "KING", valor = 12.5 },
    { nome = "LEGENDS ROCK", curto = "LEGENDS ROCK", botao = "LEGENDS", valor = 2.5 },
}
local rochaAtual = 1

local hudLigado = false
local ultimaLista = {}

local Players = game:GetService("Players")

local function fmt(n)
    local s = tostring(math.floor(n))
    local r = s:reverse():gsub("(%d%d%d)", "%1.")
    r = r:reverse()
    if r:sub(1, 1) == "." then r = r:sub(2) end
    return r
end

-- posicao do pet em XP acumulado desde o nivel 1 com 0 XP
local function posicao(xpn, L, x)
    return xpn * (L - 1) * L / 2 + x
end

local function calcular(rebirth, pet, r)
    local lista = {}
    local pedra = (rebirth + 20) * r.valor
    if pedra == math.floor(pedra) then
        for L = 1, NIVEL_MAX - 1 do
            local soma = 0
            for M = L + 1, NIVEL_MAX do
                soma = soma + (M - 1)
                local xp = pet.xp * soma - pedra
                if xp >= 0 and xp < pet.xp * L then
                    table.insert(lista, {
                        rocha = r, nivel = L, xp = xp, destino = M,
                        pedra = pedra, xpn = pet.xp,
                        bonus = (M - L) * pet.bonus,
                    })
                end
                if xp >= pet.xp * L then break end
            end
        end
    end
    table.sort(lista, function(a, b)
        if a.bonus ~= b.bonus then return a.bonus > b.bonus end
        return a.nivel < b.nivel
    end)
    return lista
end

local function proximos(rebirth, pet, r)
    local lista = {}
    for n = 1, NIVEL_MAX - 1 do
        local T = n * (n + 1) / 2
        local rb = pet.xp * T / r.valor - 20
        if rb > rebirth and rb == math.floor(rb) then
            table.insert(lista, {
                rocha = r, nivel = 1, xp = 0, destino = n + 1,
                pedra = pet.xp * T, xpn = pet.xp,
                bonus = n * pet.bonus, rebirth = rb,
            })
        end
    end
    table.sort(lista, function(a, b) return a.rebirth < b.rebirth end)
    return lista
end

local function novo(classe, props, pai)
    local o = Instance.new(classe)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = pai
    return o
end

local function destino()
    local ok, p = pcall(function() return gethui() end)
    if ok and p then return p end
    ok, p = pcall(function() return game:GetService("CoreGui") end)
    if ok and p then return p end
    return Players.LocalPlayer:WaitForChild("PlayerGui")
end

local function numero(c)
    return tonumber((c.Text:gsub("[^%d]", "")))
end

local alvo = destino()
local antigo = alvo:FindFirstChild("GlitchRebirthCalc")
if antigo then antigo:Destroy() end

local gui = novo("ScreenGui", { Name = "GlitchRebirthCalc", ResetOnSpawn = false }, nil)
local okp = pcall(function() gui.Parent = alvo end)
if not okp then gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end

local main = novo("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0.5, 0, 0.8, 0),
    BackgroundColor3 = Color3.fromRGB(8, 8, 8),
    BorderSizePixel = 0,
    Active = true,
    Draggable = true,
}, gui)
novo("UICorner", { CornerRadius = UDim.new(0, 10) }, main)
novo("UIStroke", { Color = Color3.fromRGB(45, 45, 60), Thickness = 1 }, main)

-- barra de cima
novo("TextLabel", {
    Text = TITULO, Font = Enum.Font.Gotham, TextSize = 15,
    TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left,
    TextTruncate = Enum.TextTruncate.AtEnd,
    BackgroundTransparency = 1, Position = UDim2.new(0, 14, 0, 0),
    Size = UDim2.new(0.26, 0, 0, 40),
}, main)

local botaoRocha = novo("TextButton", {
    Text = "ROCHA: " .. ROCHAS[rochaAtual].botao, Font = Enum.Font.GothamBold, TextSize = 12,
    TextColor3 = Color3.new(1, 1, 1), BackgroundColor3 = Color3.fromRGB(147, 51, 234),
    BorderSizePixel = 0, Position = UDim2.new(0.29, 0, 0, 5), Size = UDim2.new(0.3, 0, 0, 30),
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 6) }, botaoRocha)

local botaoHud = novo("TextButton", {
    Text = "HUD: OFF", Font = Enum.Font.GothamBold, TextSize = 12,
    TextColor3 = Color3.new(1, 1, 1), BackgroundColor3 = Color3.fromRGB(55, 55, 65),
    BorderSizePixel = 0, Position = UDim2.new(0.61, 0, 0, 5), Size = UDim2.new(0.25, 0, 0, 30),
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 6) }, botaoHud)

local fechar = novo("TextButton", {
    Text = "X", Font = Enum.Font.GothamBold, TextSize = 18,
    TextColor3 = Color3.fromRGB(239, 68, 68),
    BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderSizePixel = 0,
    Position = UDim2.new(1, -46, 0, 5), Size = UDim2.new(0, 38, 0, 30),
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 6) }, fechar)

-- linha 1: rebirths + calcular
local caixa = novo("TextBox", {
    Text = "", PlaceholderText = "DIGITE SEUS REBIRTHS (EX: 60300)", ClearTextOnFocus = false,
    Font = Enum.Font.Gotham, TextSize = 15, TextColor3 = Color3.new(1, 1, 1),
    PlaceholderColor3 = Color3.fromRGB(90, 90, 90),
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundColor3 = Color3.fromRGB(16, 16, 16), BorderSizePixel = 0,
    Position = UDim2.new(0, 16, 0, 46), Size = UDim2.new(1, -170, 0, 38),
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 6) }, caixa)
novo("UIPadding", { PaddingLeft = UDim.new(0, 10) }, caixa)

local botao = novo("TextButton", {
    Text = "CALCULAR", Font = Enum.Font.Gotham, TextSize = 15,
    TextColor3 = Color3.new(0, 0, 0), BackgroundColor3 = Color3.new(1, 1, 1),
    BorderSizePixel = 0, Position = UDim2.new(1, -146, 0, 46),
    Size = UDim2.new(0, 130, 0, 38),
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 6) }, botao)

-- linha 2: objetivo (nivel, xp) e pet
local function campo(placeholder, pos, tam, pai, tamTexto)
    local c = novo("TextBox", {
        Text = "", PlaceholderText = placeholder, ClearTextOnFocus = false,
        Font = Enum.Font.Gotham, TextSize = tamTexto or 12, TextColor3 = Color3.new(1, 1, 1),
        PlaceholderColor3 = Color3.fromRGB(90, 90, 90),
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundColor3 = Color3.fromRGB(16, 16, 16), BorderSizePixel = 0,
        Position = pos, Size = tam,
    }, pai)
    novo("UICorner", { CornerRadius = UDim.new(0, 6) }, c)
    novo("UIPadding", { PaddingLeft = UDim.new(0, 8) }, c)
    return c
end

local caixaLvl = campo("LVL OBJETIVO", UDim2.new(0, 16, 0, 92), UDim2.new(0.24, 0, 0, 30), main)
local caixaXp = campo("XP OBJETIVO", UDim2.new(0.24, 24, 0, 92), UDim2.new(0.26, 0, 0, 30), main)

local botaoPet = novo("TextButton", {
    Text = "PET: " .. PETS[petAtual].nome, Font = Enum.Font.GothamBold, TextSize = 13,
    TextColor3 = Color3.new(1, 1, 1), BackgroundColor3 = Color3.fromRGB(37, 99, 235),
    BorderSizePixel = 0, Position = UDim2.new(0.5, 32, 0, 92),
    Size = UDim2.new(0.5, -48, 0, 30),
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 6) }, botaoPet)

local status = novo("TextLabel", {
    Text = "COLOQUE UM VALOR PARA CALCULAR", Font = Enum.Font.Code, TextSize = 13,
    TextColor3 = Color3.fromRGB(180, 180, 180), TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1, Position = UDim2.new(0, 16, 0, 126),
    Size = UDim2.new(1, -32, 0, 22),
}, main)

local scroll = novo("ScrollingFrame", {
    BackgroundColor3 = Color3.fromRGB(5, 5, 5), BorderSizePixel = 0,
    Position = UDim2.new(0, 16, 0, 152), Size = UDim2.new(1, -32, 1, -166),
    CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollBarThickness = 4,
}, main)
novo("UICorner", { CornerRadius = UDim.new(0, 8) }, scroll)
novo("UIListLayout", { Padding = UDim.new(0, 6) }, scroll)
novo("UIPadding", {
    PaddingTop = UDim.new(0, 6), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 10),
}, scroll)

-- HUD na tela
local hud = novo("Frame", {
    Position = UDim2.new(0, 20, 0.18, 0), Size = UDim2.new(0, 260, 0, 152),
    BackgroundColor3 = Color3.fromRGB(8, 8, 8), BackgroundTransparency = 0.1,
    BorderSizePixel = 0, Active = true, Draggable = true, Visible = false,
}, gui)
novo("UICorner", { CornerRadius = UDim.new(0, 8) }, hud)
novo("UIStroke", { Color = Color3.fromRGB(34, 197, 94), Thickness = 1.5 }, hud)

local function linhaHud(y, h, tam, cor, fonte)
    return novo("TextLabel", {
        Text = "", Font = fonte, TextSize = tam, TextColor3 = cor,
        TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, y), Size = UDim2.new(1, -20, 0, h),
    }, hud)
end

local hudTitulo = linhaHud(4, 18, 11, Color3.fromRGB(150, 150, 150), Enum.Font.GothamBold)
hudTitulo.Text = "OBJETIVO DO PET"
hudTitulo.Size = UDim2.new(1, -70, 0, 18)
local hudL1 = linhaHud(24, 20, 14, Color3.fromRGB(74, 222, 128), Enum.Font.GothamBold)
local hudL2 = linhaHud(46, 18, 12, Color3.new(1, 1, 1), Enum.Font.Gotham)
local hudL3 = linhaHud(66, 18, 12, Color3.fromRGB(150, 150, 150), Enum.Font.Gotham)
local hudL4 = linhaHud(88, 22, 15, Color3.fromRGB(150, 150, 150), Enum.Font.GothamBold)

local agoraLvl = campo("LVL AGORA", UDim2.new(0, 10, 0, 118), UDim2.new(0, 105, 0, 26), hud, 12)
local agoraXp = campo("XP AGORA", UDim2.new(0, 125, 0, 118), UDim2.new(0, 125, 0, 26), hud, 12)

local botaoCalc = novo("TextButton", {
    Text = "CALC", Font = Enum.Font.GothamBold, TextSize = 11,
    TextColor3 = Color3.new(1, 1, 1), BackgroundColor3 = Color3.fromRGB(37, 99, 235),
    BorderSizePixel = 0, Position = UDim2.new(1, -56, 0, 4), Size = UDim2.new(0, 48, 0, 20),
}, hud)
novo("UICorner", { CornerRadius = UDim.new(0, 5) }, botaoCalc)

local function atualizarHud()
    hud.Visible = hudLigado
    if not hudLigado then return end
    local pet = PETS[petAtual]
    local rocha = ROCHAS[rochaAtual]
    local cinza = Color3.fromRGB(150, 150, 150)
    local verde = Color3.fromRGB(74, 222, 128)
    local amarelo = Color3.fromRGB(250, 204, 21)
    local vermelho = Color3.fromRGB(239, 68, 68)

    hudL3.Text = ""
    hudL4.Text = ""

    local lvl = numero(caixaLvl)
    if not lvl or lvl < 1 or lvl >= NIVEL_MAX then
        hudL1.Text = "SEM OBJETIVO"
        hudL2.Text = "DIGITE LVL E XP OBJETIVO"
        return
    end
    local x = numero(caixaXp) or 0
    if x >= pet.xp * lvl then
        hudL1.Text = "XP INVALIDO PARA O LVL " .. lvl
        hudL2.Text = "MAXIMO: " .. fmt(pet.xp * lvl - 1)
        return
    end

    hudL1.Text = "LVL " .. lvl .. " | XP " .. fmt(x) .. "/" .. fmt(pet.xp * lvl)
    local n = numero(caixa)
    if n then
        hudL2.Text = rocha.curto .. " | PEDRA " .. fmt((n + 20) * rocha.valor) .. " XP"
    else
        hudL2.Text = rocha.curto
    end

    for _, d in ipairs(ultimaLista) do
        if d.nivel == lvl and d.xp == x and d.rocha == rocha then
            hudL3.Text = "SALTO " .. d.nivel .. " > " .. d.destino .. " | +" .. d.bonus
            break
        end
    end
    if hudL3.Text == "" and n and #ultimaLista > 0 then
        hudL3.Text = "PONTO NAO BUGA NESSE REBIRTH"
    end

    -- quanto falta
    local la = numero(agoraLvl)
    if not la or la < 1 or la >= NIVEL_MAX then
        hudL4.Text = "DIGITE SEU LVL E XP ATUAL"
        hudL4.TextColor3 = cinza
        return
    end
    local xa = numero(agoraXp) or 0
    if xa >= pet.xp * la then
        hudL4.Text = "XP ATUAL INVALIDO"
        hudL4.TextColor3 = vermelho
        return
    end
    local falta = posicao(pet.xp, lvl, x) - posicao(pet.xp, la, xa)
    if falta > 0 then
        hudL4.Text = "FALTA: " .. fmt(falta) .. " XP"
        hudL4.TextColor3 = amarelo
    elseif falta == 0 then
        hudL4.Text = "PRONTO"
        hudL4.TextColor3 = verde
    else
        hudL4.Text = "JA PASSOU"
        hudL4.TextColor3 = vermelho
    end
end

local function cartao(i, d)
    local melhor = (i == 1 and d.rebirth == nil)
    local verde = Color3.fromRGB(74, 222, 128)
    local f = novo("Frame", {
        Size = UDim2.new(1, 0, 0, 96),
        BackgroundColor3 = melhor and Color3.fromRGB(10, 28, 16) or Color3.fromRGB(12, 12, 12),
        BorderSizePixel = 0,
    }, scroll)
    novo("UICorner", { CornerRadius = UDim.new(0, 8) }, f)
    novo("UIStroke", {
        Color = melhor and Color3.fromRGB(34, 197, 94) or Color3.fromRGB(40, 40, 40),
        Thickness = melhor and 2 or 1,
    }, f)

    local selo = novo("TextLabel", {
        Text = melhor and "MELHOR" or ("#" .. i), Font = Enum.Font.GothamBold, TextSize = 12,
        TextColor3 = Color3.new(1, 1, 1),
        BackgroundColor3 = melhor and Color3.fromRGB(34, 197, 94) or Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0, Position = UDim2.new(0, 10, 0, 8), Size = UDim2.new(0, 80, 0, 26),
    }, f)
    novo("UICorner", { CornerRadius = UDim.new(0, 5) }, selo)

    novo("TextLabel", {
        Text = d.rocha.nome, Font = Enum.Font.GothamBold, TextSize = 14,
        TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        BackgroundTransparency = 1, Position = UDim2.new(0, 100, 0, 8), Size = UDim2.new(1, -210, 0, 26),
    }, f)

    if not d.rebirth then
        local b = novo("TextButton", {
            Text = "OBJETIVO", Font = Enum.Font.GothamBold, TextSize = 11,
            TextColor3 = Color3.new(1, 1, 1), BackgroundColor3 = Color3.fromRGB(22, 101, 52),
            BorderSizePixel = 0, Position = UDim2.new(1, -102, 0, 8), Size = UDim2.new(0, 92, 0, 26),
        }, f)
        novo("UICorner", { CornerRadius = UDim.new(0, 5) }, b)
        b.MouseButton1Click:Connect(function()
            caixaLvl.Text = tostring(d.nivel)
            caixaXp.Text = tostring(d.xp)
            atualizarHud()
        end)
    end

    novo("TextLabel", {
        Text = "+" .. d.bonus .. " | LVL " .. d.nivel .. " | XP " .. fmt(d.xp) .. "/"
            .. fmt(d.xpn * d.nivel) .. " | PEDRA DA " .. fmt(d.pedra) .. " XP",
        Font = Enum.Font.GothamBold, TextSize = 13,
        TextColor3 = melhor and verde or Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true,
        BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 40), Size = UDim2.new(1, -20, 0, 20),
    }, f)

    local linha = "SALTO: NIVEL " .. d.nivel .. " PARA NIVEL " .. d.destino
    if d.rebirth then
        linha = "NO REBIRTH " .. fmt(d.rebirth) .. " | " .. linha
    end
    novo("TextLabel", {
        Text = linha,
        Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = Color3.fromRGB(150, 150, 150),
        TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true,
        BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 62), Size = UDim2.new(1, -20, 0, 30),
    }, f)
end

local function renderizar()
    for _, c in ipairs(scroll:GetChildren()) do
        if c:IsA("Frame") then c:Destroy() end
    end
    ultimaLista = {}
    local n = numero(caixa)
    if not n then
        status.Text = "DIGITE UM NUMERO VALIDO"
        status.TextColor3 = Color3.fromRGB(239, 68, 68)
        return
    end
    local pet = PETS[petAtual]
    local rocha = ROCHAS[rochaAtual]

    local lista = calcular(n, pet, rocha)
    ultimaLista = lista
    if #lista == 0 then
        status.Text = fmt(n) .. " REBIRTHS | SEM BUG NA " .. rocha.curto .. ". PROXIMOS:"
        status.TextColor3 = Color3.fromRGB(250, 204, 21)
        local prox = proximos(n, pet, rocha)
        for i = 1, math.min(#prox, 8) do
            cartao(i, prox[i])
        end
        return
    end
    local melhor = lista[1]
    status.Text = fmt(n) .. " REBIRTHS | MELHOR: +" .. melhor.bonus .. " NA " .. rocha.curto
    status.TextColor3 = Color3.fromRGB(74, 222, 128)
    for i = 1, math.min(#lista, MAX_CARTOES) do
        cartao(i, lista[i])
    end
end

local function atualizar()
    renderizar()
    atualizarHud()
end

botao.MouseButton1Click:Connect(atualizar)

botaoPet.MouseButton1Click:Connect(function()
    petAtual = petAtual % #PETS + 1
    botaoPet.Text = "PET: " .. PETS[petAtual].nome
    if numero(caixa) then atualizar() else atualizarHud() end
end)

botaoRocha.MouseButton1Click:Connect(function()
    rochaAtual = rochaAtual % #ROCHAS + 1
    botaoRocha.Text = "ROCHA: " .. ROCHAS[rochaAtual].botao
    if numero(caixa) then atualizar() else atualizarHud() end
end)

botaoHud.MouseButton1Click:Connect(function()
    hudLigado = not hudLigado
    botaoHud.Text = "HUD: " .. (hudLigado and "ON" or "OFF")
    botaoHud.BackgroundColor3 = hudLigado and Color3.fromRGB(22, 163, 74) or Color3.fromRGB(55, 55, 65)
    atualizarHud()
end)

-- atualiza o HUD na hora enquanto digita
for _, c in ipairs({ caixaLvl, caixaXp, agoraLvl, agoraXp }) do
    c:GetPropertyChangedSignal("Text"):Connect(atualizarHud)
end

fechar.MouseButton1Click:Connect(function()
    if hudLigado then
        main.Visible = false
    else
        gui:Destroy()
    end
end)

botaoCalc.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)
]==]},
{"Jumpscare", 'loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-SUS-194040"))()'},
{"Backrooms", 'loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-backrooms-127679"))()'},
{"Muscle Legends Script 1", 'loadstring(game:HttpGet("https://pastefy.app/mKvqkQo3/raw"))()'},
{"Muscle Legends Script 2", 'loadstring(game:HttpGet("https://pastefy.app/Su68oPz1/raw"))()'},
{"Jet Script", [==[
-- ============================================================
-- JET + MIRA + VELOCIDADE — funciona SENTADO e EM PÉ
-- ============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local enabled = false
local jetSpeed = 100
local lastToggle = 0

local alignOrient, attach, bodyVel = nil, nil, nil
local unanchoredParts = {}

-- ============================================================
-- MIRA VERMELHA
-- ============================================================
local gui = Instance.new("ScreenGui")
gui.Name = "JetGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.Parent = LP:WaitForChild("PlayerGui")

local crosshair = Instance.new("Frame")
crosshair.Size = UDim2.new(0, 60, 0, 60)
crosshair.Position = UDim2.new(0.5, -30, 0.5, -30)
crosshair.BackgroundTransparency = 1
crosshair.Active = false
crosshair.Visible = false
crosshair.Parent = gui

local hLine = Instance.new("Frame")
hLine.Size = UDim2.new(1, 0, 0, 2)
hLine.Position = UDim2.new(0, 0, 0.5, -1)
hLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
hLine.BorderSizePixel = 0
hLine.Parent = crosshair

local vLine = Instance.new("Frame")
vLine.Size = UDim2.new(0, 2, 1, 0)
vLine.Position = UDim2.new(0.5, -1, 0, 0)
vLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
vLine.BorderSizePixel = 0
vLine.Parent = crosshair

local dot = Instance.new("Frame")
dot.Size = UDim2.new(0, 4, 0, 4)
dot.Position = UDim2.new(0.5, -2, 0.5, -2)
dot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
dot.BorderSizePixel = 0
dot.Parent = crosshair

local dc = Instance.new("UICorner")
dc.CornerRadius = UDim.new(1, 0)
dc.Parent = dot

-- ============================================================
-- UI ARRASTÁVEL
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 210, 0, 130)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 8)
fc.Parent = frame

local handle = Instance.new("TextButton")
handle.Size = UDim2.new(1, 0, 0, 22)
handle.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
handle.BorderSizePixel = 0
handle.Text = " ⋮⋮ arrastar"
handle.TextColor3 = Color3.fromRGB(180, 180, 200)
handle.Font = Enum.Font.Gotham
handle.TextSize = 12
handle.TextXAlignment = Enum.TextXAlignment.Left
handle.AutoButtonColor = false
handle.Parent = frame

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 8)
hc.Parent = handle

local dragging, dragStart, startPos
handle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch
    or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -20, 0, 45)
btn.Position = UDim2.new(0, 10, 0, 28)
btn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
btn.Text = "LIGAR JET"
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 16
btn.Parent = frame

local bc = Instance.new("UICorner")
bc.CornerRadius = UDim.new(0, 6)
bc.Parent = btn

local lbl = Instance.new("TextLabel")
lbl.Size = UDim2.new(0.4, 0, 0, 35)
lbl.Position = UDim2.new(0, 10, 0, 82)
lbl.BackgroundTransparency = 1
lbl.Text = "Velocidade:"
lbl.TextColor3 = Color3.new(1, 1, 1)
lbl.TextXAlignment = Enum.TextXAlignment.Left
lbl.Font = Enum.Font.Gotham
lbl.TextSize = 13
lbl.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0.55, -15, 0, 35)
speedBox.Position = UDim2.new(0.45, 0, 0, 82)
speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.Text = tostring(jetSpeed)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 13
speedBox.ClearTextOnFocus = false
speedBox.Parent = frame

local sc = Instance.new("UICorner")
sc.CornerRadius = UDim.new(0, 4)
sc.Parent = speedBox

speedBox.FocusLost:Connect(function()
    local num = tonumber(speedBox.Text)
    if num and num > 0 then jetSpeed = num end
    speedBox.Text = tostring(jetSpeed)
end)

-- ============================================================
-- HELPERS
-- ============================================================
local function unanchorVehicle(model)
    for _, p in ipairs(model:GetDescendants()) do
        if p:IsA("BasePart") and p.Anchored then
            table.insert(unanchoredParts, p)
            p.Anchored = false
        end
    end
end

local function cleanup()
    if alignOrient then alignOrient:Destroy() alignOrient = nil end
    if attach then attach:Destroy() attach = nil end
    if bodyVel then bodyVel:Destroy() bodyVel = nil end
    crosshair.Visible = false
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.AutoRotate = true end
    end
end

local function updateUI()
    if enabled then
        btn.Text = "DESLIGAR JET"
        btn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
        crosshair.Visible = true
    else
        btn.Text = "LIGAR JET"
        btn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        crosshair.Visible = false
    end
end

local function toggle()
    local now = tick()
    if now - lastToggle < 0.2 then return end
    lastToggle = now
    enabled = not enabled
    updateUI()
    if not enabled then cleanup() end
end

btn.Activated:Connect(toggle)
btn.MouseButton1Click:Connect(toggle)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.J then toggle() end
end)

-- ============================================================
-- LOOP
-- ============================================================
RunService.RenderStepped:Connect(function()
    if not enabled then return end

    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    local cam = Workspace.CurrentCamera
    if not cam then return end

    hum.AutoRotate = false

    local seat = hum.SeatPart
    local targetPart

    if seat and (seat:IsA("VehicleSeat") or seat:IsA("Seat")) then
        -- ===== SENTADO: controla o ASSENTO (o veículo inteiro junto) =====
        targetPart = seat

        -- Desancora o veículo se estiver ancorado
        if seat.Anchored then seat.Anchored = false end
        local model = seat:FindFirstAncestorOfClass("Model")
        if model and #unanchoredParts == 0 then
            unanchorVehicle(model)
        end
    else
        -- ===== EM PÉ: controla o HumanoidRootPart =====
        targetPart = hrp
    end

    -- Recria AlignOrientation se o alvo mudou (sentou/levantou)
    if not alignOrient or alignOrient.Parent ~= targetPart then
        if alignOrient then alignOrient:Destroy() end
        if attach then attach:Destroy() end

        attach = Instance.new("Attachment")
        attach.Parent = targetPart

        alignOrient = Instance.new("AlignOrientation")
        alignOrient.Mode = Enum.OrientationAlignmentMode.OneAttachment
        alignOrient.Attachment0 = attach
        alignOrient.MaxTorque = 1e9
        alignOrient.Responsiveness = 200
        alignOrient.RigidityEnabled = true
        alignOrient.Parent = targetPart
    end

    -- Personagem/veículo olha pro centro da câmera (yaw + pitch)
    local camRot = cam.CFrame - cam.CFrame.Position
    alignOrient.CFrame = CFrame.new(targetPart.Position) * camRot

    -- BodyVelocity no alvo certo: voa SEMPRE pra frente
    if not bodyVel or bodyVel.Parent ~= targetPart then
        if bodyVel then bodyVel:Destroy() end
        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVel.Parent = targetPart
    end
    bodyVel.Velocity = cam.CFrame.LookVector * jetSpeed
end)
]==]},
{"Muscle Legends King Hub", 'loadstring(game:HttpGet("https://leghhh-kinghub.onrender.com/"))()'},
}
for _, e in ipairs(EXTRA2) do
	newButton(pages[2], e[1], function() runCode(e[2]) end)
end


-- ================= ABA 3 (codigos embutidos) =================
local TAB3 = {
{"ESP Picker", [==[
--[[ ═══════════════════════════════════════════════
     ESP PICKER — Botão ⚙️ Arrastável (sem fundo)
═══════════════════════════════════════════════ ]]

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local Workspace   = game:GetService("Workspace")
local UIS         = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ═══════ CONFIG ═══════
local CONFIG = {
    ScanRadius      = 500,
    MaxDistance     = 5000,
    LabelHz         = 10,
    UIHz            = 5,
    RescanInterval  = 30,
    TextSize        = 12,
    HighlightFill   = Color3.fromRGB(255, 0, 0),
    HighlightOutline= Color3.fromRGB(255, 90, 90),
    TextColor       = Color3.fromRGB(255, 70, 70),
    Blacklist = { "baseplate","terrain","camera","workspace","lighting" },
}

local ESPEnabled    = false
local SelectedNames = {}
local selectedESP   = {}
local modelCache    = {}
local rootCache     = {}
local uiRows        = {}

-- ═══════ HELPERS ═══════
local function containsAny(str, list)
    local low = str:lower()
    for i = 1, #list do
        if low:find(list[i]:lower(), 1, true) then return true end
    end
    return false
end

local function getRoot(model)
    local r = rootCache[model]
    if r and r.Parent then return r end
    r = model:FindFirstChild("HumanoidRootPart")
        or model.PrimaryPart
        or model:FindFirstChildWhichIsA("BasePart")
    rootCache[model] = r
    return r
end

local function isPlayerModel(obj)
    if Players:GetPlayerFromCharacter(obj) then return true end
    if obj.Name == LocalPlayer.Name and obj:FindFirstChildOfClass("Humanoid") then
        return true
    end
    return false
end

-- ═══════ CACHE ═══════
local function cacheAdd(obj)
    if not obj:IsA("Model") then return end
    if isPlayerModel(obj) then return end
    if containsAny(obj.Name, CONFIG.Blacklist) then return end
    modelCache[obj] = true
end

local function cacheRemove(obj)
    modelCache[obj] = nil
    rootCache[obj] = nil
    local d = selectedESP[obj]
    if d then
        if d.hl then d.hl:Destroy() end
        if d.bb then d.bb:Destroy() end
        selectedESP[obj] = nil
    end
end

task.spawn(function()
    for _, d in ipairs(Workspace:GetDescendants()) do cacheAdd(d) end
end)

Workspace.DescendantAdded:Connect(cacheAdd)
Workspace.DescendantRemoving:Connect(cacheRemove)

task.spawn(function()
    while true do
        task.wait(CONFIG.RescanInterval)
        for _, d in ipairs(Workspace:GetDescendants()) do
            if d:IsA("Model") and not modelCache[d] then cacheAdd(d) end
        end
    end
end)

-- ═══════ ESP ═══════
local function createESP(model)
    if selectedESP[model] then return end
    local root = getRoot(model)
    if not root then return end

    local hl = Instance.new("Highlight")
    hl.FillColor = CONFIG.HighlightFill
    hl.OutlineColor = CONFIG.HighlightOutline
    hl.FillTransparency = 0.55
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Adornee = model
    hl.Parent = model

    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 160, 0, 30)
    bb.StudsOffset = Vector3.new(0, 2, 0)
    bb.AlwaysOnTop = true
    bb.MaxDistance = CONFIG.MaxDistance

    local tl = Instance.new("TextLabel")
    tl.BackgroundTransparency = 1
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.Font = Enum.Font.GothamBold
    tl.TextSize = CONFIG.TextSize
    tl.TextColor3 = CONFIG.TextColor
    tl.TextStrokeTransparency = 0
    tl.TextStrokeColor3 = Color3.new(0,0,0)
    tl.Text = model.Name
    tl.Parent = bb
    bb.Parent = model

    selectedESP[model] = { hl = hl, bb = bb, text = tl, root = root }
end

local function destroyESP(model)
    local d = selectedESP[model]
    if not d then return end
    if d.hl then d.hl:Destroy() end
    if d.bb then d.bb:Destroy() end
    selectedESP[model] = nil
end

local function rebuildSelectedESP()
    for model in pairs(selectedESP) do
        if not model.Parent or not SelectedNames[model.Name] then
            destroyESP(model)
        end
    end
    for model in pairs(modelCache) do
        if model.Parent and SelectedNames[model.Name] and not selectedESP[model] then
            createESP(model)
        end
    end
end

-- ═══════ RENDER 3D ═══════
local labelAcc = 0
RunService.Heartbeat:Connect(function(dt)
    if not ESPEnabled then return end
    labelAcc = labelAcc + dt
    if labelAcc < 1 / CONFIG.LabelHz then return end
    labelAcc = 0

    local char = LocalPlayer.Character
    local myRoot = char and char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local myPos = myRoot.Position

    for model, data in pairs(selectedESP) do
        local root = data.root
        if not root or not root.Parent then
            root = getRoot(model)
            data.root = root
        end
        if root then
            local dx = root.Position.X - myPos.X
            local dy = root.Position.Y - myPos.Y
            local dz = root.Position.Z - myPos.Z
            local d  = math.sqrt(dx*dx + dy*dy + dz*dz)
            local vis = d <= CONFIG.MaxDistance
            if data.hl.Enabled ~= vis then data.hl.Enabled = vis end
            if data.bb.Enabled ~= vis then data.bb.Enabled = vis end
            if vis then
                local txt = model.Name .. " [" .. math.floor(d) .. "m]"
                if data.text.Text ~= txt then data.text.Text = txt end
            end
        end
    end
end)

-- ═══════ UI ═══════
local old = PlayerGui:FindFirstChild("ESP_PickerUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "ESP_PickerUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

-- ⚙️ BOTÃO — só ícone, sem fundo
local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 60)
mainBtn.BackgroundTransparency = 1
mainBtn.BackgroundColor3 = Color3.new(0,0,0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = "⚙️"
mainBtn.TextSize = 28
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
mainBtn.AutoButtonColor = false
mainBtn.ZIndex = 10
mainBtn.Parent = screen

local stroke = Instance.new("UIStroke", mainBtn)
stroke.Color = Color3.fromRGB(0,0,0)
stroke.Thickness = 1.5
stroke.Transparency = 0.4
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- painel
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 210, 0, 300)
panel.Position = UDim2.new(0.5, -105, 0.5, -150)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(255, 80, 80)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "≡  arraste"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(180, 180, 190)
title.Font = Enum.Font.GothamBold
title.TextSize = 11
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local search = Instance.new("TextBox")
search.Size = UDim2.new(1, -16, 0, 20)
search.Position = UDim2.new(0, 8, 0, 26)
search.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
search.BorderSizePixel = 0
search.Text = ""
search.PlaceholderText = ""
search.TextColor3 = Color3.new(1,1,1)
search.Font = Enum.Font.Gotham
search.TextSize = 11
search.ClearTextOnFocus = false
search.Parent = panel
Instance.new("UICorner", search).CornerRadius = UDim.new(0, 6)
local spad = Instance.new("UIPadding", search)
spad.PaddingLeft = UDim.new(0, 6)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -110)
scroll.Position = UDim2.new(0, 6, 0, 50)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 80, 80)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local actBtn = Instance.new("TextButton")
actBtn.Size = UDim2.new(1, -12, 0, 28)
actBtn.Position = UDim2.new(0, 6, 1, -34)
actBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
actBtn.TextColor3 = Color3.new(1,1,1)
actBtn.Font = Enum.Font.GothamBold
actBtn.TextSize = 12
actBtn.Text = "ATIVAR"
actBtn.AutoButtonColor = false
actBtn.BorderSizePixel = 0
actBtn.Parent = panel
Instance.new("UICorner", actBtn).CornerRadius = UDim.new(0, 8)

-- ═══════ LISTA ═══════
local function buildNearbyList()
    local char = LocalPlayer.Character
    local myRoot = char and char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return {} end
    local myPos = myRoot.Position
    local r2max = CONFIG.ScanRadius * CONFIG.ScanRadius

    local grouped = {}
    for model in pairs(modelCache) do
        if model.Parent then
            local root = getRoot(model)
            if root then
                local dx = root.Position.X - myPos.X
                local dy = root.Position.Y - myPos.Y
                local dz = root.Position.Z - myPos.Z
                local d2 = dx*dx + dy*dy + dz*dz
                if d2 <= r2max then
                    local n = model.Name
                    local g = grouped[n]
                    if not g then
                        grouped[n] = { d2 = d2, count = 1 }
                    else
                        g.count = g.count + 1
                        if d2 < g.d2 then g.d2 = d2 end
                    end
                end
            end
        end
    end

    local arr = {}
    for name, g in pairs(grouped) do
        arr[#arr+1] = { name = name, dist = math.sqrt(g.d2), count = g.count }
    end
    table.sort(arr, function(a,b) return a.dist < b.dist end)
    return arr
end

local function updateUI()
    local arr = buildNearbyList()
    local filter = search.Text:lower()

    local shown = {}
    local shownSet = {}
    for _, item in ipairs(arr) do
        if filter == "" or item.name:lower():find(filter, 1, true) then
            shown[#shown+1] = item
            shownSet[item.name] = true
        end
    end

    for name, btn in pairs(uiRows) do
        if not shownSet[name] then
            btn:Destroy()
            uiRows[name] = nil
        end
    end

    for i, item in ipairs(shown) do
        local btn = uiRows[item.name]
        if not btn then
            btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 26)
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 11
            btn.TextColor3 = Color3.new(1,1,1)
            btn.AutoButtonColor = false
            btn.BorderSizePixel = 0
            btn.BackgroundColor3 = SelectedNames[item.name]
                and Color3.fromRGB(50, 160, 70)
                or  Color3.fromRGB(42, 42, 52)
            btn.Parent = scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            local np = Instance.new("UIPadding", btn)
            np.PaddingLeft = UDim.new(0, 6)

            local capturedName = item.name
            btn.MouseButton1Click:Connect(function()
                if SelectedNames[capturedName] then
                    SelectedNames[capturedName] = nil
                else
                    SelectedNames[capturedName] = true
                end
                btn.BackgroundColor3 = SelectedNames[capturedName]
                    and Color3.fromRGB(50, 160, 70)
                    or  Color3.fromRGB(42, 42, 52)
                if ESPEnabled then rebuildSelectedESP() end
            end)

            uiRows[item.name] = btn
        end

        btn.LayoutOrder = i
        local txt = " " .. item.name .. "  (" .. item.count .. ")  -  "
                    .. math.floor(item.dist) .. "m"
        if btn.Text ~= txt then btn.Text = txt end
    end

    local empty = scroll:FindFirstChild("EmptyHint")
    if #shown == 0 and not empty then
        local lbl = Instance.new("TextLabel")
        lbl.Name = "EmptyHint"
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = "nada por perto"
        lbl.Parent = scroll
    elseif #shown > 0 and empty then
        empty:Destroy()
    end
end

search:GetPropertyChangedSignal("Text"):Connect(updateUI)

local uiAcc = 0
RunService.Heartbeat:Connect(function(dt)
    if not panel.Visible then return end
    uiAcc = uiAcc + dt
    if uiAcc < 1 / CONFIG.UIHz then return end
    uiAcc = 0
    updateUI()
end)

-- ═══════ ATIVAR / DESATIVAR ═══════
actBtn.MouseButton1Click:Connect(function()
    if ESPEnabled then
        ESPEnabled = false
        for m in pairs(selectedESP) do destroyESP(m) end
        actBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        actBtn.Text = "ATIVAR"
        return
    end
    local has = false
    for _ in pairs(SelectedNames) do has = true; break end
    if not has then
        actBtn.Text = "⚠ selecione"
        actBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.wait(1.2)
        actBtn.Text = "ATIVAR"
        actBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        return
    end
    ESPEnabled = true
    rebuildSelectedESP()
    actBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
    actBtn.Text = "DESATIVAR"
end)

-- ═══════ X = REMOVE TUDO ═══════
closeBtn.MouseButton1Click:Connect(function()
    for m in pairs(selectedESP) do destroyESP(m) end
    screen:Destroy()
    print("[ESP Picker] UI removida")
end)

-- ═══════ DRAG DO PAINEL ═══════
local draggingPanel, dragStartP, startPosP
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingPanel = true
        dragStartP = input.Position
        startPosP = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not draggingPanel then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - dragStartP
        panel.Position = UDim2.new(
            startPosP.X.Scale, startPosP.X.Offset + d.X,
            startPosP.Y.Scale, startPosP.Y.Offset + d.Y)
    end
end)

-- ═══════ DRAG DO ⚙️ + TOQUE PRA ABRIR ═══════
local btnDragging  = false
local btnDragStart = nil
local btnStartPos  = nil
local btnMoved     = false

mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging  = true
        btnMoved     = false
        btnDragStart = input.Position
        btnStartPos  = mainBtn.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then
            btnMoved = true
        end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then
                uiAcc = 1
                updateUI()
            end
        end
        btnDragging = false
        draggingPanel = false
    end
end)

print("[ESP Picker] ✅ ⚙️ carregado — arraste ou toque")
]==]},

{"Speed Loop", [==[
--[[ SPEED LOOP — toggle por linha ]]

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS         = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local DEF_SPEED = 16

local speeds      = {}
local toggles     = {}
local applied     = nil
local uiRows      = {}
local searchText  = ""
local hookedHum   = nil

local function recalc()
    local last = nil
    for _, v in ipairs(speeds) do
        if toggles[v] then last = v end
    end
    applied = last
end

local function hookHum(hum)
    if hookedHum == hum then return end
    hookedHum = hum
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if applied and hum.WalkSpeed ~= applied then
            hum.WalkSpeed = applied
        end
    end)
end

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if hum ~= hookedHum then hookHum(hum) end
    local target = applied or DEF_SPEED
    if hum.WalkSpeed ~= target then hum.WalkSpeed = target end
end)

local function has(v)
    for i = 1, #speeds do if speeds[i] == v then return true end end
    return false
end
local function add(v)
    v = tonumber(v)
    if not v or v ~= v or v <= 0 then return false end
    v = math.floor(v)
    if has(v) then return false end
    speeds[#speeds + 1] = v
    table.sort(speeds)
    toggles[v] = false
    return true
end
local function remove(v)
    for i = 1, #speeds do
        if speeds[i] == v then
            table.remove(speeds, i)
            toggles[v] = nil
            recalc()
            return
        end
    end
end

local old = PlayerGui:FindFirstChild("SpeedLoopUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "SpeedLoopUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 60)
mainBtn.BackgroundTransparency = 1
mainBtn.BackgroundColor3 = Color3.new(0,0,0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = "⚡"
mainBtn.TextSize = 28
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextColor3 = Color3.fromRGB(255, 220, 50)
mainBtn.AutoButtonColor = false
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 220, 0, 320)
panel.Position = UDim2.new(0.5, -110, 0.5, -160)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(255, 220, 50)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "⚡  velocidades"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 0, 20)
searchBox.Position = UDim2.new(0, 8, 0, 28)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
searchBox.BorderSizePixel = 0
searchBox.Text = ""
searchBox.PlaceholderText = "buscar"
searchBox.PlaceholderColor3 = Color3.fromRGB(120,120,130)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ClearTextOnFocus = false
searchBox.Parent = panel
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local sp1 = Instance.new("UIPadding", searchBox)
sp1.PaddingLeft = UDim.new(0, 6)

local addFrame = Instance.new("Frame")
addFrame.Size = UDim2.new(1, -16, 0, 24)
addFrame.Position = UDim2.new(0, 8, 0, 52)
addFrame.BackgroundTransparency = 1
addFrame.Parent = panel

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(1, -46, 1, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
speedInput.BorderSizePixel = 0
speedInput.Text = ""
speedInput.PlaceholderText = "speed"
speedInput.PlaceholderColor3 = Color3.fromRGB(120,120,130)
speedInput.TextColor3 = Color3.new(1,1,1)
speedInput.Font = Enum.Font.Gotham
speedInput.TextSize = 11
speedInput.ClearTextOnFocus = false
speedInput.Parent = addFrame
Instance.new("UICorner", speedInput).CornerRadius = UDim.new(0, 6)
local sp2 = Instance.new("UIPadding", speedInput)
sp2.PaddingLeft = UDim.new(0, 6)

local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 40, 1, 0)
addBtn.Position = UDim2.new(1, -40, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
addBtn.TextColor3 = Color3.new(1,1,1)
addBtn.Font = Enum.Font.GothamBold
addBtn.TextSize = 16
addBtn.Text = "+"
addBtn.AutoButtonColor = false
addBtn.BorderSizePixel = 0
addBtn.Parent = addFrame
Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 6)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -100)
scroll.Position = UDim2.new(0, 6, 0, 84)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 220, 50)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local function updateList()
    local filter = searchText:lower()
    local shown, shownSet = {}, {}
    for _, v in ipairs(speeds) do
        if filter == "" or tostring(v):find(filter, 1, true) then
            shown[#shown + 1] = v
            shownSet[v] = true
        end
    end

    for v, btn in pairs(uiRows) do
        if not shownSet[v] then btn:Destroy(); uiRows[v] = nil end
    end

    for i, v in ipairs(shown) do
        local btn = uiRows[v]
        if not btn then
            btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 12
            btn.AutoButtonColor = false
            btn.BorderSizePixel = 0
            btn.Parent = scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            local p = Instance.new("UIPadding", btn)
            p.PaddingLeft = UDim.new(0, 8)

            local del = Instance.new("TextButton")
            del.Size = UDim2.new(0, 24, 0, 24)
            del.Position = UDim2.new(1, -26, 0.5, -12)
            del.BackgroundTransparency = 1
            del.Text = "✕"
            del.TextColor3 = Color3.fromRGB(255, 120, 120)
            del.Font = Enum.Font.GothamBold
            del.TextSize = 12
            del.AutoButtonColor = false
            del.Parent = btn

            local cv = v
            btn.MouseButton1Click:Connect(function()
                toggles[cv] = not toggles[cv]
                recalc()
                updateList()
            end)
            del.MouseButton1Click:Connect(function()
                remove(cv)
                updateList()
            end)
            uiRows[v] = btn
        end

        btn.LayoutOrder = i
        btn.Text = "  Speed: " .. v
        if toggles[v] then
            btn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            btn.TextColor3 = Color3.new(1, 1, 1)
        else
            btn.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
    end

    local empty = scroll:FindFirstChild("EmptyHint")
    if #shown == 0 and not empty then
        local lbl = Instance.new("TextLabel")
        lbl.Name = "EmptyHint"
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = "adicione uma velocidade"
        lbl.Parent = scroll
    elseif #shown > 0 and empty then
        empty:Destroy()
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText = searchBox.Text
    updateList()
end)

local function doAdd()
    local v = tonumber(speedInput.Text)
    if v and add(v) then
        speedInput.Text = ""
        updateList()
    else
        addBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.delay(0.6, function() addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70) end)
    end
end
addBtn.MouseButton1Click:Connect(doAdd)
speedInput.FocusLost:Connect(function(e) if e then doAdd() end end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then updateList() end
        end
        btnDragging = false
    end
end)

local panelDragging, panelDragStart, panelStartPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = true
        panelDragStart = input.Position
        panelStartPos = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not panelDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - panelDragStart
        panel.Position = UDim2.new(
            panelStartPos.X.Scale, panelStartPos.X.Offset + d.X,
            panelStartPos.Y.Scale, panelStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    applied = nil
    screen:Destroy()
end)

updateList()
print("[SpeedLoop] ✅ carregado")
]==]},

{"Jump Loop", [==[
--[[ JUMP LOOP — toggle por linha ]]

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS         = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local DEF_JUMPP = 50
local DEF_JUMPH = 7.2

local jumps       = {}
local toggles     = {}
local applied     = nil
local uiRows      = {}
local searchText  = ""
local hookedHum   = nil

local function recalc()
    local last = nil
    for _, v in ipairs(jumps) do
        if toggles[v] then last = v end
    end
    applied = last
end

local function hookHum(hum)
    if hookedHum == hum then return end
    hookedHum = hum
    hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
        if applied and hum.JumpPower ~= applied then
            hum.JumpPower = applied
        end
    end)
    hum:GetPropertyChangedSignal("JumpHeight"):Connect(function()
        if applied and hum.JumpHeight ~= applied then
            hum.JumpHeight = applied
        end
    end)
end

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if hum ~= hookedHum then hookHum(hum) end

    if hum.UseJumpPower ~= false then
        local target = applied or DEF_JUMPP
        if hum.JumpPower ~= target then hum.JumpPower = target end
    else
        local target = applied or DEF_JUMPH
        if hum.JumpHeight ~= target then hum.JumpHeight = target end
    end
end)

local function has(v)
    for i = 1, #jumps do if jumps[i] == v then return true end end
    return false
end
local function add(v)
    v = tonumber(v)
    if not v or v ~= v or v <= 0 then return false end
    if has(v) then return false end
    jumps[#jumps + 1] = v
    table.sort(jumps)
    toggles[v] = false
    return true
end
local function remove(v)
    for i = 1, #jumps do
        if jumps[i] == v then
            table.remove(jumps, i)
            toggles[v] = nil
            recalc()
            return
        end
    end
end

local old = PlayerGui:FindFirstChild("JumpLoopUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "JumpLoopUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 110)
mainBtn.BackgroundTransparency = 1
mainBtn.BackgroundColor3 = Color3.new(0,0,0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = "🦘"
mainBtn.TextSize = 28
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextColor3 = Color3.fromRGB(120, 220, 255)
mainBtn.AutoButtonColor = false
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 220, 0, 320)
panel.Position = UDim2.new(0.5, -110, 0.5, -160)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(120, 220, 255)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "🦘  jumps"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 0, 20)
searchBox.Position = UDim2.new(0, 8, 0, 28)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
searchBox.BorderSizePixel = 0
searchBox.Text = ""
searchBox.PlaceholderText = "buscar"
searchBox.PlaceholderColor3 = Color3.fromRGB(120,120,130)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ClearTextOnFocus = false
searchBox.Parent = panel
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local sp1 = Instance.new("UIPadding", searchBox)
sp1.PaddingLeft = UDim.new(0, 6)

local addFrame = Instance.new("Frame")
addFrame.Size = UDim2.new(1, -16, 0, 24)
addFrame.Position = UDim2.new(0, 8, 0, 52)
addFrame.BackgroundTransparency = 1
addFrame.Parent = panel

local jumpInput = Instance.new("TextBox")
jumpInput.Size = UDim2.new(1, -46, 1, 0)
jumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
jumpInput.BorderSizePixel = 0
jumpInput.Text = ""
jumpInput.PlaceholderText = "jump"
jumpInput.PlaceholderColor3 = Color3.fromRGB(120,120,130)
jumpInput.TextColor3 = Color3.new(1,1,1)
jumpInput.Font = Enum.Font.Gotham
jumpInput.TextSize = 11
jumpInput.ClearTextOnFocus = false
jumpInput.Parent = addFrame
Instance.new("UICorner", jumpInput).CornerRadius = UDim.new(0, 6)
local sp2 = Instance.new("UIPadding", jumpInput)
sp2.PaddingLeft = UDim.new(0, 6)

local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 40, 1, 0)
addBtn.Position = UDim2.new(1, -40, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
addBtn.TextColor3 = Color3.new(1,1,1)
addBtn.Font = Enum.Font.GothamBold
addBtn.TextSize = 16
addBtn.Text = "+"
addBtn.AutoButtonColor = false
addBtn.BorderSizePixel = 0
addBtn.Parent = addFrame
Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 6)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -100)
scroll.Position = UDim2.new(0, 6, 0, 84)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(120, 220, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local function updateList()
    local filter = searchText:lower()
    local shown, shownSet = {}, {}
    for _, v in ipairs(jumps) do
        if filter == "" or tostring(v):find(filter, 1, true) then
            shown[#shown + 1] = v
            shownSet[v] = true
        end
    end

    for v, btn in pairs(uiRows) do
        if not shownSet[v] then btn:Destroy(); uiRows[v] = nil end
    end

    for i, v in ipairs(shown) do
        local btn = uiRows[v]
        if not btn then
            btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 12
            btn.AutoButtonColor = false
            btn.BorderSizePixel = 0
            btn.Parent = scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            local p = Instance.new("UIPadding", btn)
            p.PaddingLeft = UDim.new(0, 8)

            local del = Instance.new("TextButton")
            del.Size = UDim2.new(0, 24, 0, 24)
            del.Position = UDim2.new(1, -26, 0.5, -12)
            del.BackgroundTransparency = 1
            del.Text = "✕"
            del.TextColor3 = Color3.fromRGB(255, 120, 120)
            del.Font = Enum.Font.GothamBold
            del.TextSize = 12
            del.AutoButtonColor = false
            del.Parent = btn

            local cv = v
            btn.MouseButton1Click:Connect(function()
                toggles[cv] = not toggles[cv]
                recalc()
                updateList()
            end)
            del.MouseButton1Click:Connect(function()
                remove(cv)
                updateList()
            end)
            uiRows[v] = btn
        end

        btn.LayoutOrder = i
        btn.Text = "  Jump: " .. v
        if toggles[v] then
            btn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            btn.TextColor3 = Color3.new(1, 1, 1)
        else
            btn.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
    end

    local empty = scroll:FindFirstChild("EmptyHint")
    if #shown == 0 and not empty then
        local lbl = Instance.new("TextLabel")
        lbl.Name = "EmptyHint"
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = "adicione um jump"
        lbl.Parent = scroll
    elseif #shown > 0 and empty then
        empty:Destroy()
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText = searchBox.Text
    updateList()
end)

local function doAdd()
    local v = tonumber(jumpInput.Text)
    if v and add(v) then
        jumpInput.Text = ""
        updateList()
    else
        addBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.delay(0.6, function() addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70) end)
    end
end
addBtn.MouseButton1Click:Connect(doAdd)
jumpInput.FocusLost:Connect(function(e) if e then doAdd() end end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then updateList() end
        end
        btnDragging = false
    end
end)

local panelDragging, panelDragStart, panelStartPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = true
        panelDragStart = input.Position
        panelStartPos = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not panelDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - panelDragStart
        panel.Position = UDim2.new(
            panelStartPos.X.Scale, panelStartPos.X.Offset + d.X,
            panelStartPos.Y.Scale, panelStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    applied = nil
    screen:Destroy()
end)

updateList()
print("[JumpLoop] ✅ carregado")
]==]},

{"Script Searcher", [==[
--[[ SCRIPT SEARCHER 🔍 — ScriptBlox (com botão 💾) ]]

local Players     = game:GetService("Players")
local UIS         = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local API_SEARCH  = "https://scriptblox.com/api/script/search?q=%s&max=20"
local BROWSER_UA  = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
local SAVE_FOLDER = "ScriptSaver"
local INDEX_FILE  = SAVE_FOLDER .. "/_index.json"

local function ensureFolder()
    if isfolder and not isfolder(SAVE_FOLDER) then
        makefolder(SAVE_FOLDER)
    end
end

local function filePath(name)
    local safe = name:gsub("[^%w_%-%.]", "_")
    return SAVE_FOLDER .. "/" .. safe .. ".lua"
end

local function loadIndex()
    ensureFolder()
    if not (isfile and readfile) then return {} end
    if not isfile(INDEX_FILE) then return {} end
    local ok, data = pcall(readfile, INDEX_FILE)
    if not ok or not data or data == "" then return {} end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if not ok2 or type(decoded) ~= "table" then return {} end
    return decoded
end

local function saveIndex(idx)
    ensureFolder()
    if not writefile then return end
    local ok, encoded = pcall(function() return HttpService:JSONEncode(idx) end)
    if ok then writefile(INDEX_FILE, encoded) end
end

local results = {}

local old = PlayerGui:FindFirstChild("ScriptSearcherUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "ScriptSearcherUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 210)
mainBtn.BackgroundTransparency = 1
mainBtn.Text = "🔍"
mainBtn.TextSize = 26
mainBtn.Font = Enum.Font.GothamBold
mainBtn.AutoButtonColor = false
mainBtn.BorderSizePixel = 0
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 280, 0, 380)
panel.Position = UDim2.new(0.5, -140, 0.5, -190)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(90, 200, 255)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "🔍  scriptblox"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local searchFrame = Instance.new("Frame")
searchFrame.Size = UDim2.new(1, -16, 0, 26)
searchFrame.Position = UDim2.new(0, 8, 0, 30)
searchFrame.BackgroundTransparency = 1
searchFrame.Parent = panel

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -50, 1, 0)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
searchBox.BorderSizePixel = 0
searchBox.Text = ""
searchBox.PlaceholderText = "ex: blox fruits"
searchBox.PlaceholderColor3 = Color3.fromRGB(120,120,130)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ClearTextOnFocus = false
searchBox.Parent = searchFrame
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local sp = Instance.new("UIPadding", searchBox)
sp.PaddingLeft = UDim.new(0, 6)

local goBtn = Instance.new("TextButton")
goBtn.Size = UDim2.new(0, 44, 1, 0)
goBtn.Position = UDim2.new(1, -44, 0, 0)
goBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
goBtn.TextColor3 = Color3.new(1,1,1)
goBtn.Font = Enum.Font.GothamBold
goBtn.TextSize = 12
goBtn.Text = "🔍"
goBtn.AutoButtonColor = false
goBtn.BorderSizePixel = 0
goBtn.Parent = searchFrame
Instance.new("UICorner", goBtn).CornerRadius = UDim.new(0, 6)

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1, -16, 0, 14)
statusLbl.Position = UDim2.new(0, 8, 0, 62)
statusLbl.BackgroundTransparency = 1
statusLbl.TextXAlignment = Enum.TextXAlignment.Left
statusLbl.TextColor3 = Color3.fromRGB(160, 160, 175)
statusLbl.Font = Enum.Font.Gotham
statusLbl.TextSize = 10
statusLbl.Text = "digite e toque em 🔍"
statusLbl.Parent = panel

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -16, 1, -90)
scroll.Position = UDim2.new(0, 8, 0, 80)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(90, 200, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local toast = Instance.new("TextLabel")
toast.Size = UDim2.new(0, 240, 0, 34)
toast.Position = UDim2.new(0.5, -120, 0, 40)
toast.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
toast.TextColor3 = Color3.new(1,1,1)
toast.Font = Enum.Font.GothamBold
toast.TextSize = 11
toast.Text = ""
toast.TextWrapped = true
toast.Visible = false
toast.ZIndex = 50
toast.Parent = screen
Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 8)

local function showToast(msg, ok, dur)
    toast.Text = msg
    toast.BackgroundColor3 = ok and Color3.fromRGB(50, 170, 70)
        or Color3.fromRGB(200, 60, 60)
    toast.Visible = true
    task.delay(dur or 1.6, function() toast.Visible = false end)
end

local function httpGet(url)
    local ok, res = pcall(function() return game:HttpGet(url, true) end)
    if ok and res and res ~= "" and not res:find("403") and not res:find("blocked") then
        return res
    end
    local ok2, res2 = pcall(function() return game:HttpGet(url) end)
    if ok2 and res2 and res2 ~= "" then return res2 end
    if syn and syn.request then
        local ok3, r3 = pcall(function()
            return syn.request({Url = url, Method = "GET",
                Headers = {["User-Agent"] = BROWSER_UA}})
        end)
        if ok3 and r3 and r3.Body then return r3.Body end
    end
    if request then
        local ok4, r4 = pcall(function()
            return request({Url = url, Method = "GET",
                Headers = {["User-Agent"] = BROWSER_UA}})
        end)
        if ok4 and r4 and r4.Body then return r4.Body end
    end
    return nil
end

local function saveToSaver(scriptData)
    if not writefile then
        showToast("sem writefile", false)
        return false
    end

    local title = (scriptData.title or "script_unknown"):gsub("[^%w_%-%. ]", ""):gsub("%s+", "_")
    if title == "" then title = "script_" .. tostring(tick()):gsub("%.", "") end

    local sc = scriptData.script or ""
    local content
    if sc:match("^https?://") then
        content = 'loadstring(game:HttpGet("' .. sc .. '"))()'
    else
        content = sc
    end

    ensureFolder()
    local path = filePath(title)
    local idx = loadIndex()

    local exists = false
    for _, e in ipairs(idx) do
        if e.name == title then exists = true; e.file = path; break end
    end
    if not exists then
        table.insert(idx, { name = title, file = path })
    end

    local ok = pcall(writefile, path, content)
    if ok then
        saveIndex(idx)
        return true
    end
    return false
end

local function doSearch()
    local q = searchBox.Text:gsub("%s+", "")
    if q == "" then
        showToast("digite algo", false)
        return
    end

    statusLbl.Text = "buscando..."
    for _, c in ipairs(scroll:GetChildren()) do
        if c:IsA("TextButton") or c:IsA("TextLabel") or c:IsA("Frame") then
            c:Destroy()
        end
    end

    task.spawn(function()
        local url = string.format(API_SEARCH, HttpService:UrlEncode(q))
        local raw = httpGet(url)

        if not raw then
            statusLbl.Text = "❌ falha na conexão"
            showToast("executor bloqueou HTTP", false, 2.5)
            return
        end

        local ok2, data = pcall(function()
            return HttpService:JSONDecode(raw)
        end)

        if not ok2 or type(data) ~= "table" or not data.result then
            statusLbl.Text = "❌ resposta inválida"
            return
        end

        local scripts = data.result.scripts or {}
        results = scripts

        if #scripts == 0 then
            statusLbl.Text = "0 resultados"
            return
        end

        statusLbl.Text = #scripts .. " resultado(s)"

        for i, script in ipairs(scripts) do
            local row = Instance.new("Frame")
            row.Size = UDim2.new(1, 0, 0, 46)
            row.LayoutOrder = i
            row.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
            row.BorderSizePixel = 0
            row.Parent = scroll
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)

            local nameLbl = Instance.new("TextLabel")
            nameLbl.Size = UDim2.new(1, -100, 0, 20)
            nameLbl.Position = UDim2.new(0, 8, 0, 2)
            nameLbl.BackgroundTransparency = 1
            nameLbl.Text = script.title or "sem título"
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.TextColor3 = Color3.fromRGB(220, 220, 230)
            nameLbl.Font = Enum.Font.GothamBold
            nameLbl.TextSize = 11
            nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
            nameLbl.Parent = row

            local gameLbl = Instance.new("TextLabel")
            gameLbl.Size = UDim2.new(1, -100, 0, 18)
            gameLbl.Position = UDim2.new(0, 8, 0, 22)
            gameLbl.BackgroundTransparency = 1
            gameLbl.Text = script.game and script.game.name or "universal"
            gameLbl.TextXAlignment = Enum.TextXAlignment.Left
            gameLbl.TextColor3 = Color3.fromRGB(150, 150, 165)
            gameLbl.Font = Enum.Font.Gotham
            gameLbl.TextSize = 9
            gameLbl.TextTruncate = Enum.TextTruncate.AtEnd
            gameLbl.Parent = row

            local runBtn = Instance.new("TextButton")
            runBtn.Size = UDim2.new(0, 26, 0, 26)
            runBtn.Position = UDim2.new(1, -88, 0.5, -13)
            runBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            runBtn.Text = "▶"
            runBtn.TextColor3 = Color3.new(1,1,1)
            runBtn.Font = Enum.Font.GothamBold
            runBtn.TextSize = 12
            runBtn.AutoButtonColor = false
            runBtn.BorderSizePixel = 0
            runBtn.Parent = row
            Instance.new("UICorner", runBtn).CornerRadius = UDim.new(0, 4)

            local saveBtn = Instance.new("TextButton")
            saveBtn.Size = UDim2.new(0, 26, 0, 26)
            saveBtn.Position = UDim2.new(1, -60, 0.5, -13)
            saveBtn.BackgroundColor3 = Color3.fromRGB(80, 60, 160)
            saveBtn.Text = "💾"
            saveBtn.TextSize = 12
            saveBtn.AutoButtonColor = false
            saveBtn.BorderSizePixel = 0
            saveBtn.Parent = row
            Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0, 4)

            local copyBtn = Instance.new("TextButton")
            copyBtn.Size = UDim2.new(0, 26, 0, 26)
            copyBtn.Position = UDim2.new(1, -30, 0.5, -13)
            copyBtn.BackgroundColor3 = Color3.fromRGB(55, 65, 85)
            copyBtn.Text = "📋"
            copyBtn.TextSize = 12
            copyBtn.AutoButtonColor = false
            copyBtn.BorderSizePixel = 0
            copyBtn.Parent = row
            Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 4)

            local capturedScript = script

            runBtn.MouseButton1Click:Connect(function()
                local sc = capturedScript.script or ""
                if sc == "" then
                    showToast("script vazio", false)
                    return
                end

                runBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 100)
                showToast("executando...", true, 1)

                task.spawn(function()
                    if sc:match("^https?://") then
                        local code = httpGet(sc)
                        if not code then
                            runBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                            showToast("falha ao baixar", false, 2.5)
                            return
                        end
                        local fn, err = loadstring(code)
                        if not fn then
                            runBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                            showToast("erro: " .. tostring(err):sub(1, 40), false, 3)
                            return
                        end
                        local ok3, err3 = pcall(fn)
                        runBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                        if not ok3 then
                            showToast("runtime: " .. tostring(err3):sub(1, 40), false, 3)
                        else
                            showToast("executado!", true, 1)
                        end
                        return
                    end
                    local fn, err = loadstring(sc)
                    if not fn then
                        runBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                        showToast("erro: " .. tostring(err):sub(1, 40), false, 3)
                        return
                    end
                    local ok3, err3 = pcall(fn)
                    runBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                    if not ok3 then
                        showToast("runtime: " .. tostring(err3):sub(1, 40), false, 3)
                    else
                        showToast("executado!", true, 1)
                    end
                end)
            end)

            saveBtn.MouseButton1Click:Connect(function()
                local sc = capturedScript.script or ""
                if sc == "" then
                    showToast("script vazio", false)
                    return
                end

                if saveToSaver(capturedScript) then
                    showToast("salvo no saver!", true)
                    saveBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                    task.delay(0.8, function()
                        saveBtn.BackgroundColor3 = Color3.fromRGB(80, 60, 160)
                    end)
                else
                    showToast("falhou ao salvar", false)
                end
            end)

            copyBtn.MouseButton1Click:Connect(function()
                local sc = capturedScript.script or ""
                if sc == "" then
                    showToast("script vazio", false)
                    return
                end

                if not setclipboard then
                    showToast("sem clipboard", false)
                    return
                end

                local output
                if sc:match("^https?://") then
                    output = 'loadstring(game:HttpGet("' .. sc .. '"))()'
                else
                    output = sc
                end

                local ok = pcall(setclipboard, output)
                if ok then
                    showToast("copiado!", true)
                    copyBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                    task.delay(0.5, function()
                        copyBtn.BackgroundColor3 = Color3.fromRGB(55, 65, 85)
                    end)
                else
                    showToast("falhou", false)
                end
            end)
        end
    end)
end

goBtn.MouseButton1Click:Connect(doSearch)
searchBox.FocusLost:Connect(function(enter)
    if enter then doSearch() end
end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
        end
        btnDragging = false
    end
end)

local pd, pds, pps
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        pd = true; pds = input.Position; pps = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not pd then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - pds
        panel.Position = UDim2.new(
            pps.X.Scale, pps.X.Offset + d.X,
            pps.Y.Scale, pps.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        pd = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

print("[ScriptSearcher] ✅ 🔍 carregado")
]==]},

{"Script Saver", [==[
--[[ SCRIPT SAVER 💾 (auto-refresh + scroll) ]]

local Players     = game:GetService("Players")
local UIS         = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local SAVE_FOLDER = "ScriptSaver"
local INDEX_FILE  = SAVE_FOLDER .. "/_index.json"

local function ensureFolder()
    if isfolder and not isfolder(SAVE_FOLDER) then
        makefolder(SAVE_FOLDER)
    end
end

local function filePath(name)
    local safe = name:gsub("[^%w_%-%.]", "_")
    return SAVE_FOLDER .. "/" .. safe .. ".lua"
end

local function loadIndex()
    ensureFolder()
    if not (isfile and readfile) then return {} end
    if not isfile(INDEX_FILE) then return {} end
    local ok, data = pcall(readfile, INDEX_FILE)
    if not ok or not data or data == "" then return {} end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if not ok2 or type(decoded) ~= "table" then return {} end
    return decoded
end

local function saveIndex(idx)
    ensureFolder()
    if not writefile then return end
    local ok, encoded = pcall(function() return HttpService:JSONEncode(idx) end)
    if ok then writefile(INDEX_FILE, encoded) end
end

local function indexHash(idx)
    local s = ""
    for _, e in ipairs(idx) do
        s = s .. e.name .. "|"
    end
    return s
end

local index = loadIndex()
local lastHash = indexHash(index)

local old = PlayerGui:FindFirstChild("ScriptSaverUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "ScriptSaverUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 160)
mainBtn.BackgroundTransparency = 1
mainBtn.Text = "💾"
mainBtn.TextSize = 26
mainBtn.Font = Enum.Font.GothamBold
mainBtn.AutoButtonColor = false
mainBtn.BorderSizePixel = 0
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 260, 0, 400)
panel.Position = UDim2.new(0.5, -130, 0.5, -200)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(90, 200, 255)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "💾  script saver"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local outerScroll = Instance.new("ScrollingFrame")
outerScroll.Size = UDim2.new(1, 0, 1, -30)
outerScroll.Position = UDim2.new(0, 0, 0, 30)
outerScroll.BackgroundTransparency = 1
outerScroll.BorderSizePixel = 0
outerScroll.CanvasSize = UDim2.new(0, 0, 0, 470)
outerScroll.ScrollBarThickness = 8
outerScroll.ScrollBarImageColor3 = Color3.fromRGB(90, 200, 255)
outerScroll.ScrollBarImageTransparency = 0.2
outerScroll.ScrollingDirection = Enum.ScrollingDirection.Y
outerScroll.Parent = panel

local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(1, -16, 0, 14)
nameLabel.Position = UDim2.new(0, 8, 0, 4)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "nome"
nameLabel.TextXAlignment = Enum.TextXAlignment.Left
nameLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
nameLabel.Font = Enum.Font.Gotham
nameLabel.TextSize = 10
nameLabel.Parent = outerScroll

local nameInput = Instance.new("TextBox")
nameInput.Size = UDim2.new(1, -16, 0, 22)
nameInput.Position = UDim2.new(0, 8, 0, 20)
nameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
nameInput.BorderSizePixel = 0
nameInput.Text = ""
nameInput.PlaceholderText = "ex: speed"
nameInput.PlaceholderColor3 = Color3.fromRGB(120,120,130)
nameInput.TextColor3 = Color3.new(1,1,1)
nameInput.Font = Enum.Font.Gotham
nameInput.TextSize = 11
nameInput.ClearTextOnFocus = false
nameInput.Parent = outerScroll
Instance.new("UICorner", nameInput).CornerRadius = UDim.new(0, 6)
local np = Instance.new("UIPadding", nameInput)
np.PaddingLeft = UDim.new(0, 6)

local codeLabel = Instance.new("TextLabel")
codeLabel.Size = UDim2.new(1, -16, 0, 14)
codeLabel.Position = UDim2.new(0, 8, 0, 46)
codeLabel.BackgroundTransparency = 1
codeLabel.Text = "código"
codeLabel.TextXAlignment = Enum.TextXAlignment.Left
codeLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
codeLabel.Font = Enum.Font.Gotham
codeLabel.TextSize = 10
codeLabel.Parent = outerScroll

local codeInput = Instance.new("TextBox")
codeInput.Size = UDim2.new(1, -16, 0, 120)
codeInput.Position = UDim2.new(0, 8, 0, 62)
codeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
codeInput.BorderSizePixel = 0
codeInput.Text = ""
codeInput.PlaceholderText = "cole seu script aqui"
codeInput.PlaceholderColor3 = Color3.fromRGB(120,120,130)
codeInput.TextColor3 = Color3.new(1,1,1)
codeInput.Font = Enum.Font.Code
codeInput.TextSize = 11
codeInput.TextWrapped = true
codeInput.TextXAlignment = Enum.TextXAlignment.Left
codeInput.TextYAlignment = Enum.TextYAlignment.Top
codeInput.ClearTextOnFocus = false
codeInput.MultiLine = true
codeInput.Parent = outerScroll
Instance.new("UICorner", codeInput).CornerRadius = UDim.new(0, 6)
local cp = Instance.new("UIPadding", codeInput)
cp.PaddingLeft = UDim.new(0, 6)
cp.PaddingTop = UDim.new(0, 4)

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(1, -16, 0, 28)
saveBtn.Position = UDim2.new(0, 8, 0, 188)
saveBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
saveBtn.TextColor3 = Color3.new(1,1,1)
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 12
saveBtn.Text = "SALVAR"
saveBtn.AutoButtonColor = false
saveBtn.BorderSizePixel = 0
saveBtn.Parent = outerScroll
Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0, 6)

local listLabel = Instance.new("TextLabel")
listLabel.Size = UDim2.new(1, -16, 0, 14)
listLabel.Position = UDim2.new(0, 8, 0, 222)
listLabel.BackgroundTransparency = 1
listLabel.Text = "scripts salvos"
listLabel.TextXAlignment = Enum.TextXAlignment.Left
listLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
listLabel.Font = Enum.Font.Gotham
listLabel.TextSize = 10
listLabel.Parent = outerScroll

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -16, 0, 140)
scroll.Position = UDim2.new(0, 8, 0, 238)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(90, 200, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = outerScroll
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local renderList

renderList = function()
    for _, c in ipairs(scroll:GetChildren()) do
        if c:IsA("TextButton") or c:IsA("TextLabel") then c:Destroy() end
    end

    listLabel.Text = "scripts salvos (" .. #index .. ")"

    if #index == 0 then
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = "nenhum script salvo"
        lbl.Parent = scroll
        return
    end

    for i, entry in ipairs(index) do
        local row = Instance.new("TextButton")
        row.Size = UDim2.new(1, 0, 0, 30)
        row.LayoutOrder = i
        row.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
        row.TextColor3 = Color3.fromRGB(200, 200, 210)
        row.Font = Enum.Font.GothamBold
        row.TextSize = 12
        row.TextXAlignment = Enum.TextXAlignment.Left
        row.Text = "  " .. entry.name
        row.AutoButtonColor = false
        row.BorderSizePixel = 0
        row.Parent = scroll
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)
        local p = Instance.new("UIPadding", row)
        p.PaddingLeft = UDim.new(0, 8)

        local copyName = Instance.new("TextButton")
        copyName.Size = UDim2.new(0, 24, 0, 24)
        copyName.Position = UDim2.new(1, -80, 0.5, -12)
        copyName.BackgroundColor3 = Color3.fromRGB(55, 65, 85)
        copyName.Text = "📋"
        copyName.TextSize = 12
        copyName.AutoButtonColor = false
        copyName.BorderSizePixel = 0
        copyName.Parent = row
        Instance.new("UICorner", copyName).CornerRadius = UDim.new(0, 4)

        local copyCode = Instance.new("TextButton")
        copyCode.Size = UDim2.new(0, 24, 0, 24)
        copyCode.Position = UDim2.new(1, -52, 0.5, -12)
        copyCode.BackgroundColor3 = Color3.fromRGB(55, 85, 55)
        copyCode.Text = "📄"
        copyCode.TextSize = 12
        copyCode.AutoButtonColor = false
        copyCode.BorderSizePixel = 0
        copyCode.Parent = row
        Instance.new("UICorner", copyCode).CornerRadius = UDim.new(0, 4)

        local del = Instance.new("TextButton")
        del.Size = UDim2.new(0, 24, 0, 24)
        del.Position = UDim2.new(1, -26, 0.5, -12)
        del.BackgroundTransparency = 1
        del.Text = "✕"
        del.TextColor3 = Color3.fromRGB(255, 120, 120)
        del.Font = Enum.Font.GothamBold
        del.TextSize = 12
        del.AutoButtonColor = false
        del.Parent = row

        local capturedEntry = entry
        local capturedRow = row

        row.MouseButton1Click:Connect(function()
            if not readfile or not loadstring then
                capturedRow.Text = "  ⚠ sem loadstring"
                return
            end
            local ok, code = pcall(readfile, capturedEntry.file)
            if not ok or not code then
                capturedRow.Text = "  ⚠ arquivo sumiu"
                return
            end
            local fn, err = loadstring(code)
            if not fn then
                capturedRow.Text = "  ⚠ erro: " .. tostring(err):sub(1, 20)
                task.wait(2)
                capturedRow.Text = "  " .. capturedEntry.name
                return
            end
            capturedRow.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            task.spawn(function()
                local ok2 = pcall(fn)
                task.wait(0.8)
                capturedRow.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
                if not ok2 then
                    capturedRow.Text = "  ⚠ erro runtime"
                    task.wait(1.5)
                    capturedRow.Text = "  " .. capturedEntry.name
                end
            end)
        end)

        copyName.MouseButton1Click:Connect(function()
            if not setclipboard then
                capturedRow.Text = "  ⚠ sem clipboard"
                task.wait(1)
                capturedRow.Text = "  " .. capturedEntry.name
                return
            end
            pcall(setclipboard, capturedEntry.name)
            copyName.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            task.delay(0.5, function()
                copyName.BackgroundColor3 = Color3.fromRGB(55, 65, 85)
            end)
        end)

        copyCode.MouseButton1Click:Connect(function()
            if not readfile or not setclipboard then
                capturedRow.Text = "  ⚠ sem readfile/clipboard"
                task.wait(1)
                capturedRow.Text = "  " .. capturedEntry.name
                return
            end
            local ok, code = pcall(readfile, capturedEntry.file)
            if not ok or not code then
                capturedRow.Text = "  ⚠ arquivo vazio"
                task.wait(1)
                capturedRow.Text = "  " .. capturedEntry.name
                return
            end
            pcall(setclipboard, code)
            copyCode.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            task.delay(0.5, function()
                copyCode.BackgroundColor3 = Color3.fromRGB(55, 85, 55)
            end)
        end)

        del.MouseButton1Click:Connect(function()
            for j = 1, #index do
                if index[j] == capturedEntry then
                    table.remove(index, j)
                    break
                end
            end
            if delfile and isfile(capturedEntry.file) then
                pcall(delfile, capturedEntry.file)
            end
            saveIndex(index)
            lastHash = indexHash(index)
            renderList()
        end)
    end

    outerScroll.CanvasSize = UDim2.new(0, 0, 0, 240 + (#index * 33))
end

task.spawn(function()
    while true do
        task.wait(1)
        if panel.Visible then
            local currentIdx = loadIndex()
            local currentHash = indexHash(currentIdx)
            if currentHash ~= lastHash then
                index = currentIdx
                lastHash = currentHash
                renderList()
            end
        end
    end
end)

saveBtn.MouseButton1Click:Connect(function()
    local name = nameInput.Text:gsub("^%s+", ""):gsub("%s+$", "")
    local code = codeInput.Text

    if name == "" then
        saveBtn.Text = "⚠ digite o nome"
        saveBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.delay(1.2, function()
            saveBtn.Text = "SALVAR"
            saveBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
        end)
        return
    end
    if code == "" then
        saveBtn.Text = "⚠ sem código"
        saveBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.delay(1.2, function()
            saveBtn.Text = "SALVAR"
            saveBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
        end)
        return
    end
    if not writefile then
        saveBtn.Text = "⚠ sem writefile"
        return
    end

    ensureFolder()
    local path = filePath(name)

    local exists = false
    for _, e in ipairs(index) do
        if e.name == name then exists = true; e.file = path; break end
    end
    if not exists then
        table.insert(index, { name = name, file = path })
    end

    local ok = pcall(writefile, path, code)
    if ok then
        saveIndex(index)
        lastHash = indexHash(index)
        nameInput.Text = ""
        codeInput.Text = ""
        saveBtn.Text = "✅ salvo!"
        saveBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 90)
        task.delay(1.2, function()
            saveBtn.Text = "SALVAR"
            saveBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
        end)
        renderList()
    else
        saveBtn.Text = "⚠ falhou"
        saveBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        task.delay(1.5, function()
            saveBtn.Text = "SALVAR"
            saveBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
        end)
    end
end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then
                index = loadIndex()
                lastHash = indexHash(index)
                renderList()
            end
        end
        btnDragging = false
    end
end)

local pd, pds, pps
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        pd = true; pds = input.Position; pps = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not pd then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - pds
        panel.Position = UDim2.new(
            pps.X.Scale, pps.X.Offset + d.X,
            pps.Y.Scale, pps.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        pd = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

renderList()
print("[ScriptSaver] ✅ 💾 carregado — auto-refresh ativo")
]==]},

{"TPWalk", [==[
--[[ TPWALK 🛜 — distância ilimitada ]]

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS         = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local steps       = {}
local toggles     = {}
local applied     = nil
local uiRows      = {}
local searchText  = ""

local function recalc()
    local last = nil
    for _, v in ipairs(steps) do
        if toggles[v] then last = v end
    end
    applied = last
end

RunService.Heartbeat:Connect(function()
    if not applied or applied <= 0 then return end
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    local dir = hum.MoveDirection
    if dir.Magnitude < 0.1 then return end

    local newPos = hrp.Position + dir.Unit * applied
    hrp.CFrame = CFrame.new(newPos) * (hrp.CFrame - hrp.CFrame.Position)
end)

local function has(v)
    for i = 1, #steps do if steps[i] == v then return true end end
    return false
end
local function add(v)
    v = tonumber(v)
    if not v or v ~= v or v <= 0 then return false end
    v = math.floor(v)
    if has(v) then return false end
    steps[#steps + 1] = v
    table.sort(steps)
    toggles[v] = false
    return true
end
local function remove(v)
    for i = 1, #steps do
        if steps[i] == v then
            table.remove(steps, i)
            toggles[v] = nil
            recalc()
            return
        end
    end
end

local old = PlayerGui:FindFirstChild("TPWalkLoopUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "TPWalkLoopUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 60)
mainBtn.BackgroundTransparency = 1
mainBtn.BackgroundColor3 = Color3.new(0,0,0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = "🛜"
mainBtn.TextSize = 26
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextColor3 = Color3.fromRGB(100, 200, 255)
mainBtn.AutoButtonColor = false
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 220, 0, 320)
panel.Position = UDim2.new(0.5, -110, 0.5, -160)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(100, 200, 255)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "🛜  tpwalk"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 0, 20)
searchBox.Position = UDim2.new(0, 8, 0, 28)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
searchBox.BorderSizePixel = 0
searchBox.Text = ""
searchBox.PlaceholderText = "buscar"
searchBox.PlaceholderColor3 = Color3.fromRGB(120,120,130)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ClearTextOnFocus = false
searchBox.Parent = panel
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local sp1 = Instance.new("UIPadding", searchBox)
sp1.PaddingLeft = UDim.new(0, 6)

local addFrame = Instance.new("Frame")
addFrame.Size = UDim2.new(1, -16, 0, 24)
addFrame.Position = UDim2.new(0, 8, 0, 52)
addFrame.BackgroundTransparency = 1
addFrame.Parent = panel

local stepInput = Instance.new("TextBox")
stepInput.Size = UDim2.new(1, -46, 1, 0)
stepInput.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
stepInput.BorderSizePixel = 0
stepInput.Text = ""
stepInput.PlaceholderText = "distância"
stepInput.PlaceholderColor3 = Color3.fromRGB(120,120,130)
stepInput.TextColor3 = Color3.new(1,1,1)
stepInput.Font = Enum.Font.Gotham
stepInput.TextSize = 11
stepInput.ClearTextOnFocus = false
stepInput.Parent = addFrame
Instance.new("UICorner", stepInput).CornerRadius = UDim.new(0, 6)
local sp2 = Instance.new("UIPadding", stepInput)
sp2.PaddingLeft = UDim.new(0, 6)

local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 40, 1, 0)
addBtn.Position = UDim2.new(1, -40, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
addBtn.TextColor3 = Color3.new(1,1,1)
addBtn.Font = Enum.Font.GothamBold
addBtn.TextSize = 16
addBtn.Text = "+"
addBtn.AutoButtonColor = false
addBtn.BorderSizePixel = 0
addBtn.Parent = addFrame
Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 6)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -100)
scroll.Position = UDim2.new(0, 6, 0, 84)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(100, 200, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local function updateList()
    local filter = searchText:lower()
    local shown, shownSet = {}, {}
    for _, v in ipairs(steps) do
        if filter == "" or tostring(v):find(filter, 1, true) then
            shown[#shown + 1] = v
            shownSet[v] = true
        end
    end

    for v, btn in pairs(uiRows) do
        if not shownSet[v] then btn:Destroy(); uiRows[v] = nil end
    end

    for i, v in ipairs(shown) do
        local btn = uiRows[v]
        if not btn then
            btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 12
            btn.AutoButtonColor = false
            btn.BorderSizePixel = 0
            btn.Parent = scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            local p = Instance.new("UIPadding", btn)
            p.PaddingLeft = UDim.new(0, 8)

            local del = Instance.new("TextButton")
            del.Size = UDim2.new(0, 24, 0, 24)
            del.Position = UDim2.new(1, -26, 0.5, -12)
            del.BackgroundTransparency = 1
            del.Text = "✕"
            del.TextColor3 = Color3.fromRGB(255, 120, 120)
            del.Font = Enum.Font.GothamBold
            del.TextSize = 12
            del.AutoButtonColor = false
            del.Parent = btn

            local cv = v
            btn.MouseButton1Click:Connect(function()
                toggles[cv] = not toggles[cv]
                recalc()
                updateList()
            end)
            del.MouseButton1Click:Connect(function()
                remove(cv)
                updateList()
            end)
            uiRows[v] = btn
        end

        btn.LayoutOrder = i
        btn.Text = "  Passo: " .. v
        if toggles[v] then
            btn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            btn.TextColor3 = Color3.new(1, 1, 1)
        else
            btn.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
    end

    local empty = scroll:FindFirstChild("EmptyHint")
    if #shown == 0 and not empty then
        local lbl = Instance.new("TextLabel")
        lbl.Name = "EmptyHint"
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = "adicione uma distância"
        lbl.Parent = scroll
    elseif #shown > 0 and empty then
        empty:Destroy()
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText = searchBox.Text
    updateList()
end)

local function doAdd()
    local v = tonumber(stepInput.Text)
    if v and add(v) then
        stepInput.Text = ""
        updateList()
    else
        addBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.delay(0.6, function() addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70) end)
    end
end
addBtn.MouseButton1Click:Connect(doAdd)
stepInput.FocusLost:Connect(function(e) if e then doAdd() end end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then updateList() end
        end
        btnDragging = false
    end
end)

local panelDragging, panelDragStart, panelStartPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = true
        panelDragStart = input.Position
        panelStartPos = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not panelDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - panelDragStart
        panel.Position = UDim2.new(
            panelStartPos.X.Scale, panelStartPos.X.Offset + d.X,
            panelStartPos.Y.Scale, panelStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    applied = nil
    screen:Destroy()
end)

updateList()
print("[TPWalk] ✅ 🛜 carregado (ilimitado)")
]==]},

{"Instant Interact", [==[
--[[ INSTANT PROMPT 🎯
     • Lista todos os ProximityPrompts do mapa
     • Toca → teleporta pro prompt
     • Toggle "instant" = HoldDuration 0 em todos ]]

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS         = game:GetService("UserInputService")
local Workspace   = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local promptCache = {}
local instantOn   = false
local searchText  = ""
local uiRows      = {}
local hookedPrompts = {}

local function applyInstant(prompt)
    if not prompt or not prompt.Parent then return end
    if hookedPrompts[prompt] then return end
    hookedPrompts[prompt] = true
    pcall(function()
        prompt.HoldDuration = 0
        prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
            if instantOn and prompt.HoldDuration ~= 0 then
                prompt.HoldDuration = 0
            end
        end)
    end)
end

local function applyAllInstant()
    for _, p in ipairs(promptCache) do
        if p.prompt and p.prompt.Parent then
            applyInstant(p.prompt)
        end
    end
end

local function getPartFromPrompt(prompt)
    local parent = prompt.Parent
    if not parent then return nil end
    if parent:IsA("BasePart") then return parent end
    if parent:IsA("Attachment") then
        return parent.Parent
    end
    if parent:IsA("Model") then
        return parent.PrimaryPart
            or parent:FindFirstChildWhichIsA("BasePart")
    end
    if parent.Parent and parent.Parent:IsA("BasePart") then
        return parent.Parent
    end
    return nil
end

local function cacheAdd(obj)
    if not obj:IsA("ProximityPrompt") then return end
    local part = getPartFromPrompt(obj)
    if not part then return end

    local ok = false
    for _, item in ipairs(promptCache) do
        if item.prompt == obj then ok = true; break end
    end
    if ok then return end

    table.insert(promptCache, {
        prompt = obj,
        part = part,
        name = obj.ActionText ~= "" and obj.ActionText
            or obj.ObjectText ~= "" and obj.ObjectText
            or (obj.Parent and obj.Parent.Name or "prompt"),
    })

    if instantOn then applyInstant(obj) end
end

local function cacheRemove(obj)
    if not obj:IsA("ProximityPrompt") then return end
    for i = #promptCache, 1, -1 do
        if promptCache[i].prompt == obj then
            table.remove(promptCache, i)
        end
    end
end

task.spawn(function()
    for _, d in ipairs(Workspace:GetDescendants()) do
        cacheAdd(d)
    end
end)

Workspace.DescendantAdded:Connect(cacheAdd)
Workspace.DescendantRemoving:Connect(cacheRemove)

task.spawn(function()
    while true do
        task.wait(5)
        for _, d in ipairs(Workspace:GetDescendants()) do
            cacheAdd(d)
        end
    end
end)

local function teleportTo(part)
    if not part or not part.Parent then return false end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local target = part.Position + Vector3.new(0, 3, 0)
    hrp.CFrame = CFrame.new(target)
    return true
end

local old = PlayerGui:FindFirstChild("InstantPromptUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "InstantPromptUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 60)
mainBtn.BackgroundTransparency = 1
mainBtn.Text = "🎯"
mainBtn.TextSize = 26
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextColor3 = Color3.fromRGB(255, 200, 100)
mainBtn.AutoButtonColor = false
mainBtn.BorderSizePixel = 0
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 240, 0, 380)
panel.Position = UDim2.new(0.5, -120, 0.5, -190)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(255, 200, 100)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "🎯  prompts"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local instantBtn = Instance.new("TextButton")
instantBtn.Size = UDim2.new(1, -16, 0, 30)
instantBtn.Position = UDim2.new(0, 8, 0, 28)
instantBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
instantBtn.TextColor3 = Color3.new(1,1,1)
instantBtn.Font = Enum.Font.GothamBold
instantBtn.TextSize = 12
instantBtn.Text = "INSTANT: OFF"
instantBtn.AutoButtonColor = false
instantBtn.BorderSizePixel = 0
instantBtn.Parent = panel
Instance.new("UICorner", instantBtn).CornerRadius = UDim.new(0, 6)

instantBtn.MouseButton1Click:Connect(function()
    instantOn = not instantOn
    instantBtn.Text = instantOn and "INSTANT: ON" or "INSTANT: OFF"
    instantBtn.BackgroundColor3 = instantOn
        and Color3.fromRGB(50, 170, 70)
        or  Color3.fromRGB(70, 70, 80)
    if instantOn then
        applyAllInstant()
    end
end)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 0, 22)
searchBox.Position = UDim2.new(0, 8, 0, 64)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
searchBox.BorderSizePixel = 0
searchBox.Text = ""
searchBox.PlaceholderText = "buscar"
searchBox.PlaceholderColor3 = Color3.fromRGB(120,120,130)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ClearTextOnFocus = false
searchBox.Parent = panel
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local sp1 = Instance.new("UIPadding", searchBox)
sp1.PaddingLeft = UDim.new(0, 6)

local countLbl = Instance.new("TextLabel")
countLbl.Size = UDim2.new(1, -16, 0, 14)
countLbl.Position = UDim2.new(0, 8, 0, 92)
countLbl.BackgroundTransparency = 1
countLbl.TextXAlignment = Enum.TextXAlignment.Left
countLbl.TextColor3 = Color3.fromRGB(160, 160, 175)
countLbl.Font = Enum.Font.Gotham
countLbl.TextSize = 10
countLbl.Text = "0 prompts"
countLbl.Parent = panel

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -120)
scroll.Position = UDim2.new(0, 6, 0, 112)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(255, 200, 100)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local function updateList()
    for _, c in ipairs(scroll:GetChildren()) do
        if c:IsA("TextButton") or c:IsA("TextLabel") then c:Destroy() end
    end
    uiRows = {}

    local filter = searchText:lower()
    local shown = {}
    for _, item in ipairs(promptCache) do
        if item.prompt.Parent then
            if filter == "" or item.name:lower():find(filter, 1, true) then
                shown[#shown + 1] = item
            end
        end
    end

    countLbl.Text = #shown .. " de " .. #promptCache .. " prompts"

    if #shown == 0 then
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = (#promptCache == 0) and "nenhum prompt no mapa" or "nada encontrado"
        lbl.Parent = scroll
        return
    end

    for i, item in ipairs(shown) do
        local row = Instance.new("TextButton")
        row.Size = UDim2.new(1, 0, 0, 32)
        row.LayoutOrder = i
        row.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
        row.TextColor3 = Color3.fromRGB(200, 200, 210)
        row.Font = Enum.Font.GothamBold
        row.TextSize = 11
        row.TextXAlignment = Enum.TextXAlignment.Left
        row.Text = "  " .. item.name
        row.TextTruncate = Enum.TextTruncate.AtEnd
        row.AutoButtonColor = false
        row.BorderSizePixel = 0
        row.Parent = scroll
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 5)
        local rp = Instance.new("UIPadding", row)
        rp.PaddingLeft = UDim.new(0, 6)

        local capturedItem = item
        local capturedRow = row

        row.MouseButton1Click:Connect(function()
            if teleportTo(capturedItem.part) then
                capturedRow.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
                task.delay(0.6, function()
                    capturedRow.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
                end)
            end
        end)
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText = searchBox.Text
    updateList()
end)

task.spawn(function()
    while true do
        task.wait(1)
        if panel.Visible then
            updateList()
        end
    end
end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then updateList() end
        end
        btnDragging = false
    end
end)

local pd, pds, pps
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        pd = true; pds = input.Position; pps = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not pd then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - pds
        panel.Position = UDim2.new(
            pps.X.Scale, pps.X.Offset + d.X,
            pps.Y.Scale, pps.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        pd = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

updateList()
print("[InstantPrompt] ✅ 🎯 carregado")
]==]},

{"Hacks Menu", 'loadstring(game:HttpGet("https://pastefy.app/yuKBHLHj/raw"))()'},

{"FOV Loop", [==[
--[[ FOV LOOP — toggle por linha ]]

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS         = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local cam = workspace.CurrentCamera
local DEF_FOV = cam and cam.FieldOfView or 70

local fovs        = {}
local toggles     = {}
local applied     = nil
local uiRows      = {}
local searchText  = ""

local function recalc()
    local last = nil
    for _, v in ipairs(fovs) do
        if toggles[v] then last = v end
    end
    applied = last
end

RunService.Heartbeat:Connect(function()
    local c = workspace.CurrentCamera
    if not c then return end
    local target = applied or DEF_FOV
    if c.FieldOfView ~= target then 
        c.FieldOfView = target 
    end
end)

local function has(v)
    for i = 1, #fovs do if fovs[i] == v then return true end end
    return false
end
local function add(v)
    v = tonumber(v)
    if not v or v ~= v or v <= 0 then return false end
    v = math.floor(v)
    if has(v) then return false end
    fovs[#fovs + 1] = v
    table.sort(fovs)
    toggles[v] = false
    return true
end
local function remove(v)
    for i = 1, #fovs do
        if fovs[i] == v then
            table.remove(fovs, i)
            toggles[v] = nil
            recalc()
            return
        end
    end
end

local old = PlayerGui:FindFirstChild("FovLoopUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "FovLoopUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 44, 0, 44)
mainBtn.Position = UDim2.new(0, 10, 0, 60)
mainBtn.BackgroundTransparency = 1
mainBtn.BackgroundColor3 = Color3.new(0,0,0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = "👁️"
mainBtn.TextSize = 28
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextColor3 = Color3.fromRGB(180, 160, 255)
mainBtn.AutoButtonColor = false
mainBtn.ZIndex = 10
mainBtn.Parent = screen
local ms = Instance.new("UIStroke", mainBtn)
ms.Color = Color3.new(0,0,0)
ms.Thickness = 1.5
ms.Transparency = 0.4

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 220, 0, 320)
panel.Position = UDim2.new(0.5, -110, 0.5, -160)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(180, 160, 255)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -32, 0, 24)
title.Position = UDim2.new(0, 10, 0, 2)
title.BackgroundTransparency = 1
title.Text = "👁️  fovs"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -26, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = panel

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -16, 0, 20)
searchBox.Position = UDim2.new(0, 8, 0, 28)
searchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
searchBox.BorderSizePixel = 0
searchBox.Text = ""
searchBox.PlaceholderText = "buscar"
searchBox.PlaceholderColor3 = Color3.fromRGB(120,120,130)
searchBox.TextColor3 = Color3.new(1,1,1)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 11
searchBox.ClearTextOnFocus = false
searchBox.Parent = panel
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local sp1 = Instance.new("UIPadding", searchBox)
sp1.PaddingLeft = UDim.new(0, 6)

local addFrame = Instance.new("Frame")
addFrame.Size = UDim2.new(1, -16, 0, 24)
addFrame.Position = UDim2.new(0, 8, 0, 52)
addFrame.BackgroundTransparency = 1
addFrame.Parent = panel

local fovInput = Instance.new("TextBox")
fovInput.Size = UDim2.new(1, -46, 1, 0)
fovInput.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
fovInput.BorderSizePixel = 0
fovInput.Text = ""
fovInput.PlaceholderText = "fov"
fovInput.PlaceholderColor3 = Color3.fromRGB(120,120,130)
fovInput.TextColor3 = Color3.new(1,1,1)
fovInput.Font = Enum.Font.Gotham
fovInput.TextSize = 11
fovInput.ClearTextOnFocus = false
fovInput.Parent = addFrame
Instance.new("UICorner", fovInput).CornerRadius = UDim.new(0, 6)
local sp2 = Instance.new("UIPadding", fovInput)
sp2.PaddingLeft = UDim.new(0, 6)

local addBtn = Instance.new("TextButton")
addBtn.Size = UDim2.new(0, 40, 1, 0)
addBtn.Position = UDim2.new(1, -40, 0, 0)
addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
addBtn.TextColor3 = Color3.new(1,1,1)
addBtn.Font = Enum.Font.GothamBold
addBtn.TextSize = 16
addBtn.Text = "+"
addBtn.AutoButtonColor = false
addBtn.BorderSizePixel = 0
addBtn.Parent = addFrame
Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 6)

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -100)
scroll.Position = UDim2.new(0, 6, 0, 84)
scroll.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(180, 160, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = panel
Instance.new("UICorner", scroll).CornerRadius = UDim.new(0, 6)

local listLay = Instance.new("UIListLayout")
listLay.Padding = UDim.new(0, 3)
listLay.SortOrder = Enum.SortOrder.LayoutOrder
listLay.Parent = scroll
local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 4)
pad.PaddingLeft = UDim.new(0, 4)
pad.PaddingRight = UDim.new(0, 4)
pad.PaddingBottom = UDim.new(0, 4)
pad.Parent = scroll

local function updateList()
    local filter = searchText:lower()
    local shown, shownSet = {}, {}
    for _, v in ipairs(fovs) do
        if filter == "" or tostring(v):find(filter, 1, true) then
            shown[#shown + 1] = v
            shownSet[v] = true
        end
    end

    for v, btn in pairs(uiRows) do
        if not shownSet[v] then btn:Destroy(); uiRows[v] = nil end
    end

    for i, v in ipairs(shown) do
        local btn = uiRows[v]
        if not btn then
            btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 12
            btn.AutoButtonColor = false
            btn.BorderSizePixel = 0
            btn.Parent = scroll
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            local p = Instance.new("UIPadding", btn)
            p.PaddingLeft = UDim.new(0, 8)

            local del = Instance.new("TextButton")
            del.Size = UDim2.new(0, 24, 0, 24)
            del.Position = UDim2.new(1, -26, 0.5, -12)
            del.BackgroundTransparency = 1
            del.Text = "✕"
            del.TextColor3 = Color3.fromRGB(255, 120, 120)
            del.Font = Enum.Font.GothamBold
            del.TextSize = 12
            del.AutoButtonColor = false
            del.Parent = btn

            local cv = v
            btn.MouseButton1Click:Connect(function()
                toggles[cv] = not toggles[cv]
                recalc()
                updateList()
            end)
            del.MouseButton1Click:Connect(function()
                remove(cv)
                updateList()
            end)
            uiRows[v] = btn
        end

        btn.LayoutOrder = i
        btn.Text = "  FOV: " .. v
        if toggles[v] then
            btn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            btn.TextColor3 = Color3.new(1, 1, 1)
        else
            btn.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        end
    end

    local empty = scroll:FindFirstChild("EmptyHint")
    if #shown == 0 and not empty then
        local lbl = Instance.new("TextLabel")
        lbl.Name = "EmptyHint"
        lbl.Size = UDim2.new(1, 0, 0, 40)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(140,140,150)
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 11
        lbl.Text = "adicione um fov"
        lbl.Parent = scroll
    elseif #shown > 0 and empty then
        empty:Destroy()
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchText = searchBox.Text
    updateList()
end)

local function doAdd()
    local v = tonumber(fovInput.Text)
    if v and add(v) then
        fovInput.Text = ""
        updateList()
    else
        addBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
        task.delay(0.6, function() addBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70) end)
    end
end
addBtn.MouseButton1Click:Connect(doAdd)
fovInput.FocusLost:Connect(function(e) if e then doAdd() end end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then updateList() end
        end
        btnDragging = false
    end
end)

local panelDragging, panelDragStart, panelStartPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = true
        panelDragStart = input.Position
        panelStartPos = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not panelDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - panelDragStart
        panel.Position = UDim2.new(
            panelStartPos.X.Scale, panelStartPos.X.Offset + d.X,
            panelStartPos.Y.Scale, panelStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    applied = nil
    screen:Destroy()
end)

updateList()
print("[FovLoop] ✅ carregado")
]==]},

{"Executor", [==[
--[[ EXECUTOR 💻 — Compacto ]]

local Players     = game:GetService("Players")
local UIS         = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

local old = PlayerGui:FindFirstChild("ExecutorUI")
if old then old:Destroy() end

local screen = Instance.new("ScreenGui")
screen.Name = "ExecutorUI"
screen.ResetOnSpawn = false
screen.IgnoreGuiInset = true
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screen.DisplayOrder = 9999
screen.Parent = PlayerGui

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0, 36, 0, 36)
mainBtn.Position = UDim2.new(0, 10, 0, 60)
mainBtn.BackgroundTransparency = 1
mainBtn.Text = "💻"
mainBtn.TextSize = 22
mainBtn.Font = Enum.Font.GothamBold
mainBtn.AutoButtonColor = false
mainBtn.BorderSizePixel = 0
mainBtn.ZIndex = 10
mainBtn.Parent = screen

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 260, 0, 300)
panel.Position = UDim2.new(0.5, -130, 0.5, -150)
panel.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
panel.BorderSizePixel = 0
panel.Visible = false
panel.ZIndex = 20
panel.Parent = screen
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)
local ps = Instance.new("UIStroke", panel)
ps.Color = Color3.fromRGB(90, 200, 255)
ps.Thickness = 1.5

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -24, 0, 20)
title.Position = UDim2.new(0, 8, 0, 2)
title.BackgroundTransparency = 1
title.Text = "💻 executor"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.fromRGB(200, 200, 210)
title.Font = Enum.Font.GothamBold
title.TextSize = 11
title.Parent = panel

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -22, 0, 2)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 12
closeBtn.Parent = panel

local codeInput = Instance.new("TextBox")
codeInput.Size = UDim2.new(1, -16, 0, 150)
codeInput.Position = UDim2.new(0, 8, 0, 26)
codeInput.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
codeInput.BorderSizePixel = 0
codeInput.Text = ""
codeInput.PlaceholderText = "Cole seu script, loadstring ou URL..."
codeInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
codeInput.TextColor3 = Color3.new(1,1,1)
codeInput.Font = Enum.Font.Code
codeInput.TextSize = 11
codeInput.TextWrapped = true
codeInput.TextXAlignment = Enum.TextXAlignment.Left
codeInput.TextYAlignment = Enum.TextYAlignment.Top
codeInput.ClearTextOnFocus = false
codeInput.MultiLine = true
codeInput.Parent = panel
Instance.new("UICorner", codeInput).CornerRadius = UDim.new(0, 6)
local cp = Instance.new("UIPadding", codeInput)
cp.PaddingLeft = UDim.new(0, 4)
cp.PaddingTop = UDim.new(0, 2)

local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(1, -16, 0, 28)
errorLabel.Position = UDim2.new(0, 8, 0, 180)
errorLabel.BackgroundTransparency = 1
errorLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
errorLabel.Font = Enum.Font.GothamBold
errorLabel.TextSize = 10
errorLabel.TextXAlignment = Enum.TextXAlignment.Left
errorLabel.TextYAlignment = Enum.TextYAlignment.Top
errorLabel.TextWrapped = true
errorLabel.Text = ""
errorLabel.Parent = panel

local executeBtn = Instance.new("TextButton")
executeBtn.Size = UDim2.new(1, -16, 0, 28)
executeBtn.Position = UDim2.new(0, 8, 0, 210)
executeBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
executeBtn.TextColor3 = Color3.new(1,1,1)
executeBtn.Font = Enum.Font.GothamBold
executeBtn.TextSize = 12
executeBtn.Text = "EXECUTE"
executeBtn.AutoButtonColor = false
executeBtn.BorderSizePixel = 0
executeBtn.Parent = panel
Instance.new("UICorner", executeBtn).CornerRadius = UDim.new(0, 6)

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0.5, -12, 0, 28)
clearBtn.Position = UDim2.new(0, 8, 0, 244)
clearBtn.BackgroundColor3 = Color3.fromRGB(180, 120, 20)
clearBtn.TextColor3 = Color3.new(1,1,1)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 12
clearBtn.Text = "CLEAR"
clearBtn.AutoButtonColor = false
clearBtn.BorderSizePixel = 0
clearBtn.Parent = panel
Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 6)

local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0.5, -12, 0, 28)
copyBtn.Position = UDim2.new(0.5, 4, 0, 244)
copyBtn.BackgroundColor3 = Color3.fromRGB(55, 85, 160)
copyBtn.TextColor3 = Color3.new(1,1,1)
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 12
copyBtn.Text = "COPY"
copyBtn.AutoButtonColor = false
copyBtn.BorderSizePixel = 0
copyBtn.Parent = panel
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 6)

local function setError(msg)
    if msg and msg ~= "" then
        errorLabel.Text = "⚠ " .. msg
    else
        errorLabel.Text = ""
    end
end

executeBtn.MouseButton1Click:Connect(function()
    setError("")
    local input = codeInput.Text:gsub("^%s+", ""):gsub("%s+$", "")
    if input == "" then
        setError("O campo está vazio.")
        return
    end

    if input:match("^https?://") then
        executeBtn.Text = "..."
        executeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        
        task.spawn(function()
            local ok, res = pcall(function() return game:HttpGet(input) end)
            executeBtn.Text = "EXECUTE"
            executeBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
            
            if not ok or not res or res == "" then
                setError("Falha ao baixar a URL.")
                return
            end
            
            if not loadstring then
                setError("Sem suporte a loadstring.")
                return
            end
            
            local func, err = loadstring(res)
            if not func then setError(tostring(err)); return end
            
            local success, runtimeErr = pcall(func)
            if not success then setError(tostring(runtimeErr)) end
        end)
    else
        if not loadstring then
            setError("Sem suporte a loadstring.")
            return
        end
        
        local func, err = loadstring(input)
        if not func then
            setError(tostring(err))
            return
        end
        
        local success, runtimeErr = pcall(func)
        if not success then
            setError(tostring(runtimeErr))
        end
    end
end)

clearBtn.MouseButton1Click:Connect(function()
    codeInput.Text = ""
    setError("")
end)

copyBtn.MouseButton1Click:Connect(function()
    local txt = codeInput.Text
    if txt == "" then
        setError("Nada para copiar.")
        return
    end
    
    if setclipboard then
        pcall(setclipboard, txt)
        copyBtn.Text = "OK!"
        copyBtn.BackgroundColor3 = Color3.fromRGB(50, 170, 70)
        task.delay(1, function()
            copyBtn.Text = "COPY"
            copyBtn.BackgroundColor3 = Color3.fromRGB(55, 85, 160)
        end)
    else
        setError("Sem suporte a clipboard.")
    end
end)

local btnDragging, btnMoved, btnDragStart, btnStartPos
mainBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        btnDragging = true; btnMoved = false
        btnDragStart = input.Position; btnStartPos = mainBtn.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not btnDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - btnDragStart
        if math.abs(d.X) > 6 or math.abs(d.Y) > 6 then btnMoved = true end
        mainBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + d.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if btnDragging and not btnMoved then
            panel.Visible = not panel.Visible
            if panel.Visible then setError("") end
        end
        btnDragging = false
    end
end)

local panelDragging, panelDragStart, panelStartPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = true
        panelDragStart = input.Position
        panelStartPos = panel.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if not panelDragging then return end
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseMovement then
        local d = input.Position - panelDragStart
        panel.Position = UDim2.new(
            panelStartPos.X.Scale, panelStartPos.X.Offset + d.X,
            panelStartPos.Y.Scale, panelStartPos.Y.Offset + d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
       or input.UserInputType == Enum.UserInputType.MouseButton1 then
        panelDragging = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    screen:Destroy()
end)
]==]},

{"ExperienceSettings", 'loadstring(game:HttpGet("https://bit.ly/49157tB", true))()'},

{"EVER", 'loadstring(game:HttpGet("https://pastefy.app/EMXm5p2G/raw"))()'},

{"CAR SPEED", [==[
--[[ Universal Car Boost Script made by R_MP6 [𝙹𝚘𝚎 𝐗 𝗟𝗶𝗺𝗶𝘁𝗮𝗯𝗹𝗲]
     Editado: TextBox sem limite de valor
]]

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "CarBoost loaded!",
    Text = "Made by R_MP6",
    Button1 = "Thanks",
    Duration = 5
})

-- SETTINGS
local DEFAULTS = {
    MAX_BOOST_FORCE = 150,
    BOOST_INCREMENT = 3,
    BOOST_INTERVAL = 0.05,
}

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- BOOST STATE
local boosting = false
local currentForce = 0
local boostConnection = nil
local currentSeat = nil

-- BOOST CONFIG
local boostConfig = table.clone(DEFAULTS)

-- GET MAIN VEHICLE PART
local function getVehicleMainPart(seat)
    local model = seat:FindFirstAncestorOfClass("Model")
    if model and model.PrimaryPart then return model.PrimaryPart end
    for _, p in ipairs(model:GetDescendants()) do
        if p:IsA("BasePart") and p.Name:lower():find("chassis") then return p end
    end
    return seat
end

-- START BOOST
local function startBoost(seat)
    if boosting then return end
    boosting = true
    local part = getVehicleMainPart(seat)
    if not part then return end

    local trail = Instance.new("ParticleEmitter")
    trail.Texture = "rbxassetid://242830270"
    trail.Color = ColorSequence.new(Color3.new(1, 1, 1))
    trail.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0)})
    trail.Rate = 50
    trail.Speed = NumberRange.new(5, 10)
    trail.Lifetime = NumberRange.new(0.3)
    trail.Transparency = NumberSequence.new(0.2, 1)
    trail.VelocitySpread = 30
    trail.Name = "BoostTrail"
    trail.Parent = part

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://72642478827550"
    sound.Looped = true
    sound.Volume = 0.4
    sound.Name = "BoostSound"
    sound.Parent = part
    sound:Play()

    boostConnection = RunService.Heartbeat:Connect(function()
        if not boosting then return end
        local speed = part.AssemblyLinearVelocity.Magnitude
        local label = player.PlayerGui:WaitForChild("BoostGui"):FindFirstChild("SpeedLabel")
        if label then
            label.Text = "Speed: " .. math.floor(speed + 0.5)
            label.Visible = true
        end

        local currentVelocity = part.AssemblyLinearVelocity
        local forwardDir = seat.CFrame.LookVector
        local forwardSpeed = currentVelocity:Dot(forwardDir)
        local additionalSpeed = math.min(boostConfig.BOOST_INCREMENT, boostConfig.MAX_BOOST_FORCE - forwardSpeed)
        local newVelocity = currentVelocity + (forwardDir * additionalSpeed)

        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(newVelocity.X, currentVelocity.Y, newVelocity.Z)
        bv.MaxForce = Vector3.new(1e6, 0, 1e6)
        bv.P = 10000
        bv.Parent = part
        Debris:AddItem(bv, boostConfig.BOOST_INTERVAL)
    end)
end

-- STOP BOOST
local function stopBoost()
    boosting = false
    if boostConnection then boostConnection:Disconnect() end
    boostConnection = nil

    if currentSeat then
        local part = getVehicleMainPart(currentSeat)
        if part then
            local trail = part:FindFirstChild("BoostTrail")
            if trail then trail:Destroy() end
            local sound = part:FindFirstChild("BoostSound")
            if sound then sound:Stop() sound:Destroy() end
        end
    end

    local label = player.PlayerGui:FindFirstChild("BoostGui") and player.PlayerGui.BoostGui:FindFirstChild("SpeedLabel")
    if label then label.Visible = false end
end

-- CREATE TEXTBOX (sem limite)
local function createTextBox(name, default, onChanged)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 55)
    container.BackgroundTransparency = 1

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.55, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.4, 0, 1, 0)
    box.Position = UDim2.new(0.6, 0, 0, 0)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderText = tostring(default)
    box.Text = tostring(default)
    box.Font = Enum.Font.Gotham
    box.TextScaled = true
    box.ClearTextOnFocus = false
    box.Parent = container

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0.2, 0)
    boxCorner.Parent = box

    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = Color3.fromRGB(100, 100, 100)
    boxStroke.Thickness = 1
    boxStroke.Parent = box

    box.Focused:Connect(function()
        boxStroke.Color = Color3.fromRGB(255, 255, 255)
    end)
    box.FocusLost:Connect(function()
        boxStroke.Color = Color3.fromRGB(100, 100, 100)

        -- Aceita qualquer número, sem limite
        local num = tonumber(box.Text)
        if not num then
            box.Text = tostring(default)
            return
        end
        box.Text = tostring(num)
        onChanged(num)
    end)

    return container
end

-- CREATE GUI
local function createBoostGui()
    local gui = Instance.new("ScreenGui")
    gui.Name = "BoostGui"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local boostBtn = Instance.new("TextButton")
    boostBtn.Name = "BoostButton"
    boostBtn.Size = UDim2.new(0, 90, 0, 90)
    boostBtn.Position = UDim2.new(0.5, -100, 1, -120)
    boostBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    boostBtn.Text = "B"
    boostBtn.TextColor3 = Color3.new(1, 1, 1)
    boostBtn.TextScaled = true
    boostBtn.Font = Enum.Font.GothamBold
    boostBtn.Visible = false
    boostBtn.Parent = gui
    local boostCorner = Instance.new("UICorner", boostBtn)
    boostCorner.CornerRadius = UDim.new(1, 0)

    local settingsBtn = boostBtn:Clone()
    settingsBtn.Name = "SettingsButton"
    settingsBtn.Position = UDim2.new(0.5, 10, 1, -120)
    settingsBtn.Text = "S"
    settingsBtn.Parent = gui

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Name = "SpeedLabel"
    speedLabel.Size = UDim2.new(0, 120, 0, 40)
    speedLabel.Position = UDim2.new(0.5, -60, 1, -170)
    speedLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    speedLabel.TextColor3 = Color3.new(1, 1, 1)
    speedLabel.BackgroundTransparency = 0.3
    speedLabel.TextScaled = true
    speedLabel.Font = Enum.Font.GothamBold
    speedLabel.Text = "Speed: 0"
    speedLabel.Visible = false
    speedLabel.Parent = gui
    local corner2 = Instance.new("UICorner", speedLabel)
    corner2.CornerRadius = UDim.new(0.2, 0)

    -- Settings Panel
    local settingsPanel = Instance.new("Frame")
    settingsPanel.Name = "SettingsPanel"
    settingsPanel.Size = UDim2.new(0, 260, 0, 250)
    settingsPanel.Position = UDim2.new(0.5, -130, 0.5, -150)
    settingsPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    settingsPanel.Visible = false
    settingsPanel.Parent = gui
    local panelCorner = Instance.new("UICorner", settingsPanel)
    panelCorner.CornerRadius = UDim.new(0.1, 0)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = settingsPanel

    local resetBtn = Instance.new("TextButton")
    resetBtn.Name = "ResetButton"
    resetBtn.Size = UDim2.new(1, -20, 0, 40)
    resetBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    resetBtn.Text = "Reset to Defaults"
    resetBtn.TextColor3 = Color3.new(1, 1, 1)
    resetBtn.TextScaled = true
    resetBtn.Font = Enum.Font.GothamBold
    resetBtn.LayoutOrder = 0
    resetBtn.Parent = settingsPanel
    local resetCorner = Instance.new("UICorner", resetBtn)
    resetCorner.CornerRadius = UDim.new(1, 0)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "SETTINGS"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.LayoutOrder = 1
    title.Parent = settingsPanel

    -- DRAG
    local dragToggle, dragStart, startPos = nil, nil, nil
    local dragSpeed = 0.25

    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        TweenService:Create(settingsPanel, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end

    settingsPanel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true
            dragStart = input.Position
            startPos = settingsPanel.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            if dragToggle then
                updateInput(input)
            end
        end
    end)

    -- TextBoxes sem limites
    local boxes = {
        createTextBox("Max Force", boostConfig.MAX_BOOST_FORCE, function(v) boostConfig.MAX_BOOST_FORCE = v end),
        createTextBox("Increment", boostConfig.BOOST_INCREMENT, function(v) boostConfig.BOOST_INCREMENT = v end),
        createTextBox("Interval", boostConfig.BOOST_INTERVAL, function(v) boostConfig.BOOST_INTERVAL = v end),
    }

    for i, box in ipairs(boxes) do
        box.LayoutOrder = i + 1
        box.Parent = settingsPanel
    end

    resetBtn.MouseButton1Click:Connect(function()
        boostConfig = table.clone(DEFAULTS)
        for _, box in ipairs(boxes) do
            box:Destroy()
        end
        boxes = {
            createTextBox("Max Force", boostConfig.MAX_BOOST_FORCE, function(v) boostConfig.MAX_BOOST_FORCE = v end),
            createTextBox("Increment", boostConfig.BOOST_INCREMENT, function(v) boostConfig.BOOST_INCREMENT = v end),
            createTextBox("Interval", boostConfig.BOOST_INTERVAL, function(v) boostConfig.BOOST_INTERVAL = v end),
        }
        for i, box in ipairs(boxes) do
            box.LayoutOrder = i + 1
            box.Parent = settingsPanel
        end
    end)

    settingsBtn.MouseButton1Click:Connect(function()
        settingsPanel.Visible = not settingsPanel.Visible
    end)

    return gui, boostBtn, settingsBtn
end

-- SETUP BOOST SYSTEM
local function setupBoost(character)
    local playerGui = player:WaitForChild("PlayerGui")
    if playerGui:FindFirstChild("BoostGui") then
        playerGui.BoostGui:Destroy()
    end

    local gui, boostBtn, settingsBtn = createBoostGui()

    local function monitorSeat(seat)
        if not seat:IsA("VehicleSeat") then return end
        seat:GetPropertyChangedSignal("Occupant"):Connect(function()
            local occupant = seat.Occupant
            if occupant and occupant.Parent == character then
                currentSeat = seat
                boostBtn.Visible = true
                settingsBtn.Visible = true
            elseif currentSeat == seat then
                currentSeat = nil
                boostBtn.Visible = false
                settingsBtn.Visible = false
                stopBoost()
            end
        end)
    end

    for _, s in ipairs(workspace:GetDescendants()) do monitorSeat(s) end
    workspace.DescendantAdded:Connect(monitorSeat)

    boostBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            if currentSeat then startBoost(currentSeat) end
        end
    end)
    boostBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            stopBoost()
        end
    end)
end

-- INIT
repeat wait() until player.Character
setupBoost(player.Character)

player.CharacterAdded:Connect(function(char)
    repeat wait() until char:FindFirstChild("Humanoid")
    setupBoost(char)
end)
]==]},
}

for _, entry in ipairs(TAB3) do
	newButton(pages[3], entry[1], function() runCode(entry[2]) end)
end

-- ================= ABAS 4, 5 e 6 =================
local HttpService = game:GetService("HttpService")
local RED = Color3.fromRGB(255, 80, 80)
local GREEN = Color3.fromRGB(50, 170, 70)

for _, i in ipairs({4, 5, 6}) do
	local lay = pages[i]:FindFirstChildOfClass("UIListLayout")
	if lay then lay.SortOrder = Enum.SortOrder.LayoutOrder end
end

local function mkBox(parentFrame, h, placeholder, multi, order, inset)
	local t = Instance.new("TextBox")
	t.Size = UDim2.new(1, inset, 0, h)
	t.BackgroundColor3 = Color3.fromRGB(38, 38, 52)
	t.BorderSizePixel = 0
	t.Text = ""
	t.PlaceholderText = placeholder
	t.PlaceholderColor3 = Color3.fromRGB(130, 130, 145)
	t.TextColor3 = Color3.new(1, 1, 1)
	t.Font = multi and Enum.Font.Code or Enum.Font.Gotham
	t.TextSize = 12
	t.ClearTextOnFocus = false
	t.TextWrapped = true
	t.MultiLine = multi
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.TextYAlignment = multi and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
	t.LayoutOrder = order
	t.Parent = parentFrame
	round(t, 8)
	local p = Instance.new("UIPadding")
	p.PaddingLeft = UDim.new(0, 6)
	p.PaddingRight = UDim.new(0, 6)
	p.PaddingTop = UDim.new(0, 4)
	p.Parent = t
	return t
end

-- Executa URL, https, loadstring ou codigo Lua. Retorna ok, erro
local function runInput(text)
	text = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
	if text == "" then return false, "O campo esta vazio." end
	if not loadstring then return false, "Seu executor nao tem loadstring." end
	local code = text
	if text:match("^https?://%S+$") then
		local ok, res = pcall(function() return game:HttpGet(text) end)
		if not ok or not res or res == "" then
			return false, "Falha ao baixar a URL: " .. tostring(res)
		end
		code = res
	end
	local fn, err = loadstring(code)
	if not fn then return false, tostring(err) end
	local ok2, rerr = pcall(fn)
	if not ok2 then return false, tostring(rerr) end
	return true
end

-- ---------- Armazenamento (persiste mesmo saindo do jogo) ----------
local SAVE_FILE = "NinjaHub_scripts.json"
local saved = {}

local function loadSaved()
	if not (isfile and readfile) then return end
	local ok, data = pcall(function()
		if isfile(SAVE_FILE) then return readfile(SAVE_FILE) end
	end)
	if ok and data and data ~= "" then
		local ok2, dec = pcall(function() return HttpService:JSONDecode(data) end)
		if ok2 and type(dec) == "table" then saved = dec end
	end
end

local function persist()
	if not writefile then
		toast("Executor sem writefile: nao salva no disco")
		return
	end
	pcall(function() writefile(SAVE_FILE, HttpService:JSONEncode(saved)) end)
end

loadSaved()

local addSaved -- definido na aba 5

-- ---------- ABA 4: Executor ----------
local execBox = mkBox(pages[4], 150, "Cole aqui: URL, https, loadstring ou codigo Lua...", true, 1, -8)

local errLbl = Instance.new("TextLabel")
errLbl.Size = UDim2.new(1, -8, 0, 0)
errLbl.AutomaticSize = Enum.AutomaticSize.Y
errLbl.BackgroundTransparency = 1
errLbl.Text = ""
errLbl.TextColor3 = RED
errLbl.Font = Enum.Font.GothamBold
errLbl.TextSize = 11
errLbl.TextWrapped = true
errLbl.TextXAlignment = Enum.TextXAlignment.Left
errLbl.TextYAlignment = Enum.TextYAlignment.Top
errLbl.LayoutOrder = 2
errLbl.Parent = pages[4]

local btnRow = Instance.new("Frame")
btnRow.Size = UDim2.new(1, -8, 0, 30)
btnRow.BackgroundTransparency = 1
btnRow.LayoutOrder = 3
btnRow.Parent = pages[4]
local rowLay = Instance.new("UIListLayout")
rowLay.FillDirection = Enum.FillDirection.Horizontal
rowLay.Padding = UDim.new(0, 3)
rowLay.Parent = btnRow

local function rowBtn(text, color, cb)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0.25, -3, 1, 0)
	b.BackgroundColor3 = color
	b.BorderSizePixel = 0
	b.Text = text
	b.TextColor3 = Color3.new(1, 1, 1)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 11
	b.Parent = btnRow
	round(b, 8)
	b.MouseButton1Click:Connect(cb)
	return b
end

rowBtn("Execute", GREEN, function()
	task.spawn(function()
		errLbl.Text = ""
		local ok, err = runInput(execBox.Text)
		if ok then
			errLbl.TextColor3 = GREEN
			errLbl.Text = "Executado!"
		else
			errLbl.TextColor3 = RED
			errLbl.Text = "Erro: " .. tostring(err)
		end
	end)
end)
rowBtn("Clear", Color3.fromRGB(180, 120, 20), function()
	execBox.Text = ""
	errLbl.Text = ""
end)
rowBtn("Copy", Color3.fromRGB(55, 85, 160), function()
	if execBox.Text == "" then
		errLbl.TextColor3 = RED
		errLbl.Text = "Nada para copiar."
		return
	end
	copy(execBox.Text)
end)
rowBtn("Save", Color3.fromRGB(100, 70, 170), function()
	if execBox.Text:match("^%s*$") then
		errLbl.TextColor3 = RED
		errLbl.Text = "Nada para salvar."
		return
	end
	addSaved("Script " .. (#saved + 1), execBox.Text)
	errLbl.TextColor3 = GREEN
	errLbl.Text = "Salvo na aba 5!"
end)

-- ---------- ABA 5: Script Saver ----------
local plusBtn = newButton(pages[5], "+", function() end)
plusBtn.LayoutOrder = 1
plusBtn.TextSize = 20

local form = Instance.new("Frame")
form.Size = UDim2.new(1, -8, 0, 0)
form.AutomaticSize = Enum.AutomaticSize.Y
form.BackgroundTransparency = 1
form.Visible = false
form.LayoutOrder = 2
form.Parent = pages[5]
local formLay = Instance.new("UIListLayout")
formLay.Padding = UDim.new(0, 4)
formLay.SortOrder = Enum.SortOrder.LayoutOrder
formLay.Parent = form

local nameBox = mkBox(form, 28, "Nome do script", false, 1, 0)
local codeBox5 = mkBox(form, 90, "Codigo do script", true, 2, 0)
local saveNew = newButton(form, "Salvar", function() end)
saveNew.Size = UDim2.new(1, 0, 0, 30)
saveNew.LayoutOrder = 3
saveNew.BackgroundColor3 = GREEN

local listHolder = Instance.new("Frame")
listHolder.Size = UDim2.new(1, -8, 0, 0)
listHolder.AutomaticSize = Enum.AutomaticSize.Y
listHolder.BackgroundTransparency = 1
listHolder.LayoutOrder = 3
listHolder.Parent = pages[5]
local holderLay = Instance.new("UIListLayout")
holderLay.Padding = UDim.new(0, 4)
holderLay.Parent = listHolder

local renderSaved

local function emojiBtn(row, text, xOffset, color, cb)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(0, 26, 0, 26)
	b.Position = UDim2.new(1, xOffset, 0.5, -13)
	b.BackgroundColor3 = color
	b.BorderSizePixel = 0
	b.Text = text
	b.TextSize = 13
	b.Parent = row
	round(b, 6)
	b.MouseButton1Click:Connect(cb)
	return b
end

renderSaved = function()
	for _, c in ipairs(listHolder:GetChildren()) do
		if c:IsA("Frame") then c:Destroy() end
	end
	for _, item in ipairs(saved) do
		local row = Instance.new("Frame")
		row.Size = UDim2.new(1, 0, 0, 34)
		row.BackgroundColor3 = BTN
		row.BorderSizePixel = 0
		row.Parent = listHolder
		round(row, 8)

		local nm = Instance.new("TextLabel")
		nm.Size = UDim2.new(1, -100, 1, 0)
		nm.Position = UDim2.new(0, 8, 0, 0)
		nm.BackgroundTransparency = 1
		nm.Text = item.name
		nm.TextColor3 = Color3.new(1, 1, 1)
		nm.Font = Enum.Font.GothamBold
		nm.TextSize = 12
		nm.TextXAlignment = Enum.TextXAlignment.Left
		nm.TextTruncate = Enum.TextTruncate.AtEnd
		nm.Parent = row

		emojiBtn(row, "▶️", -92, Color3.fromRGB(40, 120, 60), function()
			task.spawn(function()
				local ok, err = runInput(item.code)
				if not ok then toast("Erro: " .. tostring(err):sub(1, 60)) end
			end)
		end)
		emojiBtn(row, "📋", -62, Color3.fromRGB(55, 85, 160), function()
			copy(item.code)
		end)
		emojiBtn(row, "🗑️", -32, Color3.fromRGB(160, 50, 50), function()
			local idx = table.find(saved, item)
			if idx then table.remove(saved, idx) end
			persist()
			renderSaved()
		end)
	end
end

addSaved = function(name, code)
	table.insert(saved, {name = name, code = code})
	persist()
	renderSaved()
end

plusBtn.MouseButton1Click:Connect(function()
	form.Visible = not form.Visible
	plusBtn.Text = form.Visible and "-" or "+"
end)

saveNew.MouseButton1Click:Connect(function()
	if nameBox.Text:match("^%s*$") then toast("Digite o nome do script") return end
	if codeBox5.Text:match("^%s*$") then toast("Cole o codigo do script") return end
	addSaved(nameBox.Text, codeBox5.Text)
	nameBox.Text = ""
	codeBox5.Text = ""
	form.Visible = false
	plusBtn.Text = "+"
	toast("Script salvo!")
end)

renderSaved()

-- ---------- ABA 6: Buscar scripts (ScriptBlox / RScripts) ----------
local apiName = "ScriptBlox"

local apiBtn = newButton(pages[6], "API: ScriptBlox  (toque para trocar)", function() end)
apiBtn.Size = UDim2.new(1, -8, 0, 22)
apiBtn.TextSize = 10
apiBtn.LayoutOrder = 1
apiBtn.MouseButton1Click:Connect(function()
	apiName = (apiName == "ScriptBlox") and "RScripts" or "ScriptBlox"
	apiBtn.Text = "API: " .. apiName .. "  (toque para trocar)"
end)

local sRow = Instance.new("Frame")
sRow.Size = UDim2.new(1, -8, 0, 30)
sRow.BackgroundTransparency = 1
sRow.LayoutOrder = 2
sRow.Parent = pages[6]

local searchBox6 = mkBox(sRow, 30, "Buscar script...", false, 1, -38)
local goBtn = Instance.new("TextButton")
goBtn.Size = UDim2.new(0, 34, 1, 0)
goBtn.Position = UDim2.new(1, -34, 0, 0)
goBtn.BackgroundColor3 = GREEN
goBtn.BorderSizePixel = 0
goBtn.Text = "🔍"
goBtn.TextSize = 14
goBtn.Parent = sRow
round(goBtn, 8)

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1, -8, 0, 16)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = "Digite e toque em 🔍"
statusLbl.TextColor3 = Color3.fromRGB(170, 170, 185)
statusLbl.Font = Enum.Font.Gotham
statusLbl.TextSize = 10
statusLbl.TextXAlignment = Enum.TextXAlignment.Left
statusLbl.LayoutOrder = 3
statusLbl.Parent = pages[6]

local resHolder = Instance.new("Frame")
resHolder.Size = UDim2.new(1, -8, 0, 0)
resHolder.AutomaticSize = Enum.AutomaticSize.Y
resHolder.BackgroundTransparency = 1
resHolder.LayoutOrder = 4
resHolder.Parent = pages[6]
local resLay = Instance.new("UIListLayout")
resLay.Padding = UDim.new(0, 4)
resLay.Parent = resHolder

local function loadstringFor(src)
	return 'loadstring(game:HttpGet("' .. src .. '"))()'
end

local function addResult(title, sub, src)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 44)
	row.BackgroundColor3 = BTN
	row.BorderSizePixel = 0
	row.Parent = resHolder
	round(row, 8)

	local t1 = Instance.new("TextLabel")
	t1.Size = UDim2.new(1, -100, 0, 22)
	t1.Position = UDim2.new(0, 8, 0, 3)
	t1.BackgroundTransparency = 1
	t1.Text = title
	t1.TextColor3 = Color3.new(1, 1, 1)
	t1.Font = Enum.Font.GothamBold
	t1.TextSize = 11
	t1.TextXAlignment = Enum.TextXAlignment.Left
	t1.TextTruncate = Enum.TextTruncate.AtEnd
	t1.Parent = row

	local t2 = Instance.new("TextLabel")
	t2.Size = UDim2.new(1, -100, 0, 16)
	t2.Position = UDim2.new(0, 8, 0, 24)
	t2.BackgroundTransparency = 1
	t2.Text = sub
	t2.TextColor3 = Color3.fromRGB(160, 160, 175)
	t2.Font = Enum.Font.Gotham
	t2.TextSize = 9
	t2.TextXAlignment = Enum.TextXAlignment.Left
	t2.TextTruncate = Enum.TextTruncate.AtEnd
	t2.Parent = row

	emojiBtn(row, "▶️", -92, Color3.fromRGB(40, 120, 60), function()
		task.spawn(function()
			local ok, err = runInput(src)
			if not ok then toast("Erro: " .. tostring(err):sub(1, 60)) end
		end)
	end)
	emojiBtn(row, "📋", -62, Color3.fromRGB(55, 85, 160), function()
		copy(loadstringFor(src))
	end)
	emojiBtn(row, "💾", -32, Color3.fromRGB(100, 70, 170), function()
		addSaved(title, loadstringFor(src))
		toast("Salvo na aba 5!")
	end)
end

local function doSearch()
	local q = searchBox6.Text
	if q:match("^%s*$") then
		statusLbl.Text = "Digite algo para buscar."
		return
	end
	for _, c in ipairs(resHolder:GetChildren()) do
		if c:IsA("Frame") then c:Destroy() end
	end
	statusLbl.Text = "Buscando em " .. apiName .. "..."
	local api = apiName
	task.spawn(function()
		local url
		if api == "ScriptBlox" then
			url = "https://scriptblox.com/api/script/search?max=20&q=" .. HttpService:UrlEncode(q)
		else
			url = "https://rscripts.net/api/v2/scripts?page=1&orderBy=date&sort=desc&q=" .. HttpService:UrlEncode(q)
		end
		local okH, raw = pcall(function() return game:HttpGet(url) end)
		if not okH or not raw or raw == "" then
			statusLbl.Text = "Falha na conexao com " .. api .. "."
			return
		end
		local okJ, data = pcall(function() return HttpService:JSONDecode(raw) end)
		if not okJ or type(data) ~= "table" then
			statusLbl.Text = "Resposta invalida de " .. api .. "."
			return
		end
		local list
		if api == "ScriptBlox" then
			list = data.result and data.result.scripts
		else
			list = data.scripts
		end
		if type(list) ~= "table" or #list == 0 then
			statusLbl.Text = "Nenhum resultado."
			return
		end
		local count = 0
		for _, s in ipairs(list) do
			if count >= 20 then break end
			local title = s.title or "sem titulo"
			local src, sub
			if api == "ScriptBlox" then
				if s.slug then src = "https://scriptblox.com/raw/" .. s.slug end
				sub = (type(s.game) == "table" and s.game.name) or "universal"
			else
				src = s.rawScript or (s.slug and ("https://rscripts.net/raw/" .. s.slug))
				sub = (type(s.game) == "table" and (s.game.title or s.game.name)) or "RScripts"
			end
			if src then
				count = count + 1
				addResult(title, tostring(sub), src)
			end
		end
		statusLbl.Text = count .. " resultado(s) em " .. api
	end)
end

goBtn.MouseButton1Click:Connect(doSearch)
searchBox6.FocusLost:Connect(function(enter) if enter then doSearch() end end)

selectTab(1)

-- Bola flutuante (minimizar)
local ball = Instance.new("ImageButton")
ball.Name = "Ball"
ball.Size = UDim2.new(0, 46, 0, 46)
ball.Position = UDim2.new(0, 20, 0.5, -28)
ball.BackgroundColor3 = TOP
ball.BorderSizePixel = 0
ball.Visible = false
ball.Parent = gui
Instance.new("UICorner", ball).CornerRadius = UDim.new(1, 0)

-- Carrega o PNG local da pasta workspace do Delta
local ICON_FILES = {
	"Ninjadeltateach.png", "Pictures/Ninjadeltateach.png", "pictures/Ninjadeltateach.png",
	"tchau.png", "Pictures/tchau.png", "pictures/tchau.png",
	"ninjadeltateach.png", "Pictures/ninjadeltateach.png", "pictures/ninjadeltateach.png",
}
local iconLoaded = false
-- Cole aqui o link direto (raw) do PNG hospedado (GitHub, etc). Ele baixa uma vez e salva.
local ICON_URL = ""
pcall(function()
	if ICON_URL ~= "" and writefile and isfile and not isfile("Ninjadeltateach.png") then
		writefile("Ninjadeltateach.png", game:HttpGet(ICON_URL))
	end
end)
pcall(function()
	if isfile and getcustomasset then
		for _, f in ipairs(ICON_FILES) do
			if isfile(f) then
				ball.Image = getcustomasset(f)
				iconLoaded = true
				break
			end
		end
	end
end)
if not iconLoaded and ICON_ID ~= "" then
	ball.Image = ICON_ID
	iconLoaded = true
end

if not iconLoaded then
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 1, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = "N"
	lbl.TextColor3 = Color3.new(1, 1, 1)
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 24
	lbl.Parent = ball
end

-- Bola arrastavel + clique abre a janela
local moved, down, dStart, dPos = false, false, nil, nil
ball.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		down, moved = true, false
		dStart, dPos = input.Position, ball.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				down = false
				if not moved then
					ball.Visible = false
					main.Visible = true
				end
			end
		end)
	end
end)
UIS.InputChanged:Connect(function(input)
	if down and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
		local d = input.Position - dStart
		if d.Magnitude > 6 then moved = true end
		if moved then
			ball.Position = UDim2.new(dPos.X.Scale, dPos.X.Offset + d.X, dPos.Y.Scale, dPos.Y.Offset + d.Y)
		end
	end
end)

minBtn.MouseButton1Click:Connect(function()
	main.Visible = false
	ball.Visible = true
end)
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)
