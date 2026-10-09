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
    -- Smart Macro and Localization Setup (File 1)
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
    -- PVP Extra / Super Added
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

-- Base64 Support Functions
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

-- ESP and Core Target Logic
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

-- Create Window with WindUI and Specified Logo ID
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

-- Comprehensive Tabs
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

-- [[ MACRO TAB ]]
local MacroSection = Tabs.Macro:Section({ Title = "Smart Macro Controls" })
MacroSection:Toggle({
    Title = "Show Macro",
    Description = "Shows a shortcut for starting or stopping Smart Macro.",
    Default = Config.ShowMacroButton,
    Callback = function(v) Config.ShowMacroButton = v end
})
MacroSection:Toggle({
    Title = "Smart Macro Active",
    Description = "Toggles automated tracking and execution sequences.",
    Default = false,
    Callback = function(v) Config.SmartMacroActive = v end
})
MacroSection:Button({
    Title = "SMART MACRO VIDEO GUIDE",
    Description = "Click to copy community/guide invite link.",
    Callback = function()
        pcall(setclipboard, "https://discord.gg/x7YbZeezpm")
        WindUI:Notify({ Title = "Macro Guide", Content = "Video guide link copied!", Duration = 3 })
    end
})

local OnScreenButtons = Tabs.Macro:Section({ Title = "On-Screen Buttons & Visibility" })
OnScreenButtons:Paragraph({
    Title = "CONTROLS & VISIBILITY",
    Content = "Choose which shortcuts appear over the game. These switches only show or hide buttons."
})
OnScreenButtons:Toggle({ Title = "Show Aimbot", Default = Config.ShowAimbotButton, Callback = function(v) Config.ShowAimbotButton = v end })
OnScreenButtons:Toggle({ Title = "Show Target Lock", Default = Config.ShowTargetLock, Callback = function(v) Config.ShowTargetLock = v end })
OnScreenButtons:Toggle({ Title = "Show Fast Attack", Default = Config.ShowFastAttack, Callback = function(v) Config.ShowFastAttack = v end })
OnScreenButtons:Toggle({ Title = "Show Soru Aim", Default = Config.ShowSoruAim, Callback = function(v) Config.ShowSoruAim = v end })
OnScreenButtons:Toggle({ Title = "Show Reset Character", Default = Config.ShowResetChar, Callback = function(v) Config.ShowResetChar = v end })
OnScreenButtons:Toggle({ Title = "Show Sang Z", Default = Config.ShowSangZ, Callback = function(v) Config.ShowSangZ = v end })
OnScreenButtons:Toggle({ Title = "Show Ragdoll", Default = Config.ShowRagdoll, Callback = function(v) Config.ShowRagdoll = v end })
OnScreenButtons:Toggle({ Title = "Show Diamond Boost", Default = Config.ShowDiamondBoost, Callback = function(v) Config.ShowDiamondBoost = v end })

-- [[ AIMBOT TAB ]]
local AimbotSection = Tabs.Aimbot:Section({ Title = "Aimbot Settings" })
AimbotSection:Toggle({ Title = "Enable Aimbot", Default = false, Callback = function(v) Config.EnableAimbot = v end })
AimbotSection:Dropdown({ Title = "Aimbot Mode", Values = {"Normal", "Silent", "Sticky", "Trigger", "Prediction", "Flick"}, Default = "Normal", Callback = function(v) Config.AimbotMode = v end })
AimbotSection:Dropdown({ Title = "Aim Part", Values = {"Head", "HumanoidRootPart", "Torso"}, Default = "Head", Callback = function(v) Config.AimPart = v end })
AimbotSection:Slider({ Title = "Smoothness", Min = 0, Max = 1, Default = 0.1, Step = 0.01, Callback = function(v) Config.Smoothness = v end })
AimbotSection:Slider({ Title = "Prediction Amount", Min = 0, Max = 0.5, Default = 0.15, Step = 0.01, Callback = function(v) Config.PredictionAmount = v end })
AimbotSection:Slider({ Title = "Flick Speed", Min = 0.01, Max = 0.2, Default = 0.05, Step = 0.01, Callback = function(v) Config.FlickSpeed = v end })
AimbotSection:Toggle({ Title = "Rotate Character", Default = true, Callback = function(v) Config.RotateCharacterToTarget = v end })

