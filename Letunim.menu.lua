-- ============================================================
--  LETUNIUM HUB (ИСПРАВЛЕННЫЙ ESP + 3D BOX + SKELETON)
--  by Tormentor412 (fixed by AI) – УПРОЩЁННЫЕ КНОПКИ
-- ============================================================

print("🚀 Загрузка Letunium Hub...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LetuniumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ПРИВЕТСТВИЕ
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "HELLO"
hello.TextColor3 = Color3.fromRGB(255, 215, 0)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
hello.TextStrokeTransparency = 0.5
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ============================================================
--  ОСНОВНОЕ МЕНЮ
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 760, 0, 400)
frame.Position = UDim2.new(0.5, -380, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Visible = true
frame.Parent = gui

-- ============================================================
--  ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = frame

local logoLetter = Instance.new("TextLabel")
logoLetter.Size = UDim2.new(0, 40, 0, 40)
logoLetter.Position = UDim2.new(0.02, 0, 0.5, -20)
logoLetter.BackgroundTransparency = 1
logoLetter.Text = "L"
logoLetter.TextColor3 = Color3.fromRGB(255, 255, 255)
logoLetter.TextSize = 38
logoLetter.Font = Enum.Font.GothamBold
logoLetter.Rotation = -12
logoLetter.TextXAlignment = Enum.TextXAlignment.Center
logoLetter.TextYAlignment = Enum.TextYAlignment.Center
logoLetter.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0.08, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Letunium"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 22
title.Font = Enum.Font.GothamMedium
title.Rotation = -2
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- ============================================================
--  ИНФО-ПАНЕЛЬ
-- ============================================================
local infoPanel = Instance.new("TextButton")
infoPanel.Size = UDim2.new(0, 180, 0, 32)
infoPanel.Position = UDim2.new(0.01, 0, 0.01, 0)
infoPanel.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
infoPanel.BackgroundTransparency = 0
infoPanel.BorderSizePixel = 0
infoPanel.Text = ""
infoPanel.AutoButtonColor = false
infoPanel.Parent = gui

local infoCorners = Instance.new("UICorner")
infoCorners.CornerRadius = UDim.new(0, 8)
infoCorners.Parent = infoPanel

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(0.6, 0, 1, 0)
infoTitle.Position = UDim2.new(0.05, 0, 0, 0)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "Letunium"
infoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
infoTitle.TextSize = 16
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.Parent = infoPanel

local infoStatus = Instance.new("TextLabel")
infoStatus.Size = UDim2.new(0.35, 0, 1, 0)
infoStatus.Position = UDim2.new(0.62, 0, 0, 0)
infoStatus.BackgroundTransparency = 1
infoStatus.Text = "Opening"
infoStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
infoStatus.TextSize = 13
infoStatus.Font = Enum.Font.GothamMedium
infoStatus.TextXAlignment = Enum.TextXAlignment.Left
infoStatus.Parent = infoPanel

infoPanel.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- ============================================================
--  ЗВЁЗДЫ
-- ============================================================
local starContainer = Instance.new("Frame")
starContainer.Size = UDim2.new(1, 0, 1, 0)
starContainer.BackgroundTransparency = 1
starContainer.Visible = true
starContainer.ZIndex = 0
starContainer.Parent = gui

local stars = {}

for i = 1, 40 do
    local star = Instance.new("Frame")
    local size = math.random(3, 7)
    star.Size = UDim2.new(0, size, 0, size)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = 0.2 + math.random(0, 50) / 100
    star.BorderSizePixel = 0
    star.Parent = starContainer
    
    local starCorners = Instance.new("UICorner")
    starCorners.CornerRadius = UDim.new(1, 0)
    starCorners.Parent = star
    
    local side = math.random(1, 4)
    local x, y
    if side == 1 then
        x = math.random(-100, 900)
        y = math.random(-100, -30)
    elseif side == 2 then
        x = math.random(800, 900)
        y = math.random(-100, 500)
    elseif side == 3 then
        x = math.random(-100, 900)
        y = math.random(450, 500)
    else
        x = math.random(-100, -30)
        y = math.random(-100, 500)
    end
    
    star.Position = UDim2.new(0, x, 0, y)
    star.Rotation = math.random(0, 360)
    
    table.insert(stars, {
        star = star,
        x = x,
        y = y,
        speedX = (math.random() - 0.5) * 2,
        speedY = (math.random() - 0.5) * 2
    })
end

game:GetService("RunService").RenderStepped:Connect(function()
    if not starContainer.Visible then return end
    
    local menuCenterX = 0.5 * gui.AbsoluteSize.X
    local menuCenterY = 0.5 * gui.AbsoluteSize.Y
    
    for _, data in pairs(stars) do
        data.x = data.x + data.speedX
        data.y = data.y + data.speedY
        
        local dx = data.x - menuCenterX
        local dy = data.y - menuCenterY
        local dist = math.sqrt(dx*dx + dy*dy)
        
        if dist < 380 then
            data.x = data.x + (dx / (dist + 0.001)) * 0.5
            data.y = data.y + (dy / (dist + 0.001)) * 0.5
        end
        
        if data.x > 1000 then data.x = -100 end
        if data.x < -100 then data.x = 1000 end
        if data.y > 550 then data.y = -100 end
        if data.y < -100 then data.y = 550 end
        
        data.star.Position = UDim2.new(0, data.x, 0, data.y)
        data.star.Rotation = (data.star.Rotation + 1) % 360
    end
end)

local function updateStarsVisibility()
    starContainer.Visible = frame.Visible
end

frame:GetPropertyChangedSignal("Visible"):Connect(updateStarsVisibility)
updateStarsVisibility()

-- ============================================================
--  КОНТЕНТ
-- ============================================================
local contentPanel = Instance.new("Frame")
contentPanel.Size = UDim2.new(1, 0, 1, -105)
contentPanel.Position = UDim2.new(0, 0, 0, 55)
contentPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
contentPanel.BackgroundTransparency = 0
contentPanel.BorderSizePixel = 0
contentPanel.Parent = frame

local bottomBar = Instance.new("Frame")
bottomBar.Size = UDim2.new(1, 0, 0, 50)
bottomBar.Position = UDim2.new(0, 0, 1, -50)
bottomBar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
bottomBar.BackgroundTransparency = 0
bottomBar.BorderSizePixel = 0
bottomBar.Parent = frame

-- ============================================================
--  ВКЛАДКИ
-- ============================================================
local tabNames = {"VISUALS", "AIMBOT", "SETTINGS"}
local tabButtons = {}
local contentFrames = {}
local underlines = {}

for i, tabName in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.333, 0, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.333, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.BackgroundTransparency = 0.3
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = bottomBar
    tabButtons[i] = btn

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 10)
    btnCorners.Parent = btn

    local underline = Instance.new("Frame")
    underline.Size = UDim2.new(0.4, 0, 0, 3)
    underline.Position = UDim2.new(0.3, 0, 1, -3)
    underline.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    underline.BackgroundTransparency = (i == 1) and 0 or 1
    underline.BorderSizePixel = 0
    underline.Parent = btn
    underlines[btn] = underline

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -20, 1, -20)
    content.Position = UDim2.new(0, 10, 0, 10)
    content.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    content.BackgroundTransparency = 0.1
    content.BorderSizePixel = 0
    content.Visible = (i == 1)
    content.Parent = contentPanel
    contentFrames[i] = content

    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 10)
    contentCorners.Parent = content

    btn.MouseButton1Click:Connect(function()
        for j = 1, #tabNames do
            contentFrames[j].Visible = (j == i)
            tabButtons[j].TextColor3 = (j == i) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
            local line = underlines[tabButtons[j]]
            if line then
                line.BackgroundTransparency = (j == i) and 0 or 1
            end
        end
    end)
