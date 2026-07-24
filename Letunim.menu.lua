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
--  ПРИВЕТСТВИЕ
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "LETUNIUM HUB"
hello.TextColor3 = Color3.fromRGB(255, 255, 255)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
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
--  ИНФО-ПАНЕЛЬ (TEXTBUTTON - ОТКРЫВАЕТ/ЗАКРЫВАЕТ МЕНЮ)
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

-- ============================================================
--  ЗВЁЗДЫ (ЛЕТАЮТ ПО ПЕРИМЕТРУ, ТОЛЬКО ПРИ ОТКРЫТОМ МЕНЮ)
-- ============================================================
local starContainer = Instance.new("Frame")
starContainer.Size = UDim2.new(1, 0, 1, 0)
starContainer.BackgroundTransparency = 1
starContainer.Visible = true
starContainer.ZIndex = 0
starContainer.Parent = gui

local stars = {}
local tween = game:GetService("TweenService")

for i = 1, 40 do
    local star = Instance.new("Frame")
    local size = math.random(3, 7)
    star.Size = UDim2.new(0, size, 0, size)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = 0.2 + math.random(0, 50) / 100
    star.BorderSizePixel = 0
    star.Parent = starContainer
    
    local starCorners = Instance.new("UICorner")
    starCorners.CornerRadius = UDim.new(1, 0)
    starCorners.Parent = star
    
    local side = math.random(1, 4)
    local x, y
    if side == 1 then
        x = math.random(-100, 900)
        y = math.random(-100, -30)
    elseif side == 2 then
        x = math.random(800, 900)
        y = math.random(-100, 500)
    elseif side == 3 then
        x = math.random(-100, 900)
        y = math.random(450, 500)
    else
        x = math.random(-100, -30)
        y = math.random(-100, 500)
    end
    
    star.Position = UDim2.new(0, x, 0, y)
    star.Rotation = math.random(0, 360)
    
    table.insert(stars, {
        star = star,
        x = x,
        y = y,
        speedX = (math.random() - 0.5) * 2,
        speedY = (math.random() - 0.5) * 2,
        size = size
    })
end

game:GetService("RunService").RenderStepped:Connect(function()
    if not starContainer.Visible then return end
    
    local menuCenterX = 0.5 * gui.AbsoluteSize.X
    local menuCenterY = 0.5 * gui.AbsoluteSize.Y
    
    for _, data in pairs(stars) do
        data.x = data.x + data.speedX
        data.y = data.y + data.speedY
        
        local dx = data.x - menuCenterX
        local dy = data.y - menuCenterY
        local dist = math.sqrt(dx*dx + dy*dy)
        
        if dist < 380 then
            data.x = data.x + (dx / (dist + 0.001)) * 0.5
            data.y = data.y + (dy / (dist + 0.001)) * 0.5
        end
        
        if data.x > 1000 then data.x = -100 end
        if data.x < -100 then data.x = 1000 end
        if data.y > 550 then data.y = -100 end
        if data.y < -100 then data.y = 550 end
        
        data.star.Position = UDim2.new(0, data.x, 0, data.y)
        
        local rot = data.star.Rotation + 1
        data.star.Rotation = rot % 360
    end
end)

local function updateStarsVisibility()
    starContainer.Visible = frame.Visible
end

frame:GetPropertyChangedSignal("Visible"):Connect(updateStarsVisibility)
updateStarsVisibility()

-- ============================================================
--  КЛИК ПО ПАНЕЛИ - ОТКРЫТИЕ/ЗАКРЫТИЕ МЕНЮ
-- ============================================================
infoPanel.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    updateStarsVisibility()
end)

-- ============================================================
--  КОНТЕНТ
-- ============================================================
local contentPanel = Instance.new("Frame")
contentPanel.Size = UDim2.new(1, 0, 1, -105)
contentPanel.Position = UDim2.new(0, 0, 0, 55)
contentPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
contentPanel.BackgroundTransparency = 0
contentPanel.BorderSizePixel = 0
contentPanel.Parent = frame

local bottomBar = Instance.new("Frame")
bottomBar.Size = UDim2.new(1, 0, 0, 50)
bottomBar.Position = UDim2.new(0, 0, 1, -50)
bottomBar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
bottomBar.BackgroundTransparency = 0
bottomBar.BorderSizePixel = 0
bottomBar.Parent = frame

-- ============================================================
--  ВКЛАДКИ
-- ============================================================
local tabNames = {"VISUALS", "AIMBOT", "SETTINGS"}
local tabButtons = {}
local contentFrames = {}

for i, tabName in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.333, 0, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.333, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.BackgroundTransparency = 0.3
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = bottomBar
    tabButtons[i] = btn

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 10)
    btnCorners.Parent = btn

    local underline = Instance.new("Frame")
    underline.Size = UDim2.new(0.4, 0, 0, 3)
    underline.Position = UDim2.new(0.3, 0, 1, -3)
    underline.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    underline.BackgroundTransparency = (i == 1) and 0 or 1
    underline.BorderSizePixel = 0
    underline.Parent = btn
    btn:SetAttribute("Underline", underline)

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -20, 1, -20)
    content.Position = UDim2.new(0, 10, 0, 10)
    content.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    content.BackgroundTransparency = 0.1
    content.BorderSizePixel = 0
    content.Visible = (i == 1)
    content.Parent = contentPanel
    contentFrames[i] = content

    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 10)
    contentCorners.Parent = content

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = tabName .. "\n\n(функции будут здесь)"
    label.TextColor3 = Color3.fromRGB(180, 180, 190)
    label.TextSize = 16
    label.Font = Enum.Font.GothamLight
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.TextWrapped = true
    label.Parent = content

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

tabButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)

-- ============================================================
--  VISUALS (ESP)
-- ============================================================
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 200, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0.15, 0)
espBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
espBtn.BackgroundTransparency = 0.3
espBtn.Text = "ESP: Выкл"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextSize = 18
espBtn.Font = Enum.Font.SourceSansBold
espBtn.Parent = contentFrames[1]
local espCorners = Instance.new("UICorner")
espCorners.CornerRadius = UDim.new(0, 10)
espCorners.Parent = espBtn

local espEnabled = false
local espLabels = {}

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP: Вкл"
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = p.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = p.Character
                espLabels[p] = highlight
            end
        end
    else
        espBtn.Text = "ESP: Выкл"
        for _, h in pairs(espLabels) do
            h:Destroy()
        end
        espLabels = {}
    end
end)

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.88, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "LETUNIUM HUB | TORMENTOR412"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.TextSize = 12
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.6
watermark.Parent = frame

print("✅ Letunium Hub загружен успешно!")
