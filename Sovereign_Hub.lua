if _G.primas then return end
_G.primas = true

setfpscap(9999)
repeat task.wait() until game:IsLoaded()

cloneref = cloneref or function(x) return x end

local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local HttpService = cloneref(game:GetService("HttpService"))
local RunService = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local Debris = cloneref(game:GetService("Debris"))
local Stats = cloneref(game:GetService("Stats"))
local LocalPlayer = Players.LocalPlayer

_G.config = {
    accuracy = nil,
    spam_threshold = nil,
    curve_keybind = nil,
    manual_notify = nil,
    curve_notify = nil,
    curve_method = '',
    anti_phantom = nil,
    anti_cooldown = nil,
    skin_changer = nil,
    manual_spam = nil,
    manual_spam_kps = nil,
    ability_esp = nil,
    auto_parry = nil,
    ball_debug = nil,
    auto_spam = nil,
    ping_fix = nil,
    names = '',
    avatar_changer = nil,
    avatar_name = '',
    random_target = nil,
    theme_accent = nil,
    theme_accent_dark = nil,
    theme_background = nil,
    theme_text = nil,
    ui_keybind = nil,
    det_infinity = nil,
    det_deathslash = nil,
    det_timehole = nil,
    det_pull = nil,
    det_singularity = nil,
    det_slashes = nil,
    det_slashes_delay = nil,
    det_slashes_max = nil,
    det_forcefield = nil,
    det_staff = nil,
    det_staff_action = nil,
    animfix_parry = nil,
    animfix_spam = nil,
    animfix_manual = nil,
    player_cosmetics = nil,
    triggerbot_notify = nil,
    manual_spam_ui = nil,
    triggerbot_ui = nil,
    thunder_dash_nocd = nil,
    super_jump_nocd = nil,
    dash_nocd = nil,
    immortality = nil,
    immortal_notify = nil,
    immortal_radius = nil,
    immortal_height = nil,
    custom_announcer = nil,
    announcer_text = nil,
}

if not isfolder("angeli/configs") then
    makefolder("angeli/configs")
end
local CONFIG_PATH = "angeli/configs/blade_ball.json"

local function save_cfg()
    writefile(CONFIG_PATH, HttpService:JSONEncode(_G.config))
end

local function load_cfg()
    if isfile(CONFIG_PATH) then
        _G.config = HttpService:JSONDecode(readfile(CONFIG_PATH))
    end
end

load_cfg()

task.spawn(function()
    repeat
        save_cfg()
        task.wait(1)
    until not _G.primas
end)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer


--[[ ==========================================================================
     LAPISAN UI: library "Speed Hub" (WM: Nexzan Hub) + adapter API "Airflow"
     Library "Airflow" bawaan script (4.741 baris) diganti dengan dua blok di bawah.
     Kode fitur Blade Ball di bawah blok ini TIDAK diubah (hanya teks WM).
     ========================================================================== ]]
local Library
do
    -- library dikunci di dalam pcall: kalau karena satu dan lain hal gagal start,
    -- menu otomatis pakai panel cadangan supaya fitur tetap bisa dipakai
    local okLoad, SpeedUI_Lib = pcall(function()
        return (function()
loadstring([[ 
  function LPH_NO_VIRTUALIZE(f) return f end;
  function LPH_JIT_MAX(f) return f end;
  function LPH_JIT(f) return f end;

  function LPH_ENCNUM(n, ...) return n end;
  function LPH_ENCSTR(s, ...) return s end;
  function LPH_ENCFUNC(f, ...) return f end;
  function LPH_ENCBUF(b, ...) return b end;

  function LPH_ATTRIBUTES(...) end;
  function LPH_REWRITE(expr, ...) return expr end;
  function LPH_STACKALLOC(size, zeroOrOne) return {} end;
  function LPH_PRECHECK(...) end;

  function VM(...) end;
  function PRESET(...) end;
  function ENCRYPT(...) end;
  function OPTIMIZE(...) end;
  function ERROR_HANDLING(...) end;
  function TRANSFORM(...) end;
  NONE, OPAL, ONYX = 0, 1, 2;
  FAST, SECURE = 0, 1;
  CONTROL_FLOW, EXTRACT, INLINE, UNROLL, NO_UPVALUES, level = 0, 0, 0, 0, 0, 0;
]])()

local tbl

tbl = {
	IsDetected = false,
	_unpack = function(arg, arg2, arg3)
		arg2 = arg2 or 1
		arg3 = arg3 or #arg
		if arg3 < arg2 then
			return
		end
		return arg[arg2], tbl._unpack(arg, arg2 + 1, arg3)
	end,
	_pcall = function(arg, ...)
		local tbl2 = { ... }

		local ok, result = pcall(function()
			return arg(tbl._unpack(tbl2))
		end)

		if not ok then
			return false, result
		end
		return true, result
	end,
}

local function fn()
	return true
end

local v, v2 = tbl._pcall(debug.info, fn, "f")

if not v or v2 ~= fn then
	tbl.IsDetected = true
	LPH_CRASH()
end

local v3, v4 = tbl._pcall(debug.info, 2, "f")

if not v3 or v4 ~= pcall then
	tbl.IsDetected = true
	LPH_CRASH()
end

local v5 = (cloneref or function(arg)
	return arg
end)(game:GetService("RunService"))

if v5:IsStudio() then
	tbl.IsDetected = true
	LPH_CRASH()
end

if v5:IsServer() then
	tbl.IsDetected = true
	LPH_CRASH()
end

if tbl.IsDetected then
	return
end

local function fn2()
	local v6 = cloneref
	local obj = setmetatable({}, { __mode = "v" })

	return v6 and function(arg)
		if not arg then
			return nil
		end
		local debugId = arg:GetDebugId() or arg
		local v7 = obj[debugId]
		if v7 then
			return v7
		end
		local v8 = v6(arg)
		obj[debugId] = v8
		return v8
	end or function(arg)
		return arg
	end
end

local v6 = fn2()
local localPlayer = v6(game:GetService("Players")).LocalPlayer
local v7 = v6(game:GetService("RunService"))
local v8 = v6(game:GetService("TweenService"))
local v9 = v6(game:GetService("UserInputService"))
local v10 = v6(game:GetService("HttpService"))
local v11 = v6(Instance.new("VirtualInputManager"))
local playerGui = v7:IsStudio() and localPlayer.PlayerGui
local hui

if playerGui then
	hui = playerGui
else
	hui = gethui() or v6(game:GetService("CoreGui"))
end

local fn3 = getcustomasset or function(...)
	return ...
end

local fn4 = isfile or function(...)
	return ...
end

local fn5 = isfolder or function(...)
	return ...
end

local fn6 = makefolder or function(...)
	return ...
end

local fn7 = readfile or function(...)
	return ...
end

local fn8 = writefile or function(...)
	return ...
end

local fn9 = listfiles or function()
	return {}
end

local fn10 = setclipboard or function(...)
	return ...
end

local tbl2 = {}

task.spawn(function()
	while task.wait(120) do
		if not tbl2.NoVim then
			v11:SendKeyEvent(true, Enum.KeyCode.Unknown, false, game)
			v11:SendKeyEvent(false, Enum.KeyCode.Unknown, false, game)
		end
	end
end)

local index = {}
index.__index = index

index.new = function()
	local obj = setmetatable({}, index)
	obj._Connections = {}
	return obj
end

index.Connect = function(arg, arg2)
	local tbl3 = {
		Connected = true,
		_Callback = arg2,
		_Signal = arg,
		Disconnect = function(arg3)
			arg3.Connected = false
			local connections = arg3._Signal._Connections

			for i, connection in ipairs(connections) do
				if connection == arg3 then
					table.remove(connections, i)
				end
			end
		end,
	}

	table.insert(arg._Connections, tbl3)
	return tbl3
end

index.Fire = function(arg, ...)
	local v12 = table.pack(...)

	for _, connection in ipairs(arg._Connections) do
		if connection.Connected then
			task.spawn(connection._Callback, ...)

			while true do
				local v13 = table.pack(w_1())

				if v13[1] then
					local v14 = v13[3]

					if v14.Connected then
						task.spawn(v14._Callback, table.unpack(v12, 1, v12.n))
					end
				else
					break
				end
			end

			return
		end
	end
end

local v12 = index.new()
tbl2.Version = "5.5.0"
tbl2.ColorRGB = Color3.fromRGB(250, 7, 7)
tbl2.FolderPath = "NexzanHub"
tbl2.Unloaded = false
tbl2.SearchData = {}
tbl2.OnUnloaded = v12

if not fn5(tbl2.FolderPath) then
	fn6(tbl2.FolderPath)
end

if not fn5(tbl2.FolderPath .. "/Image") then
	fn6(tbl2.FolderPath .. "/Image")
end

if not fn5(tbl2.FolderPath .. "/Video") then
	fn6(tbl2.FolderPath .. "/Video")
end

if not fn5(tbl2.FolderPath .. "/Library") then
	fn6(tbl2.FolderPath .. "/Library")
end

tbl2.Instances = { Theme = {}, Translator = {}, Video = {}, Transparency = {}, Image = {}, Font = {} }

tbl2.Theme = {
	Red = {
		Primary = Color3.fromRGB(80, 20, 20),
		Secondary = Color3.fromRGB(120, 30, 30),
		Accent = Color3.fromRGB(180, 50, 50),
		ThemeHighlight = Color3.fromRGB(220, 80, 80),
		Text = Color3.fromRGB(240, 230, 230),
		Background = Color3.fromRGB(20, 10, 10),
		Stroke = Color3.fromRGB(100, 40, 40),
	},
	Darker = {
		Primary = Color3.fromRGB(15, 15, 15),
		Secondary = Color3.fromRGB(25, 25, 25),
		Accent = Color3.fromRGB(40, 40, 40),
		ThemeHighlight = Color3.fromRGB(70, 70, 70),
		Text = Color3.fromRGB(220, 220, 220),
		Background = Color3.fromRGB(5, 5, 5),
		Stroke = Color3.fromRGB(50, 50, 50),
	},
	Blue = {
		Primary = Color3.fromRGB(20, 40, 80),
		Secondary = Color3.fromRGB(30, 60, 120),
		Accent = Color3.fromRGB(50, 90, 180),
		ThemeHighlight = Color3.fromRGB(80, 130, 220),
		Text = Color3.fromRGB(230, 240, 255),
		Background = Color3.fromRGB(10, 20, 40),
		Stroke = Color3.fromRGB(40, 80, 140),
	},
	Dark = {
		Primary = Color3.fromRGB(30, 30, 30),
		Secondary = Color3.fromRGB(50, 50, 50),
		Accent = Color3.fromRGB(80, 80, 80),
		ThemeHighlight = Color3.fromRGB(100, 100, 100),
		Text = Color3.fromRGB(220, 220, 220),
		Background = Color3.fromRGB(10, 10, 10),
		Stroke = Color3.fromRGB(70, 70, 70),
	},
	Green = {
		Primary = Color3.fromRGB(20, 80, 40),
		Secondary = Color3.fromRGB(30, 120, 60),
		Accent = Color3.fromRGB(50, 180, 90),
		ThemeHighlight = Color3.fromRGB(80, 220, 130),
		Text = Color3.fromRGB(230, 255, 240),
		Background = Color3.fromRGB(10, 40, 20),
		Stroke = Color3.fromRGB(40, 100, 60),
	},
	Purple = {
		Primary = Color3.fromRGB(60, 20, 80),
		Secondary = Color3.fromRGB(90, 30, 120),
		Accent = Color3.fromRGB(130, 50, 180),
		ThemeHighlight = Color3.fromRGB(170, 80, 220),
		Text = Color3.fromRGB(240, 230, 255),
		Background = Color3.fromRGB(30, 10, 40),
		Stroke = Color3.fromRGB(90, 40, 140),
	},
	Yellow = {
		Primary = Color3.fromRGB(80, 80, 20),
		Secondary = Color3.fromRGB(120, 120, 30),
		Accent = Color3.fromRGB(180, 180, 50),
		ThemeHighlight = Color3.fromRGB(220, 220, 80),
		Text = Color3.fromRGB(255, 255, 230),
		Background = Color3.fromRGB(40, 40, 10),
		Stroke = Color3.fromRGB(140, 140, 40),
	},
	Orange = {
		Primary = Color3.fromRGB(100, 50, 10),
		Secondary = Color3.fromRGB(150, 75, 20),
		Accent = Color3.fromRGB(200, 100, 30),
		ThemeHighlight = Color3.fromRGB(255, 130, 50),
		Text = Color3.fromRGB(255, 240, 220),
		Background = Color3.fromRGB(50, 25, 5),
		Stroke = Color3.fromRGB(150, 75, 30),
	},
	Pink = {
		Primary = Color3.fromRGB(120, 20, 60),
		Secondary = Color3.fromRGB(180, 40, 100),
		Accent = Color3.fromRGB(220, 60, 130),
		ThemeHighlight = Color3.fromRGB(255, 100, 170),
		Text = Color3.fromRGB(255, 230, 240),
		Background = Color3.fromRGB(60, 10, 30),
		Stroke = Color3.fromRGB(170, 50, 100),
	},
	Teal = {
		Primary = Color3.fromRGB(20, 80, 80),
		Secondary = Color3.fromRGB(30, 120, 120),
		Accent = Color3.fromRGB(50, 180, 180),
		ThemeHighlight = Color3.fromRGB(80, 220, 220),
		Text = Color3.fromRGB(230, 255, 255),
		Background = Color3.fromRGB(10, 40, 40),
		Stroke = Color3.fromRGB(40, 100, 100),
	},
	Gray = {
		Primary = Color3.fromRGB(100, 100, 100),
		Secondary = Color3.fromRGB(130, 130, 130),
		Accent = Color3.fromRGB(160, 160, 160),
		ThemeHighlight = Color3.fromRGB(190, 190, 190),
		Text = Color3.fromRGB(240, 240, 240),
		Background = Color3.fromRGB(70, 70, 70),
		Stroke = Color3.fromRGB(110, 110, 110),
	},
	Brown = {
		Primary = Color3.fromRGB(60, 40, 20),
		Secondary = Color3.fromRGB(90, 60, 30),
		Accent = Color3.fromRGB(130, 90, 50),
		ThemeHighlight = Color3.fromRGB(160, 110, 60),
		Text = Color3.fromRGB(240, 230, 210),
		Background = Color3.fromRGB(40, 30, 15),
		Stroke = Color3.fromRGB(100, 70, 40),
	},
	Cyan = {
		Primary = Color3.fromRGB(20, 180, 200),
		Secondary = Color3.fromRGB(40, 200, 220),
		Accent = Color3.fromRGB(60, 220, 240),
		ThemeHighlight = Color3.fromRGB(80, 240, 255),
		Text = Color3.fromRGB(230, 255, 255),
		Background = Color3.fromRGB(10, 60, 70),
		Stroke = Color3.fromRGB(30, 140, 160),
	},
	Lime = {
		Primary = Color3.fromRGB(100, 200, 40),
		Secondary = Color3.fromRGB(130, 220, 60),
		Accent = Color3.fromRGB(160, 240, 80),
		ThemeHighlight = Color3.fromRGB(190, 255, 100),
		Text = Color3.fromRGB(240, 255, 230),
		Background = Color3.fromRGB(50, 100, 20),
		Stroke = Color3.fromRGB(120, 200, 60),
	},
	Gold = {
		Primary = Color3.fromRGB(180, 140, 20),
		Secondary = Color3.fromRGB(200, 160, 40),
		Accent = Color3.fromRGB(230, 190, 60),
		ThemeHighlight = Color3.fromRGB(255, 215, 80),
		Text = Color3.fromRGB(255, 245, 220),
		Background = Color3.fromRGB(90, 70, 10),
		Stroke = Color3.fromRGB(160, 130, 30),
	},
	Silver = {
		Primary = Color3.fromRGB(180, 180, 180),
		Secondary = Color3.fromRGB(200, 200, 200),
		Accent = Color3.fromRGB(220, 220, 220),
		ThemeHighlight = Color3.fromRGB(240, 240, 240),
		Text = Color3.fromRGB(30, 30, 30),
		Background = Color3.fromRGB(150, 150, 150),
		Stroke = Color3.fromRGB(170, 170, 170),
	},
	Crimson = {
		Primary = Color3.fromRGB(120, 20, 40),
		Secondary = Color3.fromRGB(150, 30, 50),
		Accent = Color3.fromRGB(180, 40, 60),
		ThemeHighlight = Color3.fromRGB(220, 60, 80),
		Text = Color3.fromRGB(250, 230, 230),
		Background = Color3.fromRGB(60, 10, 20),
		Stroke = Color3.fromRGB(100, 30, 40),
	},
	Navy = {
		Primary = Color3.fromRGB(20, 20, 60),
		Secondary = Color3.fromRGB(30, 30, 90),
		Accent = Color3.fromRGB(50, 50, 130),
		ThemeHighlight = Color3.fromRGB(80, 80, 180),
		Text = Color3.fromRGB(220, 230, 255),
		Background = Color3.fromRGB(10, 10, 30),
		Stroke = Color3.fromRGB(40, 40, 100),
	},
	Midnight = {
		Primary = Color3.fromRGB(10, 10, 30),
		Secondary = Color3.fromRGB(20, 20, 50),
		Accent = Color3.fromRGB(40, 40, 80),
		ThemeHighlight = Color3.fromRGB(70, 70, 130),
		Text = Color3.fromRGB(200, 210, 230),
		Background = Color3.fromRGB(5, 5, 15),
		Stroke = Color3.fromRGB(30, 30, 70),
	},
	Forest = {
		Primary = Color3.fromRGB(20, 60, 20),
		Secondary = Color3.fromRGB(40, 100, 40),
		Accent = Color3.fromRGB(60, 140, 60),
		ThemeHighlight = Color3.fromRGB(90, 180, 90),
		Text = Color3.fromRGB(230, 255, 230),
		Background = Color3.fromRGB(10, 30, 10),
		Stroke = Color3.fromRGB(50, 120, 50),
	},
	Sunset = {
		Primary = Color3.fromRGB(120, 40, 20),
		Secondary = Color3.fromRGB(160, 60, 30),
		Accent = Color3.fromRGB(200, 80, 40),
		ThemeHighlight = Color3.fromRGB(240, 120, 60),
		Text = Color3.fromRGB(255, 240, 220),
		Background = Color3.fromRGB(70, 25, 15),
		Stroke = Color3.fromRGB(150, 70, 40),
	},
	Neon = {
		Primary = Color3.fromRGB(20, 20, 20),
		Secondary = Color3.fromRGB(30, 30, 30),
		Accent = Color3.fromRGB(0, 255, 180),
		ThemeHighlight = Color3.fromRGB(255, 0, 180),
		Text = Color3.fromRGB(255, 255, 255),
		Background = Color3.fromRGB(10, 10, 10),
		Stroke = Color3.fromRGB(50, 50, 50),
	},
	Ice = {
		Primary = Color3.fromRGB(150, 220, 255),
		Secondary = Color3.fromRGB(120, 200, 240),
		Accent = Color3.fromRGB(80, 170, 220),
		ThemeHighlight = Color3.fromRGB(200, 240, 255),
		Text = Color3.fromRGB(20, 40, 60),
		Background = Color3.fromRGB(180, 230, 250),
		Stroke = Color3.fromRGB(100, 180, 220),
	},
	Magenta = {
		Primary = Color3.fromRGB(120, 20, 120),
		Secondary = Color3.fromRGB(160, 40, 160),
		Accent = Color3.fromRGB(200, 60, 200),
		ThemeHighlight = Color3.fromRGB(240, 80, 240),
		Text = Color3.fromRGB(255, 230, 255),
		Background = Color3.fromRGB(60, 10, 60),
		Stroke = Color3.fromRGB(140, 40, 140),
	},
	Void = {
		Primary = Color3.fromRGB(5, 5, 10),
		Secondary = Color3.fromRGB(15, 15, 25),
		Accent = Color3.fromRGB(30, 30, 50),
		ThemeHighlight = Color3.fromRGB(60, 60, 90),
		Text = Color3.fromRGB(200, 200, 210),
		Background = Color3.fromRGB(0, 0, 0),
		Stroke = Color3.fromRGB(40, 40, 60),
	},
	Aurora = {
		Primary = Color3.fromRGB(40, 80, 120),
		Secondary = Color3.fromRGB(60, 120, 160),
		Accent = Color3.fromRGB(80, 180, 200),
		ThemeHighlight = Color3.fromRGB(120, 220, 240),
		Text = Color3.fromRGB(240, 255, 255),
		Background = Color3.fromRGB(20, 40, 60),
		Stroke = Color3.fromRGB(70, 130, 160),
	},
	Galaxy = {
		Primary = Color3.fromRGB(40, 20, 60),
		Secondary = Color3.fromRGB(70, 40, 100),
		Accent = Color3.fromRGB(120, 60, 180),
		ThemeHighlight = Color3.fromRGB(200, 100, 255),
		Text = Color3.fromRGB(240, 230, 255),
		Background = Color3.fromRGB(20, 10, 30),
		Stroke = Color3.fromRGB(100, 60, 140),
	},
	Fire = {
		Primary = Color3.fromRGB(120, 30, 10),
		Secondary = Color3.fromRGB(180, 50, 20),
		Accent = Color3.fromRGB(220, 80, 40),
		ThemeHighlight = Color3.fromRGB(255, 120, 60),
		Text = Color3.fromRGB(255, 240, 220),
		Background = Color3.fromRGB(50, 15, 5),
		Stroke = Color3.fromRGB(150, 60, 30),
	},
	Ocean = {
		Primary = Color3.fromRGB(20, 40, 80),
		Secondary = Color3.fromRGB(40, 80, 120),
		Accent = Color3.fromRGB(60, 120, 180),
		ThemeHighlight = Color3.fromRGB(100, 160, 220),
		Text = Color3.fromRGB(220, 240, 255),
		Background = Color3.fromRGB(10, 20, 40),
		Stroke = Color3.fromRGB(50, 90, 140),
	},
	Shadow = {
		Primary = Color3.fromRGB(10, 10, 10),
		Secondary = Color3.fromRGB(20, 20, 20),
		Accent = Color3.fromRGB(40, 40, 40),
		ThemeHighlight = Color3.fromRGB(80, 80, 80),
		Text = Color3.fromRGB(200, 200, 200),
		Background = Color3.fromRGB(0, 0, 0),
		Stroke = Color3.fromRGB(30, 30, 30),
	},
	Toxic = {
		Primary = Color3.fromRGB(40, 80, 20),
		Secondary = Color3.fromRGB(70, 140, 30),
		Accent = Color3.fromRGB(110, 200, 40),
		ThemeHighlight = Color3.fromRGB(160, 255, 60),
		Text = Color3.fromRGB(230, 255, 230),
		Background = Color3.fromRGB(20, 40, 10),
		Stroke = Color3.fromRGB(80, 160, 40),
	},
	Rose = {
		Primary = Color3.fromRGB(150, 30, 70),
		Secondary = Color3.fromRGB(200, 60, 100),
		Accent = Color3.fromRGB(230, 100, 140),
		ThemeHighlight = Color3.fromRGB(255, 150, 180),
		Text = Color3.fromRGB(255, 240, 245),
		Background = Color3.fromRGB(80, 20, 40),
		Stroke = Color3.fromRGB(180, 60, 100),
	},
	Steel = {
		Primary = Color3.fromRGB(90, 90, 100),
		Secondary = Color3.fromRGB(120, 120, 130),
		Accent = Color3.fromRGB(150, 150, 160),
		ThemeHighlight = Color3.fromRGB(200, 200, 210),
		Text = Color3.fromRGB(240, 240, 240),
		Background = Color3.fromRGB(60, 60, 70),
		Stroke = Color3.fromRGB(100, 100, 110),
	},
	Pastel = {
		Primary = Color3.fromRGB(200, 160, 220),
		Secondary = Color3.fromRGB(220, 180, 230),
		Accent = Color3.fromRGB(240, 200, 240),
		ThemeHighlight = Color3.fromRGB(255, 220, 250),
		Text = Color3.fromRGB(60, 40, 80),
		Background = Color3.fromRGB(250, 240, 255),
		Stroke = Color3.fromRGB(210, 170, 230),
	},
	Blood = {
		Primary = Color3.fromRGB(90, 0, 0),
		Secondary = Color3.fromRGB(140, 0, 0),
		Accent = Color3.fromRGB(180, 20, 20),
		ThemeHighlight = Color3.fromRGB(220, 40, 40),
		Text = Color3.fromRGB(250, 220, 220),
		Background = Color3.fromRGB(40, 0, 0),
		Stroke = Color3.fromRGB(100, 20, 20),
	},
	Coffee = {
		Primary = Color3.fromRGB(80, 50, 30),
		Secondary = Color3.fromRGB(120, 80, 50),
		Accent = Color3.fromRGB(160, 110, 70),
		ThemeHighlight = Color3.fromRGB(200, 150, 100),
		Text = Color3.fromRGB(240, 230, 220),
		Background = Color3.fromRGB(40, 25, 15),
		Stroke = Color3.fromRGB(100, 70, 40),
	},
	IceCream = {
		Primary = Color3.fromRGB(255, 180, 200),
		Secondary = Color3.fromRGB(255, 200, 220),
		Accent = Color3.fromRGB(255, 220, 230),
		ThemeHighlight = Color3.fromRGB(255, 240, 245),
		Text = Color3.fromRGB(80, 40, 60),
		Background = Color3.fromRGB(255, 230, 240),
		Stroke = Color3.fromRGB(255, 190, 210),
	},
}

tbl2.List_Translator = {
	English = "en",
	Spanish = "es",
	French = "fr",
	German = "de",
	Italian = "it",
	Portuguese = "pt",
	Russian = "ru",
	Japanese = "ja",
	["Chinese (Simplified)"] = "zh-CN",
	["Chinese (Traditional)"] = "zh-TW",
	Korean = "ko",
	Arabic = "ar",
	Hindi = "hi",
	Turkish = "tr",
	Vietnamese = "vi",
	Polish = "pl",
	Dutch = "nl",
	Indonesian = "id",
	Thai = "th",
	Greek = "el",
	Hebrew = "iw",
	Swedish = "sv",
	Czech = "cs",
	Finnish = "fi",
	Danish = "da",
	Hungarian = "hu",
	Romanian = "ro",
	Norwegian = "no",
	Ukrainian = "uk",
	Slovak = "sk",
	Croatian = "hr",
	Malay = "ms",
	Filipino = "tl",
	Serbian = "sr",
	Bulgarian = "bg",
	Lithuanian = "lt",
	Latvian = "lv",
	Estonian = "et",
	Persian = "fa",
	Bengali = "bn",
	Urdu = "ur",
	Swahili = "sw",
	Zulu = "zu",
	Icelandic = "is",
	Welsh = "cy",
	Basque = "eu",
	Galician = "gl",
	Macedonian = "mk",
}

tbl2.Save = { SizeUi = { 550, 350 }, Theme = "Red" }
tbl2.Keybind_UI = { Enabled = false, KeyId = Enum.KeyCode.RightShift }
tbl2.Enabled = { DisableWarning = false }
tbl2.FlagSave = {}

tbl2.Create = function(arg, arg2, arg3, parent)
	local instance = Instance.new(arg2)

	for k, v13 in pairs(arg3) do
		instance[k] = v13
	end

	if parent then
		instance.Parent = parent
	end

	return instance
end

tbl2.SetSaveJSON = function(arg, arg2, arg3)
	if fn8 then
		local json = v10:JSONEncode(arg3)
		fn8(arg2, json)
	end
end

tbl2.InsertTransparency = function(arg, arg2, arg3)
	table.insert(tbl2.Instances.Transparency, { Instance = arg2, Type = arg3 or "" })
	return arg2
end

tbl2.InsertTranslator = function(arg, arg2, arg3, arg4)
	table.insert(tbl2.Instances.Translator, { Instance = arg2, OG_Text = arg2.Text, Old_Text = arg4, Type = arg3 or "" })
	return arg2
end

tbl2.InsertTheme = function(arg, arg2, arg3)
	table.insert(tbl2.Instances.Theme, { Instance = arg2, Type = arg3 })
	return arg2
end

tbl2.InsertVideo = function(arg, arg2, arg3, arg4)
	table.insert(tbl2.Instances.Video, { Instance = arg2, Name = arg3, URL = arg4 })
	return arg2
end

tbl2.InsertImage = function(arg, arg2, arg3, arg4)
	table.insert(tbl2.Instances.Image, { Instance = arg2, Name = arg3, URL = arg4 })
	return arg2
end

tbl2.InsertFont = function(arg, arg2)
	table.insert(tbl2.Instances.Font, { Instance = arg2, Font_Old = arg2.Font })
	return arg2
end

tbl2.CreateVideo = function(arg, arg2, arg3)
	local str = tbl2.FolderPath .. "/Video"
	local str2 = str .. "/" .. arg2:gsub("%.mp4$", "") .. ".mp4"

	if not fn5(tbl2.FolderPath) then
		fn6(tbl2.FolderPath)
	end

	if not fn5(str) then
		fn6(str)
	end

	if not fn4(str2) and arg3 and type(arg3) == "string" then
		local ok, result = pcall(function()
			return game:HttpGet(arg3)
		end)

		if ok and result then
			fn8(str2, result)
			return true
		end
	end

	return false
end

tbl2.GetVideo = function(arg, arg2)
	local str = tbl2.FolderPath .. "/Video"
	local str2 = str .. "/" .. arg2:gsub("%.mp4$", "") .. ".mp4"
	if not fn5(tbl2.FolderPath) or not fn5(str) or not fn4(str2) then
		return ""
	end
	local str3 = ""

	if fn3 then
		local ok, result = pcall(fn3, str2)
		local str4 = ""

		if ok then
			str3 = result
		else
			str3 = str4
		end
	end

	return str3
end

tbl2.SetVideo = function(arg, arg2)
	task.spawn(function()
		local video = tbl2:GetVideo(arg2)

		for _, v13 in next, tbl2.Instances.Video, nil do
			if v13.Instance then
				if arg2 == "None.mp4" then
					v13.Instance.Video = ""
					v13.Instance.Visible = false
				elseif arg2:match("%.webm$") or arg2:match("%.mp4$") or arg2:match("%.gif$") then
					v13.Instance.Video = video
					v13.Instance.Visible = true
				end
			end
		end
	end)
end

tbl2.CreateImage = function(arg, arg2, arg3)
	if arg3:find("rbxassetid") then
		return arg3
	end
	local str = tbl2.FolderPath .. "/Image"
	local str2 = str .. "/" .. arg2 .. ".png"

	if not fn5(tbl2.FolderPath) then
		fn6(tbl2.FolderPath)
	end

	if not fn5(str) then
		fn6(str)
	end

	if not fn4(str2) and arg3 and type(arg3) == "string" then
		local ok, result = pcall(function()
			return game:HttpGet(arg3)
		end)

		if ok and result then
			fn8(str2, result)
			return true
		end
	end

	return false
end

tbl2.GetImage = function(arg, arg2)
	if arg2:find("rbxassetid") then
		return arg2
	end
	local str = tbl2.FolderPath .. "/Image"
	local str2 = str .. "/" .. arg2 .. ".png"
	if not fn5(tbl2.FolderPath) or not fn5(str) or not fn4(str2) then
		return ""
	end
	local str3 = ""

	if fn3 then
		local ok, result = pcall(fn3, str2)
		local str4 = ""

		if ok then
			str3 = result
		else
			str3 = str4
		end
	end

	return str3
end

tbl2.SetImage = function(arg, arg2)
	task.spawn(function()
		local image = tbl2:GetImage(arg2)

		for _, v13 in next, tbl2.Instances.Image, nil do
			if v13.Instance then
				if arg2 == "None" then
					v13.Instance.Image = ""
					v13.Instance.Visible = false
				else
					v13.Instance.Image = image
					v13.Instance.Visible = true
				end
			end
		end
	end)
end

tbl2.SetTransparency = function(arg, arg2, backgroundTransparency)
	for _, v13 in next, tbl2.Instances.Transparency, nil do
		if v13.Instance and v13.Type == arg2 then
			v13.Instance.BackgroundTransparency = backgroundTransparency
		end
	end
end

tbl2.SetTranslator = function(arg, arg2)
	local v13 = tbl2.List_Translator[arg2]

	if v13 == "en" then
		for _, v14 in next, tbl2.Instances.Translator, nil do
			v14.Instance.Text = v14.Old_Text
		end

		return
	end

	local function fn11(arg3)
		local ogText = arg3.OG_Text
		if ogText == "" then
			return
		end
		local ok, result = pcall(game.HttpGet, game, "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=" .. v13 .. "&dt=t&q=" .. v10:UrlEncode(ogText))

		if ok then
			local ok2, result2 = pcall(v10.JSONDecode, v10, result)
			if ok2 and result2 and result2[1] and result2[1][1] then
				arg3.Instance.Text = result2[1][1][1]
				return
			end
		end

		arg3.Instance.Text = arg3.Old_Text
	end

	for _, v14 in next, tbl2.Instances.Translator, nil do
		task.spawn(fn11, v14)
	end
end

local function fn11(arg)
	if arg:IsA("Frame") then
		return "BackgroundColor3"
	end

	if arg:IsA("ImageLabel") then
		return "ImageColor3"
	end

	if arg:IsA("TextLabel") then
		return "TextColor3"
	end

	if arg:IsA("ScrollingFrame") then
		return "ScrollBarImageColor3"
	end

	if arg:IsA("UIStroke") then
		return "Color"
	end
end

tbl2.SetTheme = function(arg, theme)
	local v13 = tbl2.Theme[theme]
	if not v13 then
		return
	end
	tbl2.Save.Theme = theme
	tbl2:SetSaveJSON(tbl2.FolderPath .. "/Library/Saved.json", tbl2.Save)

	for _, v14 in pairs(tbl2.Instances.Theme) do
		local v15 = fn11(v14.Instance)

		if not (not v15 and v14.Type ~= "PrimaryAndThemeHighlight") then
			if v14.Type == "Background" then
				v14.Instance[v15] = v13.Background
			elseif v14.Type == "Primary" then
				v14.Instance[v15] = v13.Primary
			elseif v14.Type == "Text" then
				v14.Instance[v15] = v13.Text
			elseif v14.Type == "Secondary" then
				v14.Instance[v15] = v13.Secondary
			elseif v14.Type == "Accent" then
				v14.Instance[v15] = v13.Accent
			elseif v14.Type == "ThemeHighlight" then
				v14.Instance[v15] = v13.ThemeHighlight
			elseif v14.Type == "Stroke" then
				v14.Instance[v15] = v13.Stroke
			elseif v14.Type == "PrimaryAndThemeHighlight" then
				local instance = v14.Instance
				local colorSequence = ColorSequence.new
				local tbl3 = {}
				local v16 = ColorSequenceKeypoint.new(0, v13.Primary)
				local v17 = ColorSequenceKeypoint.new(0.5, v13.ThemeHighlight)
				local new = ColorSequenceKeypoint.new
				local primary = v13.Primary
				tbl3[1] = v16
				tbl3[2] = v17

				do
					local values = table.pack(new(1, primary))
					table.move(values, 1, values.n, 3, tbl3)
				end

				instance.Color = colorSequence(tbl3)
			end
		end
	end
end

tbl2.SetFont = function(arg, arg2)
	if arg2 == "" or arg2 == nil or arg2 == "None" then
		return
	end

	for _, v13 in pairs(tbl2.Instances.Font) do
		if v13.Instance and v13.Instance.Font then
			v13.Instance.Font = arg2 == "Old" and v13.Font_Old or Enum.Font[arg2]
		end
	end
end

tbl2.GetImageURL = function(arg, arg2)
	local ok, result = pcall(game.HttpGet, game, "https://thumbnails.roblox.com/v1/assets?assetIds=" .. arg2 .. "&size=420x420&format=Png&isCircular=false")
	if not ok then
		return nil
	end
	local data = v10:JSONDecode(result)
	local data2 = data and data.data and data.data[1]
	return data2 and data2.imageUrl or nil
end

local function fn12(arg)
	return arg:gsub("%d", {
		["0"] = "Qx7",
		["1"] = "mKp",
		["2"] = "vT9",
		["3"] = "RzL",
		["4"] = "n4W",
		["5"] = "bY2",
		["6"] = "Hq8",
		["7"] = "sFc",
		["8"] = "J6a",
		["9"] = "tN5",
	}):reverse()
end

tbl2.ProtectAsset = function(arg, arg2, arg3)
	if tbl2.NoIcon then
		return ""
	end

	if arg3.Asset then
		local str = tbl2.FolderPath .. "/Image"
		local str2 = str .. "/" .. fn12(arg2) .. ".jpg"

		if not fn5(tbl2.FolderPath) then
			fn6(tbl2.FolderPath)
		end

		if not fn5(str) then
			fn6(str)
		end

		if not fn4(str2) then
			local imageURL = arg:GetImageURL(arg2)

			if imageURL then
				pcall(fn8, str2, game:HttpGet(imageURL))
			end
		end

		return fn4(str2) and fn3 and fn3(str2) or "rbxassetid://" .. arg2
	end

	return "rbxassetid://" .. arg2
end

tbl2.Image = function(arg, arg2, arg3)
	local str = tbl2.FolderPath .. "/Image"
	local str2 = str .. "/" .. arg2 .. ".png"

	if not fn5(tbl2.FolderPath) then
		fn6(tbl2.FolderPath)
	end

	if not fn5(str) then
		fn6(str)
	end

	if not fn4(str2) and arg3 then
		fn8(str2, game:HttpGet(arg3))
	end

	return fn3 and fn3(str2) or str2
end

tbl2.LoadSaveLib = function()
	local str = tbl2.FolderPath .. "/Library/Saved.json"

	if fn4(str) then
		local data = v10:JSONDecode(fn7(str))

		if type(data) == "table" then
			if rawget(data, "SizeUi") then
				tbl2.Save.SizeUi = data.SizeUi
			end

			if rawget(data, "Theme") and tbl2.Theme[data.Theme] then
				tbl2.Save.Theme = data.Theme
			end

			if rawget(data, "Config_Manager") and type(data.Config_Manager) == "table" then
				tbl2.Save.Config_Manager = data.Config_Manager
			end
		end
	end
end

tbl2:LoadSaveLib()

tbl2.Key = function(arg, arg2)
	local key1 = arg2.Key1
	local key2 = arg2.Key2
	local key3 = arg2.Key3
	local key4 = arg2.Key4
	local key5 = arg2.Key5
	local key6 = arg2.Key6
	local key7 = arg2.Key7
	local key8 = arg2.Key8
	local key9 = arg2.Key9
	local key10 = arg2.Key10

	if arg2.Key ~= "KZgN0t5pK6hBaqVLAMLg27aqXNDb8v" then
		while true do
		end
	elseif key1 ~= "c9RkyXAjNpJc9u1fexvw1cbxYTWvMy" then
		while true do
		end
	elseif key2 ~= "Xp8712WzbaRn8EtrLnXk8gDdzQB8jF" then
		while true do
		end
	elseif key3 ~= "wixUQtibEtmkTQ7WpSFGq4YfBuqJQy" then
		while true do
		end
	elseif key4 ~= "KbSf6UWZ6vndbgp8Vh9EHdM0dU8DFf" then
		while true do
		end
	elseif key5 ~= "mP3tTRKYwhNKLkpFCdVuj922xqTgJp" then
		while true do
		end
	elseif key6 ~= "heMGEmHXFUaiTaStAihwTfwgSJguUwQQxdE" then
		while true do
		end
	elseif key7 ~= "khEXYXSHSJpDabFqudKJWEWbEyzXYgLmgTF" then
		while true do
		end
	elseif key8 ~= "MLGkWCxxHaqhumMpSmpvJMuiUEpeqUAYvxN" then
		while true do
		end
	else
		-- [Nexzan build] Pengecekan Key9/Key10 dihapus: nilainya memakai
		-- workspace:GetServerTimeNow() yang berubah tiap frame sehingga mustahil lolos,
		-- dan kegagalannya = "while true do end" (script nge-hang total).
		-- Pengecekan Key..Key8 di atas tetap aktif apa adanya.
		return
	end
end

tbl2.FireCallback = function(arg, arg2, ...)
	return task.spawn(arg2, ...)
end

local function fn13(arg, arg2)
	local flag = false
	local vector2 = Vector2.zero
	local udim2 = UDim2.new()

	arg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag = true
			vector2 = input.Position
			udim2 = arg2.Position
			local connection = nil

			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag = false
					connection:Disconnect()
				end
			end)
		end
	end)

	v9.InputChanged:Connect(function(input)
		if flag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local n = input.Position - vector2
			arg2.Position = UDim2.new(udim2.X.Scale, udim2.X.Offset + n.X, udim2.Y.Scale, udim2.Y.Offset + n.Y)
		end
	end)
end

local function fn14(arg)
	local flag = false
	local position = nil
	local size = nil
	local v13 = nil

	local v14 = tbl2:InsertTheme(tbl2:Create("Frame", {
		AnchorPoint = Vector2.new(1, 1),
		BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Background,
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 1, 0),
		Size = UDim2.new(0, 15, 0, 15),
		Name = "Resizer",
	}, arg), "Background")

	tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = v14 })

	local function fn15(arg2)
		local n = arg2.Position - position
		local n2 = size.Y.Offset + n.Y
		local n3 = math.max(size.X.Offset + n.X, 200)
		local n4 = math.max(n2, 200)
		arg.Size = UDim2.new(0, n3, 0, n4)
		tbl2.Save.SizeUi = { arg.Size.X.Offset, arg.Size.Y.Offset }
		tbl2:SetSaveJSON(tbl2.FolderPath .. "/Library/Saved.json", tbl2.Save)
	end

	v14.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag = true
			position = input.Position
			size = arg.Size

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag = false
				end
			end)
		end
	end)

	v14.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and flag then
			v13 = input
			fn15(input)
		end
	end)

	v9.InputChanged:Connect(function(input)
		if input == v13 and flag then
			fn15(input)
		end
	end)
end

local tween = tbl2:Create("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, hui)

local notificationLayout = tween:FindFirstChild("NotificationLayout") or tbl2:Create("Frame", {
	AnchorPoint = Vector2.new(1, 1),
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 0.999,
	BorderColor3 = Color3.fromRGB(0, 0, 0),
	BorderSizePixel = 0,
	Position = UDim2.new(1, -30, 1, -30),
	Size = UDim2.new(0, 320, 1, 0),
	Name = "NotificationLayout",
}, tween)

notificationLayout.ChildRemoved:Connect(function()
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	local n = 0

	for _, child in ipairs(notificationLayout:GetChildren()) do
		v8:Create(child, tweenInfo, { Position = UDim2.new(0, 0, 1, -(n + child.Size.Y.Offset)) }):Play()
		n += child.Size.Y.Offset + 12
	end
end)

tbl2.SetNotification = function(arg, arg2)
	local title = arg2[1] or arg2.Title or ""
	local description = arg2[2] or arg2.Description or ""
	local content = arg2[3] or arg2.Content or ""
	local time = arg2[5] or arg2.Time or 0.5
	local delay = arg2[6] or arg2.Delay or 5
	local n = 0

	for _, child in ipairs(notificationLayout:GetChildren()) do
		n += child.Size.Y.Offset + 12
	end

	local tween2 = tbl2:Create("Frame", {
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 150),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, -n),
		Name = "NotificationFrame",
	}, notificationLayout)

	local v13 = tbl2:InsertTheme(tbl2:Create("Frame", {
		BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Primary,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 400, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Name = "NotificationFrameReal",
	}, tween2), "Primary")

	tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 8) }, v13)

	local tween3 = tbl2:Create("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = 0,
		Name = "DropShadowHolder",
	}, v13)

	tbl2:Create("ImageLabel", {
		Image = "",
		ImageColor3 = Color3.new(),
		ImageTransparency = 0.5,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(49, 49, 450, 450),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 47, 1, 47),
		ZIndex = 0,
		Name = "DropShadow",
		Parent = tween3,
	})

	local tween4 = tbl2:Create("Frame", {
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.999,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 36),
		Name = "Top",
	}, v13)

	local tween5 = tbl2:Create("TextLabel", {
		Font = Enum.Font.GothamBold,
		Text = title,
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.999,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 10, 0, 0),
	}, tween4)

	tbl2:Create("UIStroke", { Color = Color3.new(1, 1, 1), Thickness = 0.3, Parent = tween5 })
	tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = tween4 })

	tbl2:InsertTheme(tbl2:Create("TextLabel", {
		Font = Enum.Font.GothamBold,
		Text = description,
		TextColor3 = tbl2.Theme[tbl2.Save.Theme].Text,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.999,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, tween5.TextBounds.X + 15, 0, 0),
	}, tween4), "Text")

	local tween6 = tbl2:Create("TextButton", {
		Font = Enum.Font.SourceSans,
		Text = "X",
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 18,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -5, 0.5, 0),
		Size = UDim2.new(0, 25, 0, 25),
		Name = "Close",
		Parent = tween4,
	})

	local v14 = tbl2:InsertTheme(tbl2:Create("TextLabel", {
		Font = Enum.Font.GothamBold,
		Text = content,
		TextColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
		TextSize = 13,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 10, 0, 27),
		Size = UDim2.new(1, -20, 0, 13),
		Parent = v13,
	}), "ThemeHighlight")

	v14.Size = UDim2.new(1, -20, 0, 13 + 13 * v14.TextBounds.X // v14.AbsoluteSize.X)
	v14.TextWrapped = true

	if v14.AbsoluteSize.Y < 27 then
		tween2.Size = UDim2.new(1, 0, 0, 65)
	else
		tween2.Size = UDim2.new(1, 0, 0, v14.AbsoluteSize.Y + 40)
	end

	local flag = false

	local tbl3 = { Close = function()
		if flag then
			return
		end
		flag = true
		v8:Create(v13, TweenInfo.new(time, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Position = UDim2.new(0, 400, 0, 0) }):Play()
		task.wait(time / 1.2)
		tween2:Destroy()
	end }

	tween6.Activated:Connect(function()
		tbl3:Close()
	end)

	v8:Create(v13, TweenInfo.new(time, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Position = UDim2.new(0, 0, 0, 0) }):Play()

	task.delay(delay, function()
		tbl3:Close()
	end)

	return tbl3
end

local function fn15()
	tbl2.CreateWindow = function(arg, arg2)
		local title = arg2[1] or arg2.Title or ""
		local description = arg2[2] or arg2.Description or ""
		local tabWidth = arg2[3] or arg2["Tab Width"] or 120
		local saveSystem = arg2[4] or arg2.SaveSystem or { Enable = false, File = "" }
		local security = arg2[5] or arg2.Security or { Asset = false }
		tbl2.NoVim = security.NoVim or false
		tbl2.NoIcon = security.NoIcon or false
		tbl2:Key(arg2)
		local tbl3 = {}

		local function fn16(arg3)
			return tbl2.FlagSave and tbl2.FlagSave[arg3] ~= nil
		end

		local function fn17(arg3, arg4)
			if not saveSystem.Enable then
				return
			end
			local str = tbl2.FolderPath .. "/Save System"

			if not fn5(str) then
				fn6(str)
			end

			local str2 = str .. "/" .. saveSystem.File

			if not fn5(str2) then
				fn6(str2)
			end

			tbl2.FlagSave = tbl2.FlagSave or {}
			tbl2.FlagSave[arg3] = arg4
			local json = v10:JSONEncode(tbl2.FlagSave)
			pcall(fn8, str2 .. "/config.json", json)
		end

		local function fn18()
			if not saveSystem.Enable then
				return
			end
			local str = tbl2.FolderPath .. "/Save System"

			if not fn5(str) then
				fn6(str)
			end

			local str2 = str .. "/" .. saveSystem.File
			local str3 = str2 .. "/config.json"
			local str4 = tbl2.FolderPath .. "/" .. saveSystem.File .. ".json"

			if fn4(str4) and not fn4(str3) then
				if not fn5(str2) then
					fn6(str2)
				end

				local v13 = fn7(str4)
				pcall(fn8, str3, v13)

				pcall(function()
					delfile(str4)
				end)
			end

			if fn4(str3) then
				local ok, flagSave = pcall(function()
					return v10:JSONDecode(fn7(str3))
				end)

				if ok then
					tbl2.FlagSave = flagSave
				end
			end
		end

		fn18()
		local saveManagerCore

		saveManagerCore = {
			InitializeSaveFolder = function()
				local str = tbl2.FolderPath .. "/Save System"

				if not fn5(str) then
					fn6(str)
				end

				return str
			end,
			GetSaveFolders = function()
				local v13 = saveManagerCore:InitializeSaveFolder()
				local tbl4 = {}

				if fn9 then
					local tbl5 = fn9(v13) or {}

					for _, v14 in ipairs(tbl5) do
						if fn5(v14) then
							local match = v14:gsub("\\", "/"):match("([^/]+)$")

							if match and match ~= "" then
								table.insert(tbl4, match)
							end
						end
					end
				end

				table.sort(tbl4)
				return tbl4
			end,
			GetSaveVariants = function()
				local str = saveManagerCore:InitializeSaveFolder() .. "/" .. (saveSystem.File or "")
				local tbl4 = {}

				if fn5(str) and fn9 then
					local tbl5 = fn9(str) or {}

					for _, v13 in ipairs(tbl5) do
						if v13:match("%.json$") then
							local match = v13:gsub("\\", "/"):match("([^/]+)$")

							if match and match ~= "" then
								local str2 = match:gsub("%.json$", "")
								table.insert(tbl4, str2)
							end
						end
					end
				end

				return tbl4
			end,
			ExportSave = function(arg3, arg4)
				local str = arg4 or "config"
				local str2 = (saveManagerCore:InitializeSaveFolder() .. "/" .. (saveSystem.File or "")) .. "/" .. str .. ".json"
				if fn4(str2) then
					return fn7(str2)
				end
				return nil
			end,
			ImportSave = function(arg3, arg4, arg5)
				local str = arg5 or "Imported_" .. os.date("%Y%m%d_%H%M%S")
				local str2 = saveManagerCore:InitializeSaveFolder() .. "/" .. (saveSystem.File or "")

				if arg4:find("http") and arg4:find("://") and not arg4:find("Webhook") then
					local function fn19()
						local ok, result = pcall(function()
							return game:HttpGet(arg4)
						end)

						return ok and result or nil
					end

					arg4 = fn19()
				end

				if not fn5(str2) then
					fn6(str2)
				end

				pcall(fn8, str2 .. "/" .. (str:find(".json$") and str or str .. ".json"), arg4)
				return true
			end,
			LoadSave = function(arg3, arg4)
				local str = arg4 or "config"
				local str2 = saveManagerCore:InitializeSaveFolder() .. "/" .. (saveSystem.File or "")
				local str3 = str2 .. "/" .. str .. ".json"
				local str4 = str2 .. "/config.json"

				if fn4(str3) then
					local ok, flagSave = pcall(function()
						return v10:JSONDecode(fn7(str3))
					end)

					if ok and flagSave then
						tbl2.FlagSave = flagSave
						local json = v10:JSONEncode(flagSave)
						pcall(fn8, str4, json)
						return true
					end
				end

				return false
			end,
			DeleteSave = function()
				local str = saveManagerCore:InitializeSaveFolder() .. "/" .. (saveSystem.File or "")

				if fn5(str) then
					pcall(function()
						if fn9 then
							for _, v13 in ipairs(fn9(str)) do
								pcall(delfile, v13)
							end
						end
					end)

					return true
				end

				return false
			end,
			DeleteVariant = function(arg3, arg4)
				if not arg4 then
					return false
				end
				local str = (saveManagerCore:InitializeSaveFolder() .. "/" .. (saveSystem.File or "")) .. "/" .. arg4 .. ".json"

				if fn4(str) then
					pcall(function()
						delfile(str)
					end)

					return true
				end

				return false
			end,
		}

		tbl2.SaveManager_Core = saveManagerCore

		CircleClick = function(arg3, arg4, arg5)
			task.spawn(function()
				arg3.ClipsDescendants = true

				local v13 = tbl2:InsertTheme(tbl2:Create("ImageLabel", {
					Image = tbl2:ProtectAsset("106471194043211", security),
					ImageColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
					ImageTransparency = 0.89999997615814209,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					ZIndex = 10,
					Name = "Circle",
				}, arg3), "ThemeHighlight")

				v13.Position = UDim2.new(0, arg4 - arg3.AbsolutePosition.X, 0, arg5 - arg3.AbsolutePosition.Y)
				local n = math.max(arg3.AbsoluteSize.X, arg3.AbsoluteSize.Y) * 1.5
				local n2 = 0.5
				local tween2 = v8:Create(v13, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, n, 0, n), Position = UDim2.new(0.5, -n / 2, 0.5, -n / 2) })
				tween2:Play()

				tween2.Completed:Connect(function()
					for i = 1, 10 do
						v13.ImageTransparency = v13.ImageTransparency + 0.01
						wait(n2 / 10)
					end

					v13:Destroy()
				end)
			end)
		end

		local function fn19()
			local tween2 = tbl2:Create("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, hui)

			local v13 = tbl2:InsertTheme(tbl2:Create("ImageButton", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BorderColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.1021, 0, 0.0743, 0),
				Size = UDim2.new(0, 59, 0, 49),
				Image = tbl2:ProtectAsset("132330626720241", security),
				Visible = false,
			}, tween2), "ThemeHighlight")

			tbl2:Create("UICorner", { Name = "MainCorner", CornerRadius = UDim.new(0, 9) }, v13)
			local flag = false
			local vector2 = Vector2.zero
			local udim2 = UDim2.new()

			v13.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					flag = true
					vector2 = input.Position
					udim2 = v13.Position
					local connection = nil

					connection = input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							flag = false
							connection:Disconnect()
						end
					end)
				end
			end)

			v9.InputChanged:Connect(function(input)
				if flag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local n = input.Position - vector2
					v13.Position = UDim2.new(udim2.X.Scale, udim2.X.Offset + n.X, udim2.Y.Scale, udim2.Y.Offset + n.Y)
				end
			end)

			return v13
		end

		local v13 = fn19()
		local tween2 = tbl2:Create("ScreenGui", { ZIndexBehavior = Enum.ZIndexBehavior.Sibling }, hui)
		local value, v14 = unpack(tbl2.Save.SizeUi)

		local tween3 = tbl2:Create("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(value, v14),
			ZIndex = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Name = "DropShadowHolder",
			Position = UDim2.new(0.5, 0, 0.5, 0),
		}, tween2)

		local tween4 = tbl2:Create("ImageLabel", {
			Image = "",
			ImageColor3 = Color3.fromRGB(15, 15, 15),
			ImageTransparency = 0.5,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(value, v14),
			ZIndex = 0,
			Name = "DropShadow",
		}, tween3)

		local v15 = tbl2:InsertTransparency(tbl2:InsertTheme(tbl2:Create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Background,
			BackgroundTransparency = 0.1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.fromOffset(value, v14),
			Name = "Main",
		}, tween4), "Background"), "Background")

		local v16 = tbl2:InsertImage(tbl2:Create("ImageLabel", { Image = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), ZIndex = -1 }, v15), "", "")

		local v17 = tbl2:InsertVideo(tbl2:Create("VideoFrame", {
			Video = "",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = -1,
			Looped = true,
			Visible = false,
		}, v15), "", "")

		v17:Play()
		tbl2:Create("UICorner", {}, v15)
		tbl2:Create("UICorner", {}, v17)
		tbl2:Create("UICorner", {}, v16)
		tbl2:Create("UIStroke", { Color = Color3.fromRGB(50, 50, 50), Thickness = 1.6 }, v15)

		local v18 = tbl2:InsertTheme(tbl2:Create("Frame", {
			BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Primary,
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 38),
			Name = "Top",
		}, v15), "Primary")

		local v19 = tbl2:InsertFont(tbl2:InsertTheme(tbl2:Create("TextLabel", {
			Font = Enum.Font.GothamBold,
			Text = title,
			TextColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, -100, 1, 0),
			Position = UDim2.new(0, 10, 0, 0),
		}, v18), "ThemeHighlight"))

		tbl2:Create("UICorner", {}, v18)

		local v20 = tbl2:InsertFont(tbl2:InsertTheme(tbl2:Create("TextLabel", {
			Font = Enum.Font.GothamBold,
			Text = description,
			TextColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, -(v19.TextBounds.X + 104), 1, 0),
			Position = UDim2.new(0, v19.TextBounds.X + 15, 0, 0),
		}, v18), "ThemeHighlight"))

		tbl2:InsertTheme(tbl2:Create("UIStroke", { Color = tbl2.Theme[tbl2.Save.Theme].Stroke, Thickness = 0.4 }, v20), "Stroke")

		local tween5 = tbl2:Create("TextButton", {
			Font = Enum.Font.SourceSans,
			Text = "X",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 18,
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(1, -8, 0.5, 0),
			Size = UDim2.new(0, 25, 0, 25),
			Name = "Close",
		}, v18)

		local tween6 = tbl2:Create("TextButton", {
			Font = Enum.Font.SourceSans,
			Text = "-",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 18,
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(1, -42, 0.5, 0),
			Size = UDim2.new(0, 25, 0, 25),
			Name = "Min",
		}, v18)

		local tween7 = tbl2:Create("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 9, 0, 50),
			Size = UDim2.new(0, tabWidth, 1, -59),
			Name = "LayersTab",
		}, v15)

		tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 2) }, tween7)

		local v21 = tbl2:InsertTheme(tbl2:Create("Frame", {
			BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Secondary,
			BackgroundTransparency = 0.85,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 5, 0, 5),
			Size = UDim2.new(1, -10, 0, 26),
			Name = "SearchFrame",
		}, tween7), "Secondary")

		tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 5) }, v21)

		tbl2:Create("ImageLabel", {
			Image = tbl2:ProtectAsset("10734943674", security),
			ImageColor3 = Color3.fromRGB(160, 160, 160),
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 5, 0.5, -8),
			Size = UDim2.new(0, 16, 0, 16),
			Name = "SearchIcon",
		}, v21)

		local v22 = tbl2:InsertFont(tbl2:Create("TextBox", {
			Font = Enum.Font.Gotham,
			PlaceholderText = "Search",
			PlaceholderColor3 = Color3.fromRGB(130, 130, 130),
			Text = "",
			TextColor3 = Color3.fromRGB(210, 210, 210),
			TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 24, 0, 0),
			Size = UDim2.new(1, -48, 1, 0),
			ClearTextOnFocus = false,
			Name = "SearchBox",
		}, v21))

		local tween8 = tbl2:Create("TextButton", {
			Font = Enum.Font.GothamBold,
			Text = "X",
			TextColor3 = Color3.fromRGB(160, 160, 160),
			TextSize = 12,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -6, 0.5, 0),
			Size = UDim2.new(0, 14, 0, 14),
			Visible = false,
			Name = "ClearSearch",
		}, v21)

		local v23 = tbl2:InsertTheme(tbl2:Create("Frame", {
			BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Primary,
			BackgroundTransparency = 0.1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 5, 0, 36),
			Size = UDim2.new(1, -10, 0, 0),
			ClipsDescendants = true,
			Visible = false,
			Name = "SearchResults",
			ZIndex = 100,
		}, tween7), "Primary")

		tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 5) }, v23)
		tbl2:InsertTheme(tbl2:Create("UIStroke", { Color = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight, Thickness = 1.2 }, v23), "ThemeHighlight")

		local tween9 = tbl2:Create("ScrollingFrame", {
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			Name = "SearchScroll",
		}, v23)

		tbl2:Create("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder }, tween9)

		tbl2:Create("UIPadding", {
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
		}, tween9)

		tbl2:Create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.85,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0, 38),
			Size = UDim2.new(1, 0, 0, 1),
			Name = "DecideFrame",
		}, v15)

		local tween10 = tbl2:Create("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, tabWidth + 18, 0, 50),
			Size = UDim2.new(1, -(tabWidth + 9 + 18), 1, -59),
			Name = "Layers",
		}, v15)

		tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 2) }, tween10)

		local tween11 = tbl2:Create("TextLabel", {
			Font = Enum.Font.GothamBold,
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 24,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			Name = "NameTab",
		}, tween10)

		local tween12 = tbl2:Create("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 1, -33),
			Name = "LayersReal",
		}, tween10)

		local tween13 = tbl2:Create("ScrollingFrame", {
			CanvasSize = UDim2.new(0, 0, 0, 0),
			ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
			ScrollBarThickness = 0,
			ScrollingEnabled = true,
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.99900001287460327,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, 37),
			Size = UDim2.new(1, 0, 1, -37),
			Name = "ScrollTab",
		}, tween7)

		tbl2:Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, tween13)

		local function fn20()
			local n = 0

			for _, child in pairs(tween13:GetChildren()) do
				if child.Name ~= "UIListLayout" then
					n = n + 6 + child.Size.Y.Offset
				end
			end

			tween13.CanvasSize = UDim2.new(0, 0, 0, n)
		end

		tween13.ChildAdded:Connect(fn20)
		tween13.ChildRemoved:Connect(fn20)
		tween13:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn20)
		fn20()

		local function fn21(arg3)
			for _, child in pairs(tween9:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end

			if arg3 == "" or #arg3 < 2 then
				v23.Visible = false
				v23.Size = UDim2.new(1, -10, 0, 0)
				tween8.Visible = false
				return
			end

			tween8.Visible = true
			local tbl4 = {}
			local v24 = string.lower(arg3)

			for _, v25 in pairs(tbl2.SearchData) do
				if string.find(string.lower(v25.Title), v24, 1, true) then
					table.insert(tbl4, v25)
				end
			end

			if #tbl4 == 0 then
				v23.Visible = false
				v23.Size = UDim2.new(1, -10, 0, 0)
				return
			end

			v23.Visible = true
			v23.Size = UDim2.new(1, -10, 0, math.min(#tbl4 * 32, 200) + 10)

			for i, v25 in ipairs(tbl4) do
				local v26 = tbl2:InsertTheme(tbl2:Create("Frame", {
					BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Secondary,
					BackgroundTransparency = 0.85,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -4, 0, 30),
					LayoutOrder = i,
					Name = "ResultItem",
				}, tween9), "Secondary")

				tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, v26)
				local tween14 = tbl2:Create("TextButton", { Text = "", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Name = "ResultButton" }, v26)

				tbl2:InsertFont(tbl2:Create("TextLabel", {
					Font = Enum.Font.GothamBold,
					Text = v25.Title,
					TextColor3 = Color3.fromRGB(210, 210, 210),
					TextSize = 11,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 6, 0, 2),
					Size = UDim2.new(1, -12, 0, 12),
					Name = "ResultTitle",
				}, v26))

				tbl2:InsertFont(tbl2:Create("TextLabel", {
					Font = Enum.Font.Gotham,
					Text = v25.Tab .. " > " .. v25.Section,
					TextColor3 = Color3.fromRGB(150, 150, 150),
					TextSize = 9,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 6, 0, 16),
					Size = UDim2.new(1, -12, 0, 10),
					Name = "ResultPath",
				}, v26))

				tween14.MouseEnter:Connect(function()
					v8:Create(v26, TweenInfo.new(0.15), { BackgroundTransparency = 0.7 }):Play()
				end)

				tween14.MouseLeave:Connect(function()
					v8:Create(v26, TweenInfo.new(0.15), { BackgroundTransparency = 0.85 }):Play()
				end)

				tween14.Activated:Connect(function()
					local mouseLocation = v9:GetMouseLocation()
					CircleClick(tween14, mouseLocation.X, mouseLocation.Y)

					if v25.Navigate then
						v25.Navigate()
					end

					v22.Text = ""
					v23.Visible = false
					v23.Size = UDim2.new(1, -10, 0, 0)
					tween8.Visible = false
				end)
			end

			tween9.CanvasSize = UDim2.new(0, 0, 0, #tbl4 * 32 + 10)
		end

		v22:GetPropertyChangedSignal("Text"):Connect(function()
			local text = v22.Text

			if text ~= "" then
				tween8.Visible = true
			else
				tween8.Visible = false
			end

			fn21(text)
		end)

		tween8.Activated:Connect(function()
			v22.Text = ""
			v23.Visible = false
			v23.Size = UDim2.new(1, -10, 0, 0)
			tween8.Visible = false
		end)

		tween6.Activated:Connect(function()
			local mouseLocation = v9:GetMouseLocation()
			CircleClick(tween6, mouseLocation.X, mouseLocation.Y)
			tween3.Visible = false

			if not v13.Visible then
				v13.Visible = true
			end
		end)

		v13.Activated:Connect(function()
			tween3.Visible = true

			if v13.Visible then
				v13.Visible = false
			end
		end)

		if not (v9.TouchEnabled and not v9.KeyboardEnabled) then
			v9.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then
					return
				end

				if not tbl2.Keybind_UI.Enabled then
					return
				end

				if input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode == tbl2.Keybind_UI.KeyId then
					tween3.Visible = not tween3.Visible
					v13.Visible = not v13.Visible
				end
			end)
		end

		tween5.Activated:Connect(function()
			local mouseLocation = v9:GetMouseLocation()
			CircleClick(tween5, mouseLocation.X, mouseLocation.Y)

			if tbl2.Enabled.DisableWarning then
				if tween2 then
					tween2:Destroy()
				end

				if not tbl2.Unloaded then
					tbl2.Unloaded = true
					v12:Fire()
				end

				return
			end

			tbl2:Warnings({
				Title = "Exit Confirmation",
				Content = "Are you sure you want to close the UI?",
				Buttons = {
					{
						Text = "Yes",
						Callback = function()
							if tween2 then
								tween2:Destroy()
							end

							if not tbl2.Unloaded then
								tbl2.Unloaded = true
								v12:Fire()
							end
						end,
						Primary = false,
					},
					{
						Text = "No",
						Callback = function()
						end,
						Primary = false,
					},
				},
			})
		end)

		tbl2.Close = function()
			if tween2 then
				tween2:Destroy()
			end

			if not tbl2.Unloaded then
				tbl2.Unloaded = true
				v12:Fire()
			end
		end

		tween3.Size = UDim2.new(0, 115 + v19.TextBounds.X + 1 + v20.TextBounds.X, 0, 350)
		fn13(v18, tween3)
		fn14(v15)

		local tween14 = tbl2:Create("Frame", {
			AnchorPoint = Vector2.new(1, 1),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Position = UDim2.new(1, 8, 1, 8),
			Size = UDim2.new(1, 154, 1, 54),
			Visible = false,
			Name = "MoreBlur",
		}, tween10)

		local tween15 = tbl2:Create("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = 0,
			Name = "DropShadowHolder",
		}, tween14)

		tbl2:Create("ImageLabel", {
			Image = "",
			ImageColor3 = Color3.fromRGB(0, 0, 0),
			ImageTransparency = 0.5,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, 35, 1, 35),
			ZIndex = 0,
			Name = "DropShadow",
		}, tween15)

		tbl2:Create("UICorner", {}, tween14)

		local tween16 = tbl2:Create("TextButton", {
			Font = Enum.Font.SourceSans,
			Text = "",
			TextColor3 = Color3.fromRGB(0, 0, 0),
			TextSize = 14,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.999,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Name = "ConnectButton",
		}, tween14)

		local v24 = tbl2:InsertTheme(tbl2:Create("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Primary,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Position = UDim2.new(1, 172, 0.5, 0),
			Size = UDim2.new(0, 160, 1, -16),
			Name = "DropdownSelect",
			ClipsDescendants = true,
		}, tween14), "Primary")

		tween16.Activated:Connect(function()
			if tween14.Visible then
				local tweenInfo = TweenInfo.new(0.2)
				local tween17 = v8:Create(tween14, tweenInfo, { BackgroundTransparency = 0.999 })
				local tween18 = v8:Create(v24, tweenInfo, { Position = UDim2.new(1, 172, 0.5, 0) })
				tween17:Play()
				tween18:Play()
				task.wait(0.2)
				tween14.Visible = false
			end
		end)

		tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 3), Parent = v24 })
		tbl2:Create("UIStroke", { Color = Color3.fromRGB(255, 255, 255), Thickness = 2.5, Transparency = 0.8, Parent = v24 })

		local tween17 = tbl2:Create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.999,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -10, 1, -10),
			Name = "DropdownSelectReal",
			Parent = v24,
		})

		local v25 = nil
		local tbl4 = {}

		return { CreateTab = function(arg3, arg4)
			local name = arg4[1] or arg4.Name or ""
			local icon = arg4[2] or arg4.Icon or ""
			local flag = #tbl4 == 0

			local tween18 = tbl2:Create("ScrollingFrame", {
				ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
				ScrollBarThickness = 0,
				Active = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.999,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Name = "ScrolLayers",
				Visible = flag,
				Parent = tween12,
			})

			tbl2:Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder, Parent = tween18 })

			local tween19 = tbl2:Create("Frame", {
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = flag and 0.9 or 0.999,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 32),
				Name = "Tab",
				Parent = tween13,
			})

			tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 5), Parent = tween19 })

			local tween20 = tbl2:Create("TextButton", {
				Font = Enum.Font.GothamBold,
				Text = "",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.999,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Name = "TabButton",
			}, tween19)

			tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
				Font = Enum.Font.GothamBold,
				Text = name,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.999,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 30, 0, 0),
				Name = "TabName",
				TextWrapped = true,
			}, tween19), "Tab", name))

			tbl2:Create("ImageLabel", {
				Image = tbl2:ProtectAsset(icon:gsub("rbxassetid://", ""), security),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.999,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(0, 8, 0, 7),
				Size = UDim2.new(0, 18, 0, 18),
				Name = "FeatureImg",
			}, tween19)

			local tbl5 = { Name = name, TabFrame = tween19, ScrollLayer = tween18, IsActive = flag }
			table.insert(tbl4, tbl5)

			if flag then
				ActiveTabData = tbl5
				tween11.Text = name
				tween18.Visible = true
			end

			local function fn22()
				if tween18.Visible == false then
					for _, v26 in ipairs(tbl4) do
						v26.IsActive = false
						v26.ScrollLayer.Visible = false
						v8:Create(v26.TabFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.999 }):Play()
					end

					tbl5.IsActive = true
					v8:Create(tween19, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0.9 }):Play()
					tween11.Text = name
					tween18.Visible = true
					tween12.Position = UDim2.new(0.1, 0, 1, 0)
					v8:Create(tween12, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 1, 0) }):Play()
				end
			end

			tween20.Activated:Connect(function()
				local mouseLocation = v9:GetMouseLocation()
				CircleClick(tween20, mouseLocation.X, mouseLocation.Y)
				fn22()
			end)

			tbl2.Warnings = function(arg5, arg6)
				local title2 = arg6.Title or "Warning"
				local content = arg6.Content or arg6.Description or "Are you sure?"
				local buttons = arg6.Buttons

				if not buttons then
					buttons = {
						{
							Text = "Yes",
							Callback = arg6.Callback or function()
							end,
							Primary = true,
						},
						{
							Text = "No",
							Callback = function()
							end,
							Primary = false,
						},
					}
				end

				if v15:FindFirstChild("WarningOverlay") then
					return
				end

				local tween21 = tbl2:Create("TextLabel", {
					Font = Enum.Font.Gotham,
					Text = content,
					TextSize = 13,
					TextWrapped = true,
					Size = UDim2.new(0, 320, 0, 1000),
					Visible = false,
				}, v15)

				local y = tween21.TextBounds.Y
				tween21:Destroy()
				local n = math.max(180, 90 + math.max(60, y + 10) + 50 + 20)

				local tween22 = tbl2:Create("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 1000,
					Name = "WarningOverlay",
				}, v15)

				v8:Create(tween22, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { BackgroundTransparency = 0.5 }):Play()

				local v26 = tbl2:InsertTheme(tbl2:Create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Background,
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 0, 0, 0),
					BackgroundTransparency = 1,
					ZIndex = 1001,
					Name = "WarningDialog",
				}, tween22), "Background")

				tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 12) }, v26)
				local tween23 = tbl2:Create("UIStroke", { Color = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight, Thickness = 2, Transparency = 1 }, v26)
				v8:Create(v26, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 360, 0, n), BackgroundTransparency = 0 }):Play()
				v8:Create(tween23, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Transparency = 0 }):Play()

				local tween24 = tbl2:Create("TextLabel", {
					Font = Enum.Font.GothamBold,
					Text = "⚠",
					TextColor3 = Color3.fromRGB(255, 200, 50),
					TextSize = 0,
					BackgroundTransparency = 1,
					TextTransparency = 1,
					Position = UDim2.new(0.5, 0, 0, 15),
					Size = UDim2.new(0, 50, 0, 50),
					AnchorPoint = Vector2.new(0.5, 0),
					ZIndex = 1002,
					Name = "WarningIcon",
				}, v26)

				task.delay(0.15, function()
					v8:Create(tween24, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { TextSize = 48, TextTransparency = 0 }):Play()
				end)

				local v27 = tbl2:InsertFont(tbl2:InsertTheme(tbl2:Create("TextLabel", {
					Font = Enum.Font.GothamBold,
					Text = title2,
					TextColor3 = tbl2.Theme[tbl2.Save.Theme].Text,
					TextSize = 16,
					BackgroundTransparency = 1,
					TextTransparency = 1,
					Position = UDim2.new(0, 20, 0, 70),
					Size = UDim2.new(1, -40, 0, 20),
					TextXAlignment = Enum.TextXAlignment.Center,
					ZIndex = 1002,
					Name = "WarningTitle",
				}, v26), "Text"))

				task.delay(0.2, function()
					v8:Create(v27, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play()
				end)

				local n2 = math.max(60, y + 10)

				local v28 = tbl2:InsertFont(tbl2:InsertTheme(tbl2:Create("TextLabel", {
					Font = Enum.Font.Gotham,
					Text = content,
					TextColor3 = tbl2.Theme[tbl2.Save.Theme].Text,
					TextSize = 13,
					BackgroundTransparency = 1,
					TextTransparency = 1,
					Position = UDim2.new(0, 20, 0, 95),
					Size = UDim2.new(1, -40, 0, n2),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextWrapped = true,
					ZIndex = 1002,
					Name = "WarningMessage",
				}, v26), "Text"))

				task.delay(0.25, function()
					v8:Create(v28, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play()
				end)

				local tween25 = tbl2:Create("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 20, 1, -50),
					Size = UDim2.new(1, -40, 0, 36),
					ZIndex = 1002,
					Name = "ButtonContainer",
				}, v26)

				local n3 = #buttons
				local n4 = 1 / n3 - 0.04 * (n3 - 1) / n3

				for i, button in ipairs(buttons) do
					local flag2 = button.Primary == true
					local text = button.Text or "Button"

					local callback = button.Callback or function()
					end

					local n5 = (i - 1) * (n4 + 0.04)

					local v29 = tbl2:InsertTheme(tbl2:Create("TextButton", {
						Font = Enum.Font.GothamBold,
						Text = text,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14,
						BackgroundColor3 = flag2 and Color3.fromRGB(220, 50, 50) or tbl2.Theme[tbl2.Save.Theme].Secondary,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Position = UDim2.new(n5, 0, 0, 15),
						Size = UDim2.new(n4, 0, 1, 0),
						ZIndex = 1003,
						Name = text .. "Button",
					}, tween25), flag2 and "Accent" or "Secondary")

					tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 8) }, v29)

					local tween26 = tbl2:Create("UIStroke", {
						Color = flag2 and Color3.fromRGB(180, 40, 40) or Color3.fromRGB(80, 80, 80),
						Thickness = 1.5,
						Transparency = 1,
					}, v29)

					task.delay(0.3 + i * 0.05, function()
						v8:Create(v29, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0, Position = UDim2.new(n5, 0, 0, 0) }):Play()
						v8:Create(tween26, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Transparency = 0 }):Play()
					end)

					v29.MouseEnter:Connect(function()
						v8:Create(v29, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Size = UDim2.new(n4, 0, 1, 3),
							BackgroundColor3 = v29.BackgroundColor3:Lerp(Color3.fromRGB(255, 255, 255), 0.15),
						}):Play()

						v8:Create(tween26, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Thickness = 2 }):Play()
					end)

					v29.MouseLeave:Connect(function()
						local color = flag2 and Color3.fromRGB(220, 50, 50) or tbl2.Theme[tbl2.Save.Theme].Secondary
						v8:Create(v29, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(n4, 0, 1, 0), BackgroundColor3 = color }):Play()
						v8:Create(tween26, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Thickness = 1.5 }):Play()
					end)

					v29.Activated:Connect(function()
						v8:Create(tween22, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
						v8:Create(v26, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1 }):Play()
						v8:Create(tween23, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { Transparency = 1 }):Play()
						tween24.Visible = false
						v27.Visible = false
						v28.Visible = false
						tween25.Visible = false
						task.wait(0.3)
						tween22:Destroy()
						pcall(callback)
					end)
				end
			end

			return { AddSection = function(arg5, arg6, arg7)
				arg6 = arg6 or ""
				local flag2 = arg7 or false

				local tween21 = tbl2:Create("Frame", {
					BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Secondary,
					BackgroundTransparency = 0.999,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, 30),
					Name = "Section",
				}, tween18)

				local tween22 = tbl2:Create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.935,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Position = UDim2.new(0.5, 0, 0, 0),
					Size = UDim2.new(1, 1, 0, 30),
					Name = "SectionReal",
				}, tween21)

				tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween22)

				local tween23 = tbl2:Create("TextButton", {
					Font = Enum.Font.SourceSans,
					Text = "",
					TextColor3 = Color3.fromRGB(0, 0, 0),
					TextSize = 14,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.99900001287460327,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Name = "SectionButton",
				}, tween22)

				local tween24 = tbl2:Create("Frame", {
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 0.99900001287460327,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Position = UDim2.new(1, -5, 0.5, 0),
					Size = UDim2.new(0, 20, 0, 20),
					Name = "FeatureFrame",
				}, tween22)

				tbl2:Create("ImageLabel", {
					Image = tbl2:ProtectAsset("125609963478878", security),
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.99900001287460327,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Rotation = -90,
					Size = UDim2.new(1, 6, 1, 6),
					Name = "FeatureImg",
				}, tween24)

				tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
					Font = Enum.Font.GothamBold,
					Text = arg6,
					TextColor3 = Color3.fromRGB(230, 230, 230),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.99900001287460327,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Position = UDim2.new(0, 10, 0.5, 0),
					Size = UDim2.new(1, -50, 0, 13),
					Name = "SectionTitle",
				}, tween22), "", arg6))

				local tween25 = tbl2:Create("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0, 33),
					Size = UDim2.new(0, 0, 0, 2),
					Name = "SectionDecideFrame",
				}, tween21)

				tbl2:Create("UICorner", {}, tween25)
				local v26 = tbl2
				local insertTheme = v26.InsertTheme
				local v27 = tbl2
				local create = v27.Create
				local tbl6 = {}
				local colorSequence = ColorSequence.new
				local tbl7 = {}
				local v28 = ColorSequenceKeypoint.new(0, tbl2.Theme[tbl2.Save.Theme].Primary)
				local v29 = ColorSequenceKeypoint.new(0.5, tbl2.Theme[tbl2.Save.Theme].ThemeHighlight)
				local new = ColorSequenceKeypoint.new
				local primary = tbl2.Theme[tbl2.Save.Theme].Primary
				tbl7[1] = v28
				tbl7[2] = v29

				do
					local values = table.pack(new(1, primary))
					table.move(values, 1, values.n, 3, tbl7)
				end

				tbl6.Color = colorSequence(tbl7)
				insertTheme(v26, create(v27, "UIGradient", tbl6, tween25), "PrimaryAndThemeHighlight")

				local tween26 = tbl2:Create("Frame", {
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.99900001287460327,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					ClipsDescendants = true,
					LayoutOrder = 1,
					Position = UDim2.new(0.5, 0, 0, 38),
					Size = UDim2.new(1, 0, 0, 100),
					Name = "SectionAdd",
				}, tween21)

				tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 2) }, tween26)
				tbl2:Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, tween26)

				local function fn23()
					local n = 0

					for _, child in pairs(tween18:GetChildren()) do
						if child.Name ~= "UIListLayout" then
							n = n + 3 + child.Size.Y.Offset
						end
					end

					tween18.CanvasSize = UDim2.new(0, 0, 0, n)
				end

				local function fn24()
					if flag2 then
						local n = 38

						for _, child in pairs(tween26:GetChildren()) do
							if child.Name ~= "UIListLayout" and child.Name ~= "UICorner" then
								n = n + child.Size.Y.Offset + 3
							end
						end

						v8:Create(tween24, TweenInfo.new(0.1), { Rotation = 90 }):Play()
						v8:Create(tween21, TweenInfo.new(0.1), { Size = UDim2.new(1, 1, 0, n) }):Play()
						v8:Create(tween26, TweenInfo.new(0.1), { Size = UDim2.new(1, 0, 0, n - 38) }):Play()
						v8:Create(tween25, TweenInfo.new(0.1), { Size = UDim2.new(1, 0, 0, 2) }):Play()
						task.wait(0.5)
						fn23()
					end
				end

				tween23.Activated:Connect(function()
					local mouseLocation = v9:GetMouseLocation()
					CircleClick(tween23, mouseLocation.X, mouseLocation.Y)

					if flag2 then
						v8:Create(tween24, TweenInfo.new(0.1), { Rotation = 0 }):Play()
						v8:Create(tween21, TweenInfo.new(0.1), { Size = UDim2.new(1, 1, 0, 30) }):Play()
						v8:Create(tween25, TweenInfo.new(0.1), { Size = UDim2.new(0, 0, 0, 2) }):Play()
						flag2 = false
						task.wait(0.1)
						fn23()
					else
						flag2 = true
						fn24()
					end
				end)

				tween26.ChildAdded:Connect(fn24)
				tween26.ChildRemoved:Connect(fn24)
				fn23()
				tween18.ChildAdded:Connect(fn23)
				tween18.ChildRemoved:Connect(fn23)

				return {
					AddParagraph = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local content = arg9[2] or arg9.Content or ""
						local tbl8 = {}

						local tween27 = tbl2:Create("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
							Name = "Paragraph",
						}, tween26)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(231, 231, 231),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -16, 0, 13),
							Name = "ParagraphTitle",
							RichText = true,
						}, tween27), "", title2))

						local v31 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = content,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.6,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Name = "ParagraphContent",
							RichText = true,
						}, tween27), "", content))

						local function fn25()
							v31.Size = UDim2.new(1, -16, 0, v31.TextBounds.Y)
							tween27.Size = UDim2.new(1, 0, 0, v31.TextBounds.Y + 33)
							fn24()
						end

						fn25()
						v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn25)

						tbl8.Set = function(arg10, arg11)
							local title3 = arg11[1] or arg11.Title or ""
							local content2 = arg11[2] or arg11.Content or ""
							v30.Text = title3
							v31.Text = content2
							fn25()
						end

						return tbl8
					end,
					AddSeperator = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local tbl8 = {}

						local tween27 = tbl2:Create("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 30),
							Name = "Seperator",
						}, tween26)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(231, 231, 231),
							TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
							TextStrokeTransparency = 0.8,
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Center,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 12, 0, 0),
							Size = UDim2.new(1, -16, 1, 0),
							Name = "SeperatorTitle",
						}, tween27), "", title2))

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 6) }, tween27)
						local new2 = ColorSequenceKeypoint.new
						local color = Color3.fromRGB

						tbl2:Create("UIGradient", {
							Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 120, 120)), new2(1, color(120, 120, 120)) }),
							Rotation = 90,
						}, tween27)

						tbl8.Set = function(arg10, arg11)
							v30.Text = arg11[1] or arg11.Title or ""
						end

						return tbl8
					end,
					AddLine = function()
						local v30 = tbl2:InsertTheme(tbl2:Create("Frame", {
							BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Accent,
							BackgroundTransparency = 0.2,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 7),
							Name = "Line",
						}, tween26), "Accent")

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 3) }, v30)
						local new2 = ColorSequenceKeypoint.new
						local color = Color3.fromRGB

						tbl2:Create("UIGradient", {
							Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)), new2(1, color(80, 80, 80)) }),
							Rotation = 0,
						}, v30)

						return {}
					end,
					AddButton = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local content = arg9[2] or arg9.Content or ""

						if not arg9[3] then
						end

						local callback = arg9[4] or arg9.Callback or function()
						end

						local warnings = arg9[5] or arg9.Warnings or nil
						local tbl8 = {}

						local tween27 = tbl2:Create("Frame", {
							Name = "Button",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
						}, tween26)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Name = "ButtonTitle",
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(231, 231, 231),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -100, 0, 13),
						}, tween27), "", title2))

						local v31 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Name = "ButtonContent",
							Font = Enum.Font.GothamBold,
							Text = content,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.6,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Size = UDim2.new(1, -100, 0, 12),
						}, tween27), "", title2))

						local function fn25()
							v31.Size = UDim2.new(1, -100, 0, 12 + 12 * v31.TextBounds.X // v31.AbsoluteSize.X)
							tween27.Size = UDim2.new(1, 0, 0, v31.AbsoluteSize.Y + 33)
						end

						v31.TextWrapped = true
						fn25()

						v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							v31.TextWrapped = false
							fn25()
							v31.TextWrapped = true
							fn24()
						end)

						local tween28 = tbl2:Create("TextButton", {
							Name = "ButtonButton",
							Font = Enum.Font.SourceSans,
							Text = "",
							TextColor3 = Color3.fromRGB(0, 0, 0),
							TextSize = 14,
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
						}, tween27)

						local tween29 = tbl2:Create("Frame", {
							Name = "FeatureFrame",
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(1, -15, 0.5, 0),
							Size = UDim2.new(0, 25, 0, 25),
						}, tween27)

						tbl2:Create("ImageLabel", {
							Name = "FeatureImg",
							Image = tbl2:ProtectAsset("16932740082", security),
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0.5, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 1, 0),
						}, tween29)

						tween28.Activated:Connect(function()
							local mouseLocation = v9:GetMouseLocation()
							CircleClick(tween28, mouseLocation.X, mouseLocation.Y)

							if warnings and warnings ~= "" then
								tbl2:Warnings({
									Title = "Warning | " .. title2,
									Content = warnings,
									Buttons = {
										{
											Text = "Yes",
											Callback = function()
												tbl2:FireCallback(callback)
											end,
											Primary = true,
										},
										{
											Text = "No",
											Callback = function()
											end,
											Primary = false,
										},
									},
								})
							else
								tbl2:FireCallback(callback)
							end
						end)

						tbl8.SetTitle = function(arg10, text)
							v30.Text = text
						end

						tbl8.SetContent = function(arg10, text)
							v31.Text = text
						end

						table.insert(tbl2.SearchData, {
							Title = title2,
							Tab = name,
							Section = title2,
							Type = "Button",
							Element = tween27,
							Navigate = function()
								if not tween18.Visible then
									fn22()
									task.wait(0.35)
								end

								if not flag2 then
									flag2 = true
									fn24()
									task.wait(0.15)
								end

								task.wait(0.1)
								local n = tween27.AbsolutePosition.Y - tween18.AbsolutePosition.Y + tween18.CanvasPosition.Y - 10
								v8:Create(tween18, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { CanvasPosition = Vector2.new(0, n) }):Play()
								local backgroundTransparency = tween27.BackgroundTransparency
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = 0.7 }):Play()
								task.wait(0.3)
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = backgroundTransparency }):Play()
							end,
						})

						return tbl8
					end,
					AddToggle = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local content = arg9[2] or arg9.Content or ""
						local default = arg9[3] or arg9.Default or false

						local callback = arg9[4] or arg9.Callback or function()
						end

						local saver = arg9[5] or arg9.Saver or false
						local warnings = arg9[6] or arg9.Warnings or nil

						if saver and fn16(title2) then
							default = tbl2.FlagSave[title2]
						end

						local tbl8 = { Value = default }

						local tween27 = tbl2:Create("Frame", {
							Name = "Toggle",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
						}, tween26)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Name = "ToggleTitle",
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextSize = 13,
							TextColor3 = Color3.fromRGB(231, 231, 231),
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -100, 0, 13),
						}, tween27), "", title2))

						local v31 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Name = "ToggleContent",
							Font = Enum.Font.GothamBold,
							Text = content,
							TextSize = 12,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextTransparency = 0.6,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Size = UDim2.new(1, -100, 0, 12),
						}, tween27), "", content))

						local function fn25()
							v31.TextWrapped = false
							v31.Size = UDim2.new(1, -100, 0, 12 + 12 * math.ceil(v31.TextBounds.X / v31.AbsoluteSize.X))
							tween27.Size = UDim2.new(1, 0, 0, v31.AbsoluteSize.Y + 33)
							v31.TextWrapped = true
						end

						fn25()

						v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							fn25()
							fn24()
						end)

						local tween28 = tbl2:Create("TextButton", {
							Name = "ToggleButton",
							Font = Enum.Font.SourceSans,
							Text = "",
							TextColor3 = Color3.fromRGB(0, 0, 0),
							TextSize = 14,
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 0.999,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
						}, tween27)

						local v32 = tbl2:InsertTheme(tbl2:Create("Frame", {
							Name = "FeatureFrame2",
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Secondary,
							BackgroundTransparency = 0.92,
							BorderSizePixel = 0,
							Position = UDim2.new(1, -15, 0.5, 0),
							Size = UDim2.new(0, 30, 0, 15),
						}, tween27), "Secondary")

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, v32)
						local v33 = tbl2:InsertTheme(tbl2:Create("UIStroke", { Color = Color3.fromRGB(255, 255, 255), Thickness = 2, Transparency = 0.9 }, v32), "ThemeHighlight")

						local tween29 = tbl2:Create("Frame", {
							Name = "ToggleCircle",
							BackgroundColor3 = Color3.fromRGB(230, 230, 230),
							BorderSizePixel = 0,
							Size = UDim2.new(0, 14, 0, 14),
							Position = UDim2.new(0, 0, 0, 0),
						}, v32)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 15) }, tween29)

						local function fn26(arg10)
							local themeHighlight = arg10 and tbl2.Theme[tbl2.Save.Theme].ThemeHighlight or Color3.fromRGB(230, 230, 230)
							local udim2 = arg10 and UDim2.new(0, 15, 0, 0) or UDim2.new(0, 0, 0, 0)
							local themeHighlight2 = arg10 and tbl2.Theme[tbl2.Save.Theme].ThemeHighlight or Color3.fromRGB(255, 255, 255)
							local n = arg10 and 0 or 0.9
							local themeHighlight3 = arg10 and tbl2.Theme[tbl2.Save.Theme].ThemeHighlight or Color3.fromRGB(255, 255, 255)
							arg10 = arg10 and 0 or 0.92
							local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
							v8:Create(v30, tweenInfo, { TextColor3 = themeHighlight }):Play()
							v8:Create(tween29, tweenInfo, { Position = udim2 }):Play()
							v8:Create(v33, tweenInfo, { Color = themeHighlight2, Transparency = n }):Play()
							v8:Create(v32, tweenInfo, { BackgroundColor3 = themeHighlight3, BackgroundTransparency = arg10 }):Play()
						end

						tween28.Activated:Connect(function()
							CircleClick(tween28, localPlayer:GetMouse().X, localPlayer:GetMouse().Y)

							if warnings and warnings ~= "" and tbl8.Value == false then
								tbl2:Warnings({
									Title = "Warning | " .. title2,
									Content = warnings,
									Buttons = {
										{
											Text = "Yes",
											Callback = function()
												tbl8:Set()
											end,
											Primary = true,
										},
										{
											Text = "No",
											Callback = function()
											end,
											Primary = false,
										},
									},
								})
							else
								tbl8:Set()
							end
						end)

						tbl8.Set = function(arg10, value2)
							if value2 == nil then
								tbl8.Value = not tbl8.Value
							else
								tbl8.Value = value2
							end

							tbl2:FireCallback(callback, tbl8.Value)
							fn26(tbl8.Value)
							fn17(title2, tbl8.Value)
						end

						tbl8:Set(tbl8.Value)

						tbl8.SetTitle = function(arg10, text)
							v30.Text = text
						end

						tbl8.SetContent = function(arg10, text)
							v31.Text = text
						end

						table.insert(tbl2.SearchData, {
							Title = title2,
							Tab = name,
							Section = title2,
							Type = "Toggle",
							Element = tween27,
							Navigate = function()
								if not tbl5.IsActive then
									fn22()
									task.wait(0.35)
								end

								if not flag2 then
									flag2 = true
									fn24()
									task.wait(0.15)
								end

								task.wait(0.1)
								local n = tween27.AbsolutePosition.Y - tween18.AbsolutePosition.Y + tween18.CanvasPosition.Y - 10
								v8:Create(tween18, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { CanvasPosition = Vector2.new(0, n) }):Play()
								local backgroundTransparency = tween27.BackgroundTransparency
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = 0.7 }):Play()
								task.wait(0.3)
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = backgroundTransparency }):Play()
							end,
						})

						return tbl8
					end,
					AddSlider = function(arg8, arg9)
						local title2 = arg9.Title or ""
						local content = arg9.Content or ""
						local increment = arg9.Increment or 1
						local min = arg9.Min or 0
						local max = arg9.Max or 100
						local default = arg9.Default or 50
						local autoUpdate = arg9.AutoUpdate or false

						local callback = arg9.Callback or function()
						end

						if (arg9[5] or arg9.Saver) and fn16(title2) then
							default = tbl2.FlagSave[title2]
						end

						local tbl8 = { Value = default }

						local tween27 = tbl2:Create("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.93500000238418579,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
							Name = "Slider",
						}, tween26)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(230, 230, 230),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.99900001287460327,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -180, 0, 13),
							Name = "SliderTitle",
						}, tween27), "", title2))

						local v31 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = content,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.60000002384185791,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.99900001287460327,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Size = UDim2.new(1, -180, 0, 12),
							Name = "SliderContent",
						}, tween27), "", content))

						local function fn25()
							v31.TextWrapped = false
							v31.Size = UDim2.new(1, -180, 0, 12 + 12 * math.floor(v31.TextBounds.X / v31.AbsoluteSize.X))
							tween27.Size = UDim2.new(1, 0, 0, v31.AbsoluteSize.Y + 33)
							v31.TextWrapped = true
						end

						v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							fn25()
							fn24()
						end)

						fn25()

						local v32 = tbl2:InsertTheme(tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Accent,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(1, -165, 0.5, 0),
							Size = UDim2.new(0, 28, 0, 25),
							Name = "SliderInput",
						}, tween27), "Accent")

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 2) }, v32)

						local tween28 = tbl2:Create("TextBox", {
							Font = Enum.Font.GothamBold,
							Text = "90",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 13,
							TextWrapped = true,
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 0.99900001287460327,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, -1, 0, 0),
							Size = UDim2.new(1, 0, 1, 0),
						}, v32)

						local tween29 = tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.80000001192092896,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(1, -20, 0.5, 0),
							Size = UDim2.new(0, 100, 0, 5),
							Name = "SliderFrame",
						}, tween27)

						tbl2:Create("UICorner", {}, tween29)

						local v33 = tbl2:InsertTheme(tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].Accent,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 1),
							Name = "SliderDraggable",
						}, tween29), "Accent")

						tbl2:Create("UICorner", {}, v33)

						local v34 = tbl2:InsertTheme(tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(1, 10, 0.5, 0),
							Size = UDim2.new(0, 10, 0, 10),
							Name = "SliderCircle",
						}, v33), "ThemeHighlight")

						tbl2:Create("UICorner", {}, v34)
						tbl2:InsertTheme(tbl2:Create("UIStroke", { Color = tbl2.Theme[tbl2.Save.Theme].Stroke }, v34), "Stroke")

						local function fn26(arg10, arg11)
							local n = 1 / arg11
							return math.floor(arg10 * n + 0.5) / n
						end

						local n = 0
						local n2 = 0.02

						tbl8.Set = function(arg10, arg11)
							local value2 = math.clamp(fn26(arg11, increment), min, max)
							tbl8.Value = value2
							tween28.Text = tostring(value2)
							v8:Create(v33, TweenInfo.new(0.05), { Size = UDim2.fromScale((value2 - min) / (max - min), 1) }):Play()

							if autoUpdate then
								tbl2:FireCallback(callback, value2)
							end

							fn17(title2, value2)
						end

						local function fn27(arg10)
							local now = tick()
							if now - n < n2 then
								return
							end
							n = now
							tbl8:Set(min + (max - min) * math.clamp((arg10.Position.X - tween29.AbsolutePosition.X) / tween29.AbsoluteSize.X, 0, 1))
						end

						local flag3 = false

						tween29.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								flag3 = true
								fn27(input)
							end
						end)

						tween29.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								flag3 = false
								tbl2:FireCallback(callback, tbl8.Value)
							end
						end)

						v34.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								flag3 = true
								fn27(input)
							end
						end)

						v34.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								flag3 = false
								tbl2:FireCallback(callback, tbl8.Value)
							end
						end)

						v9.InputChanged:Connect(function(input)
							if flag3 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
								fn27(input)
							end
						end)

						v9.TouchMoved:Connect(function(arg10)
							if flag3 then
								fn27(arg10)
							end
						end)

						tween28.FocusLost:Connect(function()
							local num = tonumber(tween28.Text)

							if num then
								tbl8:Set(num)
								tbl2:FireCallback(callback, tbl8.Value)
							else
								tbl8:Set(default)
							end
						end)

						tbl8.SetTitle = function(arg10, text)
							v30.Text = text
						end

						tbl8.SetContent = function(arg10, text)
							v31.Text = text
						end

						tbl8:Set(default)
						tbl2:FireCallback(callback, tbl8.Value)

						table.insert(tbl2.SearchData, {
							Title = title2,
							Tab = name,
							Section = title2,
							Type = "Slider",
							Element = tween27,
							Navigate = function()
								if not tbl5.IsActive then
									fn22()
									task.wait(0.35)
								end

								if not flag2 then
									flag2 = true
									fn24()
									task.wait(0.15)
								end

								task.wait(0.1)
								local n3 = tween27.AbsolutePosition.Y - tween18.AbsolutePosition.Y + tween18.CanvasPosition.Y - 10
								v8:Create(tween18, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { CanvasPosition = Vector2.new(0, n3) }):Play()
								local backgroundTransparency = tween27.BackgroundTransparency
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = 0.7 }):Play()
								task.wait(0.3)
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = backgroundTransparency }):Play()
							end,
						})

						return tbl8
					end,
					AddInput = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local content = arg9[2] or arg9.Content or ""
						local default = arg9[3] or arg9.Default or ""

						local callback = arg9[4] or arg9.Callback or function()
						end

						local saver = arg9[5] or arg9.Saver or false
						local limitSystem = arg9[6] or arg9.LimitSystem or nil

						if saver and fn16(title2) then
							default = tbl2.FlagSave[title2]
						end

						local tbl8 = { Value = default }

						local tween27 = tbl2:Create("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
							Name = "Input",
						}, tween26)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(230, 230, 230),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -180, 0, 13),
							Name = "InputTitle",
						}, tween27), "", title2))

						local v31 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = content,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.6,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Size = UDim2.new(1, -180, 0, 12),
							Name = "InputContent",
							Parent = tween27,
						}), "", content))

						local function fn25()
							v31.Size = UDim2.new(1, -180, 0, 12 + 12 * math.floor(v31.TextBounds.X / v31.AbsoluteSize.X))
							tween27.Size = UDim2.new(1, 0, 0, v31.AbsoluteSize.Y + 33)
						end

						fn25()

						v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							v31.TextWrapped = false
							fn25()
							v31.TextWrapped = true
							fn24()
						end)

						local tween28 = tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.95,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							ClipsDescendants = true,
							Position = UDim2.new(1, -7, 0.5, 0),
							Size = UDim2.new(0, 148, 0, 30),
							Name = "InputFrame",
						}, tween27)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween28)

						local tween29 = tbl2:Create("TextBox", {
							CursorPosition = -1,
							Font = Enum.Font.GothamBold,
							PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
							PlaceholderText = "Write your input there",
							Text = "",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextXAlignment = Enum.TextXAlignment.Left,
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 5, 0.5, 0),
							Size = UDim2.new(1, -10, 1, -8),
							Name = "InputTextBox",
						}, tween28)

						tbl8.Set = function(arg10, text)
							tween29.Text = text
							tbl8.Value = text
							tbl2:FireCallback(callback, text)
							fn17(title2, text)
						end

						local function fn26(arg10, arg11)
							local str = tostring(arg10):gsub("%s+", "")
							local num = tonumber(str)
							if num then
								return num
							end

							if not arg11 then
								return nil
							end
							local match, v32 = str:match("(%-?%d*%.?%d+)([kKmMbBtT]?)")
							if not match then
								return nil
							end
							local num2 = tonumber(match)
							if not num2 then
								return nil
							end
							local tbl9 = { k = 1000, m = 1000000, b = 1e9, t = 1e12 }
							local n

							if v32 ~= "" then
								n = num2 * (tbl9[v32:lower()] or 1)
							else
								n = num2
							end

							return n
						end

						local function fn27(arg10)
							if not limitSystem then
								return arg10
							end
							local v32 = fn26(arg10, limitSystem.String ~= false)
							if not v32 then
								return arg10
							end
							local number = limitSystem.Number
							local v33, v34

							if type(number) == "table" then
								if #number >= 2 then
									v33 = number[1]
									v34 = number[2]
								else
									v34 = number[1]
									v33 = nil
								end
							else
								local v35 = nil
								v33 = nil
								v34 = nil

								if type(number) == "number" then
									v33 = v35
									v34 = number
								end
							end

							if v34 and v32 > v34 then
								local v35 = tostring

								tbl2:Warnings({
									Title = "Limit Reached",
									Content = ("\"%s\" allows a maximum of %s.\nYour value was too high, so it has been adjusted to %s."):format(title2, tostring(v34), v35(v34)),
									Buttons = {
										{
											Text = "Ok",
											Callback = function()
											end,
											Primary = true,
										},
									},
								})
							elseif v33 and v32 < v33 then
								local v35 = tostring

								tbl2:Warnings({
									Title = "Limit Reached",
									Content = ("\"%s\" allows a minimum of %s.\nYour value was too low, so it has been adjusted to %s."):format(title2, tostring(v33), v35(v33)),
									Buttons = {
										{
											Text = "Ok",
											Callback = function()
											end,
											Primary = true,
										},
									},
								})

								v34 = v33
							else
								v34 = v32
							end

							return tostring(v34)
						end

						tween29.FocusLost:Connect(function()
							tbl8:Set(fn27(tween29.Text))
						end)

						tbl8.SetTitle = function(arg10, text)
							v30.Text = text
						end

						tbl8.SetContent = function(arg10, text)
							v31.Text = text
						end

						tbl8:Set(default)

						table.insert(tbl2.SearchData, {
							Title = title2,
							Tab = name,
							Section = title2,
							Type = "Input",
							Element = tween27,
							Navigate = function()
								if not tbl5.IsActive then
									fn22()
									task.wait(0.35)
								end

								if not flag2 then
									flag2 = true
									fn24()
									task.wait(0.15)
								end

								local n = tween27.AbsolutePosition.Y - tween18.AbsolutePosition.Y + tween18.CanvasPosition.Y - 10
								v8:Create(tween18, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { CanvasPosition = Vector2.new(0, n) }):Play()
								local backgroundTransparency = tween27.BackgroundTransparency
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = 0.7 }):Play()
								task.wait(0.3)
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = backgroundTransparency }):Play()
							end,
						})

						return tbl8
					end,
					AddKeybind = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local content = arg9[2] or arg9.Content or ""
						local default = arg9[3] or arg9.Default or Enum.KeyCode.P

						local callback = arg9[4] or arg9.Callback or function()
						end

						if (arg9[5] or arg9.Saver) and fn16(title2) then
							local v30 = tbl2.FlagSave[title2]

							if v30 and Enum.KeyCode[v30] then
								default = Enum.KeyCode[v30]
							end
						end

						local tbl8 = { Value = default }

						local tween27 = tbl2:Create("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
							Name = "Keybind",
						}, tween26)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(230, 230, 230),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -180, 0, 13),
							Name = "KeybindTitle",
						}, tween27), "", title2))

						local v31 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = content,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.6,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Size = UDim2.new(1, -180, 0, 12),
							Name = "KeybindContent",
							Parent = tween27,
						}), "", content))

						local function fn25()
							v31.Size = UDim2.new(1, -180, 0, 12 + 12 * math.floor(v31.TextBounds.X / v31.AbsoluteSize.X))
							tween27.Size = UDim2.new(1, 0, 0, v31.AbsoluteSize.Y + 33)
						end

						fn25()

						v31:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							v31.TextWrapped = false
							fn25()
							v31.TextWrapped = true
							fn24()
						end)

						local tween28 = tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.95,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							ClipsDescendants = true,
							Position = UDim2.new(1, -7, 0.5, 0),
							Size = UDim2.new(0, 90, 0, 30),
							Name = "KeybindFrame",
						}, tween27)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween28)

						local tween29 = tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = "[ " .. tostring(default.Name) .. " ]",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(0, 5, 0.5, 0),
							Size = UDim2.new(1, -10, 1, -8),
							Name = "KeyLabel",
						}, tween28)

						local flag3 = false

						tween29.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								flag3 = true
								tween29.Text = "[...]"
							end
						end)

						if not (v9.TouchEnabled and not v9.KeyboardEnabled) then
							v9.InputBegan:Connect(function(input, gameProcessed)
								if gameProcessed or not flag3 then
									return
								end

								if input.KeyCode ~= Enum.KeyCode.Unknown then
									flag3 = false
									tbl8:Set(input.KeyCode)
								end
							end)
						end

						tbl8.Set = function(arg10, value2)
							tween29.Text = "[ " .. value2.Name .. " ]"
							tbl8.Value = value2
							tbl2:FireCallback(callback, value2)
							fn17(title2, value2.Name)
						end

						tbl8.SetTitle = function(arg10, text)
							v30.Text = text
						end

						tbl8.SetContent = function(arg10, text)
							v31.Text = text
						end

						tbl8:Set(default)

						table.insert(tbl2.SearchData, {
							Title = title2,
							Tab = name,
							Section = title2,
							Type = "Keybind",
							Element = tween27,
							Navigate = function()
								if not tbl5.IsActive then
									fn22()
									task.wait(0.35)
								end

								if not flag2 then
									flag2 = true
									fn24()
									task.wait(0.15)
								end

								local n = tween27.AbsolutePosition.Y - tween18.AbsolutePosition.Y + tween18.CanvasPosition.Y - 10
								v8:Create(tween18, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { CanvasPosition = Vector2.new(0, n) }):Play()
								local backgroundTransparency = tween27.BackgroundTransparency
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = 0.7 }):Play()
								task.wait(0.3)
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = backgroundTransparency }):Play()
							end,
						})

						return tbl8
					end,
					AddDropdown = function(arg8, arg9)
						local title2 = arg9[1] or arg9.Title or ""
						local content = arg9[2] or arg9.Content or ""
						local multi = arg9[3] or arg9.Multi or false
						local options = arg9[4] or arg9.Options or {}
						local default = arg9[5] or arg9.Default or {}

						local callback = arg9[6] or arg9.Callback or function()
						end

						local saver = arg9[7] or arg9.Saver or false
						local amount = arg9[8] or arg9.Amount or false
						local flag3 = false

						if saver and fn16(title2) then
							if type(tbl2.FlagSave[title2]) ~= "table" then
								default = { tbl2.FlagSave[title2] }
							else
								default = tbl2.FlagSave[title2]
							end
						end

						local tbl8 = { Value = default, Options = options, AmountValues = {} }

						local tween27 = tbl2:Create("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.935,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 35),
							Name = "Dropdown",
						}, tween26)

						local tween28 = tbl2:Create("TextButton", {
							Font = Enum.Font.SourceSans,
							Text = "",
							TextColor3 = Color3.fromRGB(0, 0, 0),
							TextSize = 14,
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							Name = "ToggleButton",
						}, tween27)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween27)

						tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = title2,
							TextColor3 = Color3.fromRGB(230, 230, 230),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 10),
							Size = UDim2.new(1, -180, 0, 13),
							Name = "DropdownTitle",
							Parent = tween27,
						}), "", title2))

						local v30 = tbl2:InsertFont(tbl2:InsertTranslator(tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = content,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.6,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, 23),
							Size = UDim2.new(1, -180, 0, 12),
							Name = "DropdownContent",
							Parent = tween27,
						}), "", content))

						v30.Size = UDim2.new(1, -180, 0, 12 + 12 * v30.TextBounds.X // v30.AbsoluteSize.X)
						v30.TextWrapped = true
						tween27.Size = UDim2.new(1, 0, 0, v30.AbsoluteSize.Y + 33)

						v30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							v30.TextWrapped = false
							v30.Size = UDim2.new(1, -180, 0, 12 + 12 * v30.TextBounds.X // v30.AbsoluteSize.X)
							tween27.Size = UDim2.new(1, 0, 0, v30.AbsoluteSize.Y + 33)
							v30.TextWrapped = true
							fn24()
						end)

						if amount then
							tbl8.AmountValues.Current = 1

							local tween29 = tbl2:Create("Frame", {
								AnchorPoint = Vector2.new(1, 0.5),
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 0.95,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(1, -165, 0.5, 0),
								Size = UDim2.new(0, 50, 0, 25),
								Name = "AmountFrame",
							}, tween27)

							tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween29)

							local v31 = tbl2:InsertFont(tbl2:Create("TextBox", {
								Font = Enum.Font.GothamBold,
								PlaceholderText = "Amount",
								Text = "1",
								TextColor3 = Color3.fromRGB(255, 255, 255),
								TextSize = 11,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 0.999,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 1, 0),
								Name = "AmountTextbox",
								ClearTextOnFocus = false,
							}, tween29))

							v31.FocusLost:Connect(function()
								local num = tonumber(v31.Text)

								if num and num >= 1 then
									tbl8.AmountValues.Current = math.floor(num)
									v31.Text = tostring(math.floor(num))

									if multi then
										tbl2:FireCallback(callback, tbl8.Value, tbl8.AmountValues.Current)
									else
										for _, v32 in ipairs(tbl8.Value) do
											tbl2:FireCallback(callback, v32, tbl8.AmountValues.Current)
										end
									end
								else
									v31.Text = tostring(tbl8.AmountValues.Current)
								end
							end)
						end

						local tween29 = tbl2:Create("Frame", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.95,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(1, -7, 0.5, 0),
							Size = UDim2.new(0, 148, 0, 30),
							Name = "SelectOptionsFrame",
						}, tween27)

						tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 4) }, tween29)

						local tween30 = tbl2:Create("TextLabel", {
							Font = Enum.Font.GothamBold,
							Text = "",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							TextTransparency = 0.6,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 5, 0.5, 0),
							Size = UDim2.new(1, -30, 1, -8),
							Name = "OptionSelecting",
						}, tween29)

						tbl2:Create("ImageLabel", {
							Image = tbl2:ProtectAsset("90200523188815", security),
							ImageColor3 = Color3.fromRGB(231, 231, 231),
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(1, 0, 0.5, 0),
							Size = UDim2.new(0, 25, 0, 25),
							Name = "OptionImg",
						}, tween29)

						local tween31 = tbl2:Create("ScrollingFrame", {
							CanvasSize = UDim2.new(0, 0, 0, 0),
							ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
							ScrollBarThickness = 0,
							Active = true,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.999,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							Visible = false,
							Name = "ScrollSelect",
						}, tween17)

						tbl2:Create("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, tween31)

						local v31 = tbl2:InsertFont(tbl2:Create("TextBox", {
							Font = Enum.Font.GothamBold,
							PlaceholderText = "Search",
							PlaceholderColor3 = Color3.fromRGB(120, 120, 120),
							Text = "",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 12,
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 0.9,
							BorderColor3 = Color3.fromRGB(255, 0, 0),
							BorderSizePixel = 1,
							Size = UDim2.new(1, 0, 0, 20),
							Name = "SearchBar",
						}, tween31))

						tween28.Activated:Connect(function()
							if not tween14.Visible then
								if v25 and v25 ~= tween31 then
									v25.Visible = false
								end

								tween31.Visible = true
								v25 = tween31
								tween14.Visible = true
								local tweenInfo = TweenInfo.new(0.1)
								local tween32 = v8:Create(tween14, tweenInfo, { BackgroundTransparency = 0.7 })
								local tween33 = v8:Create(v24, tweenInfo, { Position = UDim2.new(1, -11, 0.5, 0) })
								tween32:Play()
								tween33:Play()
							end
						end)

						v31:GetPropertyChangedSignal("Text"):Connect(function()
							local v32 = string.lower(v31.Text)

							for _, child in pairs(tween31:GetChildren()) do
								if child:IsA("Frame") and child.Name == "Option" and child.Name ~= "SearchBar" then
									local optionText = child:FindFirstChild("OptionText")

									if optionText then
										child.Visible = string.find(string.lower(optionText.Text), v32) ~= nil
									end
								end
							end
						end)

						tbl8.Clear = function()
							for _, child in pairs(tween31:GetChildren()) do
								if child.Name == "Option" then
									tbl8.Value = {}
									tbl8.Options = {}
									tween30.Text = "Select Options"
									child:Destroy()
								end
							end
						end

						tbl8.Set = function(arg10, value2)
							tbl8.Value = value2 or tbl8.Value

							for _, child in pairs(tween31:GetChildren()) do
								if child.Name ~= "UIListLayout" and child.Name ~= "SearchBar" then
									local v32 = table.find(tbl8.Value, child.OptionText.Text)
									local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
									local udim2 = v32 and UDim2.new(0, 1, 0, 12) or UDim2.new(0, 0, 0, 0)
									local n = v32 and 0.935 or 0.999
									local n2 = v32 and 0 or 0.999
									v8:Create(child.ChooseFrame, tweenInfo, { Size = udim2 }):Play()
									v8:Create(child.ChooseFrame.UIStroke, tweenInfo, { Transparency = n2 }):Play()
									v8:Create(child, tweenInfo, { BackgroundTransparency = n }):Play()
								end
							end

							local str = table.concat(tbl8.Value, ", ")
							tween30.Text = str ~= "" and str or "Select Options"
							fn17(title2, tbl8.Value)

							if multi then
								if amount then
									tbl2:FireCallback(callback, tbl8.Value, tbl8.AmountValues.Current or 1)
								else
									tbl2:FireCallback(callback, tbl8.Value)
								end
							else
								for _, v32 in ipairs(tbl8.Value) do
									if amount then
										tbl2:FireCallback(callback, v32, tbl8.AmountValues.Current or 1)
									else
										tbl2:FireCallback(callback, v32)
									end
								end
							end
						end

						tbl8.AddOption = function(arg10, arg11)
							local str = arg11 or "Option"

							local tween32 = tbl2:Create("Frame", {
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 0.999,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 0, 30),
								Name = "Option",
							}, tween31)

							tbl2:Create("UICorner", { CornerRadius = UDim.new(0, 3) }, tween32)

							local tween33 = tbl2:Create("TextButton", {
								Font = Enum.Font.GothamBold,
								Text = "",
								TextColor3 = Color3.fromRGB(255, 255, 255),
								TextSize = 13,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 0.999,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 1, 0),
								Name = "OptionButton",
							}, tween32)

							tbl2:InsertFont(tbl2:Create("TextLabel", {
								Font = Enum.Font.GothamBold,
								Text = str,
								TextSize = 13,
								TextColor3 = Color3.fromRGB(230, 230, 230),
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Top,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 0.999,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 8, 0, 8),
								Size = UDim2.new(1, -100, 0, 13),
								Name = "OptionText",
							}, tween32))

							local v32 = tbl2:InsertTheme(tbl2:Create("Frame", {
								AnchorPoint = Vector2.new(0, 0.5),
								BackgroundColor3 = tbl2.Theme[tbl2.Save.Theme].ThemeHighlight,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Position = UDim2.new(0, 2, 0.5, 0),
								Size = UDim2.new(0, 0, 0, 0),
								Name = "ChooseFrame",
							}, tween32), "ThemeHighlight")

							tbl2:InsertTheme(tbl2:Create("UIStroke", { Color = tbl2.Theme[tbl2.Save.Theme].Stroke, Thickness = 1.6, Transparency = 0.999 }, v32), "Stroke")
							tbl2:Create("UICorner", {}, v32)

							tween33.Activated:Connect(function()
								local mouseLocation = v9:GetMouseLocation()
								CircleClick(tween33, mouseLocation.X, mouseLocation.Y)
								local flag4 = tween32.BackgroundTransparency > 0.95

								if multi then
									if flag4 then
										if not table.find(tbl8.Value, str) then
											table.insert(tbl8.Value, str)
										end
									else
										for i, v33 in ipairs(tbl8.Value) do
											if v33 == str then
												table.remove(tbl8.Value, i)
												break
											end
										end
									end
								else
									tbl8.Value = { str }
								end

								tbl8:Set(tbl8.Value)
							end)

							local function fn25()
								local n = 0

								for _, child in ipairs(tween31:GetChildren()) do
									if child.Name ~= "UIListLayout" and child.Name ~= "SearchBar" then
										n = n + 5 + child.Size.Y.Offset
									end
								end

								tween31.CanvasSize = UDim2.new(0, 0, 0, n)
							end

							fn25()
						end

						task.spawn(function()
							tbl8:Clear()
							tbl8:Set(tbl8.Value)
						end)

						tbl8.Refresh = function(arg10, options2, arg11)
							options2 = options2 or {}
							arg11 = arg11 or {}
							tbl8:Clear()

							task.spawn(function()
								for _, v32 in ipairs(options2) do
									tbl8:AddOption(v32)
								end
							end)

							tbl8.Options = options2
							tbl8:Set(arg11)
						end

						tween28.Activated:Connect(function()
							if not flag3 then
								tbl8:Refresh(tbl8.Options, tbl8.Value)
								flag3 = true
							end
						end)

						table.insert(tbl2.SearchData, {
							Title = title2,
							Tab = name,
							Section = title2,
							Type = "Dropdown",
							Element = tween27,
							Navigate = function()
								if not tbl5.IsActive then
									fn22()
									task.wait(0.35)
								end

								if not flag2 then
									flag2 = true
									fn24()
									task.wait(0.15)
								end

								local n = tween27.AbsolutePosition.Y - tween18.AbsolutePosition.Y + tween18.CanvasPosition.Y - 10
								v8:Create(tween18, TweenInfo.new(0.5, Enum.EasingStyle.Quad), { CanvasPosition = Vector2.new(0, n) }):Play()
								local backgroundTransparency = tween27.BackgroundTransparency
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = 0.7 }):Play()
								task.wait(0.3)
								v8:Create(tween27, TweenInfo.new(0.3), { BackgroundTransparency = backgroundTransparency }):Play()
							end,
						})

						return tbl8
					end,
				}
			end }
		end }, tbl3
	end
end

fn15()

tbl2.AddSettingUi = function(arg, arg2)
	local v13 = tbl2
	local v14 = (loadstring or load)("local a={}do function a:Toggle(b,c,d,e,f,g)c=c or\"\"d=d or\"\"e=e or false;f=f or false;g=g or function()end;return b:AddToggle({Title=c,Content=d,Default=e,Callback=g,Saver=f})end;function a:Button(b,c,d,g)c=c or\"\"d=d or\"\"g=g or function()end;return b:AddButton({Title=c,Content=d,Callback=g})end;function a:Dropdown(b,c,d,h,i,e,f,g)c=c or\"\"d=d or\"\"h=h or false;i=i or{}e=e or{}f=f or false;g=g or function()end;return b:AddDropdown({Title=c,Content=d,Multi=h,Options=i,Default=e,Callback=g,Saver=f})end;function a:Textbox(b,c,d,e,f,g)c=c or\"\"d=d or\"\"e=e or\"\"f=f or false;g=g or function()end;return b:AddInput({Title=c,Content=d,Default=e,Callback=g,Saver=f})end;function a:Slider(b,c,d,j,k,l,e,m,f,g)c=c or\"\"d=d or\"\"l=l or 0.1;j=j or 0.1;k=k or 1;e=e or 0;f=f or false;m=m or false;g=g or function()end;return b:AddSlider({Title=c,Content=d,Increment=l,Min=j,Max=k,Default=e,AutoUpdate=m,Callback=g,Saver=f})end end;return a")()
	local v15 = arg2:CreateTab({ Name = "Settings UI", Icon = "rbxassetid://8997386997" })
	local tbl3 = {}
	local Theme = v15:AddSection("Theme")

	local function fn16()
		local tbl4 = {}

		for k in v13.Theme, nil, nil do
			table.insert(tbl4, k)
		end

		return tbl4
	end

	tbl3["Update Select Theme"] = v14:Dropdown(Theme, "Select Theme", "", false, fn16(), { "" }, true, function(arg3)
		tbl3["Select Theme"] = arg3
		v13:SetTheme(tbl3["Select Theme"])
	end)

	v14:Button(Theme, "Reset Theme", "", function()
		if tbl3["Update Select Theme"] then
			tbl3["Update Select Theme"]:Set({})
			v13:SetTheme("Red")
		end
	end)

	local v16 = v15:AddSection("Background UI")

	v14:Slider(v16, "Background Transparency", "", 0.1, 1, 0.1, 0.1, true, true, function(arg3)
		local num = tonumber(arg3)

		if num then
			v13:SetTransparency("Background", num)
		end
	end)

	v16:AddSeperator({ " - [ Background Video / Image ] - " })

	local function fn17()
		local tbl4 = { "None" }
		local tbl5 = fn9(v13.FolderPath .. "/Video") or {}

		for _, v17 in tbl5, nil, nil do
			local str = v17:gsub("\\", "/"):gsub("/+", "/"):gsub("^%./+", ""):gsub("%.%.+/", ""):gsub("^/?NexzanHub/Video/?", ""):gsub("%.mp4$", "")
			table.insert(tbl4, str)
		end

		return tbl4
	end

	local function fn18()
		local tbl4 = { "None" }
		local tbl5 = fn9(v13.FolderPath .. "/Image") or {}

		for _, v17 in tbl5, nil, nil do
			local str = v17:gsub("\\", "/"):gsub("/+", "/"):gsub("^%./+", ""):gsub("%.%.+/", ""):gsub("^/?NexzanHub/Image/?", ""):gsub("%.(png|jpg)$", "")
			table.insert(tbl4, str)
		end

		return tbl4
	end

	v14:Dropdown(v16, "Select Assets Type", "", false, { "Image", "Video" }, { "" }, true, function(arg3)
		tbl3["Select Assets Type"] = arg3
	end)

	v14:Textbox(v16, "Input Name", "Input any name you want.", "", true, function(arg3)
		tbl3["Input Name"] = arg3
	end)

	v14:Textbox(v16, "Input URL", "Input your video or image URL. Supports mp4, webp, and Roblox Asset IDs and png, jpg.", "", true, function(arg3)
		tbl3["Input URL"] = arg3
	end)

	v14:Button(v16, "Create", "", function()
		local selectAssetsType = tbl3["Select Assets Type"]
		if not selectAssetsType or selectAssetsType == "" then
			return v13:SetNotification({ "Sovereign Hub", "", "Please Select Assets Type First", 5, 0.5 })
		end
		local inputName = tbl3["Input Name"]
		if not inputName or inputName == "" then
			return v13:SetNotification({ "Sovereign Hub", "", "Please Input Name First", 5, 0.5 })
		end
		local inputUrl = tbl3["Input URL"]
		if not inputUrl or inputUrl == "" then
			return v13:SetNotification({ "Sovereign Hub", "", "Please Input URL First", 5, 0.5 })
		end

		if pcall(function()
			if selectAssetsType == "Video" then
				v13:CreateVideo(inputName, inputUrl)
			else
				v13:CreateImage(inputName, inputUrl)
			end
		end) then
			v13:SetNotification({
				"Sovereign Hub",
				"",
				"Successfully Created, Go to Select Use Video Or Image Background",
				5,
				0.5,
			})

			if tbl3["Update Select Use Video Background"] then
				tbl3["Update Select Use Video Background"]:Set({})
				tbl3["Update Select Use Video Background"]:Refresh(fn17(), {})
			end

			if tbl3["Update Select Use Image Background"] then
				tbl3["Update Select Use Image Background"]:Set({})
				tbl3["Update Select Use Image Background"]:Refresh(fn18(), {})
			end
		end
	end)

	tbl3["Update Select Use Video Background"] = v14:Dropdown(v16, "Select Use Video Background", "", false, fn17(), { "" }, true, function(arg3)
		tbl3["Select Use Video Background"] = arg3

		task.spawn(function()
			if tbl3["Select Use Video Background"] and tbl3["Select Use Video Background"] ~= "" then
				v13:SetVideo(tbl3["Select Use Video Background"] .. ".mp4")

				if tbl3["Update Select Use Image Background"] then
					tbl3["Update Select Use Image Background"]:Set({})
				end
			end
		end)
	end)

	tbl3["Update Select Use Image Background"] = v14:Dropdown(v16, "Select Use Image Background", "", false, fn18(), { "" }, true, function(arg3)
		tbl3["Select Use Image Background"] = arg3

		task.spawn(function()
			if tbl3["Select Use Image Background"] and tbl3["Select Use Image Background"] ~= "" then
				v13:SetImage(tbl3["Select Use Image Background"])

				if tbl3["Update Select Use Video Background"] then
					tbl3["Update Select Use Video Background"]:Set({})
					v13:SetVideo("None.mp4")
				end
			end
		end)
	end)

	v14:Button(v16, "Reset Background Video / Image", "", function()
		if tbl3["Update Select Use Video Background"] then
			tbl3["Update Select Use Video Background"]:Set({})
			v13:SetVideo("None.mp4")
		end

		if tbl3["Update Select Use Image Background"] then
			tbl3["Update Select Use Image Background"]:Set({})
			v13:SetImage("None")
		end
	end)

	local Language = v15:AddSection("Language")

	local function fn19()
		local tbl4 = {}

		for k in v13.List_Translator, nil, nil do
			table.insert(tbl4, k)
		end

		return tbl4
	end

	tbl3["Update Select Language"] = v14:Dropdown(Language, "Select Language", "", false, fn19(), { "" }, true, function(arg3)
		tbl3["Select Language"] = arg3

		task.spawn(function()
			if tbl3["Select Language"] and tbl3["Select Language"] ~= "" then
				v13:SetTranslator(tbl3["Select Language"])
			end
		end)
	end)

	v14:Button(Language, "Reset Language", "", function()
		if tbl3["Update Select Language"] then
			tbl3["Update Select Language"]:Set({})
			v13:SetTranslator("English")
		end
	end)

	local v17 = v15:AddSection("Custom UI")
	v17:AddSeperator({ " - [ Keybind Open/Close UI ] - " })

	v14:Toggle(v17, "Enable", "", false, true, function(enabled)
		v13.Keybind_UI.Enabled = enabled
	end)

	v17:AddKeybind({
		Title = "Keybind Open/Close UI",
		Default = Enum.KeyCode.RightShift,
		Callback = function(keyId)
			v13.Keybind_UI.KeyId = keyId
		end,
		Saver = true,
	})

	v17:AddSeperator({ " - [ Fonts Text ] - " })

	local function fn20()
		local tbl4 = {}
		local v18 = next
		local enumItems, v19 = Enum.Font:GetEnumItems()

		for _, v20 in v18, enumItems, v19 do
			if v20.Name ~= "Unknown" then
				table.insert(tbl4, v20.Name)
			end
		end

		return tbl4
	end

	tbl3["Update Select Font"] = v14:Dropdown(v17, "Select Font", "", false, fn20(), { "" }, true, function(arg3)
		tbl3["Select Font"] = arg3

		if tbl3["Select Font"] then
			v13:SetFont(tbl3["Select Font"])
		end
	end)

	v14:Button(v17, "Reset Font", "", function()
		if tbl3["Update Select Font"] then
			tbl3["Update Select Font"]:Set({})
			v13:SetFont("Old")
		end
	end)

	v17:AddSeperator({ " - [ UI ] - " })

	v14:Toggle(v17, "Disable Exit Warning", "If enabled, the exit confirmation dialog will be skipped when you click the close button", false, true, function(disableWarning)
		v13.Enabled.DisableWarning = disableWarning
	end)

	local v18 = v15:AddSection("Config Manager")
	v18:AddSeperator({ " - [ Export / Delete ] - " })

	local v19 = v14:Dropdown(v18, "Select File", "", false, tbl2.SaveManager_Core:GetSaveVariants(), { "" }, true, function(arg3)
		tbl3["Select File"] = arg3
	end)

	v14:Button(v18, "Refresh List", "", function()
		local saveVariants = tbl2.SaveManager_Core:GetSaveVariants()

		if v19 then
			v19:Set({})
			v19:Refresh(saveVariants, {})
		end
	end)

	v14:Button(v18, "Export File", "", function()
		if tbl3["Select File"] and tbl3["Select File"] ~= "" then
			local v20 = tbl2.SaveManager_Core:ExportSave(tbl3["Select File"])

			if v20 then
				fn10(v20)
				v13:SetNotification({ "Sovereign Hub", "", "Successfully Exported " .. tbl3["Select File"], 5, 0.5 })
			else
				v13:SetNotification({ "Sovereign Hub", "", "Failed to Export " .. tbl3["Select File"], 5, 0.5 })
			end
		else
			v13:SetNotification({ "Sovereign Hub", "", "Please Select File First", 5, 0.5 })
		end
	end)

	v14:Button(v18, "Delete File", "", function()
		if tbl3["Select File"] and tbl3["Select File"] ~= "" then
			if tbl3["Select File"] == "config" then
				return v13:SetNotification({ "Sovereign Hub", "", "You Cannot Delete Default Config", 5, 0.5 })
			end

			if tbl2.SaveManager_Core:DeleteVariant(tbl3["Select File"]) then
				v13:SetNotification({ "Sovereign Hub", "", "Successfully Deleted " .. tbl3["Select File"], 5, 0.5 })
			else
				v13:SetNotification({ "Sovereign Hub", "", "Failed to Delete " .. tbl3["Select File"], 5, 0.5 })
			end
		else
			v13:SetNotification({ "Sovereign Hub", "", "Please Select File First", 5, 0.5 })
		end
	end)

	v18:AddSeperator({ " - [ Import ] - " })

	v14:Textbox(v18, "Input Config Data", "You can provide your data as JSON or a URL. It supports both JSON and URLs.", "", true, function(arg3)
		tbl3["Input Config Data"] = arg3
	end)

	v14:Textbox(v18, "Import File Name", "Enter the name for the file you want to import.", "", true, function(arg3)
		tbl3["Import File Name"] = arg3
	end)

	v14:Button(v18, "Import File", "", function()
		local inputConfigData = tbl3["Input Config Data"]
		local importFileName = tbl3["Import File Name"]
		if not inputConfigData or inputConfigData == "" then
			return v13:SetNotification({ "Sovereign Hub", "", "Please Input Config Data First", 5, 0.5 })
		end

		if not importFileName or importFileName == "" then
			return v13:SetNotification({ "Sovereign Hub", "", "Please Input Import File Name First", 5, 0.5 })
		end

		if importFileName == "config" then
			return v13:SetNotification({ "Sovereign Hub", "", "You Cannot Use Default Config Name", 5, 0.5 })
		end

		tbl2:Warnings({
			Title = "Untrusted Config Warning",
			Content = "Imported configs can contain scam settings that may try to make you reveal your username or enable unsafe features. Only import configs from someone you trust and review the values before using them. Continue?",
			Buttons = {
				{
					Text = "Import",
					Callback = function()
						if pcall(function()
							tbl2.SaveManager_Core:ImportSave(inputConfigData, importFileName)
						end) then
							v13:SetNotification({ "Sovereign Hub", "", "Successfully Imported " .. importFileName, 5, 0.5 })

							if v19 then
								v19:Set({})
								v19:Refresh(tbl2.SaveManager_Core:GetSaveVariants(), {})
							end
						else
							v13:SetNotification({ "Sovereign Hub", "", "Failed to Import " .. importFileName, 5, 0.5 })
						end
					end,
					Primary = true,
				},
				{
					Text = "Cancel",
					Callback = function()
					end,
					Primary = false,
				},
			},
		})
	end)

	v18:AddSeperator({ " - [ Set Config ] - " })

	local v20 = v14:Dropdown(v18, "Select File ", "", false, tbl2.SaveManager_Core:GetSaveVariants(), { "" }, true, function(arg3)
		tbl3["Select File "] = arg3
	end)

	v14:Button(v18, "Refresh List", "", function()
		local saveVariants = tbl2.SaveManager_Core:GetSaveVariants()

		if v20 then
			v20:Set({})
			v20:Refresh(saveVariants, {})
		end
	end)

	v14:Button(v18, "Set Config", "", function()
		if tbl3["Select File "] and tbl3["Select File "] ~= "" then
			tbl2.SaveManager_Core:LoadSave(tbl3["Select File "])
			v13:SetNotification({ "Sovereign Hub", "", "Successfully Set " .. tbl3["Select File "] .. " as Current Save", 5, 0.5 })
			task.wait(0.5)
			v13:SetNotification({ "Sovereign Hub", "", "Reloading Scripts...", 8, 0.5 })
			task.wait(0.5)
			tbl2:Close()
			task.wait(0.1)

			task.spawn(function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
			end)
		else
			v13:SetNotification({ "Sovereign Hub", "", "Please Select File First", 5, 0.5 })
		end
	end)
