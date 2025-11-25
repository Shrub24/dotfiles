return {
	{
		"RedsXDD/neopywal.nvim",
		name = "neopywal",
		lazy = false,
		priority = 1000,
		version = "*",
		opts = {
			terminal_colors = true,
			transparent_background = true,
			plugins = {
				dropbar = { enabled = true },
				grug_far = true,
				harpoon = true,
				surround = true,
				octo = true,
				overseer = true,
				-- snacks = { enabled = true },
				-- illuminate = { enabled = true },
				yanky = true,
			},
		},
		config = function()
			local neopywal = require("neopywal")
			-- neopywal.setup()
			local function hex_to_rgb(hex)
				hex = hex:gsub("#", "")
				return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
			end

			local function blend(fg, bg, alpha)
				local r_f, g_f, b_f = hex_to_rgb(fg)
				local r_b, g_b, b_b = hex_to_rgb(bg)

				local r = math.floor(r_f * alpha + r_b * (1 - alpha))
				local g = math.floor(g_f * alpha + g_b * (1 - alpha))
				local b = math.floor(b_f * alpha + b_b * (1 - alpha))

				return string.format("#%02x%02x%02x", r, g, b)
			end

			local function set_dynamic_groups()
				local c = neopywal.get_colors()

				local rainbow = {
					Red = c.color1,
					Green = c.color2,
					Yellow = c.color3,
					Blue = c.color4,
					Violet = c.color5,
					Cyan = c.color6,
					Orange = blend(c.color3, c.color1, 0.43),
				}

				for key, color in pairs(rainbow) do
					vim.api.nvim_set_hl(0, "Rainbow" .. key, { fg = color })

					vim.api.nvim_set_hl(0, "RainbowBg" .. key, { bg = color, fg = c.background, bold = true })
				end

				local mode_map = {
					Normal = rainbow.Blue,
					Insert = rainbow.Orange,
					Visual = c.color7,
					Command = c.color8,
					Replace = rainbow.Cyan,
					Terminal = rainbow.Green,
				}
				for mode, color in pairs(mode_map) do
					vim.api.nvim_set_hl(0, mode .. "Mode", { fg = color })

					vim.api.nvim_set_hl(0, mode .. "ModeBg", { bg = color, fg = c.background, bold = true })

					vim.api.nvim_set_hl(0, mode .. "ModeCursor", {
						bg = blend(color, c.background, 0.6),
						fg = c.background,
					})

					vim.api.nvim_set_hl(0, mode .. "ModeLine", {
						bg = blend(color, c.background, 0.1),
					})
				end

				vim.api.nvim_set_hl(0, "StatusLineBg", {
					bg = c.background,
					fg = c.foreground,
				})

				vim.api.nvim_set_hl(0, "SidekickDiffAdd", {
					bg = blend(c.color10, c.background, 0.4),
				})

				vim.api.nvim_set_hl(0, "SidekickDiffDelete", {
					bg = blend(c.color9, c.background, 0.4),
				})

				vim.api.nvim_set_hl(0, "SidekickDiffContext", {
					bg = blend(c.color7, c.background, 0.3),
				})
			end

			-- Run immediately & on update
			set_dynamic_groups()
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("NeopywalCustom", { clear = true }),
				pattern = "neopywal",
				callback = set_dynamic_groups,
			})
		end,
	},
	{
		"rasulomaroff/reactive.nvim",
		event = "VeryLazy",
		opts = {
			configs = {
				neopywal = true,
			},
		},
		config = function()
			local reactive = require("reactive")
			local mode_map = {
				n = "Normal",
				i = "Insert",
				v = "Visual",
				V = "Visual",
				R = "Replace",
				c = "Command",
				t = "Terminal",
			}
			mode_map["\x16"] = "Visual"
			local preset_modes = {}
			for mode, prefix in pairs(mode_map) do
				preset_modes[mode] = {
					winhl = {
						Cursor = { link = prefix .. "ModeCursor" },
						CursorLineNr = { link = prefix .. "Mode" },
						CursorLine = { link = prefix .. "ModeLine" },
					},
				}
				if prefix == "Visual" then
					preset_modes[mode].winhl.Visual = { link = prefix .. "ModeCursor" }
				end
			end
			reactive.add_preset({
				name = "neopywal",
				modes = preset_modes,
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		dependencies = {
			"RedsXDD/neopywal.nvim",
		},
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				highlights = require("neopywal.theme.plugins.bufferline").setup(),
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
			"RedsXDD/neopywal.nvim",
			"HiPhish/rainbow-delimiters.nvim",
		},
		opts = function(_, opts)
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			opts.scope = {
				highlight = highlight,
				show_start = true,
				show_end = true,
			}
			-- opts.indent = { highlight = highlight }
			vim.g.rainbow_delimiters = {
				highlight = highlight,
				-- query = {
				-- 	[""] = "rainbow-parens",
				-- },
			}
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "neopywal",
		},
	},
	{
		lazy = true,
		"sphamba/smear-cursor.nvim",
		dir = "~/Projects/dev/custom/smear-cursor.nvim",
		dependencies = { "RedsXDD/neopywal.nvim" },
		opts = function(_, opts)
			opts.cursor_color = "RainbowBgOrange"
			opts.cursor_color_insert_mode = "RainbowBgGreen"
			opts.never_draw_over_target = true
			opts.hide_target_hack = true
			opts.gamma = 0.4
			opts.trailing_exponent = 3.0 -- 2.2     > 0
			opts.stiffness = 0.8 -- 0.6      [0, 1]
			opts.trailing_stiffness = 0.2 -- 0.45     [0, 1]
			opts.stiffness_insert_mode = 0.7 -- 0.5      [0, 1]
			opts.trailing_stiffness_insert_mode = 0.4 -- 0.5      [0, 1]
			opts.damping = 0.85 -- 0.85     [0, 1]
			opts.damping_insert_mode = 0.95 -- 0.9      [0, 1]
			opts.distance_stop_animating = 0.5 -- 0.1      > 0
		end,
	},
}
