--[[
    Brand Name: Sovereign Hub
    UI Library: WindUI
    Logo Asset ID: 82022500310652
]]

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/refs/heads/main/main.lua"))()

-- Initialize Services
local Services = {
    Players = game:GetService("Players"),
    Workspace = game:GetService("Workspace"),
    RunService = game:GetService("RunService"),
    UserInputService = game:GetService("UserInputService"),
    VirtualInputManager = game:GetService("VirtualInputManager"),
    Lighting = game:GetService("Lighting"),
    HttpService = game:GetService("HttpService"),
    CoreGui = game:GetService("CoreGui"),
    TweenService = game:GetService("TweenService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage")
}

local LocalPlayer = Services.Players.LocalPlayer
local CurrentCamera = Services.Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Configuration Table
local Config = {
    EnableAimbot = false,
    AimbotMode = "Normal",
    AimPart = "Head",
    Smoothness = 0.1,
    PredictionAmount = 0.15,
    FlickSpeed = 0.05,
    RotateCharacterToTarget = true,
    WallCheck = false,
    TeamCheck = true,
    TargetMode = "Distance",
    AimCursor = false,
    EnableKillAura = false,
    AuraMode = "Normal",
    AuraRange = 20,
    TriggerBot = false,
    TriggerMode = "Normal",
    ExpandHitbox = false,
    HitboxSize = 10,
    HitboxTransparency = 0.7,
    Reach = 15,
    ReachMode = "Normal",
    EnableESP = false,
    ESPMode = "Normal",
    ShowBox = false,
    ShowTracer = false,
    ShowName = false,
    ShowHealthBar = false,
    EnableHighlight = false,
    HighlightFillColor = Color3.fromRGB(255, 0, 0),
    HighlightFillTransparency = 0.5,
    HighlightOutlineColor = Color3.fromRGB(255, 255, 255),
    HighlightOutlineTransparency = 0,
    WalkSpeed = 16,
    SpeedMode = "CFrame",
    JumpPower = 50,
    Fly = false,
    FlyMode = "Normal",
    FlySpeed = 50,
    Noclip = false,
    InfiniteJump = false,
    EnableTeleport = false,
    TeleportTarget = "",
    TeleportLoop = false,
    TeleportSpeed = 100,
    TeleportMode = "Select",
    InstantTeleport = false,
    EnableSafety = false,
    SafetyHealth = 30,
    EscapeDistance = 1000,
    EnableLegitAimbot = false,
    LegitSmoothness = 0.5,
    EnableLegitTween = false,
    LegitTweenSpeed = 50,
    FPSBoost = false,
    Fullbright = true,
    AntiKick = true,
    AntiAFK = true,
    SmartMacroActive = false,
    ShowAimbotButton = true,
    ShowMacroButton = true,
    ShowTargetLock = true,
    ShowFastAttack = true,
    ShowSoruAim = true,
    ShowResetChar = true,
    ShowSangZ = true,
    ShowRagdoll = true,
    ShowDiamondBoost = true,
    InterfaceLanguage = "English",
    AutoParry = false,
    ParryMode = "Normal",
    InfiniteCombo = false,
    NoStun = false,
    AntiLock = false,
    AutoDodge = false,
    DodgeMode = "Jump",
    FastAttack = false,
    NoCooldown = false,
    DamageMultiplier = 1,
    HealthRegen = false,
    GodMode = false,
    InfiniteStamina = false,
    AutoUseSkills = false,
    KillAll = false,
    NoFallDamage = false,
    SpinBot = false,
    SpinSpeed = 200,
    AntiAdmin = false,
    SpoofStats = false,
    FakeLag = false,
    AutoBlock = false,
    RageMode = false,
    SilentAim = false,
    WallBang = false,
    ItemESP = false,
    AutoLoot = false,
    SpeedHack = false,
    AntiDetect = false,
    InfiniteMoney = false,
    AutoRevive = false,
    EnemyWeakener = false,
    AutoLevelUp = false,
    Invisibility = false,
    SuperJump = false,
    WallHack = false,
    XRay = false,
    AutoWin = false,
    BanBypass = false,
    ScriptOptimizer = false,
    MultiHit = false,
    RangeExtender = false,
    HitEffect = false,
    CustomUI = false
}

-- Base64 Functions
local function base64Encode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c*2+(x:sub(i,i)=='1' and 1 or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

local function base64Decode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c*2+(x:sub(i,i)=='1' and 1 or 0) end
        return string.char(c)
    end))
