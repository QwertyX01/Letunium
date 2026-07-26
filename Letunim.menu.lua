-- ============================================================
--  LETUNIUM HUB (ИСПРАВЛЕННАЯ СИСТЕМА ESP + AIMBOT)
--  by Tormentor412
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
--  ИНФО-ПАНЕЛЬ (ОТКРЫВАЕТ/ЗАКРЫВАЕТ МЕНЮ)
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

local yPos = 0
local spacing = 42

-- ============================================================
--  ФУНКЦИЯ СОЗДАНИЯ КНОПКИ
-- ============================================================
local function createButton(text, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 220, 0, 38)
    btn.Position = UDim2.new(0, 0, 0, y)
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

-- ============================================================
--  СИСТЕМА ESP (ИСПРАВЛЕННАЯ)
-- ============================================================
local espEnabled = false
local espData = {}  -- { [Player] = { highlight, billboard, label, boxLines, skeletonLines, distBillboard, distLabel } }

local espBoxColor = Color3.fromRGB(255, 0, 0)
local espSkeletonColor = Color3.fromRGB(0, 255, 0)
local hasDrawing = pcall(function() return Drawing end) and Drawing ~= nil
local camera = workspace.CurrentCamera
local renderStepped = game:GetService("RunService").RenderStepped

-- ============================================================
--  ОЧИСТКА ESP ДЛЯ ОДНОГО ИГРОКА
-- ============================================================
local function clearPlayerESP(p)
    local data = espData[p]
    if not data then return end
    
    if data.highlight then pcall(function() data.highlight:Destroy() end) end
    if data.billboard then pcall(function() data.billboard:Destroy() end) end
    if data.label then pcall(function() data.label:Destroy() end) end
    
    if data.boxLines then
        for _, line in pairs(data.boxLines) do
            pcall(function() line:Remove() end)
        end
    end
    
    if data.skeletonLines then
        for _, line in pairs(data.skeletonLines) do
            pcall(function() line:Remove() end)
        end
    end
    
    if data.distBillboard then pcall(function() data.distBillboard:Destroy() end) end
    if data.distLabel then pcall(function() data.distLabel:Destroy() end) end
    
    espData[p] = nil
end

-- ============================================================
--  ОЧИСТКА ВСЕГО ESP
-- ============================================================
local function clearAllESP()
    for p, _ in pairs(espData) do
        clearPlayerESP(p)
    end
    espData = {}
end

-- ============================================================
--  СОЗДАНИЕ ESP ДЛЯ ИГРОКА (ОДИН РАЗ)
-- ============================================================
local function createPlayerESP(p)
    if p == player then return end
    if espData[p] then clearPlayerESP(p) end
    
    local data = {}
    
    -- HIGHLIGHT
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.4
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineTransparency = 0.2
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    data.highlight = highlight
    
    -- BILLBOARD (имя)
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 150, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    data.billboard = billboard
    
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
    data.label = label
    
    -- 3D BOX
    if hasDrawing then
        local boxLines = {}
        for i = 1, 12 do
            local line = Drawing.new("Line")
            line.Color = espBoxColor
            line.Thickness = 2
            line.Transparency = 1
            table.insert(boxLines, line)
        end
        data.boxLines = boxLines
        
        -- SKELETON
        local skeletonLines = {}
        for i = 1, 13 do
            local line = Drawing.new("Line")
            line.Color = espSkeletonColor
            line.Thickness = 2
            line.Transparency = 1
            table.insert(skeletonLines, line)
        end
        data.skeletonLines = skeletonLines
    end
    
    -- DISTANCE
    local distBillboard = Instance.new("BillboardGui")
    distBillboard.Size = UDim2.new(0, 100, 0, 25)
    distBillboard.StudsOffset = Vector3.new(0, 2, 0)
    distBillboard.AlwaysOnTop = true
    data.distBillboard = distBillboard
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 1, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    distLabel.TextSize = 14
    distLabel.Font = Enum.Font.GothamBold
    distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distLabel.TextStrokeTransparency = 0.3
    distLabel.Parent = distBillboard
    data.distLabel = distLabel
    
    espData[p] = data
end

