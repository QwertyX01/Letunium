-- =====================================================
--  AQWARIUM SCRIPT (с логотипом, только Misc и Combat)
-- =====================================================
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AqwariumScript"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ЗАГРУЗКА ЛОГОТИПА
-- ============================================================
local imageUrl = "https://i.ibb.co/MkhPVnWs/Chat-GPT-Image-28-2026-14-13-59.png"
local fileName = "menu_logo.png"
local filePath = fileName

local function fileExists(path)
    local success, result = pcall(function()
        return loadfile(path)
    end)
    return success and result ~= nil
end

if not fileExists(filePath) then
    print("📥 Скачиваем логотип...")
    local success, content = pcall(function()
        return game:HttpGet(imageUrl, true)
    end)
    if success and content then
        local writeSuccess, err = pcall(function()
            writefile(filePath, content)
        end)
        if writeSuccess then
            print("✅ Логотип сохранён: " .. filePath)
        else
            warn("⚠️ Не удалось сохранить файл: " .. tostring(err))
        end
    else
        warn("⚠️ Не удалось скачать картинку")
    end
else
    print("✅ Логотип уже есть на диске.")
end

local logoPath = nil
if getcustomasset then
    logoPath = getcustomasset(filePath)
elseif getgenv().getcustomasset then
    logoPath = getgenv().getcustomasset(filePath)
end

-- ============================================================
--  ОСНОВНОЕ ОКНО МЕНЮ
-- ============================================================
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

-- ============================================================
--  HEADER (с логотипом)
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
header.BackgroundTransparency = 0.3
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 12)
headerCorners.Parent = header

-- Логотип (слева)
if logoPath then
    local logo = Instance.new("ImageLabel")
    logo.Name = "MenuLogoIcon"
    logo.Size = UDim2.new(0, 32, 0, 32)
    logo.Position = UDim2.new(0, 8, 0, 4)
    logo.BackgroundTransparency = 1
    logo.BorderSizePixel = 0
    logo.Image = logoPath
    logo.ZIndex = 15
    logo.Parent = header

    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0, 8)
    logoCorner.Parent = logo
    print("🖼️ Логотип загружен")
else
    print("❌ Логотип не загружен")
end

-- Заголовок (без v2)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 220, 1, 0)
title.Position = UDim2.new(0, 48, 0, 0)
title.BackgroundTransparency = 1
title.Text = "AQWARIUM SCRIPT"
title.TextColor3 = Color3.fromRGB(255, 255, 255
