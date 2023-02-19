--[[
    Game Paused UI
]]

local TweenService = game:GetService("TweenService")

local UI = {}
local screenGui, mainFrame, screenBlur, editableText

function UI:Create()
    local UICorner = Instance.new("UICorner")
    local UICorner_2 = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local UIGradient_2 = Instance.new("UIGradient")
    local UICorner_3 = Instance.new("UICorner")
    local UIGradient_3 = Instance.new("UIGradient")
    local UIGradient_4 = Instance.new("UIGradient")
    local UICorner_4 = Instance.new("UICorner")
    local UIGradient_5 = Instance.new("UIGradient")

    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Game Guardians"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    mainFrame = Instance.new("CanvasGroup")
        mainFrame.Name = "mainFrame"
        mainFrame.Parent = screenGui
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        mainFrame.GroupTransparency = 1
        mainFrame.ClipsDescendants = true
        mainFrame.Position = UDim2.fromScale(0.5, 0.457227141)
        mainFrame.Size = UDim2.fromScale(0.51886481, 0.464175642)

    UICorner.Parent = mainFrame

    local header = Instance.new("Frame")
        header.Name = "header"
        header.Parent = mainFrame
        header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        header.BorderSizePixel = 0
        header.Size = UDim2.fromScale(0.99999994, 0.147806734)

    local headerText = Instance.new("TextLabel")
        headerText.Parent = header
        headerText.AnchorPoint = Vector2.new(0.5, 0.5)
        headerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        headerText.BackgroundTransparency = 1.000
        headerText.BorderSizePixel = 0
        headerText.Position = UDim2.fromScale(0.5, 0.550000012)
        headerText.Size = UDim2.fromScale(0.786320806, 0.786320865)
        headerText.ZIndex = 2
        headerText.FontFace = Font.fromId(11702779409)
        headerText.FontFace.Weight = Enum.FontWeight.Bold
        headerText.Text = "Game Guardian Alert"
        headerText.TextColor3 = Color3.fromRGB(255, 255, 255)
        headerText.TextScaled = true
        headerText.TextSize = 14.000
        headerText.TextWrapped = true

    UICorner_2.Parent = header

    local flattenBottom = Instance.new("Frame")
        flattenBottom.Name = "flattenBottom"
        flattenBottom.Parent = header
        flattenBottom.AnchorPoint = Vector2.new(0, 1)
        flattenBottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flattenBottom.BorderSizePixel = 0
        flattenBottom.Position = UDim2.fromScale(0, 1)
        flattenBottom.Size = UDim2.fromScale(1, 0.150000006)

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient.Parent = flattenBottom

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient_2.Parent = header

    local infoText = Instance.new("TextLabel")
        infoText.Name = "infoText"
        infoText.Parent = mainFrame
        infoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        infoText.BorderSizePixel = 0
        infoText.Position = UDim2.fromScale(0.054514192, 0.199123651)
        infoText.Size = UDim2.fromScale(0.888999701, 0.174763456)
        infoText.FontFace = Font.fromId(11702779409)
        infoText.FontFace.Weight = Enum.FontWeight.Medium
        infoText.Text = "Your parent has paused access to Roblox. Controls are disabled until they reenable play."
        infoText.TextColor3 = Color3.fromRGB(77, 77, 77)
        infoText.TextScaled = true
        infoText.TextSize = 14.000
        infoText.TextWrapped = true

    local reasonText = Instance.new("TextLabel")
        reasonText.Name = "reasonText"
        reasonText.Parent = mainFrame
        reasonText.AnchorPoint = Vector2.new(0.5, 0)
        reasonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        reasonText.BorderSizePixel = 0
        reasonText.Position = UDim2.fromScale(0.5, 0.412)
        reasonText.Size = UDim2.fromScale(0.888999701, 0.0857929736)
        reasonText.FontFace = Font.fromId(11702779409)
        reasonText.FontFace.Weight = Enum.FontWeight.Medium
        reasonText.Text = "Reason:"
        reasonText.TextColor3 = Color3.fromRGB(211, 115, 115)
        reasonText.TextScaled = true
        reasonText.TextSize = 14.000
    reasonText.TextWrapped = true

    editableText = Instance.new("TextLabel")
        editableText.Name = "editableText"
        editableText.Parent = mainFrame
        editableText.AnchorPoint = Vector2.new(0.5, 0)
        editableText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        editableText.BorderSizePixel = 0
        editableText.Position = UDim2.fromScale(0.50000006, 0.497999996)
        editableText.Size = UDim2.fromScale(0.888999701, 0.057195317)
        editableText.FontFace = Font.fromId(11702779409)
        editableText.FontFace.Weight = Enum.FontWeight.Medium
        editableText.Text = "Please come down for dinner"
        editableText.TextColor3 = Color3.fromRGB(77, 77, 77)
        editableText.TextScaled = true
        editableText.TextSize = 14
        editableText.TextWrapped = true

    local footer = Instance.new("Frame")
        footer.Name = "footer"
        footer.Parent = mainFrame
        footer.AnchorPoint = Vector2.new(0, 1)
        footer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        footer.BorderSizePixel = 0
        footer.Position = UDim2.fromScale(0, 0.999999881)
        footer.Size = UDim2.fromScale(1, 0.0197217874)

    UICorner_3.Parent = footer

    local flattenTop = Instance.new("Frame")
        flattenTop.Name = "flattenTop"
        flattenTop.Parent = footer
        flattenTop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        flattenTop.BorderSizePixel = 0
        flattenTop.Size = UDim2.fromScale(1, 0.200000003)

    UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient_3.Parent = flattenTop

    UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient_4.Parent = footer

    local seperator = Instance.new("Frame")
        seperator.Name = "seperator"
        seperator.Parent = mainFrame
        seperator.AnchorPoint = Vector2.new(0.5, 0.5)
        seperator.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
        seperator.BorderSizePixel = 0
        seperator.Position = UDim2.fromScale(0.5, 0.400000006)
        seperator.Size = UDim2.fromScale(0.400000006, 0.00999999978)

    UICorner_4.Parent = seperator

    local logo = Instance.new("ImageLabel")
        logo.Name = "logo"
        logo.Parent = mainFrame
        logo.AnchorPoint = Vector2.new(0.5, 0)
        logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        logo.BackgroundTransparency = 1.000
        logo.BorderSizePixel = 0
        logo.Position = UDim2.fromScale(0.5, 0.597)
        logo.Size = UDim2.fromScale(.231, .319)
        logo.Image = "rbxassetid://12536261451"
        
    local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        uiAspectRatioConstraint.AspectRatio = 1.1
        uiAspectRatioConstraint.Parent = logo
    
    UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 224, 224)), ColorSequenceKeypoint.new(0.38, Color3.fromRGB(191, 87, 87)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 0, 0))}
    UIGradient_5.Parent = logo

    screenBlur = Instance.new("BlurEffect")
    screenBlur.Enabled = false
    screenBlur.Size = 0
    screenBlur.Parent = game:GetService("Lighting")
end

function UI:Render(state, message)
    if state == screenBlur.Enabled then return end
    if state then
        editableText.Text = message
        mainFrame.GroupTransparency = 1
        screenBlur.Size = 0
        screenGui.Enabled = true
        screenBlur.Enabled = true
        TweenService:Create(screenBlur, TweenInfo.new(1.5), {Size = 24}):Play()
        TweenService:Create(mainFrame, TweenInfo.new(1.5), {GroupTransparency = 0}):Play()
    else
        TweenService:Create(screenBlur, TweenInfo.new(1.5), {Size = 0}):Play()
        local tween = TweenService:Create(mainFrame, TweenInfo.new(1.5), {GroupTransparency = 1})
        tween:Play()
        tween.Completed:Wait()
        screenBlur.Enabled = false
        screenGui.Enabled = false
    end
end

return UI