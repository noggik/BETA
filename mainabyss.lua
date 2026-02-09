if not game:IsLoaded() then
	game.Loaded:Wait()
end

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "x2renxy"
Junkie.identifier = "1007456"
Junkie.provider = "No"

local FileName = "x2renxy_Key.json"
local keyValidated = false
local savedKey = nil

if isfile(FileName) then
    local success, fileContent = pcall(readfile, FileName)
    if success then
        local decodeSuccess, decoded = pcall(function()
            return HttpService:JSONDecode(fileContent)
        end)
        if decodeSuccess and decoded and decoded.key then
            savedKey = decoded.key
            local validationSuccess, validation = pcall(function()
                return Junkie.check_key(decoded.key)
            end)
            if validationSuccess and validation and validation.valid then
                getgenv().SCRIPT_KEY = decoded.key
                keyValidated = true
                StarterGui:SetCore("SendNotification", {
                    Title = "Key System",
                    Text = "Auto-authenticated successfully!",
                    Duration = 5,
                })
            end
        end
    end
end

if not keyValidated then
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystemUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 420, 0, 280)
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    local RedAccent = Instance.new("Frame")
    RedAccent.Name = "RedAccent"
    RedAccent.Size = UDim2.new(1, 0, 0, 3)
    RedAccent.Position = UDim2.new(0, 0, 0, 0)
    RedAccent.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    RedAccent.BorderSizePixel = 0
    RedAccent.Parent = MainFrame

    local RedAccentCorner = Instance.new("UICorner")
    RedAccentCorner.CornerRadius = UDim.new(0, 12)
    RedAccentCorner.Parent = RedAccent

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, -40, 0, 50)
    TitleLabel.Position = UDim2.new(0, 20, 0, 20)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "KEY SYSTEM"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 28
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = MainFrame

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "SubtitleLabel"
    SubtitleLabel.Size = UDim2.new(1, -40, 0, 30)
    SubtitleLabel.Position = UDim2.new(0, 20, 0, 60)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = "Enter your key to continue"
    SubtitleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    SubtitleLabel.TextSize = 14
    SubtitleLabel.Font = Enum.Font.Code
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.Parent = MainFrame

    local KeyInputFrame = Instance.new("Frame")
    KeyInputFrame.Name = "KeyInputFrame"
    KeyInputFrame.Size = UDim2.new(1, -40, 0, 45)
    KeyInputFrame.Position = UDim2.new(0, 20, 0, 105)
    KeyInputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    KeyInputFrame.BorderSizePixel = 0
    KeyInputFrame.Parent = MainFrame

    local KeyInputCorner = Instance.new("UICorner")
    KeyInputCorner.CornerRadius = UDim.new(0, 8)
    KeyInputCorner.Parent = KeyInputFrame

    local KeyInputBox = Instance.new("TextBox")
    KeyInputBox.Name = "KeyInputBox"
    KeyInputBox.Size = UDim2.new(1, -20, 1, 0)
    KeyInputBox.Position = UDim2.new(0, 10, 0, 0)
    KeyInputBox.BackgroundTransparency = 1
    KeyInputBox.PlaceholderText = "Enter key here..."
    KeyInputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    KeyInputBox.Text = ""
    KeyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInputBox.TextSize = 16
    KeyInputBox.Font = Enum.Font.Code
    KeyInputBox.TextXAlignment = Enum.TextXAlignment.Left
    KeyInputBox.ClearTextOnFocus = false
    KeyInputBox.Parent = KeyInputFrame

    local VerifyButton = Instance.new("TextButton")
    VerifyButton.Name = "VerifyButton"
    VerifyButton.Size = UDim2.new(1, -40, 0, 45)
    VerifyButton.Position = UDim2.new(0, 20, 0, 165)
    VerifyButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    VerifyButton.BorderSizePixel = 0
    VerifyButton.Text = "VERIFY KEY"
    VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyButton.TextSize = 16
    VerifyButton.Font = Enum.Font.Code
    VerifyButton.Parent = MainFrame

    local VerifyButtonCorner = Instance.new("UICorner")
    VerifyButtonCorner.CornerRadius = UDim.new(0, 8)
    VerifyButtonCorner.Parent = VerifyButton

    local GetKeyButton = Instance.new("TextButton")
    GetKeyButton.Name = "GetKeyButton"
    GetKeyButton.Size = UDim2.new(1, -40, 0, 40)
    GetKeyButton.Position = UDim2.new(0, 20, 0, 220)
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    GetKeyButton.BorderSizePixel = 0
    GetKeyButton.Text = "GET KEY"
    GetKeyButton.TextColor3 = Color3.fromRGB(200, 30, 30)
    GetKeyButton.TextSize = 14
    GetKeyButton.Font = Enum.Font.Code
    GetKeyButton.Parent = MainFrame

    local GetKeyButtonCorner = Instance.new("UICorner")
    GetKeyButtonCorner.CornerRadius = UDim.new(0, 8)
    GetKeyButtonCorner.Parent = GetKeyButton

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Size = UDim2.new(1, -40, 0, 20)
    StatusLabel.Position = UDim2.new(0, 20, 0, 85)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(200, 30, 30)
    StatusLabel.TextSize = 12
    StatusLabel.Font = Enum.Font.Code
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.Parent = MainFrame

    local isDragging = false
    local dragInput
    local dragStart
    local startPosition

    local function updateInput(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStart = input.Position
            startPosition = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and isDragging then
            updateInput(input)
        end
    end)

    local function animateButton(button)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(220, 50, 50),
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = Color3.fromRGB(200, 30, 30),
            }):Play()
        end)
    end

    animateButton(VerifyButton)

    GetKeyButton.MouseButton1Click:Connect(function()
        local keyLinkSuccess, keyLink = pcall(function()
            return Junkie.get_key_link()
        end)

        if keyLinkSuccess and keyLink then
            setclipboard(keyLink)
            StatusLabel.Text = "Link copied to clipboard!"
            StatusLabel.TextColor3 = Color3.fromRGB(50, 200, 50)
            task.wait(2)
            StatusLabel.Text = ""
        else
            StatusLabel.Text = "Failed to get key link"
            StatusLabel.TextColor3 = Color3.fromRGB(200, 30, 30)
        end
    end)

    VerifyButton.MouseButton1Click:Connect(function()
        local userKey = KeyInputBox.Text

        if userKey == "" then
            StatusLabel.Text = "Please enter a key"
            StatusLabel.TextColor3 = Color3.fromRGB(200, 30, 30)
            return
        end

        StatusLabel.Text = "Verifying..."
        StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        VerifyButton.Text = "VERIFYING..."

        local resultSuccess, result = pcall(function()
            return Junkie.check_key(userKey)
        end)

        if resultSuccess and result and result.valid then
            StatusLabel.Text = "Key verified successfully!"
            StatusLabel.TextColor3 = Color3.fromRGB(50, 200, 50)
            VerifyButton.Text = "SUCCESS"

            local writeSuccess = pcall(function()
                writefile(FileName, HttpService:JSONEncode({ key = userKey }))
            end)

            getgenv().SCRIPT_KEY = userKey
            keyValidated = true

            task.wait(1)
            ScreenGui:Destroy()
        else
            local errorMsg = "Unknown error"
            if resultSuccess and result and result.error then
                errorMsg = result.error
            end
            StatusLabel.Text = "Invalid key: " .. errorMsg
            StatusLabel.TextColor3 = Color3.fromRGB(200, 30, 30)
            VerifyButton.Text = "VERIFY KEY"
        end
    end)
end

repeat
    task.wait(0.1)
until keyValidated


print("load script x2renxy done")