-- =====================================================
--  Aqwarium HUB - МЕНЮ В СТИЛЕ AX-SCRIPT
--  by Tormentor412
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =====================================================
--  ОСНОВНАЯ ПАНЕЛЬ
-- =====================================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 520)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Скругление углов
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 10)
corners.Parent = mainFrame

-- =====================================================
--  ЗАГОЛОВОК С НАЗВАНИЕМ "Aqwarium HUB"
-- =====================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
header.BackgroundTransparency = 0.2
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 10)
headerCorners.Parent = header

-- Название (красивый шрифт)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.04, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Aqwarium HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold  -- жирный современный шрифт
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = header

-- Маленькая декоративная линия под названием (опционально)
local underline = Instance.new("Frame")
underline.Size = UDim2.new(0.5, 0, 0, 2)
underline.Position = UDim2.new(0.04, 0, 1, -4)
underline.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
underline.BackgroundTransparency = 0.3
underline.BorderSizePixel = 0
underline.Parent = header

-- Кнопка "свернуть" ( — )
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0.5, -15)
minBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
minBtn.BackgroundTransparency = 0.5
minBtn.BorderSizePixel = 0
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 20
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = header

local minCorners = Instance.new("UICorner")
minCorners.CornerRadius = UDim.new(0, 6)
minCorners.Parent = minBtn

-- Кнопка "закрыть" ( ✕ )
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
closeBtn.BackgroundTransparency = 0.5
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 6)
closeCorners.Parent = closeBtn

-- Действия кнопок
minBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- =====================================================
--  ВКЛАДКИ (ESP, AIMBOT, MOVEMENT, MISC)
-- =====================================================
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, -20, 0, 40)
tabsFrame.Position = UDim2.new(0, 10, 0, 50)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = mainFrame

local tabButtons = {}
local tabContents = {}
local tabNames = {"ESP", "AIMBOT", "MOVEMENT", "MISC"}

for i, name in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.25, -4, 1, 0)
    btn.Position = UDim2.new((i-1)*0.25, 2, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.BackgroundTransparency = 0.3
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = (i == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = tabsFrame
    tabButtons[i] = btn
    
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 6)
    btnCorners.Parent = btn
    
    -- Контент для вкладки
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -20, 1, -100)
    content.Position = UDim2.new(0, 10, 0, 95)
    content.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    content.BackgroundTransparency = 0.1
    content.BorderSizePixel = 0
    content.Visible = (i == 1)
    content.Parent = mainFrame
    
    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 8)
    contentCorners.Parent = content
    
    tabContents[i] = content
    
    btn.MouseButton1Click:Connect(function()
        for j = 1, #tabNames do
            tabContents[j].Visible = (j == i)
            tabButtons[j].TextColor3 = (j == i) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
        end
    end)
end

-- =====================================================
--  НАПОЛНЕНИЕ ВКЛАДКИ ESP (пустые переключатели)
-- =====================================================
local espContent = tabContents[1]

-- Функция создания переключателя (checkbox)
local function createCheckbox(parent, text, y, defaultState)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 30)
    frame.Position = UDim2.new(0, 5, 0, y)
    frame.BackgroundTransparency = 1
    frame.Parent = parent
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = (defaultState and "☑ " or "☐ ") .. text
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.TextSize = 15
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = frame
    
    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = (state and "☑ " or "☐ ") .. text
    end)
    
    return btn
end

-- Создаём элементы на вкладке ESP
local y = 5
createCheckbox(espContent, "ESP (Enabled)", y, true)
y = y + 35
createCheckbox(espContent, "Box (Outline)", y, true)
y = y + 35
createCheckbox(espContent, "Name (Above)", y, true)
y = y + 35
createCheckbox(espContent, "Distance", y, false)
y = y + 35
createCheckbox(espContent, "Health Bar", y, true)
y = y + 35

-- Ползунок цвета (имитация)
local colorFrame = Instance.new("Frame")
colorFrame.Size = UDim2.new(1, -10, 0, 30)
colorFrame.Position = UDim2.new(0, 5, 0, y)
colorFrame.BackgroundTransparency = 1
colorFrame.Parent = espContent

local colorLabel = Instance.new("TextLabel")
colorLabel.Size = UDim2.new(0.6, 0, 1, 0)
colorLabel.BackgroundTransparency = 1
colorLabel.Text = "●───────○─────────── Color: Red"
colorLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
colorLabel.TextSize = 15
colorLabel.Font = Enum.Font.GothamMedium
colorLabel.TextXAlignment = Enum.TextXAlignment.Left
colorLabel.Parent = colorFrame

local colorBtn = Instance.new("TextButton")
colorBtn.Size = UDim2.new(0.3, 0, 1, 0)
colorBtn.Position = UDim2.new(0.7, 0, 0, 0)
colorBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
colorBtn.BackgroundTransparency = 0
colorBtn.BorderSizePixel = 0
colorBtn.Text = ""
colorBtn.Parent = colorFrame

local colorCorners = Instance.new("UICorner")
colorCorners.CornerRadius = UDim.new(0, 6)
colorCorners.Parent = colorBtn

-- При клике меняем цвет (для демонстрации)
local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,200,255), Color3.fromRGB(255,255,0)}
local colorIndex = 1
colorBtn.MouseButton1Click:Connect(function()
    colorIndex = colorIndex % #colors + 1
    colorBtn.BackgroundColor3 = colors[colorIndex]
    local names = {"Red", "Green", "Cyan", "Yellow"}
    colorLabel.Text = "●───────○─────────── Color: " .. names[colorIndex]
end)

y = y + 40

-- Ползунок дистанции (имитация)
local distFrame = Instance.new("Frame")
distFrame.Size = UDim2.new(1, -10, 0, 30)
distFrame.Position = UDim2.new(0, 5, 0, y)
distFrame.BackgroundTransparency = 1
distFrame.Parent = espContent

local distLabel = Instance.new("TextLabel")
distLabel.Size = UDim2.new(0.6, 0, 1, 0)
distLabel.BackgroundTransparency = 1
distLabel.Text = "[─────────────────]  Distance: 300"
distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
distLabel.TextSize = 15
distLabel.Font = Enum.Font.GothamMedium
distLabel.TextXAlignment = Enum.TextXAlignment.Left
distLabel.Parent = distFrame

local distSlider = Instance.new("TextButton")
distSlider.Size = UDim2.new(0.3, 0, 1, 0)
distSlider.Position = UDim2.new(0.7, 0, 0, 0)
distSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
distSlider.BackgroundTransparency = 0.3
distSlider.BorderSizePixel = 0
distSlider.Text = "300"
distSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
distSlider.TextSize = 14
distSlider.Font = Enum.Font.GothamMedium
distSlider.Parent = distFrame

local distCorners = Instance.new("UICorner")
distCorners.CornerRadius = UDim.new(0, 6)
distCorners.Parent = distSlider

-- При клике меняем значение (для демонстрации)
local distValues = {100, 200, 300, 400, 500}
local distIndex = 3
distSlider.MouseButton1Click:Connect(function()
    distIndex = distIndex % #distValues + 1
    local val = distValues[distIndex]
    distSlider.Text = tostring(val)
    distLabel.Text = "[─────────────────]  Distance: " .. tostring(val)
end)

-- =====================================================
--  СТАТУСНАЯ СТРОКА (внизу)
-- =====================================================
local statusBar = Instance.new("Frame")
statusBar.Size = UDim2.new(1, -20, 0, 30)
statusBar.Position = UDim2.new(0, 10, 1, -40)
statusBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
statusBar.BackgroundTransparency = 0.2
statusBar.BorderSizePixel = 0
statusBar.Parent = mainFrame

local statusCorners = Instance.new("UICorner")
statusCorners.CornerRadius = UDim.new(0, 6)
statusCorners.Parent = statusBar

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 1, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Status: ESP Active  |  Players: 12/16"
statusText.TextColor3 = Color3.fromRGB(180, 180, 190)
statusText.TextSize = 13
statusText.Font = Enum.Font.GothamMedium
statusText.TextXAlignment = Enum.TextXAlignment.Center
statusText.Parent = statusBar

-- Обновление статуса (для примера)
game:GetService("RunService").RenderStepped:Connect(function()
    local count = #game.Players:GetPlayers()
    statusText.Text = "Status: ESP Active  |  Players: " .. count .. "/16"
end)

print("✅ Aqwarium HUB загружен!")
