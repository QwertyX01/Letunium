-- ============================================================
--  LETUNIUM HUB (ИСПРАВЛЕНО: ESP УДАЛЯЕТСЯ ПОСЛЕ СМЕРТИ)
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
--  ПЕРЕМЕННЫЕ ФУНКЦИЙ
-- ============================================================
local espEnabled = false
local boxEnabled = false
local distEnabled = false
local lineEnabled = false
local espObjects = {}
local boxObjects = {}
local distLabels = {}
local lineObjects = {}
local deathConnections = {}

local hasDrawing = pcall(function() return Drawing end) and Drawing ~= nil

-- ============================================================
--  ФУНКЦИИ ОЧИСТКИ
-- ============================================================
local function clearESP()
    for _, obj in pairs(espObjects) do pcall(function() obj:Destroy() end) end
    espObjects = {}
end

local function clearBoxes()
    for _, data in pairs(boxObjects) do
        if data.lines then for _, l in pairs(data.lines) do pcall(function() l:Destroy() end) end end
        if data.conn then pcall(function() data.conn:Disconnect() end) end
    end
    boxObjects = {}
end

local function clearDist()
    for _, obj in pairs(distLabels) do pcall(function() obj:Destroy() end) end
    distLabels = {}
end

local function clearLines()
    for _, obj in pairs(lineObjects) do
        if type(obj) == "table" then
            if obj.line then pcall(function() obj.line:Destroy() end) end
            if obj.conn then pcall(function() obj.conn:Disconnect() end) end
        else
            pcall(function() obj:Destroy() end)
        end
    end
    lineObjects = {}
end

-- ============================================================
--  ESP (С АВТОУДАЛЕНИЕМ ПОСЛЕ СМЕРТИ)
-- ============================================================
local function updateESP()
    clearESP()
    if not espEnabled then return end
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local humanoid = p.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = p.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineTransparency = 0.3
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = p.Character
                table.insert(espObjects, highlight)
            end
        end
    end
end

-- ОТСЛЕЖИВАНИЕ СМЕРТИ ДЛЯ УДАЛЕНИЯ ESP
local function setupDeathTracking(p)
    if p == player then return end
    p.CharacterAdded:Connect(function(char)
        local humanoid = char:WaitForChild("Humanoid")
        local conn
        conn = humanoid.HealthChanged:Connect(function()
            if humanoid.Health <= 0 then
                for i, obj in pairs(espObjects) do
                    if obj.Adornee == char then
                        pcall(function() obj:Destroy() end)
                        espObjects[i] = nil
                    end
                end
                local newObjects = {}
                for _, obj in pairs(espObjects) do
                    if obj then table.insert(newObjects, obj) end
                end
                espObjects = newObjects
                if conn then conn:Disconnect() end
            end
        end)
        table.insert(deathConnections, conn)
    end)
end

-- ПОДПИСКА НА ИГРОКОВ
for _, p in pairs(game.Players:GetPlayers()) do
    setupDeathTracking(p)
end

game.Players.PlayerAdded:Connect(function(p)
    setupDeathTracking(p)
    p.CharacterAdded:Connect(function()
        wait(0.5)
        if espEnabled then updateESP() end
    end)
end)

game.Players.PlayerRemoving:Connect(function()
    wait(0.1)
    if espEnabled then updateESP() end
end)

