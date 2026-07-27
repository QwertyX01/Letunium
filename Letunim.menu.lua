-- =====================================================
--  Aqwarium HUB - ПУСТОЕ ЧЁРНОЕ МЕНЮ С ОБВОДКОЙ
--  Размер: 545x388
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Основное окно (545x388)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 545, 0, 388)
mainFrame.Position = UDim2.new(0.5, -272.5, 0.5, -194) -- центрирование
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)   -- чисто чёрный
mainFrame.BackgroundTransparency = 0                  -- полностью непрозрачный
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true                            -- можно перетаскивать
mainFrame.Parent = gui

-- Скругление углов (по желанию, можно убрать)
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 8)                 -- лёгкое закругление
corners.Parent = mainFrame

-- Белая обводка (тонкая, полупрозрачная)
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.5                             -- полупрозрачная, чтобы не резала глаз
stroke.Thickness = 1                                  -- толщина 1 пиксель
stroke.Parent = mainFrame

print("✅ Пустое чёрное меню 545x388 загружено!")