end

tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

-- ============================================================
--  VISUALS
-- ============================================================
local visualsContent = contentFrames[1]

for _, child in pairs(visualsContent:GetChildren()) do
    child:Destroy()
end

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
scrollFrame.ScrollBarThickness = 4
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 50, 50)
scrollFrame.Parent = visualsContent

local scrollPadding = Instance.new("UIPadding")
scrollPadding.PaddingLeft = UDim.new(0, 10)
scrollPadding.PaddingTop = UDim.new(0, 10)
scrollPadding.Parent = scrollFrame

-- ============================================================
--  ПЕРЕМЕННЫЕ ФУНКЦИЙ
-- ============================================================
local espEnabled = false
local boxEnabled = false
local distEnabled = false
local skeletonEnabled = false

local espData = {}
local boxData = {}
local distData = {}
local skeletonData = {}

local boxColor = Color3.fromRGB(255, 0, 0)
local skeletonColor = Color3.fromRGB(0, 255, 0)

local hasDrawing = pcall(function() return Drawing end) and Drawing ~= nil
local renderStepped = game:GetService("RunService").RenderStepped
local camera = workspace.CurrentCamera

-- ============================================================
--  ОЧИСТКА ВСЕХ ДАННЫХ
-- ============================================================
local function clearAll()
    for _, data in pairs(espData) do
        if data.highlight then pcall(function() data.highlight:Destroy() end) end
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        if data.label then pcall(function() data.label:Destroy() end) end
    end
    espData = {}
    for _, data in pairs(boxData) do
        if data.lines then for _, l in pairs(data.lines) do pcall(function() l:Destroy() end) end end
        if data.conn then pcall(function() data.conn:Disconnect() end) end
    end
    boxData = {}
    for _, data in pairs(distData) do
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        if data.label then pcall(function() data.label:Destroy() end) end
    end
    distData = {}
    for _, data in pairs(skeletonData) do
        if data.lines then for _, l in pairs(data.lines) do pcall(function() l:Destroy() end) end end
        if data.conn then pcall(function() data.conn:Disconnect() end) end
    end
    skeletonData = {}
end

-- ============================================================
--  ESP (HIGHLIGHT + ИМЯ)
-- ============================================================
local function updateESP()
    for _, data in pairs(espData) do
        if data.highlight then pcall(function() data.highlight:Destroy() end) end
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        if data.label then pcall(function() data.label:Destroy() end) end
    end
    espData = {}
    if not espEnabled then return end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") then
            local humanoid = p.Character.Humanoid
            if humanoid.Health > 0 then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = p.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.4
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineTransparency = 0.2
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = p.Character
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 150, 0, 30)
                billboard.Adornee = p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")
                billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = p.Character
                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = p.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextSize = 14
                label.Font = Enum.Font.GothamBold
                label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                label.TextStrokeTransparency = 0.3
                label.Parent = billboard
                espData[p] = {highlight = highlight, billboard = billboard, label = label}
            end
        end
    end
end

-- ============================================================
--  3D BOX (ИСПРАВЛЕННАЯ ВЕРСИЯ)
-- ============================================================
local function updateBoxes()
    for _, data in pairs(boxData) do
        if data.lines then for _, l in pairs(data.lines) do pcall(function() l:Destroy() end) end end
        if data.conn then pcall(function() data.conn:Disconnect() end) end
        if data.diedConn then pcall(function() data.diedConn:Disconnect() end) end
    end
    boxData = {}
    if not boxEnabled or not hasDrawing then return end
    local w, h, d = 2.5, 4.5, 1.5
    local corners = {
        Vector3.new(-w, -h, -d), Vector3.new(w, -h, -d), Vector3.new(w, -h, d), Vector3.new(-w, -h, d),
        Vector3.new(-w,  h, -d), Vector3.new(w,  h, -d), Vector3.new(w,  h, d), Vector3.new(-w,  h, d)
    }
    local edges = {{1,2},{2,3},{3,4},{4,1},{5,6},{6,7},{7,8},{8,5},{1,5},{2,6},{3,7},{4,8}}
    for _, p in pairs(game.Players:GetPlayers()) do
        if p == player then continue end
        local character = p.Character
        if not character then continue end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        if not hrp or not humanoid or humanoid.Health <= 0 then continue end
        local lines = {}
        for _ = 1, #edges do
            local line = Drawing.new("Line")
            line.Color = boxColor
            line.Thickness = 2
            line.Transparency = 1
            table.insert(lines, line)
        end
        local function cleanupBox()
            if boxData[p] then
                if boxData[p].lines then for _, l in pairs(boxData[p].lines) do pcall(function() l:Destroy() end) end end
                if boxData[p].conn then pcall(function() boxData[p].conn:Disconnect() end) end
                if boxData[p].diedConn then pcall(function() boxData[p].diedConn:Disconnect() end) end
                boxData[p] = nil
            end
        end
        local diedConn = humanoid.Died:Connect(cleanupBox)
        local conn = renderStepped:Connect(function()
            if not hrp or not hrp.Parent then
                for _, line in pairs(lines) do line.Transparency = 1 end
                return
            end
            local humanoidNow = hrp.Parent:FindFirstChild("Humanoid")
            if not humanoidNow or humanoidNow.Health <= 0 then
                for _, line in pairs(lines) do line.Transparency = 1 end
                return
            end
            local screenCorners = {}
            for _, corner in pairs(corners) do
                local worldPos = hrp.CFrame:PointToWorldSpace(corner)
                local sp, onScreen = camera:WorldToViewportPoint(worldPos)
                table.insert(screenCorners, {pos = Vector2.new(sp.X, sp.Y), on = onScreen, z = sp.Z})
            end
            for i, edge in pairs(edges) do
                local c1 = screenCorners[edge[1]]
                local c2 = screenCorners[edge[2]]
                if c1.on and c2.on and c1.z > 0 and c2.z > 0 then
                    lines[i].From = c1.pos
                    lines[i].To = c2.pos
                    lines[i].Transparency = 0.5
                else
                    lines[i].Transparency = 1
                end
            end
        end)
        boxData[p] = {lines = lines, conn = conn, diedConn = diedConn, cleanup = cleanupBox}
    end
end

-- ============================================================
--  DISTANCE
-- ============================================================
local function updateDist()
    for _, data in pairs(distData) do
        if data.billboard then pcall(function() data.billboard:Destroy() end) end
        if data.label then pcall(function() data.label:Destroy() end) end
    end
    distData = {}
    if not distEnabled then return end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p == player then continue end
        local character = p.Character
        if not character then continue end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        if not rootPart or not humanoid or humanoid.Health <= 0 then continue end
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 120, 0, 25)
        billboard.Adornee = rootPart
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = character
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = "0m"
        label.TextColor3 = Color3.fromRGB(255, 0, 0)
        label.TextSize = 14
        label.Font = Enum.Font.GothamBold
        label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        label.TextStrokeTransparency = 0.3
        label.Parent = billboard
        distData[p] = {billboard = billboard, label = label}
    end
end

-- ============================================================
--  SKELETON (ИСПРАВЛЕННАЯ ВЕРСИЯ)
-- ============================================================
local function updateSkeleton()
    for _, data in pairs(skeletonData) do
        if data.lines then for _, l in pairs(data.lines) do pcall(function() l:Destroy() end) end end
        if data.conn then pcall(function() data.conn:Disconnect() end) end
        if data.diedConn then pcall(function() data.diedConn:Disconnect() end) end
    end
    skeletonData = {}
    if not skeletonEnabled or not hasDrawing then return end
    local joints = {
        {part = "Head", offset = Vector3.new(0, 0, 0)},
        {part = "UpperTorso", offset = Vector3.new(0, 0, 0)},
        {part = "UpperTorso", offset = Vector3.new(0, 1.5, 0)},
        {part = "UpperTorso", offset = Vector3.new(1.5, 0.5, 0)},
        {part = "UpperTorso", offset = Vector3.new(-1.5, 0.5, 0)},
        {part = "RightUpperArm", offset = Vector3.new(0, 0, 0)},
        {part = "RightLowerArm", offset = Vector3.new(0, 0, 0)},
        {part = "LeftUpperArm", offset = Vector3.new(0, 0, 0)},
        {part = "LeftLowerArm", offset = Vector3.new(0, 0, 0)},
        {part = "UpperTorso", offset = Vector3.new(0, -2, 0)},
        {part = "RightUpperLeg", offset = Vector3.new(0, 0, 0)},
        {part = "RightLowerLeg", offset = Vector3.new(0, 0, 0)},
        {part = "LeftUpperLeg", offset = Vector3.new(0, 0, 0)},
        {part = "LeftLowerLeg", offset = Vector3.new(0, 0, 0)}
    }
    local connections = {
        {1, 2}, {2, 3}, {3, 4}, {3, 5}, {4, 6}, {6, 7}, {5, 8}, {8, 9},
        {3, 10}, {10, 11}, {11, 12}, {10, 13}, {13, 14}
    }
    local function getPartPosition(char, partName, offset)
        local part = char:FindFirstChild(partName)
        if part then return part.Position + offset end
        return nil
    end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p == player then continue end
        local character = p.Character
        if not character then continue end
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then continue end
        local lines = {}
        for _ = 1, #connections do
            local line = Drawing.new("Line")
            line.Color = skeletonColor
            line.Thickness = 2
            line.Transparency = 1
            table.insert(lines, line)
        end
        local function cleanupSkel()
            if skeletonData[p] then
                if skeletonData[p].lines then for _, l in pairs(skeletonData[p].lines) do pcall(function() l:Destroy() end) end end
                if skeletonData[p].conn then pcall(function() skeletonData[p].conn:Disconnect() end) end
                if skeletonData[p].diedConn then pcall(function() skeletonData[p].diedConn:Disconnect() end) end
                skeletonData[p] = nil
            end
        end
        local diedConn = humanoid.Died:Connect(cleanupSkel)
        local conn = renderStepped:Connect(function()
            if not p.Character then
                for _, line in pairs(lines) do line.Transparency = 1 end
                return
            end
            local humanoidNow = p.Character:FindFirstChild("Humanoid")
            if not humanoidNow or humanoidNow.Health <= 0 then
                for _, line in pairs(lines) do line.Transparency = 1 end
                return
            end
            local positions = {}
            for _, joint in pairs(joints) do
                local pos = getPartPosition(p.Character, joint.part, joint.offset)
                table.insert(positions, pos)
            end
            local screenPositions = {}
            for _, pos in pairs(positions) do
                if pos then
                    local sp, onScreen = camera:WorldToViewportPoint(pos)
                    if onScreen and sp.Z > 0 then
                        table.insert(screenPositions, Vector2.new(sp.X, sp.Y))
                    else
                        table.insert(screenPositions, nil)
                    end
                else
                    table.insert(screenPositions, nil)
                end
            end
            for i, connIdx in pairs(connections) do
                local p1 = screenPositions[connIdx[1]]
                local p2 = screenPositions[connIdx[2]]
                if p1 and p2 then
                    lines[i].From = p1
                    lines[i].To = p2
                    lines[i].Transparency = 0.7
                else
                    lines[i].Transparency = 1
                end
            end
        end)
        skeletonData[p] = {lines = lines, conn = conn, diedConn = diedConn, cleanup = cleanupSkel}
    end