-- ============================================================
--  3D BOX
-- ============================================================
local function create3DBox(character)
    if not hasDrawing then return {lines = {}, conn = nil} end
    
    local lines = {}
    local corners = {
        Vector3.new(-2, -3, -2), Vector3.new(2, -3, -2), Vector3.new(2, -3, 2), Vector3.new(-2, -3, 2),
        Vector3.new(-2, 3, -2), Vector3.new(2, 3, -2), Vector3.new(2, 3, 2), Vector3.new(-2, 3, 2)
    }
    local edges = {{1,2},{2,3},{3,4},{4,1},{5,6},{6,7},{7,8},{8,5},{1,5},{2,6},{3,7},{4,8}}
    
    for _ = 1, #edges do
        local line = Drawing.new("Line")
        line.Color = Color3.fromRGB(255, 0, 0)
        line.Thickness = 2
        line.Transparency = 1
        table.insert(lines, line)
    end
    
    local conn = game:GetService("RunService").RenderStepped:Connect(function()
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            for _, line in pairs(lines) do line.Transparency = 1 end
            return
        end
        local hrp = character.HumanoidRootPart
        local cam = workspace.CurrentCamera
        local screenCorners = {}
        for _, corner in pairs(corners) do
            local worldPos = hrp.CFrame:PointToWorldSpace(corner)
            local sp, onScreen = cam:WorldToScreenPoint(worldPos)
            table.insert(screenCorners, {pos = sp, on = onScreen})
        end
        for i, edge in pairs(edges) do
            if screenCorners[edge[1]].on and screenCorners[edge[2]].on then
                lines[i].From = Vector2.new(screenCorners[edge[1]].pos.X, screenCorners[edge[1]].pos.Y)
                lines[i].To = Vector2.new(screenCorners[edge[2]].pos.X, screenCorners[edge[2]].pos.Y)
                lines[i].Transparency = 0.8
            else
                lines[i].Transparency = 1
            end
        end
    end)
    return {lines = lines, conn = conn}
end

local function updateBoxes()
    clearBoxes()
    if not boxEnabled then return end
    if not hasDrawing then 
        print("⚠️ Drawing API недоступна, 3D Box не работает")
        return 
    end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character then
            table.insert(boxObjects, create3DBox(p.Character))
        end
    end
end

-- ============================================================
--  DISTANCE
-- ============================================================
local function updateDist()
    clearDist()
    if not distEnabled then return end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            local bill = Instance.new("BillboardGui")
            bill.Size = UDim2.new(0, 120, 0, 30)
            bill.Adornee = p.Character.Head
            bill.StudsOffset = Vector3.new(0, 3.5, 0)
            bill.AlwaysOnTop = true
            bill.Parent = p.Character
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "0m"
            label.TextColor3 = Color3.fromRGB(0, 255, 255)
            label.TextSize = 18
            label.Font = Enum.Font.GothamBold
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            label.TextStrokeTransparency = 0.3
            label.Parent = bill
            table.insert(distLabels, {bill = bill, player = p})
        end
    end
end

-- ============================================================
--  LINE PLAYER
-- ============================================================
local function updateLines()
    clearLines()
    if not lineEnabled then return end
    if not hasDrawing then 
        print("⚠️ Drawing API недоступна, Line Player не работает")
        return 
    end
    
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local line = Drawing.new("Line")
            line.Color = Color3.fromRGB(255, 0, 0)
            line.Thickness = 2
            line.Transparency = 1
            
            local conn = game:GetService("RunService").RenderStepped:Connect(function()
                if not root or not root.Parent then return end
                if not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") then
                    line.Transparency = 1
                    return
                end
                local cam = workspace.CurrentCamera
                local sp1, on1 = cam:WorldToScreenPoint(root.Position)
                local sp2, on2 = cam:WorldToScreenPoint(p.Character.HumanoidRootPart.Position)
                if on1 and on2 then
                    line.From = Vector2.new(sp1.X, sp1.Y)
                    line.To = Vector2.new(sp2.X, sp2.Y)
                    line.Transparency = 0.7
                else
                    line.Transparency = 1
                end
            end)
            
            table.insert(lineObjects, {line = line, conn = conn})
        end
    end
end

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
--  КНОПКИ VISUALS
-- ============================================================

-- ESP
local espBtn = createButton("ESP", yPos)
espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espBtn.Text = espEnabled and "☑ ESP" or "☐ ESP"
    updateESP()
end)
yPos = yPos + spacing

-- 3D BOX
local boxBtn = createButton("3D Box", yPos)
boxBtn.MouseButton1Click:Connect(function()
    boxEnabled = not boxEnabled
    boxBtn.Text = boxEnabled and "☑ 3D Box" or "☐ 3D Box"
    updateBoxes()
end)
yPos = yPos + spacing

-- DISTANCE
local distBtn = createButton("Distance", yPos)
distBtn.MouseButton1Click:Connect(function()
    distEnabled = not distEnabled
    distBtn.Text = distEnabled and "☑ Distance" or "☐ Distance"
    updateDist()
end)
yPos = yPos + spacing