end

-- ESP & Target Logic
local ESPStorage = {}
local function CreateDrawing(type: string, props: table)
    local obj = Drawing.new(type)
    for k, v in pairs(props) do obj[k] = v end
    return obj
end

local function IsValidTarget(player: Player): boolean
    if not player or player == LocalPlayer or not player.Character then return false end
    local char = player.Character
    local humanoid = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    if not humanoid or not root or not head or humanoid.Health <= 0 then return false end
    if char:FindFirstChild("ForceField") then return false end
    if Config.TeamCheck and player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team then return false end
    return true
end

local function CanSeeTarget(targetPart: BasePart): boolean
    if not Config.WallCheck then return true end
    local origin = CurrentCamera.CFrame.Position
    local direction = targetPart.Position - origin
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character, CurrentCamera}
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.IgnoreWater = true
    local result = Services.Workspace:Raycast(origin, direction, params)
    if result then return result.Instance:IsDescendantOf(targetPart.Parent) end
    return true
end

local function GetNearestPlayer()
    local bestTarget = nil
    local bestDist = math.huge
    local bestHealth = math.huge
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if IsValidTarget(player) then
            local char = player.Character
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - root.Position).Magnitude
                local health = char.Humanoid.Health
                local condition = false
                if Config.TargetMode == "Distance" then condition = dist < bestDist
                elseif Config.TargetMode == "Health" then condition = health < bestHealth
                elseif Config.TargetMode == "Random" then condition = math.random() > 0.5 end
                if condition and CanSeeTarget(root) then
                    bestDist = dist; bestHealth = health; bestTarget = player
                end
            end
        end
    end
    return bestTarget
end

local function GetNearestPlayerForTP()
    local bestTarget = nil
    local bestDist = math.huge
    for _, player in ipairs(Services.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if dist < bestDist then bestDist = dist; bestTarget = player end
        end
    end
    return bestTarget
end

local function Fire()
    Services.VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
    task.wait(0.005)
    Services.VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end

local function TweenToPosition(targetPos: Vector3, speed: number)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    local distance = (root.Position - targetPos).Magnitude
    local duration = distance / speed
    if _G.CurrentTeleportTween then _G.CurrentTeleportTween:Cancel() end
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    _G.CurrentTeleportTween = Services.TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(targetPos)})
    _G.CurrentTeleportTween:Play()
    return _G.CurrentTeleportTween
end

local function InstantTeleportTo(targetPos: Vector3)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    char.HumanoidRootPart.CFrame = CFrame.new(targetPos)
    task.wait(math.random(0.1, 0.3))
end

-- Create Window with WindUI
local Window = WindUI:CreateWindow({
    Title = "Sovereign Hub",
    SubTitle = "All-In-One PvP & Smart Macro Suite",
    Icon = "rbxassetid://82022500310652",
    Author = "Axiom & Luffy",
    Folder = "SovereignPvPHub",
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = true
})

-- Tabs Setup
local Tabs = {
    Macro = Window:Tab({ Title = "Macro", Icon = "play" }),
    Aimbot = Window:Tab({ Title = "Aimbot", Icon = "crosshair" }),
    Visuals = Window:Tab({ Title = "Visuals (ESP)", Icon = "eye" }),
    Combat = Window:Tab({ Title = "Combat", Icon = "swords" }),
    Movement = Window:Tab({ Title = "Movement", Icon = "move" }),
    Teleport = Window:Tab({ Title = "Teleport", Icon = "navigation" }),
    Legit = Window:Tab({ Title = "Legit", Icon = "lock" }),
    PVPExtra = Window:Tab({ Title = "PVP Extra", Icon = "zap" }),
    SuperExtra = Window:Tab({ Title = "Super Extra", Icon = "star" }),
    Misc = Window:Tab({ Title = "Misc", Icon = "box" }),
    Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
}

-- Macro Tab
local MacroSection = Tabs.Macro:Section({ Title = "Smart Macro Controls" })
MacroSection:Toggle({ Title = "Show Macro", Default = Config.ShowMacroButton, Callback = function(v) Config.ShowMacroButton = v end })
MacroSection:Toggle({ Title = "Smart Macro Active", Default = false, Callback = function(v) Config.SmartMacroActive = v end })
MacroSection:Button({
    Title = "SMART MACRO VIDEO GUIDE",
    Callback = function()
        pcall(setclipboard, "https://discord.gg/x7YbZeezpm")
        WindUI:Notify({ Title = "Macro Guide", Content = "Video guide link copied!", Duration = 3 })
    end
})

