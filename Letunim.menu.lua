-- =====================================================
--  Aqwarium HUB (AX-SCRIPTS STYLE)
--  3 колонки: навигация | настройки | конфигурация
--  Цвета: чёрный матовый, тёмно-серый, красный акцент
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =====================================================
--  ОСНОВНОЕ ОКНО (соотношение 1.5 : 1)
-- =====================================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)          -- ширина 600, высота 400 (1.5:1)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- матовый чёрный
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Скругление главного окна (12px)
local mainCorners = Instance.new("UICorner")
mainCorners.CornerRadius = UDim.new(0, 12)
mainCorners.Parent = mainFrame

-- Тонкая белая обводка (для стиля)
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.7
stroke.Thickness = 1
stroke.Parent = mainFrame

-- =====================================================
--  ЗАГОЛОВОК (опционально, можно убрать)
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

-- =====================================================
--  КОЛОНКИ (20% | 45% | 35%)
-- =====================================================

-- 1. ЛЕВАЯ ПАНЕЛЬ (навигация) — 20% ширины
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0.2, 0, 1, -40)         -- 20% ширины, высота без заголовка
leftPanel.Position = UDim2.new(0, 0, 0, 40)        -- под заголовком
leftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
leftPanel.BackgroundTransparency = 0
leftPanel.BorderSizePixel = 0
leftPanel.ClipsDescendants = true
leftPanel.Parent = mainFrame

-- Скругление для левой панели (только нижние углы, но для простоты сделаем все)
local leftCorners = Instance.new("UICorner")
leftCorners.CornerRadius = UDim.new(0, 6)
leftCorners.Parent = leftPanel

-- Вертикальное расположение кнопок
local layoutLeft = Instance.new("UIListLayout")
layoutLeft.FillDirection = Enum.FillDirection.Vertical
layoutLeft.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutLeft.VerticalAlignment = Enum.VerticalAlignment.Top
layoutLeft.Padding = UDim.new(0, 6)
layoutLeft.Parent = leftPanel

-- 2. ЦЕНТРАЛЬНАЯ ПАНЕЛЬ (настройки) — 45% ширины
local centerPanel = Instance.new("Frame")
centerPanel.Size = UDim2.new(0.45, 0, 1, -40)
centerPanel.Position = UDim2.new(0.2, 0, 0, 40)
centerPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
centerPanel.BackgroundTransparency = 0.1
centerPanel.BorderSizePixel = 0
centerPanel.ClipsDescendants = true
centerPanel.Parent = mainFrame

local centerCorners = Instance.new("UICorner")
centerCorners.CornerRadius = UDim.new(0, 6)
centerCorners.Parent = centerPanel

-- 3. ПРАВАЯ ПАНЕЛЬ (конфигурация) — 35% ширины
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0.35, 0, 1, -40)
rightPanel.Position = UDim2.new(0.65, 0, 0, 40)
rightPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
rightPanel.BackgroundTransparency = 0.1
rightPanel.BorderSizePixel = 0
rightPanel.ClipsDescendants = true
rightPanel.Parent = mainFrame

local rightCorners = Instance.new("UICorner")
rightCorners.CornerRadius = UDim.new(0, 6)
rightCorners.Parent = rightPanel

-- =====================================================
--  КНОПКИ НАВИГАЦИИ (ЛЕВАЯ ПАНЕЛЬ)
-- =====================================================
local navButtons = {}
local navNames = {"Visuals", "Aimbot", "Movement", "Misc"}

for i, name in ipairs(navNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)          -- 90% ширины панели, высота 40
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
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
        btn.BackgroundTransparency = 0.2
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundTransparency < 0.9 then
            btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
            btn.BackgroundTransparency = 0.5
        end
    end)

    navButtons[name] = btn
end

-- =====================================================
--  КОНТЕНТ ЦЕНТРАЛЬНОЙ ПАНЕЛИ (переключается по клику)
-- =====================================================
local centerContent = {}

-- Создаём фрейм для каждой вкладки (виден только активный)
for _, name in ipairs(navNames) do
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -10, 1, -10)
    content.Position = UDim2.new(0, 5, 0, 5)
    content.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    content.BackgroundTransparency = 0.2
    content.BorderSizePixel = 0
    content.Visible = (name == "Visuals")  -- по умолчанию первая
    content.Parent = centerPanel

    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 6)
    contentCorners.Parent = content

    -- Заглушка: текст с названием вкладки
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name .. "\n(настройки)"
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 22
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Parent = content

    centerContent[name] = content
end

-- =====================================================
--  КОНТЕНТ ПРАВОЙ ПАНЕЛИ (информация о выбранной вкладке)
-- =====================================================
local rightLabel = Instance.new("TextLabel")
rightLabel.Size = UDim2.new(1, -10, 1, -10)
rightLabel.Position = UDim2.new(0, 5, 0, 5)
rightLabel.BackgroundTransparency = 1
rightLabel.Text = "Выберите\nкатегорию\nслева"
rightLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
rightLabel.TextSize = 18
rightLabel.Font = Enum.Font.GothamMedium
rightLabel.TextXAlignment = Enum.TextXAlignment.Center
rightLabel.TextYAlignment = Enum.TextYAlignment.Center
rightLabel.Parent = rightPanel

-- =====================================================
--  ОБРАБОТЧИКИ КЛИКОВ ПО КНОПКАМ
-- =====================================================
for name, btn in pairs(navButtons) do
    btn.MouseButton1Click:Connect(function()
        -- Показать нужный контент в центре
        for n, content in pairs(centerContent) do
            content.Visible = (n == name)
        end
        -- Обновить правую панель
        rightLabel.Text = "Категория:\n" .. name .. "\n(доп. настройки)"

        -- Визуальное выделение кнопки (акцентный красный цвет)
        for n, b in pairs(navButtons) do
            if n == name then
                b.BackgroundColor3 = Color3.fromRGB(50, 20, 20)   -- тёмно-красный
                b.BackgroundTransparency = 0.2
                b.TextColor3 = Color3.fromRGB(255, 120, 120)    -- светлый красный
            else
                b.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                b.BackgroundTransparency = 0.5
                b.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end)
end

-- Установить начальное выделение на "Visuals"
navButtons["Visuals"].BackgroundColor3 = Color3.fromRGB(50, 20, 20)
navButtons["Visuals"].BackgroundTransparency = 0.2
navButtons["Visuals"].TextColor3 = Color3.fromRGB(255, 120, 120)

-- =====================================================
--  ДОПОЛНИТЕЛЬНЫЙ СТИЛЬ: АКЦЕНТНЫЙ КРАСНЫЙ ДЛЯ ЗАГОЛОВКА
-- =====================================================
-- Можно добавить красную полоску под заголовком или изменить цвет текста
local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(0.3, 0, 0, 2)
accentLine.Position = UDim2.new(0.35, 0, 0, 38)
accentLine.BackgroundColor3 = Color3.fromRGB(180, 40, 40)   -- бордовый
accentLine.BackgroundTransparency = 0.6
accentLine.BorderSizePixel = 0
accentLine.Parent = mainFrame

print("✅ Aqwarium HUB (AX-SCRIPTS style) загружен!")
print("🔹 Используй кнопки слева для навигации.")