end

-- ============================================================
--  ОБНОВЛЕНИЕ DISTANCE В РЕАЛЬНОМ ВРЕМЕНИ
-- ============================================================
renderStepped:Connect(function()
    if not distEnabled then return end
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    for p, data in pairs(distData) do
        if data.billboard and data.billboard.Adornee and data.billboard.Adornee.Parent then
            local adornee = data.billboard.Adornee
            local humanoid = adornee.Parent:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local dist = (root.Position - adornee.Position).Magnitude
                if data.label then data.label.Text = math.round(dist) .. "m" end
                data.billboard.Enabled = true
            else
                data.billboard.Enabled = false
            end
        end
    end
end)

-- ============================================================
--  ОБНОВЛЕНИЕ ПРИ ПОЯВЛЕНИИ/УДАЛЕНИИ ИГРОКОВ
-- ============================================================
game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(character)
        wait(0.5)
        if espEnabled then updateESP() end
        if boxEnabled then updateBoxes() end
        if distEnabled then updateDist() end
        if skeletonEnabled then updateSkeleton() end
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            if espData[p] then
                if espData[p].highlight then espData[p].highlight:Destroy() end
                if espData[p].billboard then espData[p].billboard:Destroy() end
                espData[p] = nil
            end
            if distData[p] then
                if distData[p].billboard then distData[p].billboard:Destroy() end
                distData[p] = nil
            end
            if boxData[p] and boxData[p].cleanup then boxData[p].cleanup() end
            if skeletonData[p] and skeletonData[p].cleanup then skeletonData[p].cleanup() end
        end)
    end)
    p.CharacterRemoving:Connect(function()
        if espData[p] then
            if espData[p].highlight then pcall(function() espData[p].highlight:Destroy() end) end
            if espData[p].billboard then pcall(function() espData[p].billboard:Destroy() end) end
            if espData[p].label then pcall(function() espData[p].label:Destroy() end) end
            espData[p] = nil
        end
        if distData[p] then
            if distData[p].billboard then pcall(function() distData[p].billboard:Destroy() end) end
            if distData[p].label then pcall(function() distData[p].label:Destroy() end) end
            distData[p] = nil
        end
        if boxData[p] then
            if boxData[p].lines then for _, l in pairs(boxData[p].lines) do pcall(function() l:Destroy() end) end end
            if boxData[p].conn then pcall(function() boxData[p].conn:Disconnect() end) end
            boxData[p] = nil
        end
        if skeletonData[p] then
            if skeletonData[p].lines then for _, l in pairs(skeletonData[p].lines) do pcall(function() l:Destroy() end) end end
            if skeletonData[p].conn then pcall(function() skeletonData[p].conn:Disconnect() end) end
            skeletonData[p] = nil
        end
    end)
end)

