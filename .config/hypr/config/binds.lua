local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

-- AZERTY fix: the number-row keys emit symbols (& é " ' ...) without Shift, so
-- binding to the digit characters fails. Bind by physical keycode instead.
-- Digit d -> evdev keycode: 1..9 => 10..18, 0 => 19
local function digitCode(d)
	return "code:" .. (d == 0 and 19 or (9 + d))
end

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

-- Window manipulation
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))

-- Change focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(noctCall .. "window-switcher"))

-- Move active window around workspaces & monitors
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
for i = 1, NUM_WPM do
	local key = i % 10
	hl.bind(mainMod .. " + SHIFT + " .. digitCode(key), hl.dsp.window.move({ workspace = "m~" .. i }))
end

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

------------------
---- LAUNCHER ----
------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchPrefix .. TERMINAL))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(launchPrefix .. EDITOR))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind("XF86Calculator", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(launchPrefix .. BROWSER))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(noctCall .. "settings-toggle"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"))

---------------------------
---- HARDWARE CONTROLS ----
---------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true })

-------------------
---- UTILITIES ----
-------------------

-- Screen Capture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a -n"))
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "screenshot-region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"))

-- Theming and Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"))

-- Notifications
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center notifications"))

-------------------------------
---- WORKSPACES & MONITORS ----
-------------------------------

-- Focus on workspace number
-- Absolute
for i = 1, NUM_WPM do
	local key = i % 10
	hl.bind(mainMod .. " + " .. digitCode(key), hl.dsp.focus({ workspace = i }))
end
