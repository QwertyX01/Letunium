-- =====================================================
--  Aqwarium HUB (AX-SCRIPTS STYLE)
--  Tabs: Games | Player | Misc | Combat (left)
--  Right side: empty with gray separators
-- =====================================================

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =====================================================
--  MAIN WINDOW (600x400)
-- =====================================================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

local mainCorners = Instance.new("UICorner")
mainCorners.CornerRadius = UDim.new(0, 12)
mainCorners.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.7
stroke.Thickness = 1
stroke.Parent = mainFrame

-- =====================================================
--  HEADER
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

-- Minimize / Close buttons
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0.5, -15)
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
minBtn.BackgroundTransparency = 0.5
minBtn.BorderSizePixel = 0
minBtn.Text = "—"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 20
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = title

local minCorners = Instance.new("UICorner")
minCorners.CornerRadius = UDim.new(0, 6)
minCorners.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
closeBtn.BackgroundTransparency = 0.5
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = title

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
--  LEFT PANEL (tabs) — 20% width
-- =====================================================
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0.2, 0, 1, -40)
leftPanel.Position = UDim2.new(0, 0, 0, 40)
leftPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
leftPanel.BackgroundTransparency = 0
leftPanel.BorderSizePixel = 0
leftPanel.ClipsDescendants = true
leftPanel.Parent = mainFrame

local leftCorners = Instance.new("UICorner")
leftCorners.CornerRadius = UDim.new(0, 6)
leftCorners.Parent = leftPanel

local layoutLeft = Instance.new("UIListLayout")
layoutLeft.FillDirection = Enum.FillDirection.Vertical
layoutLeft.HorizontalAlignment = Enum.HorizontalAlignment.Center
layoutLeft.VerticalAlignment = Enum.VerticalAlignment.Top
layoutLeft.Padding = UDim.new(0, 8)
layoutLeft.Parent = leftPanel

-- =====================================================
--  RIGHT PANEL (content) — 80% width
-- =====================================================
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(0.8, 0, 1, -40)
rightPanel.Position = UDim2.new(0.2, 0, 0, 40)
rightPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
rightPanel.BackgroundTransparency = 0.1
rightPanel.BorderSizePixel = 0
rightPanel.ClipsDescendants = true
rightPanel.Parent = mainFrame

local rightCorners = Instance.new("UICorner")
rightCorners.CornerRadius = UDim.new(0, 6)
rightCorners.Parent = rightPanel

-- =====================================================
--  TABS: Games, Player, Misc, Combat
-- =====================================================
local tabButtons = {}
local tabNames = {"Games", "Player", "Misc", "Combat"}

local function createTabButton(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
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

    btn.MouseEnter:Connect(function()
        if btn.BackgroundTransparency > 0.1 then
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            btn.BackgroundTransparency = 0.2
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundTransparency < 0.9 then
            btn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
            btn.BackgroundTransparency = 0.5
        end
    end)

    return btn
end

local rightContentFrames = {}

for i, name in ipairs(tabNames) do
    local btn = createTabButton(name)
    tabButtons[name] = btn

    -- Content frame for each tab
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, -10, 1, -10)
    content.Position = UDim2.new(0, 5, 0, 5)
    content.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    content.BackgroundTransparency = 0.2
    content.BorderSizePixel = 0
    content.Visible = (i == 1)
    content.Parent = rightPanel

    local contentCorners = Instance.new("UICorner")
    contentCorners.CornerRadius = UDim.new(0, 6)
    contentCorners.Parent = content

    -- Gray separator lines (3 lines evenly spaced)
    for j = 1, 3 do
        local line = Instance.new("Frame")
        line.Size = UDim2.new(0.9, 0, 0, 2)
        line.Position = UDim2.new(0.05, 0, j * 0.3, 0)
        line.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        line.BackgroundTransparency = 0.3
        line.BorderSizePixel = 0
        line.Parent = content
    end

    rightContentFrames[name] = content
end

-- =====================================================
--  TAB CLICK HANDLERS (no red colors, just subtle highlight)
-- =====================================================
for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        for n, frame in pairs(rightContentFrames) do
            frame.Visible = (n == name)
        end

        for n, b in pairs(tabButtons) do
            if n == name then
                b.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
                b.BackgroundTransparency = 0.1
                b.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                b.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                b.BackgroundTransparency = 0.5
                b.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end)
end

-- Set initial selection (Games)
tabButtons["Games"].BackgroundColor3 = Color3.fromRGB(60, 60, 70)
tabButtons["Games"].BackgroundTransparency = 0.1
tabButtons["Games"].TextColor3 = Color3.fromRGB(255, 255, 255)

-- =====================================================
--  DECORATIVE LINE UNDER HEADER (optional, keep gray)
-- =====================================================
local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(0.3, 0, 0, 2)
accentLine.Position = UDim2.new(0.35, 0, 0, 38)
accentLine.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- gray, not red
accentLine.BackgroundTransparency = 0.5
accentLine.BorderSizePixel = 0
accentLine.Parent = mainFrame

print("✅ Aqwarium HUB loaded (no red, empty pages, English)")