-- ============================================================
--  ОБНОВЛЕНИЕ ESP (ВЫЗЫВАЕТСЯ КАЖДЫЙ КАДР)
-- ============================================================
local function updateESP()
    local myRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local myPos = myRoot and myRoot.Position or Vector3.new(0, 0, 0)
    
    for p, data in pairs(espData) do
        local char = p.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local humanoid = char and char:FindFirstChild("Humanoid")
        local head = char and char:FindFirstChild("Head")
        
        -- ПРОВЕРКА: жив ли игрок и видим ли
        local isValid = char and hrp and humanoid and humanoid.Health > 0 and head
        
        if not isValid then
            -- Игрок мёртв или не загружен — скрываем всё
            if data.highlight then data.highlight.Adornee = nil end
            if data.billboard then data.billboard.Adornee = nil end
            if data.distBillboard then data.distBillboard.Adornee = nil end
            if data.boxLines then
                for _, line in pairs(data.boxLines) do
                    line.Transparency = 1
                end
            end
            if data.skeletonLines then
                for _, line in pairs(data.skeletonLines) do
                    line.Transparency = 1
                end
            end
            goto continue
        end
        
        -- ОБНОВЛЯЕМ HIGHLIGHT
        if data.highlight then
            data.highlight.Adornee = char
            data.highlight.Enabled = true
        end
        
        -- ОБНОВЛЯЕМ BILLBOARD (имя)
        if data.billboard then
            data.billboard.Adornee = head
            data.billboard.Enabled = true
        end
        
        -- ОБНОВЛЯЕМ DISTANCE
        if data.distBillboard then
            data.distBillboard.Adornee = head
            data.distBillboard.Enabled = true
            if data.distLabel then
                local dist = (myPos - hrp.Position).Magnitude
                data.distLabel.Text = math.round(dist) .. "m"
            end
        end
        
        -- ОБНОВЛЯЕМ 3D BOX
        if data.boxLines and hasDrawing then
            local w, h, d = 2.5, 4.5, 1.5
            local corners = {
                Vector3.new(-w, -h, -d), Vector3.new(w, -h, -d), Vector3.new(w, -h, d), Vector3.new(-w, -h, d),
                Vector3.new(-w, h, -d), Vector3.new(w, h, -d), Vector3.new(w, h, d), Vector3.new(-w, h, d)
            }
            local edges = {{1,2},{2,3},{3,4},{4,1},{5,6},{6,7},{7,8},{8,5},{1,5},{2,6},{3,7},{4,8}}
            
            local screenCorners = {}
            for _, corner in pairs(corners) do
                local worldPos = hrp.CFrame:PointToWorldSpace(corner)
                local sp, onScreen = camera:WorldToViewportPoint(worldPos)
                table.insert(screenCorners, {pos = Vector2.new(sp.X, sp.Y), on = onScreen})
            end
            
            for i, edge in pairs(edges) do
                if screenCorners[edge[1]].on and screenCorners[edge[2]].on then
                    data.boxLines[i].From = screenCorners[edge[1]].pos
                    data.boxLines[i].To = screenCorners[edge[2]].pos
                    data.boxLines[i].Transparency = 0.5
                else
                    data.boxLines[i].Transparency = 1
                end
            end
        end
        
        -- ОБНОВЛЯЕМ SKELETON
        if data.skeletonLines and hasDrawing then
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
            
            local function getPartPos(partName, offset)
                local part = char:FindFirstChild(partName)
                if part then
                    return part.Position + offset
                end
                return nil
            end
            
            local positions = {}
            for _, joint in pairs(joints) do
                local pos = getPartPos(joint.part, joint.offset)
                table.insert(positions, pos)
            end
            
            local screenPositions = {}
            for _, pos in pairs(positions) do
                if pos then
                    local sp, onScreen = camera:WorldToViewportPoint(pos)
                    if onScreen then
                        table.insert(screenPositions, Vector2.new(sp.X, sp.Y))
                    else
                        table.insert(screenPositions, nil)
                    end
                else
                    table.insert(screenPositions, nil)
                end
            end
            
            for i, conn in pairs(connections) do
                local p1 = screenPositions[conn[1]]
                local p2 = screenPositions[conn[2]]
                if p1 and p2 then
                    data.skeletonLines[i].From = p1
                    data.skeletonLines[i].To = p2
                    data.skeletonLines[i].Transparency = 0.7
                else
                    data.skeletonLines[i].Transparency = 1
                end
            end
        end
        
        ::continue::
    end
