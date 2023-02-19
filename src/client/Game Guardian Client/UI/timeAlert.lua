--[[
    Time Remaining Notification
]]
local TweenService = game:GetService("TweenService")

local UI = {}
local screenGui, mainFrame, editableText

function UI:Create()
    screenGui = Instance.new("ScreenGui")
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local UIGradient_2 = Instance.new("UIGradient")
    local UIGradient_3 = Instance.new("UIGradient")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

    screenGui.Name = "Notify"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    mainFrame = Instance.new("Frame")
        mainFrame.Name = "mainFrame"
        mainFrame.Parent = screenGui
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        mainFrame.ClipsDescendants = true
        mainFrame.Position = UDim2.new(1.2, 0, 0.920000017, 0)
        mainFrame.Size = UDim2.new(0.270282149, 0, 0.130842283, 0)

    UICorner.Parent = mainFrame

    local header = Instance.new("Frame")
        header.Name = "header"
        header.Parent = mainFrame
        header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        header.BorderSizePixel = 0
        header.Size = UDim2.new(0.99999994, 0, 0.147806734, 0)

    UICorner_2.Parent = header

    local flattenBottom = Instance.new("Frame")
        flattenBottom.Name = "flattenBottom"
        flattenBottom.Parent = header
        flattenBottom.AnchorPoint = Vector2.new(0, 1)
        flattenBottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flattenBottom.BorderSizePixel = 0
        flattenBottom.Position = UDim2.new(0, 0, 1, 0)
        flattenBottom.Size = UDim2.new(1, 0, 0.349999994, 0)

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient.Rotation = 180
    UIGradient.Parent = flattenBottom

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient_2.Rotation = 180
    UIGradient_2.Parent = header

    local reasonText = Instance.new("TextLabel")
        reasonText.Name = "reasonText"
        reasonText.Parent = mainFrame
        reasonText.AnchorPoint = Vector2.new(0.5, 0)
        reasonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        reasonText.BorderSizePixel = 0
        reasonText.Position = UDim2.new(0.639999986, 0, 0.234639555, 0)
        reasonText.Size = UDim2.new(0.58469373, 0, 0.29299441, 0)
        reasonText.FontFace = Font.fromId(11702779409)
        reasonText.FontFace.Weight = Enum.FontWeight.Bold
        reasonText.Text = "Time Remaining:"
        reasonText.TextColor3 = Color3.fromRGB(211, 115, 115)
        reasonText.TextScaled = true
        reasonText.TextSize = 14.000
        reasonText.TextWrapped = true
        reasonText.TextXAlignment = Enum.TextXAlignment.Right

    editableText = Instance.new("TextLabel")
        editableText.Name = "editableText"
        editableText.Parent = mainFrame
        editableText.AnchorPoint = Vector2.new(0.5, 0)
        editableText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        editableText.BorderSizePixel = 0
        editableText.Position = UDim2.new(0.661000013, 0, 0.574999988, 0)
        editableText.Size = UDim2.new(0.539499819, 0, 0.271581113, 0)
        editableText.FontFace = Font.fromId(11702779409)
        editableText.FontFace.Weight = Enum.FontWeight.SemiBold
        editableText.Text = "5 Minutes"
        editableText.TextColor3 = Color3.fromRGB(77, 77, 77)
        editableText.TextScaled = true
        editableText.TextSize = 14.000
        editableText.TextWrapped = true
        editableText.TextXAlignment = Enum.TextXAlignment.Right

    local logo = Instance.new("ImageLabel")
        logo.Name = "logo"
        logo.Parent = mainFrame
        logo.AnchorPoint = Vector2.new(0.5, 0.5)
        logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        logo.BackgroundTransparency = 1.000
        logo.BorderSizePixel = 0
        logo.Position = UDim2.new(0.164000005, 0, 0.550000012, 0)
        logo.Size = UDim2.new(0.197402999, 0, 0.527870893, 0)
        logo.Image = "rbxassetid://12536261451"

    UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient_3.Parent = logo

    UIAspectRatioConstraint.Parent = logo
    UIAspectRatioConstraint.AspectRatio = 1.100
end
    local debounce = false
function UI:Render(remainingMins)
    if debounce then return end
    debounce = true

    editableText.Text = remainingMins.." Minutes"
    screenGui.Enabled = true
    local tween = TweenService:Create(mainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Position = UDim2.fromScale(.85,.92)})
    tween:Play()
    tween.Completed:Wait()
    task.wait(5)
    tween = TweenService:Create(mainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Elastic), {Position = UDim2.fromScale(1.2,.92)})
    tween:Play()
    tween.Completed:Wait()
    screenGui.Enabled = false

    debounce = false
end

return UI