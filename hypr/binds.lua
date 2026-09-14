local mainMod = "SUPER"
local alt = "ALT"

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "walker"
local EWW_SCRIPTS = "~/.config/eww/scripts"

-- Basic
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Y", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + U", hl.dsp.group.toggle())
hl.bind(mainMod .. " + V", hl.dsp.group.next())
hl.bind(mainMod .. " + ALT + I", hl.dsp.exec_cmd("~/dotfiles/scripts/background.sh"))
-- hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("XDG_CURRENT_DESKTOP=sway QT_SCALE_FACTOR=0.625 flameshot gui"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Move focus (arrow keys)
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move focus (hjkl — matches original mapping)
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move window (SHIFT + hjkl)
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- Device controls
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +10%"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl -- set-sink-mute 0 toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl -- set-source-mute 0 toggle"))

-- Switch workspaces (number keys)
-- Move window to workspace (SHIFT + number keys)
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move window to workspace (letter shortcuts)
hl.bind(mainMod .. " + SHIFT + q", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + w", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + e", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + r", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + t", hl.dsp.window.move({ workspace = 5 }))

-- Special workspaces (scratchpads)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + G", hl.dsp.workspace.toggle_special("graph"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.window.move({ workspace = "special:graph" }))
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("toolbox"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:toolbox" }))
hl.bind(mainMod .. " + F", hl.dsp.workspace.toggle_special("downside"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.move({ workspace = "special:downside" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + " .. alt .. " + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. alt .. " + h", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag / resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Launchers
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + f9", hl.dsp.exec_cmd("cliphist list | walker -d | cliphist decode | wl-copy"))

-- EWW (overrides SUPER+U togglegroup above — same as original)
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(EWW_SCRIPTS .. "/toggle_control_center.sh"))
