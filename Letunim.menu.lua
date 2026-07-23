-- menu.lua (LocalScript в StarterGui)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Создаём главное окно
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "MenuGUI"

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 350, 0, 450)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true

-- Скругление углов
local corners = Instance.new("UICorner")
corners.Parent = mainFrame
corners.CornerRadius = UDim.new(0, 12)

-- Верхняя панель с заголовком
local topBar = Instance.new("Frame")
topBar.Parent = mainFrame
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
topBar.BackgroundTransparency = 0.1
topBar.BorderSizePixel = 0

local title = Instance.new("TextLabel")
title.Parent = topBar
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "МЕНЮ"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center

-- Кнопка закрытия (крестик)
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = topBar
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.BackgroundTransparency = 0.3
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0

local closeCorners = Instance.new("UICorner")
closeCorners.Parent = closeBtn
closeCorners.CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- ═══════════════════════════════════════════════════════
-- КОНТЕНТ (занимает всё пространство между верхней панелью и нижними вкладками)
-- ═══════════════════════════════════════════════════════

local contentPanel = Instance.new("Frame")
contentPanel.Parent = mainFrame
contentPanel.Size = UDim2.new(1, 0, 1, -90)
contentPanel.Position = UDim2.new(0, 0, 0, 40)
contentPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
contentPanel.BackgroundTransparency = 0.1
contentPanel.BorderSizePixel = 0

-- ═══════════════════════════════════════════════════════
-- ВКЛАДКИ ВНИЗУ (3 штуки)
-- ═══════════════════════════════════════════════════════

local bottomBar = Instance.new("Frame")
bottomBar.Parent = mainFrame
bottomBar.Size = UDim2.new(1, 0, 0, 50)
bottomBar.Position = UDim2.new(0, 0, 1, -50)
bottomBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
bottomBar.BackgroundTransparency = 0.1
bottomBar.BorderSizePixel = 0

local bottomCorners = Instance.new("UICorner")
bottomCorners.Parent = bottomBar
bottomCorners.CornerRadius = UDim.new(0, 0)

-- Названия вкладок (3 штуки)
local tabs = {"VISUALS", "AIMBOT", "SETTINGS"}
local tabButtons = {}
local contentFrames = {}

for i, tabName in ipairs(tabs) do
    -- Кнопка вкладки
    local btn = Instance.new("TextButton")
    btn.Parent = bottomBar
    btn.Size = UDim2.new(0.333, 0, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.333, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    btn.BackgroundTransparency = 0.5
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    tabButtons[i] = btn
    
    -- Контейнер для содержимого вкладки
    local content = Instance.new("Frame")
    content.Parent = contentPanel
    content.Size = UDim2.new(1, -20, 1, -20)
    content.Position = UDim2.new(0, 10, 0, 10)
    content.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    content.BackgroundTransparency = 0.3
    content.BorderSizePixel = 0
    content.Visible = (i == 1)
    contentFrames[i] = content
    
    local contentCorners2 = Instance.new("UICorner")
    contentCorners2.Parent = content
    contentCorners2.CornerRadius = UDim.new(0, 8)
    
    -- Текст-заглушка внутри вкладки
    local label = Instance.new("TextLabel")
    label.Parent = content
    label.Size = UDim2.new(1, -20, 1, -20)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = tabName .. "\n\n(настройки появятся здесь)"
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.TextSize = 14
    label.Font = Enum.Font.GothamLight
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.TextWrapped = true
    
    -- Подчёркивание для активной вкладки
    local underline = Instance.new("Frame")
    underline.Parent = btn
    underline.Size = UDim2.new(0.6, 0, 0, 3)
    underline.Position = UDim2.new(0.2, 0, 1, -3)
    underline.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    underline.BackgroundTransparency = (i == 1) and 0 or 1
    underline.BorderSizePixel = 0
    btn:SetAttribute("Underline", underline)
    
    -- Переключение вкладок
    btn.MouseButton1Click:Connect(function()
        for j = 1, #tabs do
            contentFrames[j].Visible = (j == i)
            tabButtons[j].TextColor3 = (j == i) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 190)
            local line = tabButtons[j]:GetAttribute("Underline")
            if line then
                line.BackgroundTransparency = (j == i) and 0 or 1
            end
        end
    end)
end

-- Активируем первую вкладку по умолчанию
tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

-- ═══════════════════════════════════════════════════════
-- ПЕРЕТАСКИВАНИЕ ОКНА
-- ═══════════════════════════════════════════════════════

local dragging = false
local dragStart
local startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local pos = input.Position
        if pos.X >= mainFrame.AbsolutePosition.X and pos.X <= mainFrame.AbsolutePosition.X + mainFrame.AbsoluteSize.X and
           pos.Y >= mainFrame.AbsolutePosition.Y and pos.Y <= mainFrame.AbsolutePosition.Y + 40 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
