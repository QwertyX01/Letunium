-- ============================================================
--  LETUNIUM HUB (ЗВЁЗДЫ ТОЛЬКО ПРИ ОТКРЫТОМ МЕНЮ)
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
hello.Text = "LETUNIUM HUB"
hello.TextColor3 = Color3.fromRGB(255, 255, 255)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
hello.TextStrokeTransparency = 0.5
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
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
--  ИНФО-ПАНЕЛЬ (TEXTBUTTON)
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

-- ============================================================
--  ЗВЁЗДЫ (СОЗДАЮТСЯ, НО СКРЫТЫ ПО УМОЛЧАНИЮ)
-- ============================================================
local starContainer = Instance.new("Frame")
starContainer.Size = UDim2.new(1, 0, 1, 0)
starContainer.BackgroundTransparency = 1
starContainer.BorderSizePixel = 0
starContainer.ZIndex = 0
starContainer.Visible = true  -- Видимы, когда меню открыто
starContainer.Parent = gui

local tweenService = game:GetService("TweenService")
local starData = {}

local function createStar()
    local star = Instance.new("Frame")
    local size = math.random(3, 8)
    star.Size = UDim2.new(0, size, 0, size)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = 0.2 + math.random(0, 50) / 100
    star.BorderSizePixel = 0
    star.ZIndex = 0
    star.Parent = starContainer
    
    local starCorners = Instance.new("UICorner")
    starCorners.CornerRadius = UDim.new(1, 0)
    starCorners.Parent = star
    
    local menuCenterX = 0.5 * gui.AbsoluteSize.X
    local menuCenterY = 0.5 * gui.AbsoluteSize.Y
    local menuWidth = 760
    local menuHeight = 400
    
    local side = math.random(1, 4)
    local x, y
    
    if side == 1 then
        x = menuCenterX + (math.random() - 0.5) * (menuWidth + 150)
        y = menuCenterY - menuHeight/2 - math.random(20, 120)
    elseif side == 2 then
        x = menuCenterX + menuWidth/2 + math.random(20, 120)
        y = menuCenterY + (math.random() - 0.5) * (menuHeight + 100)
    elseif side == 3 then
        x = menuCenterX + (math.random() - 0.5) * (menuWidth + 150)
        y = menuCenterY + menuHeight/2 + math.random(20, 120)
    else
        x = menuCenterX - menuWidth/2 - math.random(20, 120)
        y = menuCenterY + (math.random() - 0.5) * (menuHeight + 100)
    end
    
    star.Position = UDim2.new(0, x, 0, y)
    
    local speedX = (math.random() - 0.5) * 1.0
    local speedY = (math.random() - 0.5) * 1.0
    
    local data = {
        star = star,
        x = x,
        y = y,
        speedX = speedX,
        speedY = speedY,
        size = size
    }
    table.insert(starData, data)
    
    tweenService:Create(star, TweenInfo.new(2 + math.random() * 3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Rotation = 360
    }):Play()
    
    tweenService:Create(star, TweenInfo.new(1 + math.random() * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        BackgroundTransparency = 0.1 + math.random(0, 60) / 100
    }):Play()
    
    tweenService:Create(star, TweenInfo.new(1.5 + math.random() * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Size = UDim2.new(0, size + math.random(2, 4), 0, size + math.random(2, 4))
    }):Play()
    
    return star
end

for i = 1, 60 do
    createStar()
end

-- Анимация движения звёзд
game:GetService("RunService").RenderStepped:Connect(function()
    -- Обновляем звёзды, только если они видимы
    if not starContainer.Visible then return end
    
    local menuCenterX = 0.5 * gui.AbsoluteSize.X
    local menuCenterY = 0.5 * gui.AbsoluteSize.Y
    local menuWidth = 760
    local menuHeight = 400
    
    for _, data in pairs(starData) do
        if data.star and data.star.Parent then
            data.x = data.x + data.speedX
            data.y = data.y + data.speedY
            
            local dx = data.x - menuCenterX
            local dy = data.y - menuCenterY
            local dist = math.sqrt(dx*dx + dy*dy)
            
            local minDist = math.max(menuWidth/2 + 30, menuHeight/2 + 30)
            if dist < minDist then
                local pushX = (dx / (dist + 0.001)) * 0.8
                local pushY = (dy / (dist + 0.001)) * 0.8
                data.x = data.x + pushX
                data.y = data.y + pushY
            end
            
            if data.x < -100 then data.x = gui.AbsoluteSize.X + 100 end
            if data.x > gui.AbsoluteSize.X + 100 then data.x = -100 end
            if data.y < -100 then data.y = gui.AbsoluteSize.Y + 100 end
            if data.y > gui.AbsoluteSize.Y + 100 then data.y = -100 end
            
            data.star.Position = UDim2.new(0, data.x, 0, data.y)
        end
    end
end)

-- ============================================================
--  УПРАВЛЕНИЕ ВИДИМОСТЬЮ ЗВЁЗД ПРИ ОТКРЫТИИ/ЗАКРЫТИИ МЕНЮ
-- ============================================================
local function updateStarsVisibility()
    starContainer.Visible = frame.Visible
end

-- Подписываемся на изменение видимости меню
frame:GetPropertyChangedSignal("Visible"):Connect(updateStarsVisibility)

-- При клике на инфо-панель
infoPanel.MouseButton1Click:Connect(function()
    if frame then
        frame.Visible = not frame.Visible
        if mButton then
            mButton.Visible = not frame.Visible
        end
        updateStarsVisibility()
    end
end)

-- При клике на кнопку M
mButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    mButton.Visible = false
    updateStarsVisibility()
end)

-- При F1
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if frame then
            frame.Visible = not frame.Visible
            if frame.Visible then
                mButton.Visible = false
            else
                mButton.Visible = true
            end
            updateStarsVisibility()
        end
    end
end)

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
--  КНОПКА M
-- ============================================================
local mButton = Instance.new("TextButton")
mButton.Size = UDim2.new(0, 55, 0, 55)
mButton.Position = UDim2.new(1, -70, 1, -70)
mButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
mButton.BackgroundTransparency = 0.1
mButton.Text = "L"
mButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mButton.TextSize = 28
mButton.Font = Enum.Font.GothamBold
mButton.Visible = false
mButton.Parent = gui

local mCorners = Instance.new("UICorner")
mCorners.CornerRadius = UDim.new(1, 0)
mCorners.Parent = mButton

local mStroke = Instance.new("UIStroke")
mStroke.Thickness = 2
mStroke.Color = Color3.fromRGB(255, 255, 255)
mStroke.Transparency = 0.3
mStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mStroke.Parent = mButton

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

-- ============================================================
--  НИЖНЯЯ ПАНЕЛЬ
-- ============================================================
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
    btn:SetAttribute("Underline", underline)

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

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = tabName .. "\n\n(функции будут здесь)"
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.TextSize = 16
    label.Font = Enum.Font.GothamLight
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.TextWrapped = true
    label.Parent = content

    btn.MouseButton1Click:Connect(function()
        for j = 1, #tabNames do
            contentFrames[j].Visible = (j == i)
            tabButtons[j].TextColor3 = (j == i) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
            local line = tabButtons[j]:GetAttribute("Underline")
            if line then
                line.BackgroundTransparency = (j == i) and 0 or 1
            end
        end
    end)
end

tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

-- ============================================================
--  VISUALS (ESP)
-- ============================================================
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 200, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0.15, 0)
espBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
espBtn.BackgroundTransparency = 0.3
espBtn.Text = "ESP: Выкл"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextSize = 18
espBtn.Font = Enum.Font.SourceSansBold
espBtn.Parent = contentFrames[1]
local espCorners = Instance.new("UICorner")
espCorners.CornerRadius = UDim.new(0, 10)
espCorners.Parent = espBtn

local espEnabled = false
local espLabels = {}

local function getTeamColor(p)
    local team = p:FindFirstChild("Team")
    local myTeam = player:FindFirstChild("Team")
    if team and myTeam then
        if team.Value ~= myTeam.Value then
            return Color3.fromRGB(255, 0, 0)
        else
            return Color3.fromRGB(0, 255, 0)
        end
    end
    return Color3.fromRGB(255, 255, 0)
end

local function createESP(p)
    if p == player then return end
    if espLabels[p] then return end
    if not p.Character then return end
    
    local color = getTeamColor(p)
    
    local highlight = Instance.new("Highlight")
    highlight.Adornee = p.Character
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0.3
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = p.Character
    
    espLabels[p] = highlight
end

local function removeESP(p)
    if espLabels[p] then
        espLabels[p]:Destroy()
        espLabels[p] = nil
    end
end

local function clearAllESP()
    for p, highlight in pairs(espLabels) do
        highlight:Destroy()
    end
    espLabels = {}
end

local function updateAllESP()
    clearAllESP()
    if espEnabled then
        for _, p in pairs(game.Players:GetPlayers()) do
            createESP(p)
        end
    end
