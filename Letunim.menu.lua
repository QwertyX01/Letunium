-- ============================================================
--  MELRELE HUB (ПУСТОЕ МЕНЮ С ВКЛАДКАМИ СНИЗУ)
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Melrele Hub...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MelreleHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ПРИВЕТСТВИЕ
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "MELRELE HUB"
hello.TextColor3 = Color3.fromRGB(255, 50, 50)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
hello.TextStrokeTransparency = 0.3
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ============================================================
--  ОСНОВНОЕ ОКНО
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 500)
frame.Position = UDim2.new(0.5, -200, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 50, 50)
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 16)
corners.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.15
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- ============================================================
--  ЗАГОЛОВОК (НАЗВАНИЕ + КРЕСТИК)
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
header.BackgroundTransparency = 0.1
header.BorderSizePixel = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 16)
headerCorners.Parent = header

-- НАЗВАНИЕ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MELRELE"
title.TextColor3 = Color3.fromRGB(255, 50, 50)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- КНОПКА ЗАКРЫТИЯ
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(0.93, 0, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0.1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 8)
closeCorners.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- ============================================================
--  КНОПКА W (ДЛЯ ОТКРЫТИЯ)
-- ============================================================
local wButton = Instance.new("TextButton")
wButton.Size = UDim2.new(0, 55, 0, 55)
wButton.Position = UDim2.new(1, -70, 1, -70)
wButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
wButton.BackgroundTransparency = 0.1
wButton.Text = "M"
wButton.TextColor3 = Color3.fromRGB(255, 255, 255)
wButton.TextSize = 28
wButton.Font = Enum.Font.GothamBold
wButton.Visible = false
wButton.Parent = gui

local wCorners = Instance.new("UICorner")
wCorners.CornerRadius = UDim.new(1, 0)
wCorners.Parent = wButton

local wStroke = Instance.new("UIStroke")
wStroke.Thickness = 2
wStroke.Color = Color3.fromRGB(255, 255, 255)
wStroke.Transparency = 0.3
wStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
wStroke.Parent = wButton

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    wButton.Visible = true
end)

wButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    wButton.Visible = false
end)

-- ============================================================
--  КОНТЕЙНЕР ДЛЯ КОНТЕНТА (ПУСТОЙ)
-- ============================================================
local contentPanel = Instance.new("Frame")
contentPanel.Size = UDim2.new(1, 0, 1, -110)
contentPanel.Position = UDim2.new(0, 0, 0, 60)
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

local bottomCorners = Instance.new("UICorner")
bottomCorners.CornerRadius = UDim.new(0, 16)
bottomCorners.Parent = bottomBar

-- ============================================================
--  СОЗДАНИЕ ВКЛАДОК (5 ШТУК)
-- ============================================================
local tabNames = {"VISUALS", "AIMBOT", "FUNCTIONS", "INVENTORY", "CONFIG"}
local tabButtons = {}
local contentFrames = {}
local tweenService = game:GetService("TweenService")

for i, tabName in ipairs(tabNames) do
    -- КНОПКА ВКЛАДКИ
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.2, 0, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.2, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.BackgroundTransparency = 0.5
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = bottomBar
    tabButtons[i] = btn

    -- ПОДЧЁРКИВАНИЕ
    local underline = Instance.new("Frame")
    underline.Size = UDim2.new(0.5, 0, 0, 3)
    underline.Position = UDim2.new(0.25, 0, 1, -3)
    underline.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    underline.BackgroundTransparency = (i == 1) and 0 or 1
    underline.BorderSizePixel = 0
    underline.Parent = btn
    btn:SetAttribute("Underline", underline)

    -- КОНТЕЙНЕР ДЛЯ КОНТЕНТА ВКЛАДКИ (ПУСТОЙ)
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

    -- ПУСТОЙ ТЕКСТ-ЗАГЛУШКА
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = tabName .. "\n\n(функции будут здесь)"
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.TextSize = 14
    label.Font = Enum.Font.GothamLight
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.TextWrapped = true
    label.Parent = content

    -- ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
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

-- АКТИВИРУЕМ ПЕРВУЮ ВКЛАДКУ
tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.93, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "MELRELE HUB | TORMENTOR412"
watermark.TextColor3 = Color3.fromRGB(255, 50, 50)
watermark.TextSize = 11
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.6
watermark.Parent = frame

-- ============================================================
--  ПЕРЕТАСКИВАНИЕ ОКНА
-- ============================================================
local dragging = false
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local pos = input.Position
        if pos.X >= frame.AbsolutePosition.X and pos.X <= frame.AbsolutePosition.X + frame.AbsoluteSize.X and
           pos.Y >= frame.AbsolutePosition.Y and pos.Y <= frame.AbsolutePosition.Y + 60 then
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
--  ХОТКЕЙ F1
-- ============================================================
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if frame then
            frame.Visible = not frame.Visible
            if frame.Visible then
                wButton.Visible = false
            else
                wButton.Visible = true
            end
        end
    end
end)

print("✅ Melrele Hub загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("📁 Вкладки: VISUALS | AIMBOT | FUNCTIONS | INVENTORY | CONFIG")
