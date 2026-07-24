-- ============================================================
--  LETUNIUM HUB (ЗВЁЗДЫ ВОКРУГ МЕНЮ)
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
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

-- ============================================================
--  ЗВЁЗДЫ ВОКРУГ МЕНЮ
-- ============================================================
local starContainer = Instance.new("Frame")
starContainer.Size = UDim2.new(1, 0, 1, 0)
starContainer.BackgroundTransparency = 1
starContainer.BorderSizePixel = 0
starContainer.ZIndex = 0
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
    
    -- Получаем позицию меню
    local menuCenterX = 0.5 * gui.AbsoluteSize.X
    local menuCenterY = 0.5 * gui.AbsoluteSize.Y
    local menuWidth = 760
    local menuHeight = 400
    
    -- Размещаем звёзды по периметру меню
    local side = math.random(1, 4)
    local x, y
    
    if side == 1 then -- Сверху
        x = menuCenterX + (math.random() - 0.5) * (menuWidth + 150)
        y = menuCenterY - menuHeight/2 - math.random(20, 120)
    elseif side == 2 then -- Справа
        x = menuCenterX + menuWidth/2 + math.random(20, 120)
        y = menuCenterY + (math.random() - 0.5) * (menuHeight + 100)
    elseif side == 3 then -- Снизу
        x = menuCenterX + (math.random() - 0.5) * (menuWidth + 150)
        y = menuCenterY + menuHeight/2 + math.random(20, 120)
    else -- Слева
        x = menuCenterX - menuWidth/2 - math.random(20, 120)
        y = menuCenterY + (math.random() - 0.5) * (menuHeight + 100)
    end
    
    star.Position = UDim2.new(0, x, 0, y)
    
    -- Скорость движения
    local speedX = (math.random() - 0.5) * 1.0
    local speedY = (math.random() - 0.5) * 1.0
    
    -- Сохраняем данные
    local data = {
        star = star,
        x = x,
        y = y,
        speedX = speedX,
        speedY = speedY,
        size = size
    }
    table.insert(starData, data)
    
    -- Анимация вращения
    tweenService:Create(star, TweenInfo.new(2 + math.random() * 3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Rotation = 360
    }):Play()
    
    -- Мерцание
    tweenService:Create(star, TweenInfo.new(1 + math.random() * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        BackgroundTransparency = 0.1 + math.random(0, 60) / 100
    }):Play()
    
    -- Пульсация размера
    tweenService:Create(star, TweenInfo.new(1.5 + math.random() * 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Size = UDim2.new(0, size + math.random(2, 4), 0, size + math.random(2, 4))
    }):Play()
    
    return star
end

-- Создаём 60 звёзд
for i = 1, 60 do
    createStar()
end

-- Движение звёзд
game:GetService("RunService").RenderStepped:Connect(function()
    local menuCenterX = 0.5 * gui.AbsoluteSize.X
    local menuCenterY = 0.5 * gui.AbsoluteSize.Y
    local menuWidth = 760
    local menuHeight = 400
    
    for _, data in pairs(starData) do
        if data.star and data.star.Parent then
            data.x = data.x + data.speedX
            data.y = data.y + data.speedY
            
            -- Отталкивание от центра меню
            local dx = data.x - menuCenterX
            local dy = data.y - menuCenterY
            local dist = math.sqrt(dx*dx + dy*dy)
            
            -- Минимальное расстояние от центра (чтобы не залетали внутрь)
            local minDist = math.max(menuWidth/2 + 30, menuHeight/2 + 30)
            if dist < minDist then
                local pushX = (dx / (dist + 0.001)) * 0.8
                local pushY = (dy / (dist + 0.001)) * 0.8
                data.x = data.x + pushX
                data.y = data.y + pushY
            end
            
            -- Телепортация за границы
            if data.x < -100 then data.x = gui.AbsoluteSize.X + 100 end
            if data.x > gui.AbsoluteSize.X + 100 then data.x = -100 end
            if data.y < -100 then data.y = gui.AbsoluteSize.Y + 100 end
            if data.y > gui.AbsoluteSize.Y + 100 then data.y = -100 end
            
            data.star.Position = UDim2.new(0, data.x, 0, data.y)
        end
    end
end)

-- ============================================================
--  ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
header.BackgroundTransparency = 0.1
header.BorderSizePixel = 0
header.Parent = frame

-- ===== БЕЛАЯ НАКЛОННАЯ БУКВА "L" =====
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

-- ===== НАЗВАНИЕ =====
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

mButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    mButton.Visible = false
end)

-- ============================================================
--  КОНТЕНТ
-- ============================================================
local contentPanel = Instance.new("Frame")
contentPanel.Size = UDim2.new(1, 0, 1, -105)
contentPanel.Position = UDim2.new(0, 0, 0, 55)
contentPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
contentPanel.BackgroundTransparency = 0.05
contentPanel.BorderSizePixel = 0
contentPanel.Parent = frame

-- ============================================================
--  НИЖНЯЯ ПАНЕЛЬ С ВКЛАДКАМИ
-- ============================================================
local bottomBar = Instance.new("Frame")
bottomBar.Size = UDim2.new(1, 0, 0, 50)
bottomBar.Position = UDim2.new(0, 0, 1, -50)
bottomBar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
bottomBar.BackgroundTransparency = 0.1
bottomBar.BorderSizePixel = 0
bottomBar.Parent = frame

-- ============================================================
--  ВКЛАДКИ
-- ============================================================
local tabNames = {"VISUALS", "AIMBOT", "FUNCTIONS"}
local tabButtons = {}
local contentFrames = {}

for i, tabName in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.333, 0, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.333, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.BackgroundTransparency = 0.5
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
    content.BackgroundTransparency = 0.2
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

-- ============================================================
--  F1
-- ============================================================
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
        end
    end
end)

frame:GetPropertyChangedSignal("Visible"):Connect(function()
    if not frame.Visible then
        mButton.Visible = true
    end
end)

print("✅ Letunium Hub загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("📁 Вкладки: VISUALS | AIMBOT | FUNCTIONS")
print("✨ Звёзды летают вокруг меню!")