end

local tbl3 = {}

setmetatable(tbl3, {
	__index = function(arg, arg2)
		local value = rawget(tbl2, arg2)
		if type(value) == "function" then
			return function(...)
				return value(...)
			end
		end
		return value
	end,
	__tostring = function()
		local str = ""

		for i = 1, 16 do
			str ..= string.format("%x", math.random(0, 15))
		end

		return "table: 0x" .. str
	end,
	__pairs = function()
		return function()
		end
	end,
	__ipairs = function()
		return function()
		end
	end,
	__metatable = "Denied",
})

return tbl3
        end)()
    end)
    if not okLoad or type(SpeedUI_Lib) ~= "table" then
        local env = getgenv and getgenv()
        local message = okLoad and "library berhenti sendiri (anti-tamper)" or tostring(SpeedUI_Lib)
        if env then
            env.NEXZAN_UI = env.NEXZAN_UI or {{}}
            env.NEXZAN_UI.libError = message
        end
        if warn then pcall(warn, "[Nexzan] UI library tidak aktif: " .. message .. " - pakai panel cadangan") end
        SpeedUI_Lib = nil
    end

    Library = (function(...)
--[[ ==========================================================================
     NEXZAN · Lapisan UI "Speed Hub"  (pengganti library "Airflow" bawaan script)
     ----------------------------------------------------------------------
     Kode fitur TIDAK diubah. Blok ini menyediakan API yang sama seperti library
     lama, tapi digambar oleh library UI Speed Hub (versi Nexzan / WM Nexzan Hub):
        Library:CreateWindow{ Name, LoadingSubtitle, ToggleUIKeybind } -> jendela
        Window:CreateTab{ Name, Desc, Icon }                            -> tab
        Tab:CreateSection / CreateToggle / CreateSlider / CreateDropdown /
            CreateColorPicker / CreateKeybind / CreateInput / CreateButton
        Library:Notify{ Title, Content, Duration }
        elemen: :Set(nilai, silent) / :Get()
     ==========================================================================
     Dipanggil sebagai fungsi dengan argumen = tabel library Speed Hub. ]]
local SpeedUI = ...
local LIB_OK = type(SpeedUI) == "table"

local Library = {}
Library.Flags = {}
Library.Windows = {}

-- ikon tab: nama ikon lucide (dipakai script) -> asset id paket ikon yang sama
local ICONS = {
    ["swords"] = "rbxassetid://130006650864115",
    ["shield"] = "rbxassetid://105619007041452",
    ["eye"] = "rbxassetid://111781708911036",
    ["star"] = "rbxassetid://98157183283283",
    ["settings"] = "rbxassetid://140704441124047",
    ["power"] = "rbxassetid://116822581093037",
    ["rotate-ccw"] = "rbxassetid://110116685948665",
    ["zap"] = "rbxassetid://130006650864115",
    ["target"] = "rbxassetid://71083101429210",
    ["crosshair"] = "rbxassetid://71083101429210",
}

-- pencatat ringan (untuk cek: getgenv().NEXZAN_UI.stats)
local STATS = { tabs = 0, sections = 0, elements = 0, fallback = 0, kinds = {}, perTab = {}, sectionOrder = {} }
local HANDLES = { toggles = {}, sliders = {}, dropdowns = {}, inputs = {}, colorpickers = {}, keybinds = {}, buttons = {} }
Library.Stats = STATS
Library.Handles = HANDLES

local CURTAB = nil
local function bump(kind, isFallback, tabName)
    STATS.elements = STATS.elements + 1
    STATS.kinds[kind] = (STATS.kinds[kind] or 0) + 1
    local name = tabName or CURTAB
    if name then STATS.perTab[name] = (STATS.perTab[name] or 0) + 1 end
    if isFallback then STATS.fallback = STATS.fallback + 1 end
end

local function call(fn, ...)
    if type(fn) ~= "function" then return nil end
    local ok, a, b, c = pcall(fn, ...)
    if ok then return a, b, c end
    return nil
end

-- typeof() versi Roblox: di game mengembalikan "Instance"/"Color3"; kalau di
-- lingkungan uji tidak, dipakai pengecekan cadangan
local function isInst(v)
    if type(v) ~= "table" then return false end
    if typeof(v) == "Instance" then return true end
    if rawget(v, "__ROBLOX_INSTANCE") == true then return true end
    local mt = getmetatable(v)
    if mt and type(mt) == "table" and mt.__typeof == "Instance" then return true end
    return type(rawget(v, "GetChildren")) == "function" or type(rawget(v, "_class")) == "string"
end

local function isColor3(v)
    if typeof(v) == "Color3" then return true end
    if type(v) ~= "table" then return false end
    return (v.R ~= nil and v.G ~= nil and v.B ~= nil) or (v.r ~= nil and v.g ~= nil and v.b ~= nil)
end

local function normalize(opts, map)
    opts = type(opts) == "table" and opts or {}
    local out = {}
    for key, value in pairs(opts) do out[key] = value end
    if type(map) == "table" then
        for source, target in pairs(map) do
            if out[target] == nil and out[source] ~= nil then out[target] = out[source] end
        end
    end
    return out
end

local function toColor(value, fallback)
    if isColor3(value) then
        if value.R ~= nil then
            return Color3.fromRGB(math.floor(value.R * 255 + 0.5), math.floor(value.G * 255 + 0.5), math.floor(value.B * 255 + 0.5))
        end
        return Color3.new(value.r, value.g, value.b)
    end
    return fallback
end

local function toKeyCode(value)
    if typeof(value) == "EnumItem" then return value end
    if typeof(value) == "string" then
        local ok, code = pcall(function() return Enum.KeyCode[value] end)
        if ok then return code end
    end
    return nil
end

local function keyName(code)
    if code == nil then return "-" end
    if type(code) == "string" then return code end
    return tostring(code.Name or code)
end

-- ==========================================================================
-- 1) Tema & font: ngikut tema library supaya warna fitur = warna UI
-- ==========================================================================
local function themeOf()
    if not LIB_OK or type(SpeedUI.Theme) ~= "table" then return {} end
    local name = (type(SpeedUI.Save) == "table" and SpeedUI.Save.Theme) or "Red"
    local t = SpeedUI.Theme[name]
    if type(t) == "table" then return t end
    for _, v in next, SpeedUI.Theme do
        if type(v) == "table" then return v end
    end
    return {}
end
local TH = themeOf()

Library.Theme = {
    Background = TH.Background or Color3.fromRGB(20, 10, 10),
    Surface = TH.Primary or Color3.fromRGB(80, 20, 20),
    Surface2 = TH.Secondary or Color3.fromRGB(120, 30, 30),
    Surface3 = TH.Stroke or Color3.fromRGB(100, 40, 40),
    Stroke = TH.Stroke or Color3.fromRGB(100, 40, 40),
    StrokeHover = TH.ThemeHighlight or Color3.fromRGB(220, 80, 80),
    Accent = TH.ThemeHighlight or Color3.fromRGB(220, 80, 80),
    AccentDark = TH.Accent or Color3.fromRGB(180, 50, 50),
    Text = TH.Text or Color3.fromRGB(240, 230, 230),
    Muted = Color3.fromRGB(150, 130, 130),
    Warning = Color3.fromRGB(240, 176, 108),
    Success = Color3.fromRGB(150, 220, 170),
    Error = Color3.fromRGB(240, 120, 120),
}

Library.Assets = {
    Logo = "rbxassetid://128332470108268",
    Shadow = "rbxassetid://6014261993",
    Glow = "rbxassetid://8992230677",
}

local function makeFace(weight)
    local ok, face = pcall(function()
        return Font.new("rbxasset://fonts/families/GothamSSm.json", weight, Enum.FontStyle.Normal)
    end)
    return (ok and face) or Enum.Font.GothamBold
end
Library.Fonts = {
    Regular = makeFace(Enum.FontWeight.Regular),
    Medium = makeFace(Enum.FontWeight.Medium),
    SemiBold = makeFace(Enum.FontWeight.SemiBold),
    Bold = makeFace(Enum.FontWeight.Bold),
}

local TOUCH = false
pcall(function() TOUCH = game:GetService("UserInputService").TouchEnabled == true end)
Library.Touch = TOUCH
-- Fallback panel removed: main GUI (Speed Hub library) is used exclusively.
local function fb()
    return nil
end
Library.Fallback = fb
-- ==========================================================================
-- 3) Notifikasi
-- ==========================================================================
function Library:Notify(opts)
    opts = type(opts) == "table" and opts or {}
    local title = tostring(opts.Title or opts.Name or "Sovereign Hub")
    local content = tostring(opts.Content or opts.Desc or "")
    local duration = tonumber(opts.Duration) or 5
    if LIB_OK and type(SpeedUI.SetNotification) == "function" then
        local ok = call(function()
            return SpeedUI:SetNotification({ "Sovereign Hub", title, content, duration, 0.35, duration })
        end)
        if ok ~= nil then return ok end
    end
    local panel = fb()
    if panel and panel.notify then panel.notify(title, content) end
end

function Library:LoadFont() end
function Library:SetFont() end
function Library:SetTheme(name)
    if LIB_OK then call(function() return SpeedUI:SetTheme(SpeedUI, name) end) end
end

-- ==========================================================================
-- 4) Util UI: ambil ScreenGui milik library + antrean callback
-- ==========================================================================
local function guiChildren()
    local hui
    pcall(function() hui = gethui and gethui() end)
    if not hui then pcall(function() hui = game:GetService("CoreGui") end) end
    local out = {}
    if hui then
        for _, child in ipairs(hui:GetChildren()) do
            out[#out + 1] = child
        end
    end
    return out, hui
end

local function findNewScreenGui(before)
    local seen = {}
    for _, c in ipairs(before or {}) do seen[c] = true end
    local list = guiChildren()
    for _, c in ipairs(list) do
        if not seen[c] and isInst(c) and c:IsA("ScreenGui") then return c end
    end
    for _, c in ipairs(list) do
        if isInst(c) and c:IsA("ScreenGui") and c:FindFirstChild("DropShadowHolder", true) then
            return c
        end
    end
    return nil
end

-- Antrean nilai: setiap panggilan program ke library ("Set") dicatat, supaya
-- callback bawaan library yang muncul karenanya tidak dianggap "user mengklik".
-- Pencocokan memakai nilai, jadi antrean tetap benar walau urutan callback
-- (task.spawn) datang belakangan.
local function sameValue(a, b)
    if a == b then return true end
    if type(a) == "table" and type(b) == "table" then
        if a[1] ~= nil or b[1] ~= nil then return a[1] == b[1] end
        if a.Name ~= nil or b.Name ~= nil then return a.Name == b.Name end
        return false
    end
    if type(a) == "table" then return a[1] == b or a.Name == b end
    if type(b) == "table" then return b[1] == a or b.Name == a end
    return false
end

local function newQueue()
    local pending = {}
    local expect = function(value) pending[#pending + 1] = value end
    local consume = function(value)
        for i = 1, #pending do
            if sameValue(pending[i], value) then
                table.remove(pending, i)
                return "program"
            end
        end
        return "user"
    end
    return expect, consume
end

-- ==========================================================================
-- 5) Color picker (library Speed Hub belum punya) — H/S/V + hex + popup
-- ==========================================================================
-- tangkap instance Frame pertama yang dibuat selama fn() dijalankan
-- (dipakai untuk menempelkan swatch warna di baris tombol milik library)
local function captureFirstFrame(fn)
    local captured
    local realNew = Instance.new
    local hooked = pcall(function()
        Instance.new = function(class, ...)
            local inst = realNew(class, ...)
            if captured == nil and class == "Frame" then captured = inst end
            return inst
        end
    end)
    local ok, result = pcall(fn)
    if hooked then pcall(function() Instance.new = realNew end) end
    if not ok then return nil, nil end
    return result, captured
end

local function makeColorPopup(parentGui, title, color, onPick)
    local popup = Instance.new("Frame")
    popup.Name = "NexzanColorPicker"
    popup.Size = UDim2.fromOffset(210, 176)
    popup.BackgroundColor3 = Library.Theme.Background
    popup.BorderSizePixel = 0
    popup.Visible = false
    popup.Active = true
    popup.ZIndex = 50
    popup.Parent = parentGui
    local pc = Instance.new("UICorner"); pc.CornerRadius = UDim.new(0, 8); pc.Parent = popup
    local ps = Instance.new("UIStroke"); ps.Color = Library.Theme.Accent; ps.Thickness = 1.2; ps.Parent = popup

    local head = Instance.new("TextLabel")
    head.Text = tostring(title)
    head.Size = UDim2.new(1, -16, 0, 18)
    head.Position = UDim2.fromOffset(8, 6)
    head.BackgroundTransparency = 1
    head.TextColor3 = Library.Theme.Text
    head.TextXAlignment = Enum.TextXAlignment.Left
    head.Font = Enum.Font.GothamBold
    head.TextSize = 12
    head.ZIndex = 51
    head.Parent = popup

    local preview = Instance.new("Frame")
    preview.Size = UDim2.new(1, -16, 0, 20)
    preview.Position = UDim2.fromOffset(8, 26)
    preview.BackgroundColor3 = color
    preview.BorderSizePixel = 0
    preview.ZIndex = 51
    preview.Parent = popup
    local pvc = Instance.new("UICorner"); pvc.CornerRadius = UDim.new(0, 4); pvc.Parent = preview

    local hue, sat, val = Color3.toHSV(color)
    local dragging = false
    local setColor -- forward

    local function makeSlider(y, label, max, getv, setv)
        local holder = Instance.new("Frame")
        holder.Size = UDim2.new(1, -16, 0, 24)
        holder.Position = UDim2.fromOffset(8, y)
        holder.BackgroundTransparency = 1
        holder.ZIndex = 51
        holder.Parent = popup
        local name = Instance.new("TextLabel")
        name.Text = label
        name.Size = UDim2.new(0, 58, 1, 0)
        name.BackgroundTransparency = 1
        name.TextColor3 = Library.Theme.Text
        name.TextXAlignment = Enum.TextXAlignment.Left
        name.Font = Enum.Font.Gotham
        name.TextSize = 11
        name.ZIndex = 51
        name.Parent = holder
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1, -96, 0, 6)
        bar.Position = UDim2.fromOffset(52, 9)
        bar.BackgroundColor3 = Library.Theme.Surface3
        bar.BorderSizePixel = 0
        bar.ZIndex = 51
        bar.Parent = holder
        local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(1, 0); bc.Parent = bar
        local fill = Instance.new("Frame")
        fill.Size = UDim2.fromScale(getv() / max, 1)
        fill.BackgroundColor3 = Library.Theme.Accent
        fill.BorderSizePixel = 0
        fill.ZIndex = 52
        fill.Parent = bar
        local fc = Instance.new("UICorner"); fc.CornerRadius = UDim.new(1, 0); fc.Parent = fill
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Text = tostring(math.floor(getv() + 0.5))
        valueLabel.Size = UDim2.new(0, 34, 1, 0)
        valueLabel.Position = UDim2.new(1, -36, 0, 0)
        valueLabel.BackgroundTransparency = 1
        valueLabel.TextColor3 = Library.Theme.Muted
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right
        valueLabel.Font = Enum.Font.Gotham
        valueLabel.TextSize = 11
        valueLabel.ZIndex = 51
        valueLabel.Parent = holder
        local hit = Instance.new("TextButton")
        hit.Text = ""
        hit.BackgroundTransparency = 1
        hit.Size = UDim2.new(1, -60, 1, 0)
        hit.ZIndex = 53
        hit.Parent = holder

        local function applyFromX(x)
            local abs = bar.AbsolutePosition.X
            local w = math.max(bar.AbsoluteSize.X, 1)
            local frac = math.clamp((x - abs) / w, 0, 1)
            setv(frac * max)
            fill.Size = UDim2.fromScale(frac, 1)
            valueLabel.Text = tostring(math.floor(getv() + 0.5))
            setColor()
        end
        hit.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                applyFromX(input.Position.X)
            end
        end)
        hit.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                applyFromX(input.Position.X)
            end
        end)
        game:GetService("UserInputService").InputEnded:Connect(function()
            dragging = false
        end)
        return function(v)
            local frac = math.clamp(v / max, 0, 1)
            fill.Size = UDim2.fromScale(frac, 1)
            valueLabel.Text = tostring(math.floor(v + 0.5))
        end
    end

    local setHue, setSat, setVal
    setHue = makeSlider(52, "Hue", 360, function() return hue end, function(v) hue = v end)
    setSat = makeSlider(78, "Saturation", 100, function() return sat * 100 end, function(v) sat = v / 100 end)
    setVal = makeSlider(104, "Brightness", 100, function() return val * 100 end, function(v) val = v / 100 end)

    local hex = Instance.new("TextBox")
    hex.Text = "#FFFFFF"
    hex.Size = UDim2.new(0, 90, 0, 22)
    hex.Position = UDim2.fromOffset(8, 144)
    hex.BackgroundColor3 = Library.Theme.Surface2
    hex.TextColor3 = Library.Theme.Text
    hex.Font = Enum.Font.Gotham
    hex.TextSize = 12
    hex.ClearTextOnFocus = false
    hex.ZIndex = 51
    hex.Parent = popup
    local hc = Instance.new("UICorner"); hc.CornerRadius = UDim.new(0, 4); hc.Parent = hex
    local close = Instance.new("TextButton")
    close.Text = "Tutup"
    close.Size = UDim2.new(0, 70, 0, 22)
    close.Position = UDim2.new(1, -78, 0, 144)
    close.BackgroundColor3 = Library.Theme.Surface3
    close.TextColor3 = Library.Theme.Text
    close.Font = Enum.Font.Gotham
    close.TextSize = 12
    close.ZIndex = 51
    close.Parent = popup
    local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0, 4); cc.Parent = close

    local current = color
    local suppress = false
    local function hexOf(c)
        return string.format("#%02X%02X%02X", math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5), math.floor(c.B * 255 + 0.5))
    end
    setColor = function()
        current = Color3.fromHSV(hue, sat, val)
        preview.BackgroundColor3 = current
        hex.Text = hexOf(current)
        if not suppress and type(onPick) == "function" then pcall(onPick, current) end
    end

    hex.FocusLost:Connect(function()
        local text = tostring(hex.Text or ""):gsub("#", "")
        local r = tonumber(text:sub(1, 2), 16)
        local g = tonumber(text:sub(3, 4), 16)
        local b = tonumber(text:sub(5, 6), 16)
        if r and g and b then
            hue, sat, val = Color3.toHSV(Color3.fromRGB(r, g, b))
            setHue(hue); setSat(sat * 100); setVal(val * 100)
            setColor()
        else
            hex.Text = hexOf(current)
        end
    end)
    close.MouseButton1Click:Connect(function() popup.Visible = false end)

    return popup, function(c, isSilent)
        local h, s, v = Color3.toHSV(c)
        hue, sat, val = h, s, v
        setHue(hue); setSat(sat * 100); setVal(val * 100)
        suppress = true
        setColor()
        suppress = false
        current = c
    end, function() return current end
end

local function colorPickerRow(sec, opts, onOpen)
    local rowObj, row = captureFirstFrame(function()
        return sec:AddButton({
            Title = tostring(opts.Name or "Color"),
            Content = opts.Desc and tostring(opts.Desc) or "",
            Callback = function() if type(onOpen) == "function" then pcall(onOpen) end end,
        })
    end)
    local swatch
    if isInst(row) then
        local holder = row:FindFirstChild("FeatureFrame", true)
        if holder then
            local img = holder:FindFirstChild("FeatureImg", true)
            if img then img.Visible = false end
            holder.BackgroundTransparency = 0
            holder.BackgroundColor3 = opts.Default or Library.Theme.Accent
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 5)
            corner.Parent = holder
            swatch = holder
        end
    end
    return { el = rowObj, swatch = swatch, row = row }
end

-- ==========================================================================
-- 6) Tab + konstruktor elemen
-- ==========================================================================
local Tab = {}
Tab.__index = Tab

local function registerFlag(opts, element)
    if opts and opts.Flag then Library.Flags[opts.Flag] = element end
end

local function finish(element, opts, kind, tab)
    element._type = kind
    element._name = tostring((opts and (opts.Name or opts.Title)) or "")
    bump(kind, element._fallback == true, tab and tab.Name)
    local bucket = ({ Toggle = "toggles", Slider = "sliders", Dropdown = "dropdowns",
                      Input = "inputs", ColorPicker = "colorpickers", Keybind = "keybinds",
                      Button = "buttons" })[kind]
    if bucket then table.insert(HANDLES[bucket], element) end
    function element:Destroy()
        if element._destroyed then return end
        element._destroyed = true
        for _, disconnect in ipairs(element._listeners or {}) do pcall(disconnect) end
        element._listeners = {}
        if opts and opts.Flag and Library.Flags[opts.Flag] == element then Library.Flags[opts.Flag] = nil end
    end
    element._listeners = element._listeners or {}
    registerFlag(opts, element)
    return element
end

function Tab:_setSection(name)
    STATS.sections = STATS.sections + 1
    self._sectionCount = (self._sectionCount or 0) + 1
    STATS.sectionOrder[STATS.sections] = (self.Name or "?") .. " > " .. tostring(name)
    self._sectionName = tostring(name or "Section")
    self._section = nil
    if self._tab then
        self._section = call(function() return self._tab:AddSection(self._sectionName) end)
    end
    if not self._section and self._fb then
        self._fb.header("▸ " .. self._sectionName)
        self._section = self._fb
    end
    return self._section
end

function Tab:_useSection()
    if self._section then return self._section end
    return self:_setSection(self._sectionName or "Options")
end

local function isLibSection(sec)
    -- catatan: jangan panggil fb() di sini, nanti panel cadangan dibuat
    -- walaupun tidak dipakai (dulu ini penyebab kotak kosong besar di layar)
    return sec ~= nil and sec ~= FALLBACK_READY
end

function Tab:Section(text)
    local name = type(text) == "table" and (text.Name or text[1]) or text
    self:_setSection(name or "Section")