end

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP: Вкл"
        updateAllESP()
    else
        espBtn.Text = "ESP: Выкл"
        clearAllESP()
    end
end)

game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function()
        wait(0.5)
        if espEnabled then
            createESP(p)
        end
    end)
    p.CharacterRemoving:Connect(function()
        removeESP(p)
    end)
end)

game.Players.PlayerRemoving:Connect(function(p)
    removeESP(p)
end)

-- ============================================================
--  AIMBOT
-- ============================================================
local aimbotBtn = Instance.new("TextButton")
aimbotBtn.Size = UDim2.new(0, 200, 0, 40)
aimbotBtn.Position = UDim2.new(0, 10, 0.15, 0)
aimbotBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
aimbotBtn.BackgroundTransparency = 0.3
aimbotBtn.Text = "Aimbot: Выкл"
aimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotBtn.TextSize = 18
aimbotBtn.Font = Enum.Font.SourceSansBold
aimbotBtn.Parent = contentFrames[2]
local aimbotCorners = Instance.new("UICorner")
aimbotCorners.CornerRadius = UDim.new(0, 10)
aimbotCorners.Parent = aimbotBtn

local aimbotEnabled = false

aimbotBtn.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        aimbotBtn.Text = "Aimbot: Вкл"
    else
        aimbotBtn.Text = "Aimbot: Выкл"
    end
end)

-- ============================================================
--  SETTINGS (ПРОЗРАЧНОСТЬ)
-- ============================================================
local transLabel = Instance.new("TextLabel")
transLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
transLabel.Position = UDim2.new(0, 10, 0.12, 0)
transLabel.BackgroundTransparency = 1
transLabel.Text = "Прозрачность: 0%"
transLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transLabel.TextSize = 16
transLabel.Font = Enum.Font.SourceSansBold
transLabel.TextXAlignment = Enum.TextXAlignment.Left
transLabel.Parent = contentFrames[3]

local transSlider = Instance.new("Frame")
transSlider.Size = UDim2.new(0.4, 0, 0.035, 0)
transSlider.Position = UDim2.new(0.35, 0, 0.135, 0)
transSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
transSlider.BackgroundTransparency = 0.3
transSlider.BorderSizePixel = 1
transSlider.BorderColor3 = Color3.fromRGB(200, 50, 50)
transSlider.Parent = contentFrames[3]

local transFill = Instance.new("Frame")
transFill.Size = UDim2.new(0, 0, 1, 0)
transFill.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
transFill.BackgroundTransparency = 0.5
transFill.BorderSizePixel = 0
transFill.Parent = transSlider

local transKnob = Instance.new("TextButton")
transKnob.Size = UDim2.new(0, 16, 0, 16)
transKnob.Position = UDim2.new(0, -8, 0.5, -8)
transKnob.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
transKnob.BackgroundTransparency = 0
transKnob.Text = ""
transKnob.Parent = transSlider

local transKnobCorners = Instance.new("UICorner")
transKnobCorners.CornerRadius = UDim.new(1, 0)
transKnobCorners.Parent = transKnob

local transDragging = false
transKnob.MouseButton1Down:Connect(function() transDragging = true end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then transDragging = false end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if transDragging then
        local mouse = player:GetMouse()
        if mouse then
            local relX = (mouse.X - transSlider.AbsolutePosition.X) / transSlider.AbsoluteSize.X
            local val = math.clamp(relX, 0, 1)
            transFill.Size = UDim2.new(val, 0, 1, 0)
            transKnob.Position = UDim2.new(val, -8, 0.5, -8)
            local percent = math.round(val * 100)
            transLabel.Text = "Прозрачность: " .. percent .. "%"
            frame.BackgroundTransparency = val * 0.8
            header.BackgroundTransparency = val * 0.8
            contentPanel.BackgroundTransparency = val * 0.8
            bottomBar.BackgroundTransparency = val * 0.8
        end
    end
end)

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

-- ============================================================
--  ПЕРЕТАСКИВАНИЕ
-- ============================================================
local dragging = false
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local pos = input.Position
        if pos.X >= frame.AbsolutePosition.X and pos.X <= frame.AbsolutePosition.X + frame.AbsoluteSize.X and
           pos.Y >= frame.AbsolutePosition.Y and pos.Y <= frame.AbsolutePosition.Y + 55 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("✅ Letunium Hub загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("📁 Вкладки: VISUALS | AIMBOT | SETTINGS")
print("✨ Звёзды появляются только при открытом меню!")