local AdvancedAimbot = Tabs.Aimbot:Section({ Title = "Advanced Aimbot" })
AdvancedAimbot:Toggle({ Title = "Wall Check", Default = false, Callback = function(v) Config.WallCheck = v end })
AdvancedAimbot:Toggle({ Title = "Team Check", Default = true, Callback = function(v) Config.TeamCheck = v end })
AdvancedAimbot:Toggle({ Title = "Silent Aim", Default = false, Callback = function(v) Config.SilentAim = v end })
AdvancedAimbot:Toggle({ Title = "Wall Bang", Default = false, Callback = function(v) Config.WallBang = v end })
AdvancedAimbot:Dropdown({ Title = "Target Mode", Values = {"Distance", "Health", "Random"}, Default = "Distance", Callback = function(v) Config.TargetMode = v end })

-- [[ VISUALS TAB ]]
local ESPSection = Tabs.Visuals:Section({ Title = "ESP Settings" })
ESPSection:Toggle({ Title = "Enable ESP", Default = false, Callback = function(v) Config.EnableESP = v end })
ESPSection:Dropdown({ Title = "ESP Mode", Values = {"Normal", "Chams", "Skeleton", "Glow"}, Default = "Normal", Callback = function(v) Config.ESPMode = v end })
ESPSection:Toggle({ Title = "Show Box", Default = false, Callback = function(v) Config.ShowBox = v end })
ESPSection:Toggle({ Title = "Show Tracer", Default = false, Callback = function(v) Config.ShowTracer = v end })
ESPSection:Toggle({ Title = "Show Name & Distance", Default = false, Callback = function(v) Config.ShowName = v end })
ESPSection:Toggle({ Title = "Show Health Bar", Default = false, Callback = function(v) Config.ShowHealthBar = v end })
ESPSection:Toggle({ Title = "Item ESP", Default = false, Callback = function(v) Config.ItemESP = v end })
ESPSection:Toggle({ Title = "Wall Hack", Default = false, Callback = function(v) Config.WallHack = v end })
ESPSection:Toggle({ Title = "X-Ray", Default = false, Callback = function(v) Config.XRay = v end })

local HighlightSection = Tabs.Visuals:Section({ Title = "Highlight ESP" })
HighlightSection:Toggle({ Title = "Enable Highlight", Default = false, Callback = function(v) Config.EnableHighlight = v end })
HighlightSection:Colorpicker({ Title = "Fill Color", Default = Color3.fromRGB(255, 0, 0), Callback = function(v) Config.HighlightFillColor = v end })
HighlightSection:Slider({ Title = "Fill Transparency", Min = 0, Max = 1, Default = 0.5, Step = 0.05, Callback = function(v) Config.HighlightFillTransparency = v end })
HighlightSection:Colorpicker({ Title = "Outline Color", Default = Color3.fromRGB(255, 255, 255), Callback = function(v) Config.HighlightOutlineColor = v end })
HighlightSection:Slider({ Title = "Outline Transparency", Min = 0, Max = 1, Default = 0, Step = 0.05, Callback = function(v) Config.HighlightOutlineTransparency = v end })

-- [[ COMBAT TAB ]]
local CombatSection = Tabs.Combat:Section({ Title = "Combat Tools" })
CombatSection:Toggle({ Title = "Kill Aura", Default = false, Callback = function(v) Config.EnableKillAura = v end })
CombatSection:Dropdown({ Title = "Aura Mode", Values = {"Normal", "Spin", "Orbit", "MultiTarget"}, Default = "Normal", Callback = function(v) Config.AuraMode = v end })
CombatSection:Slider({ Title = "Aura Range", Min = 5, Max = 100, Default = 20, Step = 1, Callback = function(v) Config.AuraRange = v end })
CombatSection:Toggle({ Title = "TriggerBot", Default = false, Callback = function(v) Config.TriggerBot = v end })
CombatSection:Dropdown({ Title = "Trigger Mode", Values = {"Normal", "Rapid", "Burst"}, Default = "Normal", Callback = function(v) Config.TriggerMode = v end })

local HitboxSection = Tabs.Combat:Section({ Title = "Hitbox Expander" })
HitboxSection:Toggle({ Title = "Enable Hitbox Expander", Default = false, Callback = function(v) Config.ExpandHitbox = v end })
HitboxSection:Slider({ Title = "Hitbox Size", Min = 2, Max = 50, Default = 10, Step = 1, Callback = function(v) Config.HitboxSize = v end })
HitboxSection:Slider({ Title = "Hitbox Transparency", Min = 0, Max = 1, Default = 0.7, Step = 0.05, Callback = function(v) Config.HitboxTransparency = v end })
HitboxSection:Slider({ Title = "Reach", Min = 5, Max = 100, Default = 15, Step = 1, Callback = function(v) Config.Reach = v end })
HitboxSection:Dropdown({ Title = "Reach Mode", Values = {"Normal", "Extended", "Infinite"}, Default = "Normal", Callback = function(v) Config.ReachMode = v end })
CombatSection:Toggle({ Title = "Multi Hit", Default = false, Callback = function(v) Config.MultiHit = v end })
CombatSection:Toggle({ Title = "Range Extender", Default = false, Callback = function(v) Config.RangeExtender = v end })
CombatSection:Toggle({ Title = "Hit Effect", Default = false, Callback = function(v) Config.HitEffect = v end })

-- [[ MOVEMENT TAB ]]
local MovementSection = Tabs.Movement:Section({ Title = "Character Mods" })
MovementSection:Toggle({ Title = "Fly", Default = false, Callback = function(v) Config.Fly = v end })
MovementSection:Dropdown({ Title = "Fly Mode", Values = {"Normal", "Jetpack", "NoclipFly", "Glide"}, Default = "Normal", Callback = function(v) Config.FlyMode = v end })
MovementSection:Slider({ Title = "Fly Speed", Min = 10, Max = 500, Default = 50, Step = 5, Callback = function(v) Config.FlySpeed = v end })
MovementSection:Toggle({ Title = "Noclip", Default = false, Callback = function(v) Config.Noclip = v end })
MovementSection:Toggle({ Title = "Speed Hack (CFrame)", Default = false, Callback = function(v) Config.SpeedHack = v end })
MovementSection:Dropdown({ Title = "Speed Mode", Values = {"CFrame", "Velocity", "Teleport", "Bhop"}, Default = "CFrame", Callback = function(v) Config.SpeedMode = v end })
MovementSection:Slider({ Title = "Walk Speed", Min = 16, Max = 1000, Default = 16, Step = 5, Callback = function(v) Config.WalkSpeed = v end })
MovementSection:Slider({ Title = "Jump Power", Min = 50, Max = 1000, Default = 50, Step = 5, Callback = function(v) Config.JumpPower = v end })
MovementSection:Toggle({ Title = "Infinite Jump", Default = false, Callback = function(v) Config.InfiniteJump = v end })
MovementSection:Toggle({ Title = "Super Jump", Default = false, Callback = function(v) Config.SuperJump = v end })

-- [[ TELEPORT TAB ]]
local TeleportSection = Tabs.Teleport:Section({ Title = "Teleport Settings" })
TeleportSection:Toggle({ Title = "Enable Teleport (Tween)", Default = false, Callback = function(v) Config.EnableTeleport = v end })
TeleportSection:Toggle({ Title = "Instant Teleport", Default = false, Callback = function(v) Config.InstantTeleport = v end })
TeleportSection:Dropdown({ Title = "Teleport Mode", Values = {"Select", "Nearest", "Random", "Safe"}, Default = "Select", Callback = function(v) Config.TeleportMode = v end })

local playerListValues = {}
for _, p in ipairs(Services.Players:GetPlayers()) do
    if p ~= LocalPlayer then table.insert(playerListValues, p.Name) end
end
local TargetDropdown = TeleportSection:Dropdown({
    Title = "Select Target Player",
    Values = playerListValues,
    Default = "",
    Callback = function(v) Config.TeleportTarget = v end
})

TeleportSection:Toggle({ Title = "Loop Teleport", Default = false, Callback = function(v) Config.TeleportLoop = v end })
TeleportSection:Slider({ Title = "Tween Speed", Min = 50, Max = 1000, Default = 150, Step = 10, Callback = function(v) Config.TeleportSpeed = v end })

task.spawn(function()
    while task.wait(5) do
        local newPlayers = {}
        for _, p in ipairs(Services.Players:GetPlayers()) do
            if p ~= LocalPlayer then table.insert(newPlayers, p.Name) end
        end
        TargetDropdown:SetValues(newPlayers)
    end
end)

-- [[ LEGIT TAB ]]
local LegitSection = Tabs.Legit:Section({ Title = "Legit Features" })
LegitSection:Toggle({ Title = "Legit Aimbot", Default = false, Callback = function(v) Config.EnableLegitAimbot = v end })
LegitSection:Slider({ Title = "Legit Smoothness", Min = 0.3, Max = 1, Default = 0.5, Step = 0.05, Callback = function(v) Config.LegitSmoothness = v end })
LegitSection:Toggle({ Title = "Legit Tween", Default = false, Callback = function(v) Config.EnableLegitTween = v end })
LegitSection:Slider({ Title = "Legit Tween Speed", Min = 20, Max = 200, Default = 50, Step = 5, Callback = function(v) Config.LegitTweenSpeed = v end })

-- [[ PVP EXTRA TAB ]]
local PVPExtraSection = Tabs.PVPExtra:Section({ Title = "Extra PVP Features" })
PVPExtraSection:Toggle({ Title = "Auto Parry", Default = false, Callback = function(v) Config.AutoParry = v end })
PVPExtraSection:Dropdown({ Title = "Parry Mode", Values = {"Normal", "Perfect", "RandomDelay"}, Default = "Normal", Callback = function(v) Config.ParryMode = v end })
PVPExtraSection:Toggle({ Title = "Infinite Combo", Default = false, Callback = function(v) Config.InfiniteCombo = v end })
PVPExtraSection:Toggle({ Title = "No Stun", Default = false, Callback = function(v) Config.NoStun = v end })
PVPExtraSection:Toggle({ Title = "Anti Lock", Default = false, Callback = function(v) Config.AntiLock = v end })
PVPExtraSection:Toggle({ Title = "Auto Dodge", Default = false, Callback = function(v) Config.AutoDodge = v end })
PVPExtraSection:Dropdown({ Title = "Dodge Mode", Values = {"Jump", "Dash", "Roll"}, Default = "Jump", Callback = function(v) Config.DodgeMode = v end })
PVPExtraSection:Toggle({ Title = "Fast Attack", Default = false, Callback = function(v) Config.FastAttack = v end })
PVPExtraSection:Toggle({ Title = "No Cooldown", Default = false, Callback = function(v) Config.NoCooldown = v end })
PVPExtraSection:Slider({ Title = "Damage Multiplier", Min = 1, Max = 50, Default = 1, Step = 1, Callback = function(v) Config.DamageMultiplier = v end })
PVPExtraSection:Toggle({ Title = "Health Regen", Default = false, Callback = function(v) Config.HealthRegen = v end })
PVPExtraSection:Toggle({ Title = "God Mode", Default = false, Callback = function(v) Config.GodMode = v end })
PVPExtraSection:Toggle({ Title = "Infinite Stamina", Default = false, Callback = function(v) Config.InfiniteStamina = v end })
PVPExtraSection:Toggle({ Title = "Auto Use Skills", Default = false, Callback = function(v) Config.AutoUseSkills = v end })
PVPExtraSection:Toggle({ Title = "Kill All", Default = false, Callback = function(v) Config.KillAll = v end })
PVPExtraSection:Toggle({ Title = "No Fall Damage", Default = false, Callback = function(v) Config.NoFallDamage = v end })
PVPExtraSection:Toggle({ Title = "Spin Bot", Default = false, Callback = function(v) Config.SpinBot = v end })
PVPExtraSection:Slider({ Title = "Spin Speed", Min = 100, Max = 1000, Default = 200, Step = 25, Callback = function(v) Config.SpinSpeed = v end })
PVPExtraSection:Toggle({ Title = "Auto Block", Default = false, Callback = function(v) Config.AutoBlock = v end })
PVPExtraSection:Toggle({ Title = "Rage Mode", Default = false, Callback = function(v) Config.RageMode = v end })