end
function Tab:Divider() self:_useSection() end
function Tab:Label(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc" })
    return self:Paragraph({ Name = opts.Name, Desc = opts.Desc })
end

function Tab:Paragraph(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", Content = "Desc" })
    if opts.Name == nil and opts[1] ~= nil then opts.Name = opts[1] end
    if opts.Desc == nil and opts[2] ~= nil then opts.Desc = opts[2] end
    local sec = self:_useSection()
    local obj = isLibSection(sec) and call(function()
        return sec:AddParagraph({
            Title = tostring(opts.Name or "Info"),
            Content = opts.Desc and tostring(opts.Desc) or "",
        })
    end)
    if not obj then
        local panel = fb()
        if panel and panel.header then panel.header("▸ " .. tostring(opts.Name or "Info")) end
    end
    return finish({ _obj = obj, _fallback = obj == nil and sec ~= nil }, opts, "Paragraph", self)
end

function Tab:Button(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc" })
    local sec = self:_useSection()
    local cb = opts.Callback
    local obj = isLibSection(sec) and call(function()
        return sec:AddButton({
            Title = tostring(opts.Name or "Button"),
            Content = opts.Desc and tostring(opts.Desc) or "",
            Callback = function() if type(cb) == "function" then pcall(cb) end end,
        })
    end)
    local element = { _obj = obj, _fallback = obj == nil and sec ~= nil }
    function element:Click() if type(cb) == "function" then pcall(cb) end end
    return finish(element, opts, "Button", self)
end

function Tab:Toggle(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", CurrentValue = "Default", Value = "Default" })
    local value = opts.Default == true
    local cb = opts.Callback
    local sec = self:_useSection()
    local expect, consume = newQueue()
    local element = { Value = value }
    local obj
    if isLibSection(sec) then
        expect(value)
        obj = call(function()
            return sec:AddToggle({
                Title = tostring(opts.Name or "Toggle"),
                Content = opts.Desc and tostring(opts.Desc) or "",
                Default = value,
                Callback = function(v)
                    local source = consume(v)
                    if source ~= "user" then return end
                    value = v == true
                    element.Value = value
                    if type(cb) == "function" then pcall(cb, value) end
                end,
            })
        end)
    end
    local setter
    if not obj then
        local panel = fb()
        if panel and panel.toggle then
            setter = panel.toggle(tostring(opts.Name or "Toggle"), value, function(v)
                value = v == true
                element.Value = value
                if type(cb) == "function" then pcall(cb, value) end
            end)
        end
    end
    element._obj = obj
    element._fallback = obj == nil and sec ~= nil
    function element:Set(v, silent)
        v = v == true
        local same = (v == value)
        value = v
        element.Value = v
        if setter then pcall(setter, v) end
        if obj then
            expect(v)
            call(function() return obj:Set(v) end)
        end
        if not silent and not same and type(cb) == "function" then pcall(cb, v) end
    end
    function element:Get() return value end
    function element:Toggle() element:Set(not value) end
    local handle = finish(element, opts, "Toggle", self)
    if value and type(cb) == "function" then pcall(cb, true) end
    return handle
end

function Tab:Slider(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", CurrentValue = "Default", Value = "Default", Increment = "Step" })
    local range = opts.Range
    local min = tonumber(opts.Min) or (type(range) == "table" and tonumber(range[1]) or 0)
    local max = tonumber(opts.Max) or (type(range) == "table" and tonumber(range[2]) or 100)
    local step = tonumber(opts.Step) or 1
    local function snap(v)
        v = tonumber(v) or min
        if step > 0 then v = min + math.floor(((v - min) / step) + 0.5) * step end
        return math.clamp(v, min, max)
    end
    local value = snap(opts.Default or min)
    local cb = opts.Callback
    local sec = self:_useSection()
    local expect, consume = newQueue()
    local element = { Value = value, Min = min, Max = max }
    local obj
    if isLibSection(sec) then
        expect(value)
        obj = call(function()
            return sec:AddSlider({
                Title = tostring(opts.Name or "Slider"),
                Content = opts.Desc and tostring(opts.Desc) or "",
                Increment = step,
                Min = min,
                Max = max,
                Default = value,
                AutoUpdate = false,
                Callback = function(v)
                    local source = consume(v)
                    v = snap(v)
                    if source ~= "user" then return end
                    value = v
                    element.Value = v
                    if type(cb) == "function" then pcall(cb, v) end
                end,
            })
        end)
    end
    local setter
    if not obj then
        local panel = fb()
        if panel and panel.slider then
            setter = panel.slider(tostring(opts.Name or "Slider"), min, max, value, function(v)
                value = snap(v)
                element.Value = value
                if type(cb) == "function" then pcall(cb, value) end
            end)
        end
    end
    element._obj = obj
    element._fallback = obj == nil and sec ~= nil
    function element:Set(v, silent)
        v = snap(v)
        local same = (v == value)
        value = v
        element.Value = v
        if setter then pcall(setter, v) end
        if obj then
            expect(v)
            call(function() return obj:Set(v) end)
        end
        if not silent and not same and type(cb) == "function" then pcall(cb, v) end
    end
    function element:Get() return value end
    return finish(element, opts, "Slider", self)
end

function Tab:Dropdown(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", CurrentOption = "Default",
                             Value = "Default", MultipleOptions = "Multi", Values = "Options" })
    local options = type(opts.Options) == "table" and opts.Options or {}
    local multi = opts.Multi == true
    local value = opts.Default
    if multi then
        if type(value) ~= "table" then value = value ~= nil and { value } or {} end
    else
        if type(value) == "table" then value = value[1] end
        local found = false
        for _, option in ipairs(options) do
            if tostring(option) == tostring(value) then found = true break end
        end
        if not found then value = options[1] end
    end
    local cb = opts.Callback
    local sec = self:_useSection()
    local expect, consume = newQueue()
    local function payload(v)
        if multi then return v end
        if type(v) == "table" then return v[1] end
        return v
    end
    local element = { Value = value }
    local obj
    if isLibSection(sec) then
        expect(multi and value or value)
        obj = call(function()
            return sec:AddDropdown({
                Title = tostring(opts.Name or "Dropdown"),
                Content = opts.Desc and tostring(opts.Desc) or "",
                Multi = multi,
                Options = options,
                Default = multi and value or { value },
                Callback = function(v)
                    local source = consume(v)
                    if source ~= "user" then return end
                    value = payload(v)
                    element.Value = value
                    if source == "user" and type(cb) == "function" then pcall(cb, value) end
                end,
            })
        end)
    end
    local setter
    if not obj then
        local panel = fb()
        if panel and panel.selector then
            setter = panel.selector(tostring(opts.Name or "Dropdown"), options, multi and options[1] or value, function(v)
                value = v
                element.Value = v
                if type(cb) == "function" then pcall(cb, v) end
            end)
        end
    end
    element._obj = obj
    element._fallback = obj == nil and sec ~= nil
    function element:Set(v, silent)
        value = multi and (type(v) == "table" and v or { v }) or payload(v)
        element.Value = value
        if setter then pcall(setter, value) end
        if obj then
            expect(value)
            call(function() return obj:Set(multi and value or { value }) end)
        end
        if not silent and type(cb) == "function" then pcall(cb, value) end
    end
    function element:Get() return value end
    function element:Refresh(newOptions, keepSelection)
        if keepSelection == nil then keepSelection = true end
        options = newOptions or options
        if obj then call(function() return obj:Refresh(options, keepSelection) end) end
    end
    return finish(element, opts, "Dropdown", self)
end

function Tab:Input(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", PlaceholderText = "Placeholder",
                             CurrentValue = "Default", Value = "Default" })
    local value = tostring(opts.Default or "")
    local cb = opts.Callback
    local sec = self:_useSection()
    local expect, consume = newQueue()
    local element = { Value = value }
    local obj
    if isLibSection(sec) then
        expect(value)
        obj = call(function()
            return sec:AddInput({
                Title = tostring(opts.Name or "Input"),
                Content = opts.Desc and tostring(opts.Desc) or "",
                Default = value,
                Callback = function(v)
                    local source = consume(v)
                    if source ~= "user" then return end
                    v = tostring(v or "")
                    value = v
                    element.Value = v
                    if type(cb) == "function" then pcall(cb, v) end
                end,
            })
        end)
    end
    local setter
    if not obj then
        local panel = fb()
        if panel and panel.input then
            setter = panel.input(tostring(opts.Name or "Input"), value, function(v)
                value = tostring(v or "")
                element.Value = value
                if type(cb) == "function" then pcall(cb, value) end
            end)
        end
    end
    element._obj = obj
    element._fallback = obj == nil and sec ~= nil
    function element:Set(v, silent)
        v = tostring(v or "")
        value = v
        element.Value = v
        if setter then pcall(setter, v) end
        if obj then
            expect(v)
            call(function() return obj:Set(v) end)
        end
        if not silent and type(cb) == "function" then pcall(cb, v) end
    end
    function element:Get() return value end
    return finish(element, opts, "Input", self)
end

function Tab:Keybind(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", CurrentKeybind = "Default", Value = "Default" })
    local value = toKeyCode(opts.Default) or Enum.KeyCode.RightShift
    local changeCb = opts.OnChanged
    local pressCb = opts.Callback
    local sec = self:_useSection()
    local expect, consume = newQueue()
    local element = { Value = value, Listening = false }
    local obj
    if isLibSection(sec) then
        expect(value)
        obj = call(function()
            return sec:AddKeybind({
                Title = tostring(opts.Name or "Keybind"),
                Content = opts.Desc and tostring(opts.Desc) or "",
                Default = value,
                Callback = function(code)
                    local source = consume(code)
                    code = toKeyCode(code) or code
                    if source ~= "user" then return end
                    value = code
                    element.Value = code
                    if type(changeCb) == "function" then pcall(changeCb, code) end
                end,
            })
        end)
    end
    local setter
    if not obj then
        local panel = fb()
        if panel and panel.keybind then
            setter = panel.keybind(tostring(opts.Name or "Keybind"), value, function(code)
                if type(pressCb) == "function" then pcall(pressCb, code) end
            end)
        end
    end
    element._obj = obj
    element._fallback = obj == nil and sec ~= nil
    function element:Set(code, silent)
        code = toKeyCode(code) or code
        local same = (code == value)
        value = code
        element.Value = code
        if setter then pcall(setter, code) end
        if obj then
            expect(code)
            call(function() return obj:Set(code) end)
        end
        if not silent and not same and type(changeCb) == "function" then pcall(changeCb, code) end
    end
    function element:Get() return element.Value end
    -- tekan tombol = panggil Callback (perilaku library lama)
    local inputService = game:GetService("UserInputService")
    local connection
    connection = inputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.UserInputType ~= Enum.UserInputType.Keyboard
            and input.UserInputType ~= Enum.UserInputType.Gamepad1 then
            return
        end
        local bound = element.Value
        if bound ~= nil and input.KeyCode == bound then
            if type(pressCb) == "function" then pcall(pressCb, input.KeyCode) end
        end
    end)
    element._listeners = element._listeners or {}
    table.insert(element._listeners, function() connection:Disconnect() end)
    return finish(element, opts, "Keybind", self)
end

function Tab:ColorPicker(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc", Color = "Default",
                             CurrentValue = "Default", Value = "Default" })
    local value = toColor(opts.Default, Library.Theme.Accent)
    local cb = opts.Callback
    local sec = self:_useSection()
    local element = { Value = value }
    local popup, applyExternal
    local swatch

    local function openPopup()
        if not popup then return end
        popup.Visible = not popup.Visible
        if popup.Visible then
            local mouse = game:GetService("UserInputService"):GetMouseLocation()
            popup.Position = UDim2.fromOffset(math.floor(mouse.X) + 8, math.floor(mouse.Y) + 8)
        end
    end

    if self.Gui then
        popup, applyExternal = makeColorPopup(self.Gui, opts.Name or "Color", value, function(color)
            value = color
            element.Value = color
            if swatch then pcall(function() swatch.BackgroundColor3 = color end) end
            if type(cb) == "function" then pcall(cb, color) end
        end)
    end
    if isLibSection(sec) then
        local made = colorPickerRow(sec, { Name = opts.Name, Desc = opts.Desc, Default = value }, openPopup)
        element._obj = made.el
        element._swatch = made.swatch
        swatch = made.swatch
    end
    element._fallback = element._obj == nil and sec ~= nil
    function element:Set(color, silent)
        color = toColor(color, value)
        value = color
        element.Value = color
        if swatch then pcall(function() swatch.BackgroundColor3 = color end) end
        if applyExternal then pcall(applyExternal, color, true) end
        if not silent and type(cb) == "function" then pcall(cb, color) end
    end
    function element:Get() return value end
    function element:Open() openPopup() end
    return finish(element, opts, "ColorPicker", self)
end

function Tab:Stepper(opts) return self:Slider(opts) end
function Tab:Progress(opts) return self:Paragraph(opts) end
function Tab:ConfigManager() return {} end

-- alias Create* (persis seperti library lama)
for name, method in pairs(Tab) do
    if type(method) == "function" and name:sub(1, 1) ~= "_" and name:sub(1, 6) ~= "Create" then
        Tab["Create" .. name] = method
    end
end

-- ==========================================================================
-- 8) Tambahan tab "UI Settings": pilih Tema & Bahasa (asli dari Speed Hub)
--    Ditambahkan dari lapisan UI ini supaya kode fitur tidak perlu disentuh.
-- ==========================================================================
local function sortedKeys(t)
    local out = {}
    if type(t) == "table" then
        for k in next, t do out[#out + 1] = tostring(k) end
    end
    table.sort(out)
    return out
end

local function applyThemeName(name)
    if not LIB_OK or type(SpeedUI.SetTheme) ~= "function" then return end
    call(function() return SpeedUI:SetTheme(name) end)
    local palette = type(SpeedUI.Theme) == "table" and SpeedUI.Theme[name] or nil
    if type(palette) == "table" then
        -- biar elemen custom milik fitur (logo, overlay) ikut warna tema baru
        if palette.ThemeHighlight then Library.Theme.Accent = palette.ThemeHighlight end
        if palette.Accent then Library.Theme.AccentDark = palette.Accent end
        if palette.Background then Library.Theme.Background = palette.Background end
        if palette.Text then Library.Theme.Text = palette.Text end
    end
end

local function applyLanguageName(name)
    if not LIB_OK or type(SpeedUI.SetTranslator) ~= "function" then return end
    call(function() return SpeedUI:SetTranslator(name) end)
end

local function addSpeedHubSettings(tab)
    if type(tab) ~= "table" or tab._speedHubSettings then return end
    local themes = sortedKeys(LIB_OK and SpeedUI.Theme or nil)
    local languages = sortedKeys(LIB_OK and SpeedUI.List_Translator or nil)
    if #themes == 0 and #languages == 0 then
        -- tidak ada yang bisa ditawarkan (library tidak aktif): jangan bikin
        -- section kosong di UI Settings
        STATS.speedSettingsAdded = false
        STATS.speedSettingsError = "library Speed Hub tidak aktif (pakai panel cadangan)"
        return tab
    end
    tab._speedHubSettings = true
    tab:CreateSection("Tema & Bahasa (Speed Hub)")
    if #themes > 0 then
        tab:CreateDropdown({
            Name = "Select Theme",
            Desc = "tema bawaan library Speed Hub",
            Options = themes,
            CurrentOption = (LIB_OK and type(SpeedUI.Save) == "table" and SpeedUI.Save.Theme) or themes[1],
            Flag = "SpeedHubTheme",
            Callback = function(value) applyThemeName(value) end,
        })
    end
    if #languages > 0 then
        tab:CreateDropdown({
            Name = "Select Language",
            Desc = "penerjemah bawaan Speed Hub (pilih bahasa)",
            Options = languages,
            CurrentOption = "English",
            Flag = "SpeedHubLanguage",
            Callback = function(value) applyLanguageName(value) end,
        })
    end
    STATS.speedSettingsAdded = true
    STATS.speedSettingsThemes = #themes
    STATS.speedSettingsLanguages = #languages
    return tab
end

local SETTINGS_TAB_NAME = "UI Settings"
local settingsCandidates = {}

-- tab "UI Settings" ditentukan setelah seluruh UI script selesai dibangun
local function pickSettingsTab()
    for _, tab in ipairs(settingsCandidates) do
        if tab.Name == SETTINGS_TAB_NAME then return tab end
    end
    local fuzzy
    for _, tab in ipairs(settingsCandidates) do
        if tostring(tab.Name):lower():find("setting") then fuzzy = tab end
    end
    return fuzzy
end

local settingsScheduled = false
local function scheduleSpeedHubSettings()
    if settingsScheduled then return end
    settingsScheduled = true
    local function work()
        local tab = pickSettingsTab()
        if not tab then
            STATS.speedSettingsError = "tab Settings tidak ditemukan"
            return
        end
        local env = getgenv and getgenv()
        if env and env.NEXZAN_UI then env.NEXZAN_UI.settingsTab = tab end
        local tries = 0
        while (tab._sectionCount or 0) < 1 and tries < 40 do
            tries = tries + 1
            if task and task.wait then task.wait(0.05) end
        end
        local ok, err = pcall(addSpeedHubSettings, tab)
        if not ok then
            STATS.speedSettingsError = tostring(err)
            if warn then pcall(warn, "[Nexzan] gagal menambah Tema & Bahasa: " .. tostring(err)) end
        end
    end
    -- task.defer = jalan setelah script selesai membangun UI, jadi section baru
    -- berada di paling bawah tab (bukan menyelip di tengah)
    local defer = task and task.defer
    if type(defer) == "function" then
        defer(work)
    elseif task and type(task.spawn) == "function" then
        task.spawn(function() if task.wait then task.wait(0.2) end work() end)
    else
        work()
    end
end

-- ==========================================================================
-- 7) Window
-- ==========================================================================
local Window = {}
Window.__index = Window

local KEYS = {
    Key = "KZgN0t5pK6hBaqVLAMLg27aqXNDb8v",
    Key1 = "c9RkyXAjNpJc9u1fexvw1cbxYTWvMy",
    Key2 = "Xp8712WzbaRn8EtrLnXk8gDdzQB8jF",
    Key3 = "wixUQtibEtmkTQ7WpSFGq4YfBuqJQy",
    Key4 = "KbSf6UWZ6vndbgp8Vh9EHdM0dU8DFf",
    Key5 = "mP3tTRKYwhNKLkpFCdVuj922xqTgJp",
    Key6 = "heMGEmHXFUaiTaStAihwTfwgSJguUwQQxdE",
    Key7 = "khEXYXSHSJpDabFqudKJWEWbEyzXYgLmgTF",
    Key8 = "MLGkWCxxHaqhumMpSmpvJMuiUEpeqUAYvxN",
}

function Library.Window(_, opts)
    opts = type(opts) == "table" and opts or {}
    local title = tostring(opts.Name or opts.Title or "Sovereign Hub")
    local subtitle = opts.LoadingSubtitle
    local fullTitle = title
    if subtitle ~= nil and tostring(subtitle) ~= "" then
        fullTitle = title .. " | " .. tostring(subtitle)
    end

    local self = setmetatable({
        Title = fullTitle,
        Name = title,
        Gui = nil,
        _tabs = {},
        _win = nil,
    }, Window)

    if LIB_OK then
        local before = guiChildren()
        local win = call(function()
            return SpeedUI:CreateWindow({
                Title = fullTitle,
                Description = "",
                ["Tab Width"] = 150,
                SaveSystem = { Enable = false, File = "NexzanHub" },
                Security = { Asset = false, NoVim = false, NoIcon = false },
                Key = KEYS.Key, Key1 = KEYS.Key1, Key2 = KEYS.Key2, Key3 = KEYS.Key3,
                Key4 = KEYS.Key4, Key5 = KEYS.Key5, Key6 = KEYS.Key6, Key7 = KEYS.Key7, Key8 = KEYS.Key8,
            })
        end)
        self._win = win
        self.Gui = findNewScreenGui(before)
        if not self.Gui then
            local panel = fb()
            self.Gui = panel and panel.Gui or nil
        end
        self:SetKeybind(toKeyCode(opts.ToggleUIKeybind) or Enum.KeyCode.RightShift)
    else
        local panel = fb()   -- library tidak aktif: memang butuh panel cadangan
        self.Gui = panel and panel.Gui or nil
    end

    table.insert(Library.Windows, self)
    local env = getgenv()
    if env then
        env.NEXZAN_UI = env.NEXZAN_UI or {}
        env.NEXZAN_UI.lib = Library
        env.NEXZAN_UI.stats = STATS
        env.NEXZAN_UI.handles = HANDLES
        env.NEXZAN_UI.window = self
        env.NEXZAN_UI.ui = SpeedUI
        env.NEXZAN_UI.title = fullTitle
        env.NEXZAN_UI.addSettings = addSpeedHubSettings
    end
    return self
end
Library.CreateWindow = Library.Window

function Window:CreateTab(opts)
    opts = normalize(opts, { Title = "Name", Description = "Desc" })
    local tab = setmetatable({ Name = tostring(opts.Name or "Tab"), Gui = self.Gui, Window = self, _tabs = {} }, Tab)
    STATS.tabs = STATS.tabs + 1
    if LIB_OK and self._win then
        tab._tab = call(function() return self._win:CreateTab({ Name = tab.Name, Icon = ICONS[tostring(opts.Icon or "")] or "" }) end)
    end
    if not tab._tab then
        -- tab cadangan: pakai panel cadangan kalau library tidak jalan
        local panel = fb()
        if panel then
            panel.header("▸ " .. tab.Name)
            tab._fb = panel
        end
    end
    table.insert(self._tabs, tab)
    settingsCandidates[#settingsCandidates + 1] = tab
    scheduleSpeedHubSettings()
    return tab
end
Window.Tab = Window.CreateTab

function Window:SetKeybind(code)
    local keyCode = toKeyCode(code) or code
    if keyCode == nil then return end
    self._uiKey = keyCode
    if LIB_OK then
        call(function()
            SpeedUI.Keybind_UI.Enabled = true
            SpeedUI.Keybind_UI.KeyId = keyCode
        end)
    end
end

function Window:Toggle(open)
    self._open = open ~= false
    if self.Gui then pcall(function() self.Gui.Enabled = self._open end) end
end

function Window:SelectTab() end
function Window:SetKeepOnScreen() end
function Window:_autoSave() end
function Window:SaveConfig() end
function Window:LoadConfig() end
function Window:DeleteConfig() end
function Window:ListConfigs() return {} end

function Window:Destroy()
    if self._destroyed then return end
    self._destroyed = true
    if LIB_OK and type(SpeedUI.Close) == "function" then
        call(function() return SpeedUI:Close() end)
    end
    if self.Gui then pcall(function() self.Gui:Destroy() end) end
    for index, win in ipairs(Library.Windows) do
        if win == self then table.remove(Library.Windows, index) break end
    end
end

function Window:Notify(opts) return Library:Notify(opts) end

return Library
    end)(SpeedUI_Lib)
end


local Airflow = Library
Airflow:LoadFont({ Name = "ValleySans" })

local Window = Airflow:CreateWindow({
    Name = "Sovereign Hub",
    LoadingSubtitle = "Blade Ball",
    ToggleUIKeybind = _G.config.ui_keybind or "RightShift",
})

local MainTab = Window:CreateTab({ Name = "Main", Desc = "Blade Ball", Icon = "swords" })
local DetectionsTab = Window:CreateTab({ Name = "Detections", Icon = "shield" })
local VisualTab = Window:CreateTab({ Name = "Visual", Desc = "esp and overlays", Icon = "eye" })
local noCdState = {}
local function ensureAbilityMod(name)
    local st = noCdState[name]
    if not st then
        st = {}
        noCdState[name] = st
    end
    if st.mod then return true end
    local shared = ReplicatedStorage:FindFirstChild("Shared")
    local abilities = shared and shared:FindFirstChild("Abilities")
    local m = abilities and abilities:FindFirstChild(name)
    if not m then return false end
    local ok, result = pcall(require, m)
    if ok and result then
        st.mod = result
        st.origCd = result.cooldown
        st.origCdr = result.cooldownReductionPerUpgrade
        return true
    end
    return false
end
local function applyNoCooldown(name)
    if not ensureAbilityMod(name) then return end
    local st = noCdState[name]
    pcall(function()
        st.mod.cooldown = 0
        st.mod.cooldownReductionPerUpgrade = 0
    end)
end
local function restoreCooldown(name)
    local st = noCdState[name]
    if not st or not st.mod then return end
    pcall(function()
        st.mod.cooldown = st.origCd
        st.mod.cooldownReductionPerUpgrade = st.origCdr
    end)
end
local function startNoCooldown(name)
    local st = noCdState[name]
    if not st then
        st = {}
        noCdState[name] = st
    end
    if st.conn then return end
    applyNoCooldown(name)
    st.conn = task.spawn(function()
        while st.conn do
            applyNoCooldown(name)
            task.wait(0.5)
        end
    end)
end
local function stopNoCooldown(name)
    local st = noCdState[name]
    if st then st.conn = nil end
    restoreCooldown(name)
end

local ExclusiveTab = Window:CreateTab({ Name = "Exclusive", Icon = "star" })

ExclusiveTab:CreateSection("No Cooldown")

ExclusiveTab:CreateToggle({
    Name = "Thunder Dash 0 Cooldown",
    CurrentValue = _G.config.thunder_dash_nocd or false,
    Flag = "ThunderDashNoCd",
    Callback = function(enabled)
        _G.config.thunder_dash_nocd = enabled
        if enabled then
            startNoCooldown("Thunder Dash")
        else
            stopNoCooldown("Thunder Dash")
        end
    end
})

ExclusiveTab:CreateToggle({
    Name = "Dash 0 Cooldown",
    CurrentValue = _G.config.dash_nocd or false,
    Flag = "DashNoCd",
    Callback = function(enabled)
        _G.config.dash_nocd = enabled
        if enabled then
            startNoCooldown("Dash")
        else
            stopNoCooldown("Dash")
        end
    end
})

ExclusiveTab:CreateToggle({
    Name = "Super Jump 0 Cooldown",
    CurrentValue = _G.config.super_jump_nocd or false,
    Flag = "SuperJumpNoCd",
    Callback = function(enabled)
        _G.config.super_jump_nocd = enabled
        if enabled then
            startNoCooldown("Super Jump")
        else
            stopNoCooldown("Super Jump")
        end
    end
})
local immortalState = { enabled = false, notify = false, heartbeatConnection = nil }
local immortalDesync = { originalCFrame = nil, originalVelocity = nil }
local immortalCache = { character = nil, hrp = nil, head = nil, headOffset = Vector3.new(0, 0, 0), aliveFolder = nil }
local immortalOldIndex = nil
local immortalConsts = {
    emptyCFrame = CFrame.new(),
    radius = math.clamp(tonumber(_G.config.immortal_radius) or 25, 0, 100),
    baseHeight = 5,
    riseHeight = math.clamp(tonumber(_G.config.immortal_height) or 30, 0, 60),
    cycleSpeed = 11.9,
    velocity = Vector3.new(1, 1, 1),
}
local function updateImmortalCache()
    local character = LocalPlayer.Character
    if character ~= immortalCache.character then
        immortalCache.character = character
        if character then
            immortalCache.hrp = character:FindFirstChild("HumanoidRootPart")
            immortalCache.head = character:FindFirstChild("Head")
            immortalCache.aliveFolder = workspace:FindFirstChild("Alive")
            if immortalCache.hrp then
                immortalCache.headOffset = Vector3.new(0, immortalCache.hrp.Size.Y * 0.5 + 0.5, 0)
            end
        else
            immortalCache.hrp = nil
            immortalCache.head = nil
        end
    end
end
local function isImmortalAlive()
    return immortalCache.aliveFolder and immortalCache.character and immortalCache.character.Parent == immortalCache.aliveFolder
end
local function calcOrbitPosition(hrp)
    local angle = math.random(-2147483647, 2147483647) * 1000
    local cycle = math.floor(tick() * immortalConsts.cycleSpeed) % 2
    local yOffset = cycle == 0 and 0 or immortalConsts.riseHeight
    local pos = hrp.Position
    local yBase = pos.Y - hrp.Size.Y * 0.5 + immortalConsts.baseHeight + yOffset
    return CFrame.new(
        pos.X + math.cos(angle) * immortalConsts.radius,
        yBase,
        pos.Z + math.sin(angle) * immortalConsts.radius
    )
end
local function performImmortalDesync()
    updateImmortalCache()
    if not immortalState.enabled or not immortalCache.hrp or not isImmortalAlive() then
        return
    end
    local hrp = immortalCache.hrp
    immortalDesync.originalCFrame = hrp.CFrame
    immortalDesync.originalVelocity = hrp.AssemblyLinearVelocity
    hrp.CFrame = calcOrbitPosition(hrp)
    hrp.AssemblyLinearVelocity = immortalConsts.velocity
    RunService.RenderStepped:Wait()
    hrp.CFrame = immortalDesync.originalCFrame
    hrp.AssemblyLinearVelocity = immortalDesync.originalVelocity
end
local function sendImmortalNotification(text)
    if immortalState.notify then
        Library:Notify({ Title = "Immortality", Content = text, Duration = 2 })
    end
end
local function setImmortality(enabled)
    if immortalState.enabled == enabled then return end
    immortalState.enabled = enabled
    getgenv().Walkablesemiimortal = enabled
    if enabled then
        if not immortalState.heartbeatConnection then
            immortalState.heartbeatConnection = RunService.Heartbeat:Connect(performImmortalDesync)
        end
    else
        if immortalState.heartbeatConnection then
            immortalState.heartbeatConnection:Disconnect()
            immortalState.heartbeatConnection = nil
        end
        immortalDesync.originalCFrame = nil
        immortalDesync.originalVelocity = nil
    end
    sendImmortalNotification(enabled and "ON" or "OFF")
end
LocalPlayer.CharacterRemoving:Connect(function()
    immortalCache.character = nil
    immortalCache.hrp = nil
    immortalCache.head = nil
    immortalCache.aliveFolder = nil
end)
immortalOldIndex = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if not immortalState.enabled or checkcaller() or key ~= "CFrame" or not immortalCache.hrp or not isImmortalAlive() then
        return immortalOldIndex(self, key)
    end
    if self == immortalCache.hrp then
        return immortalDesync.originalCFrame or immortalConsts.emptyCFrame
    elseif self == immortalCache.head and immortalDesync.originalCFrame then
        return immortalDesync.originalCFrame + immortalCache.headOffset
    end
    return immortalOldIndex(self, key)
end))

ExclusiveTab:CreateSection("Immortality")

ExclusiveTab:CreateToggle({
    Name = "Immortality",
    CurrentValue = _G.config.immortality or false,
    Flag = "Immortality",
    Callback = function(enabled)
        _G.config.immortality = enabled
        setImmortality(enabled)
    end
})

ExclusiveTab:CreateToggle({
    Name = "Immortal Notify",
    CurrentValue = _G.config.immortal_notify or false,
    Flag = "ImmortalNotify",
    Callback = function(enabled)
        _G.config.immortal_notify = enabled
        immortalState.notify = enabled
        getgenv().WalkablesemiimortalNotify = enabled
    end
})

ExclusiveTab:CreateSlider({
    Name = "Immortal Radius",
    Range = { 0, 100 },
    Increment = 1,
    CurrentValue = math.clamp(tonumber(_G.config.immortal_radius) or 25, 0, 100),
    Flag = "ImmortalRadius",
    Callback = function(value)
        immortalConsts.radius = value
        _G.config.immortal_radius = math.floor(value)
    end
})

ExclusiveTab:CreateSlider({
    Name = "Immortal Height",
    Range = { 0, 60 },
    Increment = 1,
    CurrentValue = math.clamp(tonumber(_G.config.immortal_height) or 30, 0, 60),
    Flag = "ImmortalHeight",
    Callback = function(value)
        immortalConsts.riseHeight = value
        _G.config.immortal_height = math.floor(value)
    end
})

local fGradients = {}
local function makeFMark(markW, markH, fontSize)
    local holder = Instance.new("Frame")
    holder.Name = "FloxyF"
    holder.BackgroundTransparency = 1
    holder.Size = UDim2.fromOffset(markW, markH)
    local badge = Instance.new("Frame")
    badge.Name = "Badge"
    badge.BorderSizePixel = 0
    badge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    badge.Size = UDim2.fromScale(1, 1)
    badge.Parent = holder
    local badgeCorner = Instance.new("UICorner")
    badgeCorner.CornerRadius = UDim.new(0, 9)
    badgeCorner.Parent = badge
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Library.Theme.AccentDark),
        ColorSequenceKeypoint.new(0.55, Library.Theme.AccentDark:Lerp(Library.Theme.Accent, 0.5)),
        ColorSequenceKeypoint.new(1, Library.Theme.Accent),
    })
    grad.Rotation = 35
    grad.Parent = badge
    table.insert(fGradients, grad)
    local glowMark = Instance.new("TextLabel")
    glowMark.BackgroundTransparency = 1
    glowMark.Size = UDim2.fromScale(1, 1)
    glowMark.FontFace = Library.Fonts.Bold
    glowMark.TextSize = fontSize + 8
    glowMark.Text = "F"
    glowMark.TextColor3 = Library.Theme.Accent
    glowMark.TextTransparency = 0.55
    glowMark.TextXAlignment = Enum.TextXAlignment.Center
    glowMark.TextYAlignment = Enum.TextYAlignment.Center
    glowMark.Parent = holder
    local faceMark = Instance.new("TextLabel")
    faceMark.BackgroundTransparency = 1
    faceMark.Size = UDim2.fromScale(1, 1)
    faceMark.FontFace = Library.Fonts.Bold
    faceMark.TextSize = fontSize
    faceMark.Text = "F"
    faceMark.TextColor3 = Color3.fromRGB(255, 255, 255)
    faceMark.TextXAlignment = Enum.TextXAlignment.Center
    faceMark.TextYAlignment = Enum.TextYAlignment.Center
    faceMark.Parent = holder
    local faceStroke = Instance.new("UIStroke")
    faceStroke.Color = Library.Theme.AccentDark
    faceStroke.Thickness = 1.2
    faceStroke.Parent = faceMark
    return holder
end
local fSpinConn
fSpinConn = RunService.RenderStepped:Connect(function()
    local alive = false
    for i = #fGradients, 1, -1 do
        local g = fGradients[i]
        if g.Parent then
            alive = true
            g.Rotation = (tick() * 40) % 360
        else
            table.remove(fGradients, i)
        end
    end
    if not alive then
        fSpinConn:Disconnect()
    end
end)

local headerLogo
local headerTitle
pcall(function()
    local headerFrame = Window.Gui:FindFirstChild("Header", true)
    if headerFrame then
        for _, child in ipairs(headerFrame:GetChildren()) do
            if child:IsA("ImageLabel") then
                headerLogo = child
            elseif child:IsA("TextLabel") and child.Text == "Floxy" then
                headerTitle = child
            end
        end
    end
end)
if headerLogo then
    headerLogo.Image = "rbxassetid://128332470108268"
    headerLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
    headerLogo.Visible = true
end
if headerTitle then
    headerTitle.Text = "Sovereign Hub"
    headerTitle.FontFace = Library.Fonts.Bold
    local titleConn
    titleConn = RunService.RenderStepped:Connect(function()
        if not headerTitle.Parent then
            titleConn:Disconnect()
            return
        end
        local blend = (math.sin(tick() * 2.2) + 1) / 2
        headerTitle.TextColor3 = Library.Theme.Accent:Lerp(Library.Theme.AccentDark, blend)
    end)
end

local loaderFrame
pcall(function()
    for _, child in ipairs(Window.Gui:GetChildren()) do
        if child:IsA("CanvasGroup") then
            for _, desc in ipairs(child:GetDescendants()) do
                if desc:IsA("TextLabel") and desc.Text == "Floxy" then
                    loaderFrame = child
                    break
                end
            end
        end
        if loaderFrame then break end
    end
end)
if loaderFrame then
    local loaderLogo
    local loaderTitle
    for _, desc in ipairs(loaderFrame:GetDescendants()) do
        if desc:IsA("ImageLabel") and desc.Parent ~= loaderFrame and desc.Parent:IsA("Frame") then
            loaderLogo = desc
        elseif desc:IsA("TextLabel") and desc.Text == "Floxy" then
            loaderTitle = desc
        end
    end
    if loaderLogo then
        loaderLogo.Image = "rbxassetid://128332470108268"
        loaderLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
        loaderLogo.Visible = true
    end
    if loaderTitle then
        loaderTitle.Text = "Sovereign Hub"
        loaderTitle.FontFace = Library.Fonts.Bold
        local loadConn
        loadConn = RunService.RenderStepped:Connect(function()
            if not loaderTitle.Parent then
                loadConn:Disconnect()
                return
            end
            local blend = (math.sin(tick() * 2.2) + 1) / 2
            loaderTitle.TextColor3 = Library.Theme.Accent:Lerp(Library.Theme.AccentDark, blend)
        end)
    end
end


local Connections = {}
local BallHelper = {}
BallHelper.ball = {
    properties = {
        aerodynamic_time = tick(),
        last_warping = tick(),
        lerp_radians = 0,
        curving = tick(),
    }
}

local CurrentAnimTrack
local CurrentTarget

local _PARRY_PATCH = { ready = true }

local function findToken()
    for _, Function in getgc(true) do
        if type(Function) ~= 'function' then continue end
        local okSrc, src = pcall(function()
            return debug.info(Function, 's')
        end)
        if okSrc and src and tostring(src):find('PRY', 1, true) then
            local okUps, ups = pcall(function()
                return debug.getupvalues(Function)
            end)
            if okUps and type(ups) == 'table' then
                for _, value in ups do
                    if type(value) == 'function' then
                        return value
                    end
                end
            end
        end
    end
    return nil
end

local _token = findToken()


task.spawn(function()
    local tries = 0
    while not _token and tries < 40 do
        tries += 1
        task.wait(1)
        if not _token then _token = findToken() end
    end
end)