-- Aimbot Tab
local AimbotSection = Tabs.Aimbot:Section({ Title = "Aimbot Settings" })
AimbotSection:Toggle({ Title = "Enable Aimbot", Default = false, Callback = function(v) Config.EnableAimbot = v end })
AimbotSection:Dropdown({ Title = "Aimbot Mode", Values = {"Normal", "Silent", "Sticky", "Trigger", "Prediction", "Flick"}, Default = "Normal", Callback = function(v) Config.AimbotMode = v end })
AimbotSection:Dropdown({ Title = "Aim Part", Values = {"Head", "HumanoidRootPart", "Torso"}, Default = "Head", Callback = function(v) Config.AimPart = v end })
AimbotSection:Slider({ Title = "Smoothness", Min = 0, Max = 1, Default = 0.1, Step = 0.01, Callback = function(v) Config.Smoothness = v end })

-- Visuals Tab
local ESPSection = Tabs.Visuals:Section({ Title = "ESP Settings" })
ESPSection:Toggle({ Title = "Enable ESP", Default = false, Callback = function(v) Config.EnableESP = v end })
ESPSection:Toggle({ Title = "Show Box", Default = false, Callback = function(v) Config.ShowBox = v end })
ESPSection:Toggle({ Title = "Show Tracer", Default = false, Callback = function(v) Config.ShowTracer = v end })
ESPSection:Toggle({ Title = "Show Name", Default = false, Callback = function(v) Config.ShowName = v end })

-- Combat Tab
local CombatSection = Tabs.Combat:Section({ Title = "Combat Tools" })
CombatSection:Toggle({ Title = "Kill Aura", Default = false, Callback = function(v) Config.EnableKillAura = v end })
CombatSection:Slider({ Title = "Aura Range", Min = 5, Max = 100, Default = 20, Step = 1, Callback = function(v) Config.AuraRange = v end })

-- Movement Tab
local MovementSection = Tabs.Movement:Section({ Title = "Character Mods" })
MovementSection:Toggle({ Title = "Fly", Default = false, Callback = function(v) Config.Fly = v end })
MovementSection:Slider({ Title = "Fly Speed", Min = 10, Max = 500, Default = 50, Step = 5, Callback = function(v) Config.FlySpeed = v end })
MovementSection:Toggle({ Title = "Noclip", Default = false, Callback = function(v) Config.Noclip = v end })

-- Settings Tab
local SecuritySection = Tabs.Settings:Section({ Title = "Security & Management" })
SecuritySection:Toggle({ Title = "Anti-Kick", Default = true, Callback = function(v) Config.AntiKick = v end })
SecuritySection:Toggle({ Title = "Anti-AFK", Default = true, Callback = function(v) Config.AntiAFK = v end })
SecuritySection:Button({
    Title = "Destroy Script",
    Callback = function()
        Window:Destroy()
        for _, espData in pairs(ESPStorage) do
            for _, obj in pairs(espData) do
                if typeof(obj) == "Instance" then obj:Destroy() else obj:Remove() end
            end
        end
    end
})

-- Core Render Loop
Services.RunService.RenderStepped:Connect(function()
    if Config.EnableAimbot then
        local target = GetNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild(Config.AimPart) then
            local targetPos = target.Character[Config.AimPart].Position
            CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(CFrame.new(CurrentCamera.CFrame.Position, targetPos), 1 - Config.Smoothness)
        end
    end
end)

Services.RunService.Heartbeat:Connect(function(delta)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart

    if Config.SmartMacroActive then
        local target = GetNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            root.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
            Fire()
        end
    end

    if Config.EnableKillAura then
        for _, player in pairs(Services.Players:GetPlayers()) do
            if IsValidTarget(player) then
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot and (root.Position - targetRoot.Position).Magnitude <= Config.AuraRange then
                    root.CFrame = CFrame.new(root.Position, Vector3.new(targetRoot.Position.X, root.Position.Y, targetRoot.Position.Z))
                    Fire()
                end
            end
        end
    end
end)

WindUI:Notify({ Title = "Sovereign Hub Loaded", Content = "Script executed successfully.", Duration = 3 })