-- [[ SUPER EXTRA TAB ]]
local SuperExtraSection = Tabs.SuperExtra:Section({ Title = "Super Features" })
SuperExtraSection:Toggle({ Title = "Auto Loot", Default = false, Callback = function(v) Config.AutoLoot = v end })
SuperExtraSection:Toggle({ Title = "Anti Detect", Default = false, Callback = function(v) Config.AntiDetect = v end })
SuperExtraSection:Toggle({ Title = "Infinite Money", Default = false, Callback = function(v) Config.InfiniteMoney = v end })
SuperExtraSection:Toggle({ Title = "Auto Revive", Default = false, Callback = function(v) Config.AutoRevive = v end })
SuperExtraSection:Toggle({ Title = "Enemy Weakener", Default = false, Callback = function(v) Config.EnemyWeakener = v end })
SuperExtraSection:Toggle({ Title = "Auto Level Up", Default = false, Callback = function(v) Config.AutoLevelUp = v end })
SuperExtraSection:Toggle({ Title = "Invisibility", Default = false, Callback = function(v) Config.Invisibility = v end })
SuperExtraSection:Toggle({ Title = "Auto Win", Default = false, Callback = function(v) Config.AutoWin = v end })
SuperExtraSection:Toggle({ Title = "Ban Bypass", Default = false, Callback = function(v) Config.BanBypass = v end })
SuperExtraSection:Toggle({ Title = "Script Optimizer", Default = false, Callback = function(v) Config.ScriptOptimizer = v end })
SuperExtraSection:Toggle({ Title = "Custom UI", Default = false, Callback = function(v) Config.CustomUI = v end })

-- [[ MISC TAB ]]
local MiscSection = Tabs.Misc:Section({ Title = "System Tools" })
MiscSection:Toggle({
    Title = "FPS Boost",
    Default = false,
    Callback = function(v)
        Config.FPSBoost = v
        if v then
            for _, obj in pairs(game:GetDescendants()) do
                if obj:IsA("Texture") or obj:IsA("Decal") then obj:Destroy() end
            end
            Services.Lighting.GlobalShadows = false
        end
    end
})
MiscSection:Toggle({
    Title = "Fullbright",
    Default = false,
    Callback = function(v)
        Config.Fullbright = v
        if v then
            Services.Lighting.Brightness = 2
            Services.Lighting.ClockTime = 14
            Services.Lighting.FogEnd = 100000
            Services.Lighting.GlobalShadows = false
        else
            Services.Lighting.Brightness = 1
            Services.Lighting.ClockTime = 12
            Services.Lighting.FogEnd = 1000
        end
    end
})

local SafetySection = Tabs.Misc:Section({ Title = "Safety Settings" })
SafetySection:Toggle({ Title = "Auto Escape", Default = false, Callback = function(v) Config.EnableSafety = v end })
SafetySection:Slider({ Title = "Escape Health %", Min = 10, Max = 50, Default = 30, Step = 1, Callback = function(v) Config.SafetyHealth = v end })
SafetySection:Slider({ Title = "Escape Distance", Min = 500, Max = 5000, Default = 1000, Step = 100, Callback = function(v) Config.EscapeDistance = v end })
SafetySection:Toggle({ Title = "Anti Admin", Default = false, Callback = function(v) Config.AntiAdmin = v end })
SafetySection:Toggle({ Title = "Spoof Stats", Default = false, Callback = function(v) Config.SpoofStats = v end })
SafetySection:Toggle({ Title = "Fake Lag", Default = false, Callback = function(v) Config.FakeLag = v end })

-- [[ SETTINGS TAB ]]
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

local ConfigSection = Tabs.Settings:Section({ Title = "Config Management" })
local configNameVal, configDesVal, importStringVal, encryptConfigVal = "", "", "", false

ConfigSection:Input({
    Title = "Config Name",
    Placeholder = "Enter config name",
    Callback = function(v) configNameVal = v end
})
ConfigSection:Input({
    Title = "Config Description",
    Placeholder = "Enter description",
    Callback = function(v) configDesVal = v end
})
ConfigSection:Toggle({
    Title = "Encrypt Config",
    Default = false,
    Callback = function(v) encryptConfigVal = v end
})
ConfigSection:Button({
    Title = "Export Config",
    Callback = function()
        local configData = { name = configNameVal, des = configDesVal, data = Config }
        local json = Services.HttpService:JSONEncode(configData)
        local exportStr = encryptConfigVal and base64Encode(json) or json
        setclipboard(exportStr)
        WindUI:Notify({ Title = "Config Exported", Content = "Copied to clipboard.", Duration = 3 })
    end
})
ConfigSection:Input({
    Title = "Import Config String",
    Placeholder = "Paste config string here",
    Callback = function(v) importStringVal = v end
})
ConfigSection:Button({
    Title = "Import Config",
    Callback = function()
        if importStringVal == "" then return end
        local json = encryptConfigVal and base64Decode(importStringVal) or importStringVal
        local success, configData = pcall(function() return Services.HttpService:JSONDecode(json) end)
        if success then
            Config = configData.data
            WindUI:Notify({ Title = "Success", Content = "Config loaded successfully!", Duration = 3 })
        else
            WindUI:Notify({ Title = "Import Failed", Content = "Invalid string format.", Duration = 3 })
        end
    end
})

-- Core Visual Loop & Update Handlers
local function AddESP(player: Player)
    if ESPStorage[player] then return end
    ESPStorage[player] = {
        Box = CreateDrawing("Square", {Thickness = 1.5, Color = Color3.fromRGB(255, 0, 0), Filled = false, Visible = false}),
        Tracer = CreateDrawing("Line", {Thickness = 1.5, Color = Color3.fromRGB(255, 0, 0), Visible = false}),
        Name = CreateDrawing("Text", {Size = 14, Center = true, Outline = true, Color = Color3.fromRGB(255, 255, 255), Visible = false}),
        HealthBarBorder = CreateDrawing("Square", {Thickness = 1, Color = Color3.new(0,0,0), Filled = false, Visible = false}),
        HealthBarFill = CreateDrawing("Square", {Thickness = 1, Filled = true, Visible = false}),
        Highlight = nil
    }
end

local function RemoveESP(player: Player)
    if ESPStorage[player] then
        for _, obj in pairs(ESPStorage[player]) do
            if typeof(obj) == "Instance" and obj then obj:Destroy() elseif obj then obj:Remove() end
        end
        ESPStorage[player] = nil
    end
end

local function UpdateESP()
    for player, esp in pairs(ESPStorage) do
        if Config.EnableESP and IsValidTarget(player) then
            local char = player.Character
            local root = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChild("Humanoid")
            local head = char:FindFirstChild("Head")
            if root and humanoid and head then
                local topPos = head.Position + Vector3.new(0, 1, 0)
                local bottomPos = root.Position - Vector3.new(0, 3, 0)
                local top, onScreenTop = CurrentCamera:WorldToViewportPoint(topPos)
                local bottom, onScreenBottom = CurrentCamera:WorldToViewportPoint(bottomPos)
                if onScreenTop and onScreenBottom then
                    local height = math.abs(top.Y - bottom.Y)
                    local width = height / 2
                    local posY = math.min(top.Y, bottom.Y)
                    local posX = (top.X + bottom.X) / 2 - width / 2
                    local topLeft = Vector2.new(posX, posY)
                    local size = Vector2.new(width, height)
                    local centerX = posX + width / 2
                    local bottomY = posY + height
                
                    if Config.ShowBox then
                        esp.Box.Visible = true; esp.Box.Position = topLeft; esp.Box.Size = size
                    else esp.Box.Visible = false end
                
                    if Config.ShowTracer then
                        esp.Tracer.Visible = true
                        esp.Tracer.From = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y)
                        esp.Tracer.To = Vector2.new(centerX, bottomY)
                    else esp.Tracer.Visible = false end
                
                    if Config.ShowName then
                        esp.Name.Visible = true
                        esp.Name.Position = Vector2.new(centerX, posY - 15)
                        esp.Name.Text = string.format("%s [%.0fm]", player.Name, (root.Position - CurrentCamera.CFrame.Position).Magnitude)
                    else esp.Name.Visible = false end
                
                    if Config.ShowHealthBar then
                        esp.HealthBarBorder.Visible = true; esp.HealthBarFill.Visible = true
                        local barWidth = 2; local offset = 4
                        local healthPct = humanoid.Health / humanoid.MaxHealth
                        local barHeight = height * healthPct
                        esp.HealthBarBorder.Position = Vector2.new(posX - offset - barWidth, posY)
                        esp.HealthBarBorder.Size = Vector2.new(barWidth, height)
                        esp.HealthBarFill.Position = Vector2.new(posX - offset - barWidth, posY + (height - barHeight))
                        esp.HealthBarFill.Size = Vector2.new(barWidth, barHeight)
                        esp.HealthBarFill.Color = Color3.fromHSV(healthPct * 0.3, 1, 1)
                    else
                        esp.HealthBarBorder.Visible = false; esp.HealthBarFill.Visible = false
                    end
                else
                    for k, obj in pairs(esp) do if k ~= "Highlight" then obj.Visible = false end end
                end
            
                if Config.EnableHighlight then
                    if not esp.Highlight then
                        esp.Highlight = Instance.new("Highlight")
                        esp.Highlight.Adornee = char
                        esp.Highlight.Parent = char
                    end
                    esp.Highlight.FillColor = Config.HighlightFillColor
                    esp.Highlight.FillTransparency = Config.HighlightFillTransparency
                    esp.Highlight.OutlineColor = Config.HighlightOutlineColor
                    esp.Highlight.OutlineTransparency = Config.HighlightOutlineTransparency
                elseif esp.Highlight then
                    esp.Highlight:Destroy()
                    esp.Highlight = nil
                end
            else
                for k, obj in pairs(esp) do
                    if k == "Highlight" and obj then obj:Destroy() elseif k ~= "Highlight" then obj.Visible = false end
                end
                esp.Highlight = nil
            end
        else
            for k, obj in pairs(esp) do
                if k == "Highlight" and obj then obj:Destroy() elseif k ~= "Highlight" then obj.Visible = false end
            end
            esp.Highlight = nil
        end
    end