end

-- ============================================================
--  ФУНКЦИЯ ВКЛЮЧЕНИЯ/ВЫКЛЮЧЕНИЯ ESP
-- ============================================================
local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player then
                createPlayerESP(p)
            end
        end
        updateESP()
    else
        clearAllESP()
    end
end

-- ============================================================
--  ПОДПИСКА НА СОБЫТИЯ ИГРОКОВ
-- ============================================================
game.Players.PlayerAdded:Connect(function(p)
    if p ~= player then
        p.CharacterAdded:Connect(function()
            if espEnabled then
                createPlayerESP(p)
            end
        end)
        p.CharacterRemoving:Connect(function()
            clearPlayerESP(p)
        end)
        if espEnabled then
            createPlayerESP(p)
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(p)
    clearPlayerESP(p)
end)

-- ============================================================
--  ОБНОВЛЕНИЕ КАЖДЫЙ КАДР
-- ============================================================
renderStepped:Connect(function()
    if espEnabled then
        updateESP()
    end
end)

-- ============================================================
--  КНОПКИ VISUALS
-- ============================================================

-- ESP
local espBtn = createButton("ESP", yPos)
espBtn.MouseButton1Click:Connect(function()
    toggleESP()
    espBtn.Text = espEnabled and "☑ ESP" or "☐ ESP"
end)
yPos = yPos + spacing

-- 3D BOX (включает/выключает отображение бокса)
local boxEnabled = false
local function toggleBox()
    boxEnabled = not boxEnabled
    for p, data in pairs(espData) do
        if data.boxLines then
            for _, line in pairs(data.boxLines) do
                if boxEnabled then
                    line.Transparency = 0.5
                else
                    line.Transparency = 1
                end
            end
        end
    end
end

local boxBtn = createButton("3D Box", yPos)
boxBtn.MouseButton1Click:Connect(function()
    toggleBox()
    boxBtn.Text = boxEnabled and "☑ 3D Box" or "☐ 3D Box"
end)
yPos = yPos + spacing

-- DISTANCE (включает/выключает отображение дистанции)
local distEnabled = false
local function toggleDist()
    distEnabled = not distEnabled
    for p, data in pairs(espData) do
        if data.distBillboard then
            data.distBillboard.Enabled = distEnabled
        end
    end
end

local distBtn = createButton("Distance", yPos)
distBtn.MouseButton1Click:Connect(function()
    toggleDist()
    distBtn.Text = distEnabled and "☑ Distance" or "☐ Distance"
end)
yPos = yPos + spacing

-- SKELETON (включает/выключает отображение скелета)
local skeletonEnabled = false
local function toggleSkeleton()
    skeletonEnabled = not skeletonEnabled
    for p, data in pairs(espData) do
        if data.skeletonLines then
            for _, line in pairs(data.skeletonLines) do
                if skeletonEnabled then
                    line.Transparency = 0.7
                else
                    line.Transparency = 1
                end
            end
        end
    end
end

local skeletonBtn = createButton("Skeleton", yPos)
skeletonBtn.MouseButton1Click:Connect(function()
    toggleSkeleton()
    skeletonBtn.Text = skeletonEnabled and "☑ Skeleton" or "☐ Skeleton"
end)
yPos = yPos + spacing

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos + 50)

-- ============================================================
--  AIMBOT (ИСПРАВЛЕННАЯ ВЕРСИЯ)
-- ============================================================
local aimbotContent = contentFrames[2]
for _, child in pairs(aimbotContent:GetChildren()) do
    child:Destroy()
end

local aimbotEnabled = false
local aimbotConnection = nil

-- Кнопка Aimbot
local aimbotBtn = Instance.new("TextButton")
aimbotBtn.Size = UDim2.new(0, 220, 0, 38)
aimbotBtn.Position = UDim2.new(0, 10, 0.1, 0)
aimbotBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
aimbotBtn.BackgroundTransparency = 0.3
aimbotBtn.Text = "☐ Aimbot"
aimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotBtn.TextSize = 16
aimbotBtn.Font = Enum.Font.SourceSansBold
aimbotBtn.TextXAlignment = Enum.TextXAlignment.Left
aimbotBtn.Parent = aimbotContent
local aimbotCorners = Instance.new("UICorner")
aimbotCorners.CornerRadius = UDim.new(0, 8)
aimbotCorners.Parent = aimbotBtn

