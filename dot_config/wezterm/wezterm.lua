local wezterm = require("wezterm")

local act = wezterm.action

local config = wezterm.config_builder()

config.font = wezterm.font({
	family = "Maple Mono NF",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})

local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
-- need to setup

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.apply_to_config(config)

local wezterm_replay = wezterm.plugin.require("https://github.com/btrachey/wezterm-replay")
wezterm_replay.apply_to_config(config)

local theme_path = wezterm.config_dir .. "/colors/dank-theme.toml"
wezterm.add_to_config_reload_watch_list(theme_path)
config.colors, _ = wezterm.color.load_scheme(theme_path)

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = config.colors,
		-- theme_overrides = {
		-- 	tab = {
		-- 		-- inactive = {
		-- 		-- 	bg = config.colors.foreground,
		-- 		-- },
		-- 		active = {
		-- 			bg = config.colors.ansi[1],
		-- 			fg = config.colors.ansi[2],
		-- 		},
		-- 	},
		-- },
		section_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
		component_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thin,
			right = wezterm.nerdfonts.ple_left_half_circle_thin,
		},
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = { { padding = { left = 1, right = 0 }, "workspace" } },
		tabline_c = { "     " },
		tab_active = {
			{ "index", zero_indexed = false },
			{ "process", padding = { left = 0, right = 0 } },
			"/",
			{ "cwd", padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
			max_length = 15,
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } }, max_length = 8 },
		tabline_x = { "datetime" },
		tabline_y = { "battery" },
		tabline_z = { "hostname" },
	},
	extensions = { "resurrect", "smart_workspace_switcher" },
})

tabline.apply_to_config(config)
config.window_padding.left = "0.25cell"
local z_theme = {
	bg = config.colors.brights[3],
	fg = config.colors.ansi[1],
}
local x_theme = {
	bg = config.colors.ansi[4],
	fg = config.colors.ansi[1],
}

tabline.set_theme({
	normal_mode = {
		y = x_theme,
		b = x_theme,
	},

	tab = {
		inactive = {
			bg = config.colors.ansi[1],
			fg = config.colors.brights[3],
		},
		active = {
			bg = config.colors.brights[2],
			fg = config.colors.ansi[1],
		},
	},
})
tabline.refresh()

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

smart_splits.apply_to_config(config)
config.adjust_window_size_when_changing_font_size = false
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.enable_kitty_keyboard = true
-- table.insert(config.hyperlink_rules, {
-- 	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
-- 	format = "https://www.github.com/$1/$3",
-- })
--
table.insert(config.keys, {
	key = "Delete",
	mods = "NONE",
	action = act.SendString("\x1b[3~"),
})

config.line_height = 1.0
config.color_scheme = "dank-theme"
config.font_size = 15.0
config.initial_cols = 120
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.freetype_load_target = "HorizontalLcd" -- Makes fonts look bolder/sharper on high DPI
config.freetype_render_target = "HorizontalLcd"

return config