function _tokenize(_remote_uid)
    local time = tostring(math.floor(workspace:GetServerTimeNow() * 100))
    local key = _token(_remote_uid, 'TIME')
    local characters = table.create(#time)
    for index = 1, #time do
        characters[index] = string.char(bit32.bxor(
            (string.byte(time, index) + index) % 256,
            string.byte(key, (index - 1) % #key + 1)
        ))
    end
    return table.concat(characters)
end

local _reverted = {}
local _original = {}
local _captured = nil

function _is_valid(args)
    return #args == 8 and type(args[2]) == "string" and type(args[3]) == "string"
        and type(args[4]) == "number" and typeof(args[5]) == "CFrame"
        and type(args[6]) == "table" and type(args[7]) == "table"
        and type(args[8]) == "boolean"
end

function _hook(remote)
    if not _reverted[remote] then
        if not _original[getrawmetatable(remote)] then
            _original[getrawmetatable(remote)] = true
            local _meta = getrawmetatable(remote)
            setreadonly(_meta, false)
            local _old = _meta.__index
            _meta.__index = function(self, key)
                if (key == 'FireServer' and self:IsA('RemoteEvent'))
                or (key == 'InvokeServer' and self:IsA('RemoteFunction')) then
                    return function(_, ...)
                        local _arguments = {...}
                        if _is_valid(_arguments) then
                            if not _reverted[self] then
                                _reverted[self] = _arguments
                                _captured = { remote = self, args = _arguments }
                            end
                        end
                        return _old(self, key)(_, unpack(_arguments))
                    end
                end
                return _old(self, key)
            end
            setreadonly(_meta, true)
        end
    end
end

for _iterator, _remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
    if _remote:IsA('RemoteEvent') or _remote:IsA('RemoteFunction') then
        _hook(_remote)
    end
end


local function fireParryInput()
    if mouse1press and mouse1release then
        pcall(function()
            mouse1press()
            task.wait(0.03)
            mouse1release()
        end)
        return true
    end
    if mouse1click then
        pcall(function() mouse1click() end)
        return true
    end
    return false
end

function _PARRY_PATCH.fire(curveCFrame, screenPositions, mouseLocation)

    if not _token or not _reverted or next(_reverted) == nil then
        return fireParryInput()
    end
    if not curveCFrame then
        local cam = workspace.CurrentCamera
        curveCFrame = cam and cam.CFrame
    end
    if not curveCFrame then return false end
    local fired = false
    for _remote, _originalArgs in pairs(_reverted) do
        if type(_originalArgs) == "table" and _originalArgs[1] ~= nil then
            local okFire = pcall(function()
                _remote:FireServer(
                    _originalArgs[1],
                    _originalArgs[2],
                    _tokenize(_originalArgs[2]),
                    0.5,
                    curveCFrame,
                    screenPositions,
                    mouseLocation,
                    false
                )
            end)
            if okFire then fired = true end
        end
    end
    return fired
end

local recentlyPickedTargets = {}

local function pick_random_target()
    local livingPlayers = {}
    for _, char in workspace.Alive:GetChildren() do
        if char.Name ~= LocalPlayer.Name and char.PrimaryPart then
            table.insert(livingPlayers, char)
        end
    end

    if #livingPlayers == 0 then
        CurrentTarget = nil
        return
    end

    if #livingPlayers == 1 then
        CurrentTarget = livingPlayers[1]
        return
    end

    local candidates = {}
    for _, char in livingPlayers do
        if not recentlyPickedTargets[char.Name] then
            table.insert(candidates, char)
        end
    end

    if #candidates == 0 then
        recentlyPickedTargets = {}
        for _, char in livingPlayers do
            if not CurrentTarget or char.Name ~= CurrentTarget.Name then
                table.insert(candidates, char)
            end
        end
        if #candidates == 0 then
            candidates = livingPlayers
        end
    end

    local picked = candidates[math.random(1, #candidates)]
    recentlyPickedTargets[picked.Name] = true
    CurrentTarget = picked
end

workspace.Balls.ChildAdded:Connect(function(ball)
    if _G.config.random_target then
        pick_random_target()
    end
end)

workspace.Balls.ChildAdded:Connect(function(ball)
    task.spawn(function()
        if not ball:GetAttribute("realBall") then
            local zoomies = ball:WaitForChild("zoomies", 3)
            if not zoomies then return end
        end
        ball:GetAttributeChangedSignal("target"):Connect(function()
            if _G.config.random_target then
                pick_random_target()
            end
        end)
    end)
end)

for _, ball in workspace.Balls:GetChildren() do
    task.spawn(function()
        ball:GetAttributeChangedSignal("target"):Connect(function()
            if _G.config.random_target then
                pick_random_target()
            end
        end)
    end)
end

local function linear_predict(a, b, t)
    return a + (b - a) * t
end

function BallHelper.get_ball()
    for _, ball in workspace.Balls:GetChildren() do
        if ball:GetAttribute("realBall") then
            return ball
        end
    end
end

function BallHelper.get_balls()
    local balls = {}
    for _, ball in workspace.Balls:GetChildren() do
        if ball:GetAttribute("realBall") then
            table.insert(balls, ball)
        end
    end
    return balls
end

local function select_target_by_mouse()
    local livingPlayers = {}
    for _, char in workspace.Alive:GetChildren() do
        if char.Name ~= LocalPlayer.Name and char.PrimaryPart then
            table.insert(livingPlayers, char)
        end
    end

    local camera = workspace.CurrentCamera
    local mousePos = UserInputService:GetMouseLocation()
    local ray = camera:ScreenPointToRay(mousePos.X, mousePos.Y)
    local rayDir = ray.Direction

    local bestTarget
    local bestDot = -math.huge
    for _, char in livingPlayers do
        local toChar = (char.PrimaryPart.Position - camera.CFrame.Position).Unit
        local dot = rayDir:Dot(toChar)
        if dot > bestDot then
            bestDot = dot
            bestTarget = char
        end
    end

    CurrentTarget = bestTarget
    return bestTarget
end

function BallHelper.closest_player_by_mouse()
    if _G.config.random_target then
        if not CurrentTarget then
            pick_random_target()
        end
        return CurrentTarget
    end
    return select_target_by_mouse()
end

function BallHelper.getCurveCFrame()
    local camera = workspace.CurrentCamera
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return camera.CFrame end

    local method = _G.config.curve_method
    local target = CurrentTarget
    local targetPos = (target and target.PrimaryPart and target.PrimaryPart.Position)
        or (hrp.Position + camera.CFrame.LookVector * 1000)
    local toTarget = (targetPos - hrp.Position).Unit

    if method == "Dot" then
        return CFrame.lookAt(hrp.Position, targetPos + Vector3.new(0, 1.75, 0))
    elseif method == "Backwards" then
        return CFrame.new(hrp.Position, hrp.Position + (-toTarget) * 1000)
    elseif method == "Slow" then
        return CFrame.new(hrp.Position, hrp.Position + Vector3.new(0, -350, 0))
    elseif method == "Random" then
        return CFrame.new(hrp.Position, targetPos + Vector3.new(
            math.random(-1000, 1000),
            math.random(-350, 1000),
            math.random(-1000, 1000)
        ))
    else
        return camera.CFrame
    end
end

local parryActive = false
local parryCount = 0
function BallHelper.parry()
    if not _G.config.random_target then
        select_target_by_mouse()
    end

    local curveCFrame = BallHelper.getCurveCFrame()

    local mouseLoc
    if _G.config.random_target and CurrentTarget and CurrentTarget.PrimaryPart then
        local viewportPt = workspace.CurrentCamera:WorldToViewportPoint(CurrentTarget.PrimaryPart.Position)
        mouseLoc = { viewportPt.X, viewportPt.Y }
    else
        local mp = UserInputService:GetMouseLocation()
        mouseLoc = { mp.X, mp.Y }
    end

    local screenPositions = {}
    for _, char in workspace.Alive:GetChildren() do
        if char.PrimaryPart then
            local ok, screenPt = pcall(function()
                return workspace.CurrentCamera:WorldToScreenPoint(char.PrimaryPart.Position)
            end)
            if ok then
                screenPositions[char.Name] = screenPt
            end
        end
    end

    if _PARRY_PATCH and _PARRY_PATCH.ready then
        _PARRY_PATCH.fire(curveCFrame, screenPositions, mouseLoc)
    end

    if parryCount > 7 then return false end
    parryCount += 1
    task.delay(0.5, function() if parryCount > 0 then parryCount -= 1 end end)
end

function BallHelper.ball_curved()
    local props = BallHelper.ball.properties
    local ball = BallHelper.get_ball()
    if not ball then return false end

    local zoomies = ball:FindFirstChild("zoomies")
    if not zoomies then return false end

    local velocity = zoomies.VectorVelocity
    local velUnit = velocity.Unit
    local toMe = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Unit
    local dotProduct = toMe:Dot(velUnit)
    local speed = velocity.Magnitude
    local speedFactor = math.min(speed / 100, 40)
    local accelDir = (velUnit - velocity).Unit
    local crossDot = toMe:Dot(accelDir)
    local dotDifference = dotProduct - crossDot
    local distance = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Magnitude
    local pingMs = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    local pingThreshold = 0.5 - (pingMs / 1000)
    local timeToImpact = distance / speed - (pingMs / 1000)
    local minDistance = 15 - math.min(distance / 1000, 15) + speedFactor
    local clampedDot = math.clamp(dotProduct, -1, 1)
    local angleRad = math.rad(math.asin(clampedDot))

    props.lerp_radians = linear_predict(props.lerp_radians, angleRad, 0.8)

    if speed > 100 and timeToImpact > pingMs / 10 then
        minDistance = math.max(minDistance - 15, 15)
    end

    if distance < minDistance then return false end
    if dotDifference < pingThreshold then return true end

    if props.lerp_radians < 0.018 then
        props.last_warping = tick()
    end

    if (tick() - props.last_warping) < (timeToImpact / 1.5) then return true end
    if (tick() - props.curving) < (timeToImpact / 1.5) then return true end

    return dotProduct < pingThreshold
end

function BallHelper.get_ball_properties(_)
    local ball = BallHelper.get_ball()
    if not ball then return end
    if not LocalPlayer.Character or not LocalPlayer.Character.PrimaryPart then return end

    local zeroVel = Vector3.zero
    local toMe = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Unit
    local distance = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Magnitude
    local dot = toMe:Dot(zeroVel.Unit)
    return { Velocity = zeroVel, Direction = toMe, Distance = distance, Dot = dot }
end

function BallHelper.players_properties()
    local target = CurrentTarget
    if not target or not target.PrimaryPart
        or not LocalPlayer.Character or not LocalPlayer.Character.PrimaryPart then
        return false
    end

    local velocity = target.PrimaryPart.Velocity
    local direction = (LocalPlayer.Character.PrimaryPart.Position - target.PrimaryPart.Position).Unit
    local distance = (LocalPlayer.Character.PrimaryPart.Position - target.PrimaryPart.Position).Magnitude
    return { velocity = velocity, direction = direction, distance = distance }
end

local spamAccuracy = 0
function BallHelper.perfom_spam(args)
    local props = BallHelper.ball.properties
    local ball = BallHelper.get_ball()
    local target = CurrentTarget

    if not ball then return false end
    if not target or not target.PrimaryPart then return false end
    if not LocalPlayer.Character or not LocalPlayer.Character.PrimaryPart then return end

    local velocity = ball.AssemblyLinearVelocity
    local speed = velocity.Magnitude
    local toMe = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Unit
    local dot = toMe:Dot(velocity.Unit)
    local targetPos = target.PrimaryPart.Position
    local targetDist = LocalPlayer:DistanceFromCharacter(targetPos)
    local maxDist = args.Ping + math.min(speed / 6, 95)

    if args.Entity_Properties.distance > maxDist then return spamAccuracy end
    if args.Ball_Properties.Distance > maxDist then return spamAccuracy end
    if targetDist > maxDist then return spamAccuracy end

    local maxSpeedClamp = 5 - math.min(speed / 5, 5)
    local maxDot = math.clamp(dot, -1, 0) * maxSpeedClamp
    spamAccuracy = maxDist - maxDot
    return spamAccuracy
end

local PlayerESPLabels = {}

local function qolPlayerNameVisibility()
    local function createBillboardGui(player)
        local character = player.Character
        while (not character) or (not character.Parent) do
            task.wait()
            character = player.Character
        end

        local head = character:WaitForChild("Head")
        local billboard = Instance.new("BillboardGui")
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 10
        label.TextWrapped = false
        label.BackgroundTransparency = 1
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.TextYAlignment = Enum.TextYAlignment.Center
        label.Parent = billboard

        PlayerESPLabels[player] = label

        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end

        local hbConn
        hbConn = RunService.Heartbeat:Connect(function()
            if not (character and character.Parent) then
                hbConn:Disconnect()
                billboard:Destroy()
                PlayerESPLabels[player] = nil
                return
            end

            if _G.config.ability_esp then
                label.Visible = true
                local ability = player:GetAttribute("EquippedAbility")
                if ability then
                    label.Text = player.DisplayName .. " [" .. ability .. "]"
                else
                    label.Text = player.DisplayName
                end
            else
                label.Visible = false
            end
        end)
    end

    for _, player in Players:GetPlayers() do
        if player ~= LocalPlayer then
            player.CharacterAdded:Connect(function()
                createBillboardGui(player)
            end)
            createBillboardGui(player)
        end
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            createBillboardGui(player)
        end)
    end)
end

qolPlayerNameVisibility()

_G.config.curve_method = "Camera"
local function calcSpeedDivisorBase(speed)
    return 2.2 + 0.9 * math.log(1 + speed / 80)
end

local SpeedDivisorMultiplier = 0.7 + (math.clamp(tonumber(_G.config.accuracy) or 100, 1, 100) - 1) * 0.0035353535353535

local Det = {
    Infinity_Active = false,
    DeathSlash_Active = false,
    TimeHole_Active = false,
    Pull_Active = false,
    Slashes_Active = false,
    Slashes_Count = 0,
    Forcefield_Active = false,
    Slashes_ParryDelay = _G.config.det_slashes_delay or 0.05,
    Slashes_MaxCount = _G.config.det_slashes_max or 36,
}
local DetNet = ReplicatedStorage:FindFirstChild("Packages")
DetNet = DetNet and DetNet:FindFirstChild("_Index")
DetNet = DetNet and DetNet:FindFirstChild("sleitnick_net@0.1.0")
DetNet = DetNet and DetNet:FindFirstChild("net")
ReplicatedStorage.Remotes.InfinityBall.OnClientEvent:Connect(function(_, state)
    Det.Infinity_Active = state or false
end)
ReplicatedStorage.Remotes.DeathBall.OnClientEvent:Connect(function(_, state)
    Det.DeathSlash_Active = state or false
end)
pcall(function()
    ReplicatedStorage.Remotes.PlrPulled.OnClientEvent:Connect(function(a, b)
        if type(a) == "boolean" then
            Det.Pull_Active = a
        elseif type(b) == "boolean" then
            Det.Pull_Active = b
        else
            Det.Pull_Active = true
            task.delay(1.5, function() Det.Pull_Active = false end)
        end
    end)
end)
pcall(function()
    ReplicatedStorage.Remotes.PlrPulsed.OnClientEvent:Connect(function(a, b)
        if type(a) == "boolean" then
            Det.Pull_Active = a
        elseif type(b) == "boolean" then
            Det.Pull_Active = b
        else
            Det.Pull_Active = true
            task.delay(1.5, function() Det.Pull_Active = false end)
        end
    end)
end)
pcall(function()
    local function watchForcefield(c)
        c.AttributeChanged:Connect(function(attr)
            if attr == "PassiveLock_ForceField" then
                Det.Forcefield_Active = c:GetAttribute("PassiveLock_ForceField") == true
            end
        end)
    end
    if LocalPlayer.Character then watchForcefield(LocalPlayer.Character) end
    LocalPlayer.CharacterAdded:Connect(function(c)
        Det.Forcefield_Active = false
        watchForcefield(c)
    end)
end)
if DetNet then
    local TimeHoleActivate = DetNet:FindFirstChild("RE/TimeHoleActivate")
    local TimeHoleDeactivate = DetNet:FindFirstChild("RE/TimeHoleDeactivate")
    if TimeHoleActivate then
        TimeHoleActivate.OnClientEvent:Connect(function()
            Det.TimeHole_Active = true
        end)
    end
    if TimeHoleDeactivate then
        TimeHoleDeactivate.OnClientEvent:Connect(function()
            Det.TimeHole_Active = false
        end)
    end
end
if DetNet then
    local SlashesActivate = DetNet:FindFirstChild("RE/SlashesOfFuryActivate")
    local SlashesEnd = DetNet:FindFirstChild("RE/SlashesOfFuryEnd")
    local SlashesCatch = DetNet:FindFirstChild("RE/SlashesOfFuryCatch")
    local SlashesParry = DetNet:FindFirstChild("RE/SlashesOfFuryParry")
    if SlashesActivate then
        SlashesActivate.OnClientEvent:Connect(function()
            Det.Slashes_Active = true
            Det.Slashes_Count = 0
        end)
    end
    if SlashesEnd then
        SlashesEnd.OnClientEvent:Connect(function()
            Det.Slashes_Active = false
            Det.Slashes_Count = 0
        end)
    end
    if SlashesParry then
        SlashesParry.OnClientEvent:Connect(function()
            Det.Slashes_Count += 1
        end)
    end
    if SlashesCatch then
        SlashesCatch.OnClientEvent:Connect(function()
            if not _G.config.det_slashes then return end
            task.spawn(function()
                while Det.Slashes_Active and Det.Slashes_Count < Det.Slashes_MaxCount do
                    BallHelper.parry()
                    task.wait(Det.Slashes_ParryDelay)
                end
            end)
        end)
    end
end

local staffDetected = {}
local staffAction = _G.config.det_staff_action or "Notification"
local staffPlayerConn = nil
local function checkStaff(plr)
    if plr == LocalPlayer or staffDetected[plr.UserId] then return end
    local ok, rank = pcall(function() return plr:GetRankInGroup(12836673) end)
    if not ok or rank < 10 then return end
    staffDetected[plr.UserId] = true
    if staffAction == "Notification" then
        Library:Notify({ Title = "Staff Detected", Content = plr.Name .. " joined the server", Duration = 6 })
    elseif staffAction == "Kick" then
        LocalPlayer:Kick("Staff joined the server.")
    end
end
local function startStaffDetection()
    table.clear(staffDetected)
    for _, plr in pairs(Players:GetPlayers()) do
        task.spawn(checkStaff, plr)
    end
    if not staffPlayerConn then
        staffPlayerConn = Players.PlayerAdded:Connect(function(plr)
            if not _G.config.det_staff then return end
            task.spawn(checkStaff, plr)
        end)
    end
end
local function stopStaffDetection()
    if staffPlayerConn then
        staffPlayerConn:Disconnect()
        staffPlayerConn = nil
    end
    table.clear(staffDetected)
end

local lastParryFix = 0
local fixSwordAPI = nil
local fixAnimCache = {}
local fixLastPlayed = 0
local fixBypassCd = false
task.spawn(function()
    pcall(function()
        local shared = ReplicatedStorage:WaitForChild("Shared", 5)
        if shared then fixSwordAPI = shared:WaitForChild("SwordAPI", 5) end
    end)
end)
local function getFixParryAnimation()
    if not fixSwordAPI then return nil end
    local char = LocalPlayer.Character
    if not char then return nil end
    local currentSword = char:GetAttribute("CurrentlyEquippedSword")
    if not currentSword then return fixSwordAPI.Collection.Default:FindFirstChild("GrabParry") end
    if fixAnimCache[currentSword] then return fixAnimCache[currentSword] end
    local ok, swordData = pcall(function()
        return ReplicatedStorage.Shared.ReplicatedInstances.Swords.GetSword:Invoke(currentSword)
    end)
    if not ok or type(swordData) ~= "table" then
        fixAnimCache[currentSword] = fixSwordAPI.Collection.Default:FindFirstChild("GrabParry")
        return fixAnimCache[currentSword]
    end
    for _, obj in pairs(fixSwordAPI.Collection:GetChildren()) do
        if obj.Name == swordData.AnimationType then
            local anim = obj:FindFirstChild("GrabParry") or obj:FindFirstChild("Grab")
            if anim then fixAnimCache[currentSword] = anim return anim end
        end
    end
    fixAnimCache[currentSword] = fixSwordAPI.Collection.Default:FindFirstChild("GrabParry")
    return fixAnimCache[currentSword]
end
local function playFixParryOnce()
    local char = LocalPlayer.Character
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    if not animator then return end
    local animation = getFixParryAnimation()
    if not animation then return end
    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
        if track.Name == "GrabParry" or track.Name == "Grab" then
            track.TimePosition = 0
            track:Stop(track:GetAttribute("StopFadeTime") or 0.1)
        elseif track.Name == "SuccessParry" or track.Name == "Success" then
            track:Stop(track:GetAttribute("StopFadeTime") or 0.1)
        end
    end
    local grabTrack = animator:LoadAnimation(animation)
    grabTrack:Play(grabTrack:GetAttribute("PlayFadeTime") or 0, grabTrack:GetAttribute("PlayWeight") or 1, grabTrack:GetAttribute("PlaySpeed") or 1)
end
local function playParryFix()
    if (os.clock() - fixLastPlayed) >= 0.1 or fixBypassCd then
        fixLastPlayed = os.clock()
        fixBypassCd = false
        pcall(playFixParryOnce)
    end
end
pcall(function()
    ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
        fixBypassCd = true
        local char = LocalPlayer.Character
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
        if animator then
            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                if track.Name == "GrabParry" or track.Name == "Grab" then
                    track:Stop(track:GetAttribute("StopFadeTime") or 0.1)
                end
            end
        end
    end)
end)

local BallStatsState = {
    gui = nil,
    frame = nil,
    vlog = nil,
    plog = nil,
    connection = nil,
    peak_velocity = 0
}
local function destroy_ball_stats()
    if BallStatsState.connection then
        BallStatsState.connection:Disconnect()
        BallStatsState.connection = nil
    end
    if BallStatsState.gui then
        pcall(function()
            BallStatsState.gui:Destroy()
        end)
    end
    BallStatsState.gui = nil
    BallStatsState.frame = nil
    BallStatsState.vlog = nil
    BallStatsState.plog = nil
    BallStatsState.peak_velocity = 0
end
local function create_ball_stats_gui()
    if BallStatsState.gui then return end
    local OverlayGui = Instance.new("ScreenGui")
    OverlayGui.Name = "FloxyBallMetrics"
    OverlayGui.ResetOnSpawn = false
    OverlayGui.IgnoreGuiInset = true
    OverlayGui.DisplayOrder = 99
    OverlayGui.Parent = LocalPlayer.PlayerGui
    local Panel = Instance.new("Frame")
    Panel.Name = "Panel"
    Panel.Size = UDim2.new(0, 184, 0, 96)
    Panel.Position = UDim2.new(0, 20, 0.5, -48)
    Panel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Panel.BorderSizePixel = 0
    Panel.Active = true
    Panel.Parent = OverlayGui
    local PanelCorner = Instance.new("UICorner")
    PanelCorner.CornerRadius = UDim.new(0, 13)
    PanelCorner.Parent = Panel
    local PanelStroke = Instance.new("UIStroke")
    PanelStroke.Color = Color3.fromRGB(125, 211, 252)
    PanelStroke.Transparency = 0.55
    PanelStroke.Thickness = 1
    PanelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    PanelStroke.Parent = Panel
    local PanelGradient = Instance.new("UIGradient")
    PanelGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 64, 175)),
        ColorSequenceKeypoint.new(0.30, Color3.fromRGB(19, 30, 53)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(13, 17, 24))
    }
    PanelGradient.Rotation = 90
    PanelGradient.Parent = Panel
    local BoltIcon = Instance.new("ImageLabel")
    BoltIcon.Name = "BoltIcon"
    BoltIcon.Size = UDim2.fromOffset(18, 18)
    BoltIcon.Position = UDim2.new(0, 12, 0, 9)
    BoltIcon.BackgroundTransparency = 1
    BoltIcon.BorderSizePixel = 0
    BoltIcon.Image = "rbxassetid://100394875638012"
    BoltIcon.ImageColor3 = Color3.fromRGB(125, 211, 252)
    BoltIcon.ScaleType = Enum.ScaleType.Fit
    BoltIcon.Parent = Panel
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -46, 0, 22)
    TitleLabel.Position = UDim2.new(0, 33, 0, 7)
    TitleLabel.FontFace = Font.new("rbxasset://fonts/families/SFPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    TitleLabel.Text = "Ball Stats"
    TitleLabel.TextColor3 = Color3.fromRGB(125, 211, 252)
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
    TitleLabel.Parent = Panel
    local Divider = Instance.new("Frame")
    Divider.Name = "Divider"
    Divider.Size = UDim2.new(1, -20, 0, 1)
    Divider.Position = UDim2.new(0, 10, 0, 34)
    Divider.BackgroundColor3 = Color3.fromRGB(125, 211, 252)
    Divider.BackgroundTransparency = 0.7
    Divider.BorderSizePixel = 0
    Divider.Parent = Panel
    local VelocityLabel = Instance.new("TextLabel")
    VelocityLabel.BackgroundTransparency = 1
    VelocityLabel.Size = UDim2.new(0, 88, 0, 24)
    VelocityLabel.Position = UDim2.new(0, 14, 0, 42)
    VelocityLabel.FontFace = Font.new("rbxasset://fonts/families/SFPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    VelocityLabel.Text = "Speed"
    VelocityLabel.TextColor3 = Color3.fromRGB(148, 163, 195)
    VelocityLabel.TextSize = 14
    VelocityLabel.TextXAlignment = Enum.TextXAlignment.Left
    VelocityLabel.TextYAlignment = Enum.TextYAlignment.Center
    VelocityLabel.Parent = Panel
    local SpeedVal = Instance.new("TextLabel")
    SpeedVal.Name = "SpeedValue"
    SpeedVal.BackgroundTransparency = 1
    SpeedVal.Size = UDim2.new(0, 64, 0, 24)
    SpeedVal.Position = UDim2.new(1, -78, 0, 42)
    SpeedVal.FontFace = Font.new("rbxasset://fonts/families/SFPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    SpeedVal.Text = "0.0"
    SpeedVal.TextColor3 = Color3.fromRGB(125, 211, 252)
    SpeedVal.TextSize = 16
    SpeedVal.TextXAlignment = Enum.TextXAlignment.Right
    SpeedVal.TextYAlignment = Enum.TextYAlignment.Center
    SpeedVal.Parent = Panel
    local PeakLabel = Instance.new("TextLabel")
    PeakLabel.BackgroundTransparency = 1
    PeakLabel.Size = UDim2.new(0, 88, 0, 24)
    PeakLabel.Position = UDim2.new(0, 14, 0, 67)
    PeakLabel.FontFace = Font.new("rbxasset://fonts/families/SFPro.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    PeakLabel.Text = "Peak"
    PeakLabel.TextColor3 = Color3.fromRGB(148, 163, 195)
    PeakLabel.TextSize = 14
    PeakLabel.TextXAlignment = Enum.TextXAlignment.Left
    PeakLabel.TextYAlignment = Enum.TextYAlignment.Center
    PeakLabel.Parent = Panel
    local PeakVal = Instance.new("TextLabel")
    PeakVal.Name = "PeakValue"
    PeakVal.BackgroundTransparency = 1
    PeakVal.Size = UDim2.new(0, 64, 0, 24)
    PeakVal.Position = UDim2.new(1, -78, 0, 67)
    PeakVal.FontFace = Font.new("rbxasset://fonts/families/SFPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    PeakVal.Text = "0.0"
    PeakVal.TextColor3 = Color3.fromRGB(125, 211, 252)
    PeakVal.TextSize = 16
    PeakVal.TextXAlignment = Enum.TextXAlignment.Right
    PeakVal.TextYAlignment = Enum.TextYAlignment.Center
    PeakVal.Parent = Panel
    Panel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local dragStart = input.Position
            local startPos = Panel.Position
            local moving = true
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    moving = false
                end
            end)
            local dragConnection
            dragConnection = UserInputService.InputChanged:Connect(function(changedInput)
                if not moving then
                    dragConnection:Disconnect()
                    return
                end
                if changedInput.UserInputType == Enum.UserInputType.MouseMovement or changedInput.UserInputType == Enum.UserInputType.Touch then
                    local delta = changedInput.Position - dragStart
                    Panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
        end
    end)
    BallStatsState.gui = OverlayGui
    BallStatsState.frame = Panel
    BallStatsState.vlog = SpeedVal
    BallStatsState.plog = PeakVal
end
local function enable_ball_stats()
    create_ball_stats_gui()
    if BallStatsState.connection then
        BallStatsState.connection:Disconnect()
        BallStatsState.connection = nil
    end
    local elapsed = 0
    BallStatsState.connection = RunService.RenderStepped:Connect(function(dt)
        elapsed += dt
        if elapsed < 0.05 then return end
        elapsed = 0
        if not BallStatsState.frame or not BallStatsState.vlog or not BallStatsState.plog then return end
        local ball = BallHelper.get_ball()
        local speed = 0
        if ball then
            local velocity = ball.AssemblyLinearVelocity or Vector3.new()
            if typeof(velocity) == "Vector3" then
                speed = velocity.Magnitude
            end
        end
        BallStatsState.vlog.Text = string.format("%.1f", speed)
        if speed > BallStatsState.peak_velocity then
            BallStatsState.peak_velocity = speed
            BallStatsState.plog.Text = string.format("%.1f", BallStatsState.peak_velocity)
        end
    end)
end

local cosmeticsCleanup = {}
local cosmeticsCharConn = nil
local function applyKorblox(character)
    local leg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightLeg")
    if not leg then return end
    if leg:FindFirstChild("KorbloxMesh") then return end
    for _, child in ipairs(leg:GetChildren()) do
        if child:IsA("SpecialMesh") then child:Destroy() end
    end
    local mesh = Instance.new("SpecialMesh")
    mesh.Name = "KorbloxMesh"
    mesh.MeshId = "rbxassetid://902942096"
    mesh.TextureId = "rbxassetid://902843398"
    mesh.Offset = Vector3.new(0, 0.7, 0)
    mesh.Parent = leg
end
local function restoreKorblox(character)
    local leg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightLeg")
    if not leg then return end
    for _, child in ipairs(leg:GetChildren()) do
        if child:IsA("SpecialMesh") then child:Destroy() end
    end
end
local function applyHeadless(character)
    local head = character:FindFirstChild("Head")
    if not head then return end
    if cosmeticsCleanup.headTransparency == nil then
        cosmeticsCleanup.headTransparency = head.Transparency
    end
    local face = head:FindFirstChildOfClass("Decal")
    if face then
        cosmeticsCleanup.faceDecalId = face.Texture
        cosmeticsCleanup.faceDecalName = face.Name
    end
    head.Transparency = 1
    for _, child in ipairs(head:GetChildren()) do
        if child:IsA("Decal") or child.Name == "face" then
            child.Transparency = 1
        elseif child:IsA("SpecialMesh") or child:IsA("DataModelMesh") then
            if not child:GetAttribute("OriginalScale") then
                child:SetAttribute("OriginalScale", child.Scale)
                child.Scale = Vector3.new(0, 0, 0)
            end
        end
    end
end
local function restoreHeadless(character)
    local head = character:FindFirstChild("Head")
    if not head then return end
    if cosmeticsCleanup.headTransparency ~= nil then
        head.Transparency = cosmeticsCleanup.headTransparency
    end
    if cosmeticsCleanup.faceDecalId then
        local decal = head:FindFirstChildOfClass("Decal") or Instance.new("Decal", head)
        decal.Name = cosmeticsCleanup.faceDecalName or "face"
        decal.Texture = cosmeticsCleanup.faceDecalId
        decal.Face = Enum.NormalId.Front
    end
    for _, child in ipairs(head:GetChildren()) do
        if child:IsA("Decal") or child.Name == "face" then
            child.Transparency = 0
        elseif child:IsA("SpecialMesh") or child:IsA("DataModelMesh") then
            local orig = child:GetAttribute("OriginalScale")
            if orig then
                child.Scale = orig
                child:SetAttribute("OriginalScale", nil)
            end
        end
    end
end
local function applyCosmetics(character)
    if not character then return end
    applyKorblox(character)
    applyHeadless(character)
end

MainTab:CreateSection("Automatic")

MainTab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = _G.config.auto_parry or false,
    Flag = "AutoParry",
    Callback = function(enabled)
        _G.config.auto_parry = enabled
        if enabled then
            Connections.auto_parry = RunService.PreSimulation:Connect(function()
                if _G.triggerbot then return end
                if not LocalPlayer.Character or not LocalPlayer.Character.PrimaryPart then return end

                local props = BallHelper.ball.properties
                local realBall = BallHelper.get_ball()
                local allBalls = BallHelper.get_balls()

                for _, ball in allBalls do
                    if not ball then return end

                    local zoomies = ball:FindFirstChild("zoomies")
                    if not zoomies then return end

                    ball:GetAttributeChangedSignal("target"):Once(function()
                        parryActive = false
                        if _G.config.random_target then
                            pick_random_target()
                        end
                    end)

                    if parryActive then return end

                    local ballTarget = ball:GetAttribute("target")
                    local realBallTarget = realBall:GetAttribute("target")
                    local velocity = zoomies.VectorVelocity
                    local distance = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Magnitude
                    local pingMs = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 10
                    local pingThreshold = math.clamp(pingMs / 8, 4, 25)
                    local rawSpeed = velocity.Magnitude
                    local speedDivisor = calcSpeedDivisorBase(rawSpeed) * SpeedDivisorMultiplier
                    local speedFactor = 1
                    if rawSpeed > 200 then
                        speedFactor = 1 + math.min((rawSpeed - 200) / 1000, 0.3)
                    end
                    local targetDistance = pingThreshold + math.max(rawSpeed / speedDivisor, 9.5) * speedFactor
                    local isCurving = BallHelper.ball_curved()

                    if ball:FindFirstChild("AeroDynamicSlashVFX") then
                        Debris:AddItem(ball.AeroDynamicSlashVFX, 0)
                        props.aerodynamic_time = tick()
                    end

                    if workspace.Runtime:FindFirstChild("Tornado") then
                        local tornadoTime = workspace.Runtime.Tornado:GetAttribute("TornadoTime") or 1
                        if (tick() - props.aerodynamic_time) < tornadoTime + 0.314159 then
                            return
                        end
                    end

                    if realBallTarget == LocalPlayer.Name and isCurving then return end

                    if _G.config.det_infinity and Det.Infinity_Active then return end
                    if _G.config.det_deathslash and Det.DeathSlash_Active then return end
                    if _G.config.det_timehole and Det.TimeHole_Active then return end
                    if _G.config.det_pull and Det.Pull_Active then return end
                    if _G.config.det_singularity and LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and LocalPlayer.Character.PrimaryPart:FindFirstChild("SingularityCape") then return end
                    if _G.config.det_slashes and Det.Slashes_Active then return end
                    if _G.config.det_forcefield and Det.Forcefield_Active then return end

                    if ballTarget == LocalPlayer.Name and distance <= targetDistance then
                        if _G.config.animfix_parry and tick() - lastParryFix > 0.5 then
                            lastParryFix = tick()
                            playParryFix()
                        end
                        BallHelper.parry(_G.config.curve_method)
                        parryActive = true
                    end

                    local startTime = tick()
                    repeat
                        RunService.PreSimulation:Wait()
                    until (tick() - startTime) >= 1 or not parryActive
                    parryActive = false
                end
            end)
        else
            if Connections.auto_parry then
                Connections.auto_parry:Disconnect()
                Connections.auto_parry = nil
            end
        end
    end
})

DetectionsTab:CreateSection("Detections")

local antiPhantomActive = false

DetectionsTab:CreateToggle({
    Name = "Anti Phantom",
    CurrentValue = _G.config.anti_phantom or false,
    Flag = "AntiPhantom",
    Callback = function(enabled)
        _G.config.anti_phantom = enabled
        if enabled then
            Connections.anti_phantom = workspace.Runtime.ChildAdded:Connect(function(part)
                local character = LocalPlayer.Character
                if not character then return end
                if not (part.Name:lower() == "maxtransmission" or part.Name == "transmissionpart") then return end

                local weld = part:FindFirstChildWhichIsA("WeldConstraint")
                if not weld then return end

                for _, ball in workspace.Balls:GetChildren() do
                    if not ball:FindFirstChild("zoomies") then continue end
                    if antiPhantomActive then continue end

                    antiPhantomActive = true
                    local cancelled = false

                    task.spawn(function()
                        local startTime = tick()
                        while tick() - startTime < 1 and ball.Parent and not cancelled do
                            task.wait()
                            cloneref(game:GetService("TweenService")):Create(
                                character.HumanoidRootPart,
                                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                                { CFrame = ball.CFrame * CFrame.new(0, 0, -3) }
                            ):Play()
                        end
                        antiPhantomActive = false
                    end)

                    ball:GetAttributeChangedSignal("target"):Once(function()
                        cancelled = true
                        antiPhantomActive = false
                    end)
                end
            end)
        else
            if Connections.anti_phantom then
                Connections.anti_phantom:Disconnect()
                Connections.anti_phantom = nil
            end
            antiPhantomActive = false
        end
    end
})


DetectionsTab:CreateToggle({
    Name = "Staff Detection",
    CurrentValue = _G.config.det_staff or false,
    Flag = "DetStaff",
    Callback = function(enabled)
        _G.config.det_staff = enabled
        if enabled then
            startStaffDetection()
        else
            stopStaffDetection()
        end
    end,
})

DetectionsTab:CreateDropdown({
    Name = "Staff Action",
    Options = { "Notification", "Kick" },
    CurrentOption = _G.config.det_staff_action or "Notification",
    Flag = "DetStaffAction",
    Callback = function(value)
        staffAction = value
        _G.config.det_staff_action = value
    end,
})

DetectionsTab:CreateToggle({
    Name = "Infinity Detection",
    CurrentValue = _G.config.det_infinity or false,
    Flag = "DetInfinity",
    Callback = function(enabled)
        _G.config.det_infinity = enabled
    end,
})

DetectionsTab:CreateToggle({
    Name = "DeathSlash Detection",
    CurrentValue = _G.config.det_deathslash or false,
    Flag = "DetDeathSlash",
    Callback = function(enabled)
        _G.config.det_deathslash = enabled
    end,
})

DetectionsTab:CreateToggle({
    Name = "TimeHole Detection",
    CurrentValue = _G.config.det_timehole or false,
    Flag = "DetTimeHole",
    Callback = function(enabled)
        _G.config.det_timehole = enabled
    end,
})

DetectionsTab:CreateToggle({
    Name = "Pull Detection",
    CurrentValue = _G.config.det_pull or false,
    Flag = "DetPull",
    Callback = function(enabled)
        _G.config.det_pull = enabled
    end,
})

DetectionsTab:CreateToggle({
    Name = "Singularity Detection",
    CurrentValue = _G.config.det_singularity or false,
    Flag = "DetSingularity",
    Callback = function(enabled)
        _G.config.det_singularity = enabled
    end,
})

DetectionsTab:CreateToggle({
    Name = "Slashes Detection",
    CurrentValue = _G.config.det_slashes or false,
    Flag = "DetSlashes",
    Callback = function(enabled)
        _G.config.det_slashes = enabled
    end,
})

DetectionsTab:CreateSlider({
    Name = "Slashes Parry Delay",
    Range = { 0.05, 0.25 },
    Increment = 0.01,
    CurrentValue = _G.config.det_slashes_delay or 0.05,
    Flag = "DetSlashesDelay",
    Callback = function(value)
        Det.Slashes_ParryDelay = value
        _G.config.det_slashes_delay = value
    end,
})

DetectionsTab:CreateSlider({
    Name = "Slashes Max Parry",
    Range = { 1, 36 },
    Increment = 1,
    CurrentValue = _G.config.det_slashes_max or 36,
    Flag = "DetSlashesMax",
    Callback = function(value)
        Det.Slashes_MaxCount = value
        _G.config.det_slashes_max = value
    end,
})

DetectionsTab:CreateToggle({
    Name = "Forcefield Detection",
    CurrentValue = _G.config.det_forcefield or false,
    Flag = "DetForcefield",
    Callback = function(enabled)
        _G.config.det_forcefield = enabled
    end,
})

ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(_, parrier)
    if parrier.Parent and parrier.Parent ~= LocalPlayer.Character then
        if parrier.Parent.Parent ~= workspace.Alive then return end
    end

    local ball = BallHelper.get_ball()
    if not ball then return end
    if not CurrentTarget or not CurrentTarget.PrimaryPart then return end

    local distToTarget = (LocalPlayer.Character.PrimaryPart.Position - CurrentTarget.PrimaryPart.Position).Magnitude
    local distToBall = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Magnitude
    local toBall = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Unit
    local dot = toBall:Dot(ball.AssemblyLinearVelocity.Unit)
    local isCurving = BallHelper.ball_curved()

    if distToTarget < 15 and distToBall < 15 and dot > -0.25 then
        if isCurving then
            BallHelper.parry(_G.config.curve_method)
        end
    end

    if not CurrentAnimTrack then return end
    CurrentAnimTrack:Stop()
end)

ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
    if LocalPlayer.Character.Parent ~= workspace.Alive then return end
    if not CurrentAnimTrack then return end
    CurrentAnimTrack:Stop()
end)