-- Функция поиска цели (враг, видим, голова)
local function findTarget()
    local myTeam = player:FindFirstChild("Team")
    local bestTarget = nil
    local bestAngle = math.rad(90) -- максимальный угол 90 градусов
    
    local cam = workspace.CurrentCamera
    local camPos = cam.CFrame.Position
    local camLook = cam.CFrame.LookVector
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p == player then goto continue end
        if not p.Character then goto continue end
        local head = p.Character:FindFirstChild("Head")
        if not head then goto continue end
        
        local humanoid = p.Character:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then goto continue end
        
        -- Проверка команды (если есть)
        local pTeam = p:FindFirstChild("Team")
        if myTeam and pTeam then
            if pTeam == myTeam then -- сравниваем объекты Team
                goto continue -- союзник
            end
        end
        
        -- Проверка видимости (Line of Sight)
        local headPos = head.Position
        local screenPos, onScreen = cam:WorldToViewportPoint(headPos)
        if not onScreen then goto continue end
        
        -- Raycast
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        raycastParams.FilterDescendantsInstances = {player.Character, p.Character}
        local direction = (headPos - camPos).Unit
        local distance = (headPos - camPos).Magnitude
        local rayResult = workspace:Raycast(camPos, direction * distance, raycastParams)
        
        -- Если луч попал не в игрока – значит не видим
        if rayResult then
            local hitInstance = rayResult.Instance
            if not hitInstance or not hitInstance:IsDescendantOf(p.Character) then
                goto continue -- за стеной
            end
        else
            -- если rayResult nil – значит ничего не мешает, видим
        end
        
        -- Угол между направлением камеры и направлением на голову
        local dirToTarget = (headPos - camPos).Unit
        local angle = math.acos(math.clamp(camLook:Dot(dirToTarget), -1, 1))
        if angle < bestAngle then
            bestAngle = angle
            bestTarget = p
        end
        
        ::continue::
    end
    
    return bestTarget
end

-- Обновление Aimbot (вызывается в RenderStepped)
local function updateAimbot()
    if not aimbotEnabled then
        if aimbotConnection then
            aimbotConnection:Disconnect()
            aimbotConnection = nil
        end
        return
    end
    if aimbotConnection then return end -- уже есть
    
    aimbotConnection = game:GetService("RunService").RenderStepped:Connect(function()
        if not aimbotEnabled then return end
        local target = findTarget()
        if target then
            local head = target.Character.Head
            local cam = workspace.CurrentCamera
            local camPos = cam.CFrame.Position
            local lookAt = (head.Position - camPos).Unit
            cam.CFrame = CFrame.new(camPos, camPos + lookAt)
        end
    end)
end

-- Переключение Aimbot
aimbotBtn.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    aimbotBtn.Text = aimbotEnabled and "☑ Aimbot" or "☐ Aimbot"
    if aimbotEnabled then
        print("🔫 Aimbot включен")
        updateAimbot()
    else
        print("🔫 Aimbot выключен")
        if aimbotConnection then
            aimbotConnection:Disconnect()
            aimbotConnection = nil
        end
    end
end)

-- Если меню закрывается, можно отключать aimbot (опционально)
frame:GetPropertyChangedSignal("Visible"):Connect(function()
    if not frame.Visible and aimbotEnabled then
        -- Опционально: отключать aimbot при закрытии меню
        -- aimbotEnabled = false
        -- aimbotBtn.Text = "☐ Aimbot"
        -- if aimbotConnection then aimbotConnection:Disconnect() aimbotConnection = nil end
    end
end)

-- ============================================================
--  SETTINGS (ЗАГЛУШКА)
-- ============================================================
local settingsContent = contentFrames[3]
for _, child in pairs(settingsContent:GetChildren()) do
    child:Destroy()
end
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
print("🎨 VISUALS: ESP, 3D Box, Distance, Skeleton")
print("🎯 AIMBOT: Aimbot (только враги, голова, видимость)")
print("✅ ESP обновляется каждый кадр и удаляется при смерти")
