-- =====================================================
--  Aqwarium HUB (AX-SCRIPTS STYLE)
--  Вкладки: Games | Player | Misc | Combat (слева)
--  С правой стороны: пустые блоки с серыми разделителями
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =====================================================
--  ОСНОВНОЕ ОКНО (600x400)
-- =====================================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Скругление
local mainCorners = Instance.new("UICorner")
mainCorners.CornerRadius = UDim.new(0, 12)
mainCorners.Parent = mainFrame

-- Белая обводка
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.7
stroke.Thickness = 1
stroke.Parent = mainFrame

-- =====================================================
--  ЗАГОЛОВОК
-- =====================================================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
title.BackgroundTransparency = 0.3
title.BorderSizePixel = 0
title.Text = "Aqwarium HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = mainFrame

local titleCorners = Instance.new("UICorner")
titleCorners.CornerRadius = UDim.new(0, 12)
titleCorners.Parent = title

-- Кнопки свернуть/закрыть (как в AX)
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0.5, -15)
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
minBtn.BackgroundTransparency = 0.5
minBtn.BorderSizePixel = 0
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 20
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = title

local minCorners = Instance.new("UICorner")
minCorners.CornerRadius = UDim.new(0, 6)
minCorners.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
closeBtn.BackgroundTransparency = 0.5
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = title

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 6)
closeCorners.Parent = closeBtn

minBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- =====================================================
--  ЛЕВАЯ ПАНЕЛЬ (вкладки) — 20% ширины
-- =====================================================
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0.2, 0, 1, -40)
leftPanel.Position = UDim2.new(0, 0, 0, 40)
leftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
leftPanel.BackgroundTransparency = 0
leftPanel.BorderSizePixel = 0
leftPanel.ClipsDescendants = true
leftPanel.Parent = mainFrame

local leftCorners = Instance.new("UICorner")
leftCorners.CornerRadius = UDim.new(0, 6)
leftCorners.Parent = leftPanel

-- Вертикальное расположение кнопок
local layoutLeft = Instance.new("UIListLayout")
layoutLeft.FillDirection = Enum.FillDirection.Vertical
layoutLeft.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutLeft.VerticalAlignment = Enum.VerticalAlignment.Top
layoutLeft.Padding = UDim.new(0, 8)
layoutLeft.Parent = leftPanel

-- =====================================================
--  ПРАВАЯ ПАНЕЛЬ (контент) — 80% ширины
-- =====================================================
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0.8, 0, 1, -40)
rightPanel.Position = UDim2.new(0.2, 0, 0, 40)
rightPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
rightPanel.BackgroundTransparency = 0.1
rightPanel.BorderSizePixel = 0
rightPanel.ClipsDescendants = true
rightPanel.Parent = mainFrame

local rightCorners = Instance.new("UICorner")
rightCorners.CornerRadius = UDim.new(0, 6)
rightCorners.Parent = rightPanel

-- =====================================================
--  ВКЛАДКИ: Games, Player, Misc, Combat
-- =====================================================
local tabButtons = {}
local tabNames = {"Games", "Player", "Misc", "Combat"}

-- Функция создания кнопки вкладки
local function createTabButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 16
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = leftPanel

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 6)
    btnCorners.Parent = btn

    -- Эффект наведения
    btn.MouseEnter:Connect(function()
        if btn.BackgroundTransparency > 0.1 then
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            btn.BackgroundTransparency = 0.2
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundTransparency < 0.9 then
            btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
            btn.BackgroundTransparency = 0.5
        end
    end)

    return btn
end

-- Создаём кнопки и контейнеры для правой панели
local rightContentFrames = {}

for i, name in ipairs(tabNames) do
    -- Кнопка
    local btn = createTabButton(name)
    tabButtons[name] = btn

    -- Контейнер для правой панели (каждая вкладка – свой фрейм)
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -10, 1, -10)
    content.Position = UDim2.new(0, 5, 0, 5)
    content.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    content.BackgroundTransparency = 0.2
    content.BorderSizePixel = 0
    content.Visible = (i == 1)  -- первая видна
    content.Parent = rightPanel

    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 6)
    contentCorners.Parent = content

    -- Добавляем серые горизонтальные разделители (по 3 штуки, как в AX)
    local lines = {}
    for j = 1, 3 do
        local line = Instance.new("Frame")
        line.Size = UDim2.new(0.9, 0, 0, 2)
        line.Position = UDim2.new(0.05, 0, j * 0.3, 0)  -- распределяем по высоте
        line.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        line.BackgroundTransparency = 0.3
        line.BorderSizePixel = 0
        line.Parent = content
        lines[j] = line
    end

    -- Текст-заглушка для каждой вкладки (можно убрать, если не нужно)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, 0, 0, 30)
    label.Position = UDim2.new(0.05, 0, 0.05, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 20
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = content

    -- Небольшой описательный текст (для антуража)
    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(0.5, 0, 0, 20)
    desc.Position = UDim2.new(0.05, 0, 0.12, 0)
    desc.BackgroundTransparency = 1
    desc.Text = "Настройки для " .. name
    desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    desc.TextSize = 14
    desc.Font = Enum.Font.GothamMedium
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.Parent = content

    rightContentFrames[name] = content
end

-- =====================================================
--  ОБРАБОТЧИКИ КЛИКОВ (переключение вкладок)
-- =====================================================
for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        -- Скрываем все контейнеры, показываем выбранный
        for n, frame in pairs(rightContentFrames) do
            frame.Visible = (n == name)
        end

        -- Визуальное выделение кнопки (акцентный красный)
        for n, b in pairs(tabButtons) do
            if n == name then
                b.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
                b.BackgroundTransparency = 0.2
                b.TextColor3 = Color3.fromRGB(255, 120, 120)
            else
                b.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                b.BackgroundTransparency = 0.5
                b.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end)
end

-- Устанавливаем начальное выделение на первую вкладку (Games)
tabButtons["Games"].BackgroundColor3 = Color3.fromRGB(50, 20, 20)
tabButtons["Games"].BackgroundTransparency = 0.2
tabButtons["Games"].TextColor3 = Color3.fromRGB(255, 120, 120)

-- =====================================================
--  ДЕКОРАТИВНАЯ КРАСНАЯ ЛИНИЯ ПОД ЗАГОЛОВКОМ
-- =====================================================
local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(0.3, 0, 0, 2)
accentLine.Position = UDim2.new(0.35, 0, 0, 38)
accentLine.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
accentLine.BackgroundTransparency = 0.6
accentLine.BorderSizePixel = 0
accentLine.Parent = mainFrame

print("✅ Aqwarium HUB с вкладками Games, Player, Misc, Combat загружен!")
print("🔹 Используй кнопки слева для переключения.")