end

Services.RunService.RenderStepped:Connect(function()
    UpdateESP()
    if Config.EnableAimbot or Config.EnableLegitAimbot then
        local smoothness = Config.EnableLegitAimbot and Config.LegitSmoothness or Config.Smoothness
        local target = GetNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild(Config.AimPart) then
            local targetPos = target.Character[Config.AimPart].Position
            if Config.AimbotMode == "Prediction" then
                targetPos = targetPos + target.Character[Config.AimPart].Velocity * Config.PredictionAmount
            end
            local currentCFrame = CurrentCamera.CFrame
            local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
        
            if Config.AimbotMode == "Flick" then smoothness = Config.FlickSpeed
            elseif Config.AimbotMode == "Sticky" then smoothness = 0
            elseif Config.AimbotMode == "Silent" then return
            elseif Config.AimbotMode == "Trigger" then
                if Mouse.Target and Mouse.Target:IsDescendantOf(target.Character) then Fire() end
                return
            end

            if smoothness <= 0.05 then
                CurrentCamera.CFrame = targetCFrame
            else
                CurrentCamera.CFrame = currentCFrame:Lerp(targetCFrame, 1 - smoothness)
            end
        
            if Config.RotateCharacterToTarget and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local root = LocalPlayer.Character.HumanoidRootPart
                root.CFrame = CFrame.new(root.Position, Vector3.new(targetPos.X, root.Position.Y, targetPos.Z))
            end
        end
    end
end)

Services.RunService.Heartbeat:Connect(function(delta)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    local humanoid = char:FindFirstChild("Humanoid")

    -- Smart Macro Loop Functionality
    if Config.SmartMacroActive then
        local target = GetNearestPlayer()
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            root.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
            Fire()
        end
    end

    if Config.EnableTeleport then
        local targetPlayer = nil
        if Config.TeleportMode == "Nearest" then targetPlayer = GetNearestPlayerForTP()
        elseif Config.TeleportMode == "Random" then
            local players = Services.Players:GetPlayers()
            targetPlayer = players[math.random(1, #players)]
        else targetPlayer = Services.Players:FindFirstChild(Config.TeleportTarget) end

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetRP = targetPlayer.Character.HumanoidRootPart
            local targetPos = targetRP.Position + Vector3.new(0, 0, 3)
            if Config.TeleportLoop then
                if Config.InstantTeleport then InstantTeleportTo(targetPos)
                else char.HumanoidRootPart.CFrame = targetRP.CFrame * CFrame.new(0, 0, 3) end
            else
                if not _G.TeleportingNow then
                    _G.TeleportingNow = true
                    task.spawn(function()
                        if Config.InstantTeleport then InstantTeleportTo(targetPos)
                        else
                            local tween = TweenToPosition(targetPos, Config.TeleportSpeed)
                            if tween then tween.Completed:Wait() end
                        end
                        _G.TeleportingNow = false
                        Config.EnableTeleport = false
                    end)
                end
            end
        end
    end

    if Config.ExpandHitbox then
        for _, player in pairs(Services.Players:GetPlayers()) do
            if IsValidTarget(player) then
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    targetRoot.Size = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize)
                    targetRoot.Transparency = Config.HitboxTransparency
                    targetRoot.CanCollide = false
                end
            end
        end
    end

    if Config.EnableKillAura then
        local range = Config.ReachMode == "Infinite" and math.huge or (Config.ReachMode == "Extended" and Config.Reach * 2 or Config.Reach)
        for _, player in pairs(Services.Players:GetPlayers()) do
            if IsValidTarget(player) then
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot and (root.Position - targetRoot.Position).Magnitude <= range then
                    root.CFrame = CFrame.new(root.Position, Vector3.new(targetRoot.Position.X, root.Position.Y, targetRoot.Position.Z))
                    Fire()
                end
            end
        end
    end

    if Config.Fly then
        local velocity = root:FindFirstChild("SovereignFlyVelocity") or Instance.new("BodyVelocity")
        velocity.Name = "SovereignFlyVelocity"
        velocity.Parent = root
        velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        local camCFrame = CurrentCamera.CFrame
        local velocityVector = Vector3.new()
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.W) then velocityVector = velocityVector + camCFrame.LookVector end
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.S) then velocityVector = velocityVector - camCFrame.LookVector end
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.A) then velocityVector = velocityVector - camCFrame.RightVector end
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.D) then velocityVector = velocityVector + camCFrame.RightVector end
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) then velocityVector = velocityVector + Vector3.new(0, 1, 0) end
        if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then velocityVector = velocityVector - Vector3.new(0, 1, 0) end
        velocity.Velocity = velocityVector.Magnitude > 0 and velocityVector.Unit * Config.FlySpeed or Vector3.new()
    else
        local velocity = root:FindFirstChild("SovereignFlyVelocity")
        if velocity then velocity:Destroy() end
    end

    if Config.Noclip then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
        end
    end

    if humanoid then
        if Config.SpeedHack or Config.WalkSpeed > 16 then
            if Config.SpeedMode == "CFrame" then
                root.CFrame = root.CFrame + humanoid.MoveDirection * Config.WalkSpeed * delta
            elseif Config.SpeedMode == "Velocity" then
                root.Velocity = humanoid.MoveDirection * Config.WalkSpeed
            end
        end
        if Config.JumpPower > 50 then humanoid.JumpPower = Config.JumpPower end
    end
end)

Services.Players.PlayerAdded:Connect(function(player)
    AddESP(player)
    player.CharacterAdded:Connect(function() AddESP(player) end)
end)
Services.Players.PlayerRemoving:Connect(RemoveESP)
for _, player in pairs(Services.Players:GetPlayers()) do
    if player ~= LocalPlayer then
        AddESP(player)
        player.CharacterAdded:Connect(function() AddESP(player) end)
    end
end

Services.UserInputService.JumpRequest:Connect(function()
    if Config.InfiniteJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then humanoid:ChangeState("Jumping") end
    end
end)

LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        local vu = game:GetService("VirtualUser")
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end
end)

-- Keybind for cycling players with 'U'
Services.UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.U then
        local players = {}
        for _, p in ipairs(Services.Players:GetPlayers()) do
            if p ~= LocalPlayer then table.insert(players, p.Name) end
        end
        if #players > 0 then
            local curIndex = table.find(players, Config.TeleportTarget) or 0
            local nextIndex = (curIndex % #players) + 1
            Config.TeleportTarget = players[nextIndex]
            WindUI:Notify({ Title = "Teleport Target", Content = "Target set to: " .. Config.TeleportTarget, Duration = 2 })
        end
    end
end)

WindUI:Notify({
    Title = "Sovereign Hub Loaded",
    Content = "All-in-one features and Smart Macro loaded successfully.",
    Duration = 5
})