game.Players.PlayerRemoving:Connect(function(p)
    if espData[p] then
        if espData[p].highlight then pcall(function() espData[p].highlight:Destroy() end) end
        if espData[p].billboard then pcall(function() espData[p].billboard:Destroy() end) end
        if espData[p].label then pcall(function() espData[p].label:Destroy() end) end
        espData[p] = nil
    end
    if boxData[p] then
        if boxData[p].lines then for _, l in pairs(boxData[p].lines) do pcall(function() l:Destroy() end) end end
        if boxData[p].conn then pcall(function() boxData[p].conn:Disconnect() end) end
        boxData[p] = nil
    end
    if distData[p] then
        if distData[p].billboard then pcall(function() distData[p].billboard:Destroy() end) end
        if distData[p].label then pcall(function() distData[p].label:Destroy() end) end
        distData[p] = nil
    end
    if skeletonData[p] then
        if skeletonData[p].lines then for _, l in pairs(skeletonData[p].lines) do pcall(function() l:Destroy() end) end end
        if skeletonData[p].conn then pcall(function() skeletonData[p].conn:Disconnect() end) end
        skeletonData[p] = nil
    end
end)

-- ============================================================
--  УПРОЩЁННЫЕ КНОПКИ (ГАРАНТИРОВАННО РАБОТАЮТ)
-- ============================================================
local yPos = 0
local spacing = 42

local function createSimpleButton(text, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 38)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    btn.BackgroundTransparency = 0.3
    btn.Text = "☐ " .. text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = scrollFrame
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 8)
    corners.Parent = btn
    return btn
end

-- Кнопка ESP
local espBtn = createSimpleButton("ESP", yPos)
espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espBtn.Text = espEnabled and "☑ ESP" or "☐ ESP"
    updateESP()
end)
yPos = yPos + spacing

-- Кнопка 3D Box
local boxBtn = createSimpleButton("3D Box", yPos)
boxBtn.MouseButton1Click:Connect(function()
    boxEnabled = not boxEnabled
    boxBtn.Text = boxEnabled and "☑ 3D Box" or "☐ 3D Box"
    updateBoxes()
end)
yPos = yPos + spacing

-- Кнопка Distance
local distBtn = createSimpleButton("Distance", yPos)
distBtn.MouseButton1Click:Connect(function()
    distEnabled = not distEnabled
    distBtn.Text = distEnabled and "☑ Distance" or "☐ Distance"
    updateDist()
end)
yPos = yPos + spacing

-- Кнопка Skeleton
local skeletonBtn = createSimpleButton("Skeleton", yPos)
skeletonBtn.MouseButton1Click:Connect(function()
    skeletonEnabled = not skeletonEnabled
    skeletonBtn.Text = skeletonEnabled and "☑ Skeleton" or "☐ Skeleton"
    updateSkeleton()
end)
yPos = yPos + spacing

-- Устанавливаем размер прокрутки
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos + 50)

-- ============================================================
--  AIMBOT (ЗАГЛУШКА)
-- ============================================================
local aimbotContent = contentFrames[2]
for _, child in pairs(aimbotContent:GetChildren()) do child:Destroy() end
local aimbotLabel = Instance.new("TextLabel")
aimbotLabel.Size = UDim2.new(1, 0, 1, 0)
aimbotLabel.BackgroundTransparency = 1
aimbotLabel.Text = "AIMBOT\n\n(coming soon...)"
aimbotLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
aimbotLabel.TextSize = 20
aimbotLabel.Font = Enum.Font.GothamLight
aimbotLabel.TextXAlignment = Enum.TextXAlignment.Center
aimbotLabel.TextYAlignment = Enum.TextYAlignment.Center
aimbotLabel.Parent = aimbotContent

-- ============================================================
--  SETTINGS (ЗАГЛУШКА)
-- ============================================================
local settingsContent = contentFrames[3]
for _, child in pairs(settingsContent:GetChildren()) do child:Destroy() end
local settingsLabel = Instance.new("TextLabel")
settingsLabel.Size = UDim2.new(1, 0, 1, 0)
settingsLabel.BackgroundTransparency = 1
settingsLabel.Text = "SETTINGS\n\n(coming soon...)"
settingsLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
settingsLabel.TextSize = 20
settingsLabel.Font = Enum.Font.GothamLight
settingsLabel.TextXAlignment = Enum.TextXAlignment.Center
settingsLabel.TextYAlignment = Enum.TextYAlignment.Center
settingsLabel.Parent = settingsContent

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.88, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "LETUNIUM HUB | TORMENTOR412"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.TextSize = 12
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.6
watermark.Parent = frame

print("✅ Letunium Hub загружен успешно!")
print("🔑 Нажми на панель Letunium Opening чтобы открыть/закрыть")
