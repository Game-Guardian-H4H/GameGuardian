
local TweenService = game:GetService("TweenService")


local UI = {}
local screenGui, mainFrame, screenBlur

function UI:Create()
    screenGui = Instance.new("ScreenGui")
    local fullFrame = Instance.new("Frame")
        fullFrame.Size = UDim2.fromScale(1,1)
        fullFrame.BackgroundTransparency = 1
        fullFrame.Parent = screenGui
    mainFrame = Instance.new("CanvasGroup")
        mainFrame.BorderSizePixel = 0
        mainFrame.BackgroundColor3 = Color3.new(1,1,1)
        mainFrame.GroupTransparency = 1
        mainFrame.AnchorPoint = Vector2.new(.5, .5)
        mainFrame.Position = UDim2.fromScale(.5, .5)
        mainFrame.Size = UDim2.fromScale(.519, .55)
        mainFrame.Parent = fullFrame
    local uiCorner1 = Instance.new("UICorner")
        uiCorner1.Parent = mainFrame
    local header = Instance.new("Frame")
        header.Size = UDim2.fromScale(1,.126)
        header.BorderSizePixel = 0
        header.BackgroundColor3 = Color3.fromRGB(85,0,0)
        header.Parent = mainFrame
    local uiCorner2 = Instance.new("UICorner")
        uiCorner2.Parent = header
    local title = Instance.new("TextLabel")
        title.AnchorPoint = Vector2.new(.5, .5)
        title.Position = UDim2.fromScale(.5, .55)
        title.Size = UDim2.fromScale(.786, .786)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.JosefinSans
        title.TextScaled = true
        title.TextColor3 = Color3.new(1,1,1)
        title.Text = "GameSafe Alert"
        title.Parent = header
    
    screenGui.Name = "GameSafe"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Enabled = false
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    
    screenBlur = Instance.new("BlurEffect")
    screenBlur.Enabled = false
    screenBlur.Size = 0
    screenBlur.Parent = game:GetService("Lighting")
end

function UI:Render(state)
    if state then
        screenGui.Enabled = true
        screenBlur.Enabled = true
        task.wait(5)
        TweenService:Create(screenBlur, TweenInfo.new(1.5), {Size = 24}):Play()
        TweenService:Create(mainFrame, TweenInfo.new(1.5), {GroupTransparency = 0}):Play()
    else
        TweenService:Create(screenBlur, TweenInfo.new(1.5), {Size = 0}):Play()
        TweenService:Create(mainFrame, TweenInfo.new(1.5), {GroupTransparency = 1}):Play():Wait()
        screenBlur.Enabled = false
        screenGui.Enabled = false
    end
end

return UI