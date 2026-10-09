-- Sovereign PvP Hub by Kaizerr, Axiom and Luffy
-- WindUI-based UI shell with black surfaces and red border accents.
-- This rewrite intentionally includes safe client-side UI settings only.
-- It does not implement aimbot, ESP/wallhack, exploit remotes, combat automation,
-- stat manipulation, anti-ban/bypass, or automated PvP macros.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local LOGO_ASSET = "rbxassetid://82022500310652"
local RED = Color3.fromRGB(235, 35, 48)
local BLACK = Color3.fromRGB(10, 10, 12)
local DARK = Color3.fromRGB(17, 17, 20)
local WHITE = Color3.fromRGB(245, 245, 247)

-- Load WindUI.
local WindUI
local loaded, loadError = pcall(function()
    WindUI = loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
    ))()
end)

if not loaded or not WindUI then
    warn("[Sovereign PvP Hub] WindUI failed to load: " .. tostring(loadError))
    return
end

local Window = WindUI:CreateWindow({
    Title = "Sovereign PvP Hub",
    Icon = "shield",
    Author = "by Kaizerr, Axiom and Luffy",
    Folder = "SovereignPvPHub",
    Size = UDim2.fromOffset(650, 480),
    MinSize = Vector2.new(360, 300),
    MaxSize = Vector2.new(900, 700),
    Transparent = false,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 180,
    Background = LOGO_ASSET,
    BackgroundImageTransparency = 0.86,
    HideSearchBar = false,
    ScrollBarEnabled = true,
})

pcall(function()
    Window:SetBackgroundImage(LOGO_ASSET)
end)

pcall(function()
    Window:SetTheme({
        Background = BLACK,
        Accent = RED,
        Outline = RED,
        Text = WHITE,
        Placeholder = Color3.fromRGB(145, 145, 150),
        Button = DARK,
        Icon = RED,
    })
end)

local function addTab(title, icon)
    local ok, tab = pcall(function()
        return Window:Tab({ Title = title, Icon = icon })
    end)
    if ok then return tab end
    return Window:Tab({ Title = title })
end

local function addSection(tab, title)
    return tab:Section({ Title = title })
end

local Home = addTab("Home", "house")
local Visuals = addTab("Visuals", "monitor")
local Character = addTab("Character", "user-round")
local Utilities = addTab("Utilities", "wrench")
local Macro = addTab("Macro", "keyboard")
local Settings = addTab("Settings", "settings")
local About = addTab("About", "info")

-- Preserve the actual starting lighting values so restore does not guess defaults.
local originalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    GlobalShadows = Lighting.GlobalShadows,
    FogEnd = Lighting.FogEnd,
}

local function restoreOriginalLighting()
    Lighting.Brightness = originalLighting.Brightness
    Lighting.ClockTime = originalLighting.ClockTime
    Lighting.GlobalShadows = originalLighting.GlobalShadows
    Lighting.FogEnd = originalLighting.FogEnd
end

-- HOME
addSection(Home, "SOVEREIGN PVP HUB")
pcall(function()
    Home:Paragraph({
        Title = "Sovereign PvP Hub",
        Desc = "A black-and-red WindUI interface by Kaizerr, Axiom and Luffy. Restored utility panels include local FPS optimization, character status/reset, camera restore, session information, and macro profiles.",
        Image = LOGO_ASSET,
        ImageSize = 48,
    })
end)

addSection(Home, "SESSION")
local sessionLabel
pcall(function()
    sessionLabel = Home:Paragraph({
        Title = "Session information",
        Desc = "Player: " .. LocalPlayer.Name .. "\nPlace ID: " .. tostring(game.PlaceId),
    })
end)

addSection(Home, "QUICK ACTIONS")
Home:Button({
    Title = "Recenter camera",
    Desc = "Restore the default camera subject when your character is available.",
    Callback = function()
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            workspace.CurrentCamera.CameraSubject = humanoid
            WindUI:Notify({
                Title = "Sovereign",
                Content = "Camera subject restored.",
                Duration = 3,
            })
        end
    end,
})

Home:Button({
    Title = "Reset client visual settings",
    Desc = "Restore the local lighting values changed by this UI.",
    Callback = function()
        restoreOriginalLighting()
        WindUI:Notify({
            Title = "Sovereign",
            Content = "Default lighting values restored.",
            Duration = 3,
        })
    end,
})

-- CLIENT-SIDE SETTINGS ONLY
addSection(Visuals, "LOCAL DISPLAY")
Visuals:Toggle({
    Title = "Fullbright",
    Desc = "Adjust local lighting for visibility; affects your client only.",
    Value = false,
    Callback = function(enabled)
        if enabled then
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 100000
        else
            restoreOriginalLighting()
        end
    end,
})

Visuals:Toggle({
    Title = "Hide local particles",
    Desc = "Hide particle emitters and trails locally; does not change other players.",
    Value = false,
    Callback = function(enabled)
        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("ParticleEmitter") or object:IsA("Trail") then
                if enabled then
                    if object:GetAttribute("Sovereign_OldEnabled") == nil then
                        object:SetAttribute("Sovereign_OldEnabled", object.Enabled)
                    end
                    object.Enabled = false
                else
                    local old = object:GetAttribute("Sovereign_OldEnabled")
                    if old ~= nil then
                        object.Enabled = old
                        object:SetAttribute("Sovereign_OldEnabled", nil)
                    end
                end
            end
        end
    end,
})

Visuals:Toggle({
    Title = "Hide local post-processing",
    Desc = "Temporarily disable local Bloom, Blur, and ColorCorrection effects.",
    Value = false,
    Callback = function(enabled)
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("BloomEffect")
                or effect:IsA("BlurEffect")
                or effect:IsA("ColorCorrectionEffect")
                or effect:IsA("SunRaysEffect")
            then
                if enabled then
                    if effect:GetAttribute("Sovereign_OldEnabled") == nil then
                        effect:SetAttribute("Sovereign_OldEnabled", effect.Enabled)
                    end
                    effect.Enabled = false
                else
                    local old = effect:GetAttribute("Sovereign_OldEnabled")
                    if old ~= nil then
                        effect.Enabled = old
                        effect:SetAttribute("Sovereign_OldEnabled", nil)
                    end
                end
            end
        end
    end,
})

-- RESTORED LEGACY UTILITY FEATURES (client-side / normal Roblox actions)
-- These restore safe utility-style functionality from the original layout without
-- reintroducing exploit-based movement, targeting, combat, or bypass systems.

local fpsBoostEnabled = false
local fpsSaved = setmetatable({}, { __mode = "k" })
local function setLocalEffectsEnabled(enabled)
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ParticleEmitter") or object:IsA("Trail") or object:IsA("Beam") then
            if enabled then
                if fpsSaved[object] == nil then fpsSaved[object] = { Enabled = object.Enabled } end
                object.Enabled = false
            else
                local saved = fpsSaved[object]
                if saved then
                    pcall(function() object.Enabled = saved.Enabled end)
                    fpsSaved[object] = nil
                end
            end
        elseif object:IsA("BasePart") then
            if enabled then
                if fpsSaved[object] == nil then fpsSaved[object] = { CastShadow = object.CastShadow } end
                object.CastShadow = false
            else
                local saved = fpsSaved[object]
                if saved and saved.CastShadow ~= nil then
                    pcall(function() object.CastShadow = saved.CastShadow end)
                    fpsSaved[object] = nil
                end
            end
        end
    end
    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("PostEffect") then
            if enabled then
                if fpsSaved[effect] == nil then fpsSaved[effect] = { Enabled = effect.Enabled } end
                effect.Enabled = false
            else
                local saved = fpsSaved[effect]
                if saved and saved.Enabled ~= nil then
                    pcall(function() effect.Enabled = saved.Enabled end)
                    fpsSaved[effect] = nil
                end
            end
        end
    end
end

addSection(Visuals, "PERFORMANCE")
Visuals:Toggle({
    Title = "FPS Boost",
    Desc = "Locally disables particles, trails, beams, post effects and part shadows. Original values are restored when switched off.",
    Value = false,
    Callback = function(enabled)
        fpsBoostEnabled = enabled
        setLocalEffectsEnabled(enabled)
        pcall(function()
            WindUI:Notify({ Title = "Sovereign", Content = enabled and "Local visual effects reduced." or "Saved visual effects restored.", Duration = 3 })
        end)
    end,
})

