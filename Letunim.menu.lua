-- =====================================================
--  Aqwarium HUB - ВКЛАДКИ (Games, Players, Miscs, Settings)
--  Размер: 545x388, чёрный фон, обводка
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Основное окно
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 545, 0, 388)
mainFrame.Position = UDim2.new(0.5, -272.5, 0.5, -194)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Скругление углов окна
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 8)
corners.Parent = mainFrame

-- Белая обводка
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.5
stroke.Thickness = 1
stroke.Parent = mainFrame

-- Заголовок "Aqwarium Hub"
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Aqwarium Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 32
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = mainFrame

-- Декоративная линия под заголовком
local line = Instance.new("Frame")
line.Size = UDim2.new(0.4, 0, 0, 2)
line.Position = UDim2.new(0.3, 0, 0, 62)
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 0.6
line.BorderSizePixel = 0
line.Parent = mainFrame

-- =====================================================
--  ПАНЕЛЬ ВКЛАДОК (горизонтально, под линией)
-- =====================================================
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -20, 0, 40)
tabsFrame.Position = UDim2.new(0, 10, 0, 68)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = mainFrame

-- Массивы для кнопок и контента
local tabButtons = {}
local tabContents = {}
local tabNames = {"Games", "Players", "Miscs", "Settings"}

-- Создаём кнопки вкладок (равномерно по ширине)
local tabWidth = 0.25  -- каждая занимает 1/4

for i, name in ipairs(tabNames) do
    -- Кнопка вкладки
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(tabWidth, -6, 1, 0)
    btn.Position = UDim2.new((i-1)*tabWidth, 3, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.BackgroundTransparency = 0.4
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.TextSize = 18
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = tabsFrame

    -- Скругление углов кнопки (мягкое)
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 10)
    btnCorners.Parent = btn

    -- Эффект наведения
    btn.MouseEnter:Connect(function()
        if btn.BackgroundTransparency > 0.2 then
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
            btn.BackgroundTransparency = 0.2
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundTransparency > 0.2 then
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            btn.BackgroundTransparency = 0.4
        end
    end)

    tabButtons[i] = btn

    -- Контент для вкладки (основная область)
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -20, 1, -120)
    content.Position = UDim2.new(0, 10, 0, 115)
    content.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    content.BackgroundTransparency = 0.2
    content.BorderSizePixel = 0
    content.Visible = (i == 1)  -- первая активна по умолчанию
    content.Parent = mainFrame

    -- Закругление для контента
    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 8)
    contentCorners.Parent = content

    -- Заглушка: текст внутри контента (название вкладки)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = name .. "\n(пусто)"
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 28
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.Parent = content

    tabContents[i] = content
end

-- Обработка кликов по вкладкам
for i, btn in ipairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        for j = 1, #tabButtons do
            -- Показываем только выбранный контент
            tabContents[j].Visible = (j == i)
            -- Меняем внешний вид кнопок
            if j == i then
                tabButtons[j].BackgroundColor3 = Color3.fromRGB(80, 80, 100)
                tabButtons[j].BackgroundTransparency = 0.1
                tabButtons[j].TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                tabButtons[j].BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                tabButtons[j].BackgroundTransparency = 0.4
                tabButtons[j].TextColor3 = Color3.fromRGB(220, 220, 220)
            end
        end
    end)
end

-- Устанавливаем начальное состояние (активна первая)
tabButtons[1].BackgroundColor3 = Color3.fromRGB(80, 80, 100)
tabButtons[1].BackgroundTransparency = 0.1
tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

print("✅ Aqwarium Hub с вкладками Games, Players, Miscs, Settings загружен!")
