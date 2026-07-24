-- ============================================================
--  LETUNIUM HUB (РАБОЧАЯ ВЕРСИЯ)
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Letunium Hub...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LetuniumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ПРИВЕТСТВИЕ HELLO
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "HELLO"
hello.TextColor3 = Color3.fromRGB(255, 215, 0)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
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
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Visible = true
frame.Parent = gui

-- ============================================================
--  ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = frame

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
--  ИНФО-ПАНЕЛЬ (ОТКРЫВАЕТ/ЗАКРЫВАЕТ МЕНЮ)
-- ============================================================
local infoPanel = Instance.new("TextButton")
infoPanel.Size = UDim2.new(0, 180, 0, 32)
infoPanel.Position = UDim2.new(0.01, 0, 0.01, 0)
infoPanel.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
infoPanel.BackgroundTransparency = 0
infoPanel.BorderSizePixel = 0
infoPanel.Text = ""
infoPanel.AutoButtonColor = false
infoPanel.Parent = gui

local infoCorners = Instance.new("UICorner")
infoCorners.CornerRadius = UDim.new(0, 8)
infoCorners.Parent = infoPanel

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(0.6, 0, 1, 0)
infoTitle.Position = UDim2.new(0.05, 0, 0, 0)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "Letunium"
infoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
infoTitle.TextSize = 16
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextXAlignment = Enum.TextXAlignment.Left
infoTitle.Parent = infoPanel

local infoStatus = Instance.new("TextLabel")
infoStatus.Size = UDim2.new(0.35, 0, 1, 0)
infoStatus.Position = UDim2.new(0.62, 0, 0, 0)
infoStatus.BackgroundTransparency = 1
infoStatus.Text = "Opening"
infoStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
infoStatus.TextSize = 13
infoStatus.Font = Enum.Font.GothamMedium
infoStatus.TextXAlignment = Enum.TextXAlignment.Left
infoStatus.Parent = infoPanel

-- КЛИК ПО ПАНЕЛИ
infoPanel.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- ============================================================
--  ЗВЁЗДЫ
-- ============================================================
local starContainer = Instance.new("Frame")
starContainer.Size = UDim2.new(1, 0, 1, 0)
starContainer.BackgroundTransparency = 1
starContainer.Visible = true
starContainer.ZIndex = 0
starContainer.Parent = gui

local stars = {}

for i = 1, 40 do
    local star = Instance.new("Frame")
    local size = math.random(3, 7)
    star.Size = UDim2.new(0, size, 0, size)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = 0.2 + math.random(0, 50) / 100
    star.BorderSizePixel = 0
    star.Parent = starContainer
    
    local starCorners = Instance.new("UICorner")
    starCorners.CornerRadius = UDim.new(1, 
