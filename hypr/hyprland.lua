require("autostart")
require("env")
require("windows")
require("binds")

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "eDP-1", mode = "highres@30", position = "auto-up", scale = "1.6" })
hl.monitor({ output = "HDMI-A-1", mode = "3440x1440@99.99Hz", position = "auto-right", scale = "auto" })
hl.monitor({ output = "DP-3", mode = "preferred", position = "auto-up", scale = "auto" })
hl.monitor({ output = "DP-8", mode = "preferred", position = "auto-up", scale = "1.0" })
hl.monitor({ output = "DP-7", mode = "preferred", position = "auto-up", scale = "1.0" })
-- hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto-up", scale = "1.0" })

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		layout = "dwindle",
		allow_tearing = false,
	},

	decoration = {
		rounding = 30,
		blur = {
			enabled = true,
			size = 2,
			passes = 5,
			new_optimizations = true,
			xray = true,
			ignore_opacity = true,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		force_default_wallpaper = -1,
	},

	input = {
		kb_layout = "us, myru",
		kb_variant = ", basic",
		kb_model = "",
		kb_options = "grp:caps_toggle",
		kb_rules = "",
		follow_mouse = 1,
		mouse_refocus = false,
		float_switch_override_focus = 0,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
})

-----------------
---- CURVES -----
-----------------

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "default", style = "fade" })

------------------
---- GESTURES ----
------------------

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

------------------
---- DEVICES -----
------------------

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
