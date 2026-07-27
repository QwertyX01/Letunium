-- =====================================================
--  Aqwarium HUB - ЧЁРНОЕ МАТОВОЕ МЕНЮ С ОБВОДКОЙ
--  by Tormentor412
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =====================================================
--  ОСНОВНАЯ ПАНЕЛЬ (ширина 760, чёрный матовый)
-- =====================================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 760, 0, 520)          -- ширина 760
mainFrame.Position = UDim2.new(0.5, -380, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- почти чёрный
mainFrame.BackgroundTransparency = 0.05             -- лёгкая полупрозрачность для матовости
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Скругление углов
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 10)
corners.Parent = mainFrame

-- БЕЛАЯ НЕЗАМЕТНАЯ ОБВОДКА (UIStroke)
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.7        -- почти прозрачная
stroke.Thickness = 1             -- тонкая
stroke.Parent = mainFrame

-- =====================================================
--  ЗАГОЛОВОК
-- =====================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
header.BackgroundTransparency = 0.3
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 10)
headerCorners.Parent = header

-- Название
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.04, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Aqwarium HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = header

-- Декоративная линия
local underline = Instance.new("Frame")
underline.Size = UDim2.new(0.4, 0, 0, 2)
underline.Position = UDim2.new(0.04, 0, 1, -4)
underline.BackgroundColor3 = Color3.fromRGB(255, 120, 180)
underline.BackgroundTransparency = 0.4
underline.BorderSizePixel = 0
underline.Parent = header

-- Кнопка "свернуть"
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 32, 0, 32)
minBtn.Position = UDim2.new(1, -74, 0.5, -16)
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
minBtn.BackgroundTransparency = 0.4
minBtn.BorderSizePixel = 0
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 22
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = header

local minCorners = Instance.new("UICorner")
minCorners.CornerRadius = UDim.new(0, 6)
minCorners.Parent = minBtn

-- Кнопка "закрыть"
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -38, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
closeBtn.BackgroundTransparency = 0.4
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = header

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
--  ВКЛАДКИ
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
    btn.BackgroundTransparency = 0.4
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = (i == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
    btn.TextSize = 15
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = tabsFrame
    tabButtons[i] = btn

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 6)
    btnCorners.Parent = btn

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -20, 1, -100)
    content.Position = UDim2.new(0, 10, 0, 95)
    content.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    content.BackgroundTransparency = 0.2
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
--  НАПОЛНЕНИЕ ВКЛАДКИ ESP (переключатели)
-- =====================================================
local espContent = tabContents[1]

local function createCheckbox(parent, text, y, defaultState)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 32)
    frame.Position = UDim2.new(0, 5, 0, y)
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = (defaultState and "☑ " or "☐ ") .. text
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.TextSize = 16
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

local y = 5
createCheckbox(espContent, "ESP (Enabled)", y, true)
y = y + 37
createCheckbox(espContent, "Box (Outline)", y, true)
y = y + 37
createCheckbox(espContent, "Name (Above)", y, true)
y = y + 37
createCheckbox(espContent, "Distance", y, false)
y = y + 37
createCheckbox(espContent, "Health Bar", y, true)
y = y + 37

-- Цвет
local colorFrame = Instance.new("Frame")
colorFrame.Size = UDim2.new(1, -10, 0, 32)
colorFrame.Position = UDim2.new(0, 5, 0, y)
colorFrame.BackgroundTransparency = 1
colorFrame.Parent = espContent

local colorLabel = Instance.new("TextLabel")
colorLabel.Size = UDim2.new(0.6, 0, 1, 0)
colorLabel.BackgroundTransparency = 1
colorLabel.Text = "●───────○─────────── Color: Red"
colorLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
colorLabel.TextSize = 16
colorLabel.Font = Enum.Font.GothamMedium
colorLabel.TextXAlignment = Enum.TextXAlignment.Left
colorLabel.Parent = colorFrame

local colorBtn = Instance.new("TextButton")
colorBtn.Size = UDim2.new(0.25, 0, 1, 0)
colorBtn.Position = UDim2.new(0.72, 0, 0, 0)
colorBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
colorBtn.BackgroundTransparency = 0
colorBtn.BorderSizePixel = 0
colorBtn.Text = ""
colorBtn.Parent = colorFrame

local colorCorners = Instance.new("UICorner")
colorCorners.CornerRadius = UDim.new(0, 6)
colorCorners.Parent = colorBtn

local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,200,255), Color3.fromRGB(255,255,0)}
local colorIndex = 1
colorBtn.MouseButton1Click:Connect(function()
    colorIndex = colorIndex % #colors + 1
    colorBtn.BackgroundColor3 = colors[colorIndex]
    local names = {"Red", "Green", "Cyan", "Yellow"}
    colorLabel.Text = "●───────○─────────── Color: " .. names[colorIndex]
end)

y = y + 42

-- Дистанция
local distFrame = Instance.new("Frame")
distFrame.Size = UDim2.new(1, -10, 0, 32)
distFrame.Position = UDim2.new(0, 5, 0, y)
distFrame.BackgroundTransparency = 1
distFrame.Parent = espContent

local distLabel = Instance.new("TextLabel")
distLabel.Size = UDim2.new(0.6, 0, 1, 0)
distLabel.BackgroundTransparency = 1
distLabel.Text = "[─────────────────]  Distance: 300"
distLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
distLabel.TextSize = 16
distLabel.Font = Enum.Font.GothamMedium
distLabel.TextXAlignment = Enum.TextXAlignment.Left
distLabel.Parent = distFrame

local distSlider = Instance.new("TextButton")
distSlider.Size = UDim2.new(0.25, 0, 1, 0)
distSlider.Position = UDim2.new(0.72, 0, 0, 0)
distSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
distSlider.BackgroundTransparency = 0.3
distSlider.BorderSizePixel = 0
distSlider.Text = "300"
distSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
distSlider.TextSize = 16
distSlider.Font = Enum.Font.GothamMedium
distSlider.Parent = distFrame

local distCorners = Instance.new("UICorner")
distCorners.CornerRadius = UDim.new(0, 6)
distCorners.Parent = distSlider

local distValues = {100, 200, 300, 400, 500}
local distIndex = 3
distSlider.MouseButton1Click:Connect(function()
    distIndex = distIndex % #distValues + 1
    local val = distValues[distIndex]
    distSlider.Text = tostring(val)
    distLabel.Text = "[─────────────────]  Distance: " .. tostring(val)
end)

-- =====================================================
--  СТАТУСНАЯ СТРОКА
-- =====================================================
local statusBar = Instance.new("Frame")
statusBar.Size = UDim2.new(1, -20, 0, 32)
statusBar.Position = UDim2.new(0, 10, 1, -42)
statusBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
statusBar.BackgroundTransparency = 0.3
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
statusText.TextSize = 14
statusText.Font = Enum.Font.GothamMedium
statusText.TextXAlignment = Enum.TextXAlignment.Center
statusText.Parent = statusBar

game:GetService("RunService").RenderStepped:Connect(function()
    local count = #game.Players:GetPlayers()
    statusText.Text = "Status: ESP Active  |  Players: " .. count .. "/16"
end)

print("✅ Aqwarium HUB (матовый, ширина 760, обводка) загружен!")