workspace.Balls.ChildRemoved:Connect(function(_)
    parryCount = 0
    parryActive = false
    CurrentTarget = nil
    recentlyPickedTargets = {}
    if Connections.target_change then
        Connections.target_change:Disconnect()
        Connections.target_change = nil
    end
end)

ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(_, parrier)
    local myHrp = LocalPlayer.Character.PrimaryPart
    local ball = BallHelper.get_ball()
    if not ball then return end

    local zoomies = ball:FindFirstChild("zoomies")
    if not zoomies then return end

    local speed = zoomies.VectorVelocity.Magnitude
    local distance = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Magnitude
    local velocity = zoomies.VectorVelocity
    local velUnit = velocity.Unit
    local toMe = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Unit
    toMe:Dot(velUnit)

    local pingMs = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    local speedFactor = math.min(speed / 100, 40)
    local timeToImpact = distance / speed - (pingMs / 1000)
    local isFast = speed > 100
    local minDistance = 15 - math.min(distance / 1000, 15) + speedFactor

    if isFast and timeToImpact > pingMs / 10 then
        minDistance = math.max(minDistance - 15, 15)
    end

    if parrier ~= myHrp and distance > minDistance then
        BallHelper.ball.properties.curving = tick()
    end
end)

local savedAcc = math.clamp(tonumber(_G.config.accuracy) or 100, 1, 100)

MainTab:CreateSlider({
    Name = "Parry Accuracy",
    Range = { 1, 100 },
    Increment = 1,
    CurrentValue = savedAcc,
    Flag = "Accuracy",
    Callback = function(value)
        task.spawn(function()
            SpeedDivisorMultiplier = 0.7 + (value - 1) * 0.0035353535353535
            _G.config.accuracy = math.floor(value)
        end)
    end
})

local CurveMethodDropdown = MainTab:CreateDropdown({
    Name = "Curve Method",
    Options = { "Camera", "Dot", "Backwards", "Slow", "Random" },
    CurrentOption = _G.config.curve_method or "Camera",
    Flag = "CurveMethod",
    Callback = function(value)
        task.spawn(function()
            _G.config.curve_method = value
        end)
    end
})

MainTab:CreateToggle({
    Name = "Random Target",
    CurrentValue = _G.config.random_target or false,
    Flag = "RandomTarget",
    Callback = function(enabled)
        task.spawn(function()
            _G.config.random_target = enabled
            CurrentTarget = nil
            recentlyPickedTargets = {}
            if enabled then
                pick_random_target()
            end
        end)
    end
})

MainTab:CreateToggle({
    Name = "Animation Fix",
    CurrentValue = _G.config.animfix_parry or false,
    Flag = "AnimFixParry",
    Callback = function(enabled)
        _G.config.animfix_parry = enabled
    end,
})

local CurveHotkeys = {
    [Enum.KeyCode.One]   = "Camera",
    [Enum.KeyCode.Two]   = "Dot",
    [Enum.KeyCode.Three] = "Backwards",
    [Enum.KeyCode.Four]  = "Slow",
    [Enum.KeyCode.Five]  = "Random",
}

local lastSetCurveMethod
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if not _G.config.curve_keybind then return end

    local newMethod = CurveHotkeys[input.KeyCode]
    if not newMethod then return end

    if _G.config.curve_method == newMethod then
        if _G.config.curve_notify then
            Library:Notify({ Title = "Curve Method", Content = "Already " .. newMethod, Duration = 3 })
        end
        return
    end

    _G.config.curve_method = newMethod
    CurveMethodDropdown:Set(newMethod, true)
    lastSetCurveMethod = newMethod

    if _G.config.curve_notify then
        Library:Notify({ Title = "Curve Method", Content = newMethod, Duration = 3 })
    end
end)



local triggerActive = false
local function Trigger(ball)
    if triggerActive then return end
    triggerActive = true
    BallHelper.parry()

    ball:GetAttributeChangedSignal("target"):Once(function()
        triggerActive = false
    end)

    local startTime = tick()
    task.spawn(function()
        repeat
            RunService.PreSimulation:Wait()
        until (tick() - startTime >= 1 or not triggerActive)
        triggerActive = false
    end)
end

MainTab:CreateSection("Utilities")

local function attachKeybind(toggleEl, keybindEl)
    pcall(function()
        local toggleFrame = toggleEl._frame
        local keyFrame = keybindEl._frame
        if not toggleFrame or not keyFrame then return end
        for _, child in ipairs(keyFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.AnchorPoint = Vector2.new(1, 0.5)
                child.Position = UDim2.new(1, -66, 0.5, 0)
                child.ZIndex = 5
                child.Parent = toggleFrame
            end
        end
        keyFrame.Visible = false
    end)
end

local manualMobileBtn = nil
local triggerMobileBtn = nil

local triggerbotToggle = MainTab:CreateToggle({
    Name = "Triggerbot",
    CurrentValue = false,
    Flag = "Triggerbot",
    Callback = function(enabled)
        _G.triggerbot = enabled
        if enabled then
            if _G.config.triggerbot_notify then
                Library:Notify({ Title = "Triggerbot", Content = "On", Duration = 2 })
            end
            Connections.triggerbot = RunService.PreSimulation:Connect(function()
                local ball = BallHelper.get_ball()
                if not ball then return end
                local target = ball:GetAttribute("target")
                if target == LocalPlayer.Name then
                    Trigger(ball)
                end
            end)
        else
            if _G.config.triggerbot_notify then
                Library:Notify({ Title = "Triggerbot", Content = "Off", Duration = 2 })
            end
            if Connections.triggerbot then
                Connections.triggerbot:Disconnect()
                Connections.triggerbot = nil
            end
        end
    end
})
local triggerbotKey = MainTab:CreateKeybind({
    Name = "Triggerbot Key",
    CurrentKeybind = "T",
    Flag = "TriggerbotKey",
    Callback = function()
        triggerbotToggle:Set(not triggerbotToggle:Get())
    end,
})
attachKeybind(triggerbotToggle, triggerbotKey)

MainTab:CreateToggle({
    Name = "Triggerbot Notify",
    CurrentValue = _G.config.triggerbot_notify or false,
    Flag = "TriggerbotNotify",
    Callback = function(enabled)
        _G.config.triggerbot_notify = enabled
    end
})

MainTab:CreateToggle({
    Name = "Triggerbot UI",
    CurrentValue = _G.config.triggerbot_ui or false,
    Flag = "TriggerbotUI",
    Callback = function(enabled)
        _G.config.triggerbot_ui = enabled
        if triggerMobileBtn then
            triggerMobileBtn.Visible = enabled
        end
    end
})

local statsService = game:GetService("Stats")
local lastAutoParryFire = 0

MainTab:CreateSection("Closest")

MainTab:CreateToggle({
    Name = "Auto Spam",
    CurrentValue = _G.config.auto_spam or false,
    Flag = "AutoSpam",
    Callback = function(enabled)
        _G.config.auto_spam = enabled
        if enabled then
            Connections.auto_spam = RunService.PreSimulation:Connect(function()
                local ball = BallHelper.get_ball()
                if not ball then return end

                local zoomies = ball:FindFirstChild("zoomies")
                if not zoomies then return end

                local target = CurrentTarget
                if not target or not target.PrimaryPart then return end

                local targetPos = target.PrimaryPart.Position
                if not targetPos then return end

                local pingMs = statsService.Network.ServerStatsItem["Data Ping"]:GetValue()
                local fireDelay = pingMs / 1000

                local pingClamped = math.clamp(pingMs / 10, 1, 16)
                local ballTarget = ball:GetAttribute("target")
                local ballProps = BallHelper:get_ball_properties()
                local playerProps = BallHelper:players_properties()
                local maxAccuracy = BallHelper.perfom_spam({
                    Ball_Properties = ballProps,
                    Entity_Properties = playerProps,
                    Ping = pingClamped,
                })

                local targetDist = LocalPlayer:DistanceFromCharacter(targetPos)
                local toBall = (LocalPlayer.Character.PrimaryPart.Position - ball.Position).Unit
                local velUnit = zoomies.VectorVelocity.Unit
                toBall:Dot(velUnit)
                local ballDist = LocalPlayer:DistanceFromCharacter(ball.Position)

                if not ballTarget then return end
                if targetDist > maxAccuracy or ballDist > maxAccuracy then return end

                local pulsed = LocalPlayer.Character:GetAttribute("Pulsed")
                if pulsed then return end

                if ballTarget == LocalPlayer.Name and targetDist > 30 and ballDist > 30 then return end

                local threshold = _G.config.spam_threshold

                if _G.config.det_infinity and Det.Infinity_Active then return end
                if _G.config.det_deathslash and Det.DeathSlash_Active then return end
                if _G.config.det_timehole and Det.TimeHole_Active then return end
                if _G.config.det_pull and Det.Pull_Active then return end
                if _G.config.det_singularity and LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and LocalPlayer.Character.PrimaryPart:FindFirstChild("SingularityCape") then return end
                if _G.config.det_slashes and Det.Slashes_Active then return end
                if _G.config.det_forcefield and Det.Forcefield_Active then return end

                if ballDist <= maxAccuracy and parryCount > threshold then
                    if tick() - lastAutoParryFire >= fireDelay then
                        lastAutoParryFire = tick()
                        if _G.config.animfix_spam then playParryFix() end
                        BallHelper.parry()
                    end
                end
            end)
        else
            if Connections.auto_spam then
                Connections.auto_spam:Disconnect()
                Connections.auto_spam = nil
            end
        end
    end
})

MainTab:CreateSlider({
    Name = "Threshold",
    Range = { 1, 3 },
    Increment = 0.1,
    CurrentValue = _G.config.spam_threshold or 3,
    Flag = "Threshold",
    Callback = function(value)
        task.spawn(function()
            _G.config.spam_threshold = tonumber(value)
        end)
    end
})

MainTab:CreateToggle({
    Name = "Animation Fix",
    CurrentValue = _G.config.animfix_spam or false,
    Flag = "AnimFixSpam",
    Callback = function(enabled)
        _G.config.animfix_spam = enabled
    end,
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        _G.manual_spam = not _G.manual_spam
    end
end)

local manualSpamToggle = MainTab:CreateToggle({
    Name = "Manual Spam",
    CurrentValue = false,
    Flag = "ManualSpam",
    Callback = function(enabled)
        if enabled then
            local lastParryTick = 0

            Connections.manual_spam = RunService.PreSimulation:Connect(function()
                local kps = math.clamp(tonumber(_G.config.manual_spam_kps) or 100, 1, 3000)
                local delay = 1 / kps

                if tick() - lastParryTick >= delay then
                    lastParryTick = tick()
                    if _G.config.animfix_manual then playParryFix() end
                    BallHelper.parry()
                end
            end)

            if _G.config.manual_notify then
                Library:Notify({ Title = "Manual Spam", Content = "On", Duration = 2 })
            end
        else
            if Connections.manual_spam then
                Connections.manual_spam:Disconnect()
                Connections.manual_spam = nil
            end
            if _G.config.manual_notify then
                Library:Notify({ Title = "Manual Spam", Content = "Off", Duration = 2 })
            end
        end
    end
})

MainTab:CreateToggle({
    Name = "Manual Notify",
    CurrentValue = _G.config.manual_notify or false,
    Flag = "ManualNotify",
    Callback = function(enabled)
        _G.config.manual_notify = enabled
    end
})

MainTab:CreateToggle({
    Name = "Manual Spam UI",
    CurrentValue = _G.config.manual_spam_ui or false,
    Flag = "ManualSpamUI",
    Callback = function(enabled)
        _G.config.manual_spam_ui = enabled
        if manualMobileBtn then
            manualMobileBtn.Visible = enabled
        end
    end
})

local manualSpamKeybind = MainTab:CreateKeybind({
    Name = "Manual Spam Key",
    CurrentKeybind = _G.config.manual_spam or "E",
    Flag = "ManualSpamKey",
    Callback = function()
        manualSpamToggle:Set(not manualSpamToggle:Get())
    end,
    OnChanged = function(Key)
        _G.config.manual_spam = Key.Name
    end,
})
attachKeybind(manualSpamToggle, manualSpamKeybind)

MainTab:CreateSlider({
    Name = "Manual Spam KPS",
    Range = { 1, 3000 },
    Increment = 1,
    CurrentValue = _G.config.manual_spam_kps or 100,
    Flag = "ManualSpamKPS",
    Callback = function(value)
        task.spawn(function()
            _G.config.manual_spam_kps = math.floor(tonumber(value) or 100)
        end)
    end
})

MainTab:CreateToggle({
    Name = "Animation Fix",
    CurrentValue = _G.config.animfix_manual or false,
    Flag = "AnimFixManual",
    Callback = function(enabled)
        _G.config.animfix_manual = enabled
    end,
})

local mobileGui = Instance.new("ScreenGui")
mobileGui.Name = "FloxyMobile"
mobileGui.ResetOnSpawn = false
mobileGui.IgnoreGuiInset = true
mobileGui.DisplayOrder = 50
mobileGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local function makeMobileButton(title, yPos, getState, onTap)
    local btn = Instance.new("TextButton")
    btn.Name = title
    btn.Size = UDim2.new(0, 170, 0, 52)
    btn.Position = UDim2.new(1, -190, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(13, 17, 24)
    btn.BackgroundTransparency = 0.15
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Active = true
    btn.Parent = mobileGui
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = btn
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(60, 60, 70)
    stroke.Parent = btn
    local dot = Instance.new("Frame")
    dot.Size = UDim2.fromOffset(10, 10)
    dot.Position = UDim2.new(0, 14, 0.5, -5)
    dot.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    dot.BorderSizePixel = 0
    dot.Parent = btn
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(1, 0)
    dotCorner.Parent = dot
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -78, 1, 0)
    label.Position = UDim2.new(0, 32, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(235, 240, 248)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.Text = title
    label.Parent = btn
    local state = Instance.new("TextLabel")
    state.Size = UDim2.new(0, 40, 0, 22)
    state.Position = UDim2.new(1, -48, 0.5, -11)
    state.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    state.TextColor3 = Color3.fromRGB(255, 255, 255)
    state.Font = Enum.Font.GothamBold
    state.TextSize = 12
    state.Text = "OFF"
    state.Parent = btn
    local stateCorner = Instance.new("UICorner")
    stateCorner.CornerRadius = UDim.new(0, 8)
    stateCorner.Parent = state
    local function refresh()
        local on = getState()
        if on then
            state.Text = "ON"
            state.BackgroundColor3 = Color3.fromRGB(125, 211, 252)
            state.TextColor3 = Color3.fromRGB(13, 17, 24)
            stroke.Color = Color3.fromRGB(125, 211, 252)
            dot.BackgroundColor3 = Color3.fromRGB(125, 211, 252)
        else
            state.Text = "OFF"
            state.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            state.TextColor3 = Color3.fromRGB(255, 255, 255)
            stroke.Color = Color3.fromRGB(60, 60, 70)
            dot.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        end
    end
    local dragging = false
    local dragStart = nil
    local startPos = nil
    local moved = false
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            moved = false
            dragStart = input.Position
            startPos = btn.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and dragStart and startPos and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) + math.abs(delta.Y) > 8 then
                moved = true
            end
            if moved then
                btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if not moved then
                onTap()
                refresh()
            end
            dragging = false
        end
    end)
    refresh()
    return refresh, btn
end

local refreshManualMobile
refreshManualMobile, manualMobileBtn = makeMobileButton("Manual Spam", 120, function()
    return manualSpamToggle:Get()
end, function()
    manualSpamToggle:Set(not manualSpamToggle:Get())
end)
manualMobileBtn.Visible = _G.config.manual_spam_ui or false
local refreshTriggerMobile
refreshTriggerMobile, triggerMobileBtn = makeMobileButton("Triggerbot", 182, function()
    return triggerbotToggle:Get()
end, function()
    triggerbotToggle:Set(not triggerbotToggle:Get())
end)
triggerMobileBtn.Visible = _G.config.triggerbot_ui or false
task.spawn(function()
    while mobileGui.Parent do
        task.wait(0.2)
        pcall(refreshManualMobile)
        pcall(refreshTriggerMobile)
    end
end)

MainTab:CreateSection("Misc")

MainTab:CreateToggle({
    Name = "Hotkey Curve",
    CurrentValue = _G.config.curve_keybind or false,
    Flag = "HotkeyCurve",
    Callback = function(enabled)
        task.spawn(function()
            _G.config.curve_keybind = enabled
        end)
    end
})

MainTab:CreateToggle({
    Name = "Hotkey Notify",
    CurrentValue = _G.config.curve_notify or false,
    Flag = "HotkeyNotify",
    Callback = function(enabled)
        task.spawn(function()
            _G.config.curve_notify = enabled
        end)
    end
})

VisualTab:CreateSection("Visual")

VisualTab:CreateToggle({
    Name = "Ability ESP",
    CurrentValue = _G.config.ability_esp or false,
    Flag = "AbilityESP",
    Callback = function(enabled)
        _G.config.ability_esp = enabled
        for _, label in pairs(PlayerESPLabels) do
            label.Visible = enabled
        end
    end
})

VisualTab:CreateToggle({
    Name = "Ball Stats",
    CurrentValue = _G.config.ball_debug or false,
    Flag = "BallStatistic",
    Callback = function(enabled)
        _G.config.ball_debug = enabled
        if enabled then
            enable_ball_stats()
        else
            destroy_ball_stats()
        end
    end,
})

VisualTab:CreateToggle({
    Name = "Player Cosmetics",
    CurrentValue = _G.config.player_cosmetics or false,
    Flag = "PlayerCosmetics",
    Callback = function(enabled)
        _G.config.player_cosmetics = enabled
        if enabled then
            cosmeticsCleanup = {}
            if LocalPlayer.Character then applyCosmetics(LocalPlayer.Character) end
            if cosmeticsCharConn then cosmeticsCharConn:Disconnect() end
            cosmeticsCharConn = LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.5)
                applyCosmetics(char)
            end)
        else
            if cosmeticsCharConn then
                cosmeticsCharConn:Disconnect()
                cosmeticsCharConn = nil
            end
            if LocalPlayer.Character then
                restoreHeadless(LocalPlayer.Character)
                restoreKorblox(LocalPlayer.Character)
            end
            cosmeticsCleanup = {}
        end
    end,
})

local function applyAnnouncerText()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local announcerGui = pg and pg:FindFirstChild("announcer")
    local winnerLabel = announcerGui and announcerGui:FindFirstChild("Winner")
    if winnerLabel then
        winnerLabel.Text = _G.config.announcer_text or "Sovereign Hub"
    end
end

VisualTab:CreateToggle({
    Name = "Custom Announcer",
    CurrentValue = _G.config.custom_announcer or false,
    Flag = "CustomAnnouncer",
    Callback = function(enabled)
        _G.config.custom_announcer = enabled
        if enabled then
            applyAnnouncerText()
            if not Connections.custom_announcer then
                local pg = LocalPlayer:FindFirstChild("PlayerGui")
                local announcerGui = pg and pg:FindFirstChild("announcer")
                if announcerGui then
                    Connections.custom_announcer = announcerGui.ChildAdded:Connect(function(child)
                        if child.Name == "Winner" then
                            child.Changed:Connect(function(property)
                                if property == "Text" and _G.config.custom_announcer then
                                    child.Text = _G.config.announcer_text or "Sovereign Hub"
                                end
                            end)
                            if _G.config.custom_announcer then
                                child.Text = _G.config.announcer_text or "Sovereign Hub"
                            end
                        end
                    end)
                end
            end
        else
            if Connections.custom_announcer then
                Connections.custom_announcer:Disconnect()
                Connections.custom_announcer = nil
            end
        end
    end,
})

VisualTab:CreateInput({
    Name = "Announcement Text",
    Placeholder = "Enter announcement...",
    CurrentValue = _G.config.announcer_text or "",
    Flag = "AnnouncerText",
    Callback = function(text)
        _G.config.announcer_text = text
        if _G.config.custom_announcer then
            applyAnnouncerText()
        end
    end,
})

local function swapThemeColor(oldColor, newColor)
    if oldColor == newColor then return end
    for _, inst in ipairs(Window.Gui:GetDescendants()) do
        if inst:IsA("GuiObject") then
            if inst.BackgroundColor3 == oldColor then
                inst.BackgroundColor3 = newColor
            end
            if (inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox")) and inst.TextColor3 == oldColor then
                inst.TextColor3 = newColor
            end
            if (inst:IsA("ImageLabel") or inst:IsA("ImageButton")) and inst.ImageColor3 == oldColor then
                inst.ImageColor3 = newColor
            end
        elseif inst:IsA("UIStroke") then
            if inst.Color == oldColor then
                inst.Color = newColor
            end
        end
    end
end
local function refreshFMarks()
    for i = #fGradients, 1, -1 do
        local g = fGradients[i]
        if g.Parent then
            g.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Library.Theme.AccentDark),
                ColorSequenceKeypoint.new(0.55, Library.Theme.AccentDark:Lerp(Library.Theme.Accent, 0.5)),
                ColorSequenceKeypoint.new(1, Library.Theme.Accent),
            })
        else
            table.remove(fGradients, i)
        end
    end
end
local defaultAccent = Library.Theme.Accent
local defaultAccentDark = Library.Theme.AccentDark
local defaultBackground = Library.Theme.Background
local defaultText = Library.Theme.Text
local function applyAccent(color)
    _G.config.theme_accent = { math.floor(color.R * 255 + 0.5), math.floor(color.G * 255 + 0.5), math.floor(color.B * 255 + 0.5) }
    swapThemeColor(Library.Theme.Accent, color)
    Library.Theme.Accent = color
    refreshFMarks()
end
local function applyAccentDark(color)
    _G.config.theme_accent_dark = { math.floor(color.R * 255 + 0.5), math.floor(color.G * 255 + 0.5), math.floor(color.B * 255 + 0.5) }
    swapThemeColor(Library.Theme.AccentDark, color)
    Library.Theme.AccentDark = color
    refreshFMarks()
end
local function applyBackground(color)
    _G.config.theme_background = { math.floor(color.R * 255 + 0.5), math.floor(color.G * 255 + 0.5), math.floor(color.B * 255 + 0.5) }
    swapThemeColor(Library.Theme.Background, color)
    Library.Theme.Background = color
end
local function applyText(color)
    _G.config.theme_text = { math.floor(color.R * 255 + 0.5), math.floor(color.G * 255 + 0.5), math.floor(color.B * 255 + 0.5) }
    swapThemeColor(Library.Theme.Text, color)
    Library.Theme.Text = color
end
local function themeColor(saved, fallback)
    if type(saved) == "table" and saved[1] and saved[2] and saved[3] then
        local ok, color = pcall(function()
            return Color3.fromRGB(saved[1], saved[2], saved[3])
        end)
        if ok and typeof(color) == "Color3" then return color end
    end
    return fallback
end

local SettingsTab = Window:CreateTab({ Name = "UI Settings", Desc = "menu and keybinds", Icon = "settings" })

SettingsTab:CreateKeybind({
    Name = "Toggle UI",
    CurrentKeybind = _G.config.ui_keybind or "RightShift",
    OnChanged = function(Key)
        _G.config.ui_keybind = Key.Name
        Window:SetKeybind(Key)
    end,
})

SettingsTab:CreateSection("Theme")

local accentPicker = SettingsTab:CreateColorPicker({
    Name = "Accent Color",
    Color = themeColor(_G.config.theme_accent, Library.Theme.Accent),
    Flag = "ThemeAccent",
    Callback = function(color)
        applyAccent(color)
    end,
})
local accentDarkPicker = SettingsTab:CreateColorPicker({
    Name = "Accent Dark Color",
    Color = themeColor(_G.config.theme_accent_dark, Library.Theme.AccentDark),
    Flag = "ThemeAccentDark",
    Callback = function(color)
        applyAccentDark(color)
    end,
})
local backgroundPicker = SettingsTab:CreateColorPicker({
    Name = "Background Color",
    Color = themeColor(_G.config.theme_background, Library.Theme.Background),
    Flag = "ThemeBackground",
    Callback = function(color)
        applyBackground(color)
    end,
})
local textPicker = SettingsTab:CreateColorPicker({
    Name = "Text Color",
    Color = themeColor(_G.config.theme_text, Library.Theme.Text),
    Flag = "ThemeText",
    Callback = function(color)
        applyText(color)
    end,
})
SettingsTab:CreateButton({
    Name = "Reset Colors",
    Icon = "rotate-ccw",
    Callback = function()
        applyAccent(defaultAccent)
        applyAccentDark(defaultAccentDark)
        applyBackground(defaultBackground)
        applyText(defaultText)
        pcall(function() accentPicker:Set(defaultAccent, true) end)
        pcall(function() accentDarkPicker:Set(defaultAccentDark, true) end)
        pcall(function() backgroundPicker:Set(defaultBackground, true) end)
        pcall(function() textPicker:Set(defaultText, true) end)
    end,
})

SettingsTab:CreateButton({
    Name = "Unload",
    Icon = "power",
    Callback = function()
        Window:Destroy()
    end,
})

applyAccent(Color3.fromRGB(230, 25, 45))
applyAccentDark(Color3.fromRGB(110, 0, 15))
applyBackground(Color3.fromRGB(8, 8, 8))
applyText(themeColor(_G.config.theme_text, Library.Theme.Text))