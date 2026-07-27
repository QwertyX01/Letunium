-- =====================================================
--  Aqwarium HUB - ЧЁРНОЕ МЕНЮ С ЗАГОЛОВКОМ
--  Размер: 545x388, белая обводка
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

-- Скругление углов
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 8)
corners.Parent = mainFrame

-- Белая обводка
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.5
stroke.Thickness = 1
stroke.Parent = mainFrame

-- =====================================================
--  ЗАГОЛОВОК "Aqwarium Hub" (сверху)
-- =====================================================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)          -- растянуть по ширине, высота 50
title.Position = UDim2.new(0, 0, 0, 10)      -- отступ сверху 10
title.BackgroundTransparency = 1
title.Text = "Aqwarium Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 32
title.Font = Enum.Font.GothamBold             -- красивый жирный шрифт
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = mainFrame

-- Декоративная линия под заголовком (опционально)
local line = Instance.new("Frame")
line.Size = UDim2.new(0.4, 0, 0, 2)
line.Position = UDim2.new(0.3, 0, 0, 62)      -- под текстом
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 0.6
line.BorderSizePixel = 0
line.Parent = mainFrame

print("✅ Aqwarium Hub с заголовком загружен!")
