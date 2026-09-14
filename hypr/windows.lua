-- Border colors
hl.window_rule({
	match = { class = "nemo" },
	border_color = { colors = { "rgba(E6C384ff)", "rgba(DCA561ff)" }, angle = 45 },
})
hl.window_rule({
	match = { class = "firefox" },
	border_color = { colors = { "rgba(E6C384ff)", "rgba(DCA561ff)" }, angle = 45 },
})
hl.window_rule({
	match = { class = "obsidian" },
	border_color = { colors = { "rgba(791F8AFF)", "rgba(a745bbff)" }, angle = 45 },
})

-- Float + no decoration
hl.window_rule({
	match = { class = "^(org.gnome.Nautilus)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(org.gnome.Loupe)$" },
	float = true,
	rounding = 0,
	border_size = 0,
})
hl.window_rule({
	match = { class = "^(xdg-desktop-portal-gtk)$" },
	float = true,
	rounding = 0,
	border_size = 0,
})
hl.window_rule({
	match = { class = "^(org.kde.kate)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Extension).+" },
	float = true,
})

-- Chrome
hl.window_rule({
	match = { class = "Google-chrome" },
	border_size = 0,
})
hl.window_rule({
	match = { class = "Google-chrome" },
	opacity = "0.90 0.90",
})

-- Flameshot: force to monitor 1
hl.window_rule({
	match = { class = "^(flameshot)$" },
	monitor = 1,
})

-- JetBrains tooltip flicker fix (https://github.com/hyprwm/Hyprland/issues/2245)
hl.window_rule({
	match = { class = "^(jetbrains-.*)$", title = "^(win[0-9]+)$" },
	float = true,
	no_focus = true,
})

-- Workspace rules
hl.workspace_rule({
	workspace = "special:toolbox",
	no_rounding = true,
	decorate = false,
	no_border = true,
})