-- LINE PLAYER
local lineBtn = createButton("Line Player", yPos)
lineBtn.MouseButton1Click:Connect(function()
    lineEnabled = not lineEnabled
    lineBtn.Text = lineEnabled and "☑ Line Player" or "☐ Line Player"
    updateLines()
end)
yPos = yPos + spacing + 10

-- ============================================================
--  SKY COLOR
-- ============================================================
local skyLabel = Instance.new("TextLabel")
skyLabel.Size = UDim2.new(0, 220, 0, 28)
skyLabel.Position = UDim2.new(0, 0, 0, yPos)
skyLabel.BackgroundTransparency = 1
skyLabel.Text = "Sky Color"
skyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
skyLabel.TextSize = 16
skyLabel.Font = Enum.Font.GothamBold
skyLabel.TextXAlignment = Enum.TextXAlignment.Left
skyLabel.Parent = scrollFrame
yPos = yPos + 30

local skyColors = {
    {name = "🌑", color = Color3.fromRGB(10, 10, 20)},
    {name = "⬜", color = Color3.fromRGB(200, 200, 200)},
    {name = "🌸", color = Color3.fromRGB(255, 150, 200)},
    {name = "🌌", color = Color3.fromRGB(20, 30, 80)},
    {name = "🌅", color = Color3.fromRGB(255, 150, 50)},
    {name = "🌿", color = Color3.fromRGB(50, 150, 50)},
    {name = "🔥", color = Color3.fromRGB(255, 100, 20)},
    {name = "💜", color = Color3.fromRGB(150, 50, 200)},
    {name = "🌊", color = Color3.fromRGB(50, 150, 255)}
}

for i, data in ipairs(skyColors) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 55, 0, 35)
    btn.Position = UDim2.new(0, (i-1) * 60, 0, yPos)
    btn.BackgroundColor3 = data.color
    btn.BackgroundTransparency = 0.1
    btn.Text = data.name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = scrollFrame
    local cn = Instance.new("UICorner")
    cn.CornerRadius = UDim.new(0, 6)
    cn.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, child in pairs(scrollFrame:GetChildren()) do
            if child:IsA("TextButton") and child.BackgroundColor3 == data.color then
                child.BackgroundTransparency = 0.1
            else
                child.BackgroundTransparency = 0.8
            end
        end
        btn.BackgroundTransparency = 0.2
        local lighting = game:GetService("Lighting")
        lighting.Ambient = data.color
        lighting.OutdoorAmbient = data.color
        lighting.FogColor = data.color
        lighting.FogEnd = 500
    end)
end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos + 50)

-- ============================================================
--  ОБНОВЛЕНИЕ ПОЯВЛЕНИЯ ИГРОКОВ
-- ============================================================
game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        wait(0.5)
        if espEnabled then updateESP() end
        if boxEnabled then updateBoxes() end
        if distEnabled then updateDist() end
        if lineEnabled then updateLines() end
    end)
end)

game.Players.PlayerRemoving:Connect(function()
    wait(0.1)
    if espEnabled then updateESP() end
    if boxEnabled then updateBoxes() end
    if distEnabled then updateDist() end
    if lineEnabled then updateLines() end
end)

-- ============================================================
--  ОБНОВЛЕНИЕ DISTANCE В РЕАЛЬНОМ ВРЕМЕНИ
-- ============================================================
game:GetService("RunService").RenderStepped:Connect(function()
    if not distEnabled then return end
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    for _, data in pairs(distLabels) do
        if data.bill and data.bill.Adornee and data.bill.Adornee.Parent then
            local dist = (root.Position - data.bill.Adornee.Position).Magnitude
            local label = data.bill:FindFirstChildOfClass("TextLabel")
            if label then label.Text = math.round(dist) .. "m" end
        end
    end
end)

-- ============================================================
--  AIMBOT (ЗАГЛУШКА)
-- ============================================================
local aimbotContent = contentFrames[2]
for _, child in pairs(aimbotContent:GetChildren()) do
    child:Destroy()
end
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
print("🎨 VISUALS: ESP, 3D Box, Distance, Line Player, Sky Color")
print("✅ ESP автоматически удаляется после смерти игрока")
