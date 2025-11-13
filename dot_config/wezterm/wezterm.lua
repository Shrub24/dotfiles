local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font({
	family = "Maple Mono NF",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=1", "liga=1" },
})
wezterm.add_to_config_reload_watch_list(wezterm.config_dir .. "/colors/dank-theme.toml")

config.color_scheme = "dank-theme"
config.font_size = 15.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.max_fps = 142

return config