addSection(Character, "CHARACTER STATUS")
local function getCharacterStatus()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not character or not humanoid then return "Character not loaded." end
    return string.format("Health: %d / %d\nWalkSpeed: %.1f\nJumpPower: %.1f\nRoot part: %s",
        math.floor(humanoid.Health + 0.5), math.floor(humanoid.MaxHealth + 0.5),
        humanoid.WalkSpeed, humanoid.JumpPower, root and "Available" or "Missing")
end

pcall(function()
    Character:Paragraph({ Title = "Current character", Desc = getCharacterStatus(), Image = LOGO_ASSET, ImageSize = 36 })
end)

Character:Button({
    Title = "Refresh character status",
    Desc = "Re-read health and standard movement properties.",
    Callback = function()
        pcall(function() WindUI:Notify({ Title = "Character Status", Content = getCharacterStatus(), Duration = 5 }) end)
    end,
})

Character:Button({
    Title = "Reset character",
    Desc = "Uses the normal Humanoid health reset when available.",
    Callback = function()
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
            pcall(function() WindUI:Notify({ Title = "Sovereign", Content = "Character reset requested.", Duration = 3 }) end)
        else
            pcall(function() WindUI:Notify({ Title = "Sovereign", Content = "Character is not loaded yet.", Duration = 3 }) end)
        end
    end,
})

Character:Button({
    Title = "Restore default camera",
    Desc = "Sets the camera subject back to your current Humanoid.",
    Callback = function()
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and workspace.CurrentCamera then
            workspace.CurrentCamera.CameraSubject = humanoid
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            pcall(function() WindUI:Notify({ Title = "Sovereign", Content = "Default camera restored.", Duration = 3 }) end)
        end
    end,
})

addSection(Utilities, "SESSION TOOLS")
Utilities:Button({
    Title = "Show session information",
    Desc = "Displays player, place, and server identifiers.",
    Callback = function()
        local info = "Player: " .. LocalPlayer.Name .. "\nUserId: " .. tostring(LocalPlayer.UserId)
            .. "\nPlaceId: " .. tostring(game.PlaceId) .. "\nJobId: " .. tostring(game.JobId)
        pcall(function() WindUI:Notify({ Title = "Session Information", Content = info, Duration = 6 }) end)
    end,
})

Utilities:Button({
    Title = "Restore local visual effects",
    Desc = "Re-enables the FPS Boost-saved effects and turns FPS Boost off.",
    Callback = function()
        fpsBoostEnabled = false
        setLocalEffectsEnabled(false)
        pcall(function() WindUI:Notify({ Title = "Sovereign", Content = "Saved local visual effects restored.", Duration = 3 }) end)
    end,
})

-- MACRO TAB: profile manager for manually performed action sequences.
-- This stores step lists and guides the player; it does not inject inputs or automate combat.
addSection(Macro, "MACRO WORKSPACE")
pcall(function()
    Macro:Paragraph({
        Title = "Macro profiles",
        Desc = "Create, save, load, delete, and step through reusable profiles. These are manual action checklists; no game inputs are injected.",
        Image = LOGO_ASSET,
        ImageSize = 40,
    })
end)

local HttpService = game:GetService("HttpService")
local MACRO_FILE = "SovereignPvPHub/macros.json"
local macroProfiles = {}
local currentMacroName = ""
local currentMacroSteps = {}
local currentStepIndex = 1
local profileNameInput = ""
local profileStepsInput = ""
local profileLoadInput = ""

local function notifyMacro(title, content)
    pcall(function()
        WindUI:Notify({ Title = title, Content = tostring(content), Duration = 4 })
    end)
end

local function saveMacroData()
    local encodedOk, encoded = pcall(function()
        return HttpService:JSONEncode(macroProfiles)
    end)
    if not encodedOk then
        notifyMacro("Macro Manager", "Could not encode macro profiles.")
        return false
    end
    -- Executor file APIs are optional. Profiles still work in memory without them.
    if type(writefile) == "function" then
        local ok = pcall(function()
            if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder("SovereignPvPHub") then
                makefolder("SovereignPvPHub")
            elseif type(makefolder) == "function" and type(isfolder) ~= "function" then
                pcall(makefolder, "SovereignPvPHub")
            end
            writefile(MACRO_FILE, encoded)
        end)
        if ok then return true end
    end
    return false
end

local function loadMacroData()
    if type(readfile) ~= "function" or type(isfile) ~= "function" then return end
    local ok, contents = pcall(function()
        if isfile(MACRO_FILE) then return readfile(MACRO_FILE) end
        return nil
    end)
    if ok and type(contents) == "string" then
        local decodeOk, decoded = pcall(function() return HttpService:JSONDecode(contents) end)
        if decodeOk and type(decoded) == "table" then macroProfiles = decoded end
    end
end

local function splitSteps(text)
    local steps = {}
    for line in tostring(text or ""):gmatch("[^\r\n]+") do
        local trimmed = line:match("^%s*(.-)%s*$")
        if trimmed ~= "" then table.insert(steps, trimmed) end
    end
    return steps
end

local function renderSteps(steps)
    if type(steps) ~= "table" or #steps == 0 then return "No steps saved." end
    local lines = {}
    for i, step in ipairs(steps) do
        table.insert(lines, tostring(i) .. ". " .. tostring(step))
    end
    return table.concat(lines, "\n")
end

loadMacroData()
addSection(Macro, "CREATE OR UPDATE PROFILE")
Macro:Input({
    Title = "Profile name",
    Desc = "Use a short name, e.g. Training Warmup.",
    Value = "",
    Placeholder = "Enter profile name...",
    Callback = function(value) profileNameInput = tostring(value or "") end,
})
Macro:Input({
    Title = "Steps (one per line)",
    Desc = "Write manual reminders only, such as: 1) open practice mode; 2) test a movement key.",
    Value = "",
    Placeholder = "Enter each step on a new line...",
    Callback = function(value) profileStepsInput = tostring(value or "") end,
})
Macro:Button({
    Title = "Save profile",
    Desc = "Create or replace the named profile.",
    Callback = function()
        local name = profileNameInput:match("^%s*(.-)%s*$")
        local steps = splitSteps(profileStepsInput)
        if not name or name == "" then
            notifyMacro("Macro Manager", "Enter a profile name first.")
            return
        end
        if #steps == 0 then
            notifyMacro("Macro Manager", "Add at least one step, one per line.")
            return
        end
        if #steps > 40 then
            notifyMacro("Macro Manager", "A profile can contain at most 40 steps.")
            return
        end
        macroProfiles[name] = steps
        currentMacroName = name
        currentMacroSteps = steps
        currentStepIndex = 1
        local persisted = saveMacroData()
        notifyMacro("Macro Manager", "Saved '" .. name .. "' with " .. #steps .. " steps." .. (persisted and " Saved to file." or " Session-only unless file APIs are available."))
    end,
})

addSection(Macro, "LOAD / DELETE PROFILE")
Macro:Input({
    Title = "Existing profile name",
    Desc = "Type the exact name of a saved profile.",
    Value = "",
    Placeholder = "Profile name to load or delete...",
    Callback = function(value) profileLoadInput = tostring(value or "") end,
})
Macro:Button({
    Title = "Load profile",
    Callback = function()
        local name = profileLoadInput:match("^%s*(.-)%s*$")
        local steps = macroProfiles[name]
        if type(steps) ~= "table" then
            notifyMacro("Macro Manager", "Profile not found. Check the name or save it first.")
            return
        end
        currentMacroName = name
        currentMacroSteps = steps
        currentStepIndex = 1
        notifyMacro("Loaded: " .. name, renderSteps(steps))
    end,
})
Macro:Button({
    Title = "Delete profile",
    Callback = function()
        local name = profileLoadInput:match("^%s*(.-)%s*$")
        if name == "" or macroProfiles[name] == nil then
            notifyMacro("Macro Manager", "No matching profile to delete.")
            return
        end
        macroProfiles[name] = nil
        if currentMacroName == name then
            currentMacroName, currentMacroSteps, currentStepIndex = "", {}, 1
        end
        local persisted = saveMacroData()
        notifyMacro("Macro Manager", "Deleted '" .. name .. "'." .. (persisted and " Changes saved." or " Changes apply for this session."))
    end,
})
Macro:Button({
    Title = "List saved profiles",
    Desc = "Show profile names currently available.",
    Callback = function()
        local names = {}
        for name, steps in pairs(macroProfiles) do
            table.insert(names, name .. " (" .. tostring(type(steps) == "table" and #steps or 0) .. " steps)")
        end
        table.sort(names)
        notifyMacro("Saved profiles", #names > 0 and table.concat(names, "\n") or "No profiles saved yet.")
    end,
})

addSection(Macro, "MANUAL STEP GUIDE")
Macro:Button({
    Title = "Show current profile",
    Callback = function()
        if currentMacroName == "" then
            notifyMacro("Macro Manager", "Load or save a profile first.")
            return
        end
        notifyMacro(currentMacroName, renderSteps(currentMacroSteps))
    end,
})
Macro:Button({
    Title = "Show next step",
    Desc = "Advance the checklist; it will not press keys or perform actions for you.",
    Callback = function()
        if currentMacroName == "" or #currentMacroSteps == 0 then
            notifyMacro("Macro Manager", "Load or save a profile first.")
            return
        end
        if currentStepIndex > #currentMacroSteps then
            notifyMacro(currentMacroName, "All steps reviewed. Use Reset checklist to start again.")
            return
        end
        local message = "Step " .. currentStepIndex .. "/" .. #currentMacroSteps .. ": " .. tostring(currentMacroSteps[currentStepIndex])
        currentStepIndex = currentStepIndex + 1
        notifyMacro(currentMacroName, message)
    end,
})
Macro:Button({
    Title = "Reset checklist",
    Callback = function()
        currentStepIndex = 1
        notifyMacro("Macro Manager", currentMacroName ~= "" and ("Checklist reset for '" .. currentMacroName .. "'.") or "Checklist reset.")
    end,
})
Macro:Button({
    Title = "Export current profile as text",
    Desc = "Display the steps so you can copy them into your notes.",
    Callback = function()
        if currentMacroName == "" then
            notifyMacro("Macro Manager", "Load or save a profile first.")
            return
        end
        notifyMacro("Export: " .. currentMacroName, renderSteps(currentMacroSteps))
    end,
})

-- SETTINGS
addSection(Settings, "INTERFACE")
Settings:Keybind({
    Title = "Toggle interface",
    Desc = "Show or hide the window using a keybind.",
    Value = "RightControl",
    Callback = function()
        pcall(function()
            Window:Toggle()
        end)
    end,
})

Settings:Button({
    Title = "Show interface",
    Callback = function()
        pcall(function()
            Window:Show()
        end)
    end,
})

Settings:Button({
    Title = "Hide interface",
    Callback = function()
        pcall(function()
            Window:Hide()
        end)
    end,
})

addSection(Settings, "CLEANUP")
Settings:Button({
    Title = "Restore local visuals",
    Desc = "Restore lighting and effects altered by this UI.",
    Callback = function()
        restoreOriginalLighting()
        for _, effect in ipairs(Lighting:GetChildren()) do
            local old = effect:GetAttribute("Sovereign_OldEnabled")
            if old ~= nil then
                effect.Enabled = old
                effect:SetAttribute("Sovereign_OldEnabled", nil)
            end
        end
        for _, object in ipairs(workspace:GetDescendants()) do
            local old = object:GetAttribute("Sovereign_OldEnabled")
            if old ~= nil and (object:IsA("ParticleEmitter") or object:IsA("Trail")) then
                object.Enabled = old
                object:SetAttribute("Sovereign_OldEnabled", nil)
            end
        end
        WindUI:Notify({
            Title = "Sovereign",
            Content = "Local visual settings restored.",
            Duration = 3,
        })
    end,
})

-- ABOUT
addSection(About, "CREDITS")
pcall(function()
    About:Paragraph({
        Title = "Sovereign PvP Hub",
        Desc = "Created by Kaizerr, Axiom and Luffy.\nUI library: WindUI.\nRestored: local visual/performance utilities, character status/reset, camera restore, session information, macro profiles.\nNot included: aimbot, silent aim, ESP/wallhack, exploit combat automation, or bypass features.\nLogo asset: " .. LOGO_ASSET,
        Image = LOGO_ASSET,
        ImageSize = 56,
    })
end)

WindUI:Notify({
    Title = "Sovereign PvP Hub",
    Content = "Interface loaded.",
    Duration = 4,
})

print("[Sovereign PvP Hub] Loaded by Kaizerr, Axiom and Luffy.")
