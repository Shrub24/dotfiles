return {
	"saghen/blink.cmp",
	dependencies = {
		"Kaiser-Yang/blink-cmp-git",
		"MahanRahmati/blink-nerdfont.nvim",
		"mikavilpas/blink-ripgrep.nvim",
	},
	opts = {
		completion = {
			ghost_text = {
				enabled = false,
			},
		},
		sources = {
			default = {
				"nerdfont",
				"git",
				"ripgrep",
			},
			providers = {
				-- copilot = {},
				nerdfont = {
					module = "blink-nerdfont",
					name = "Nerd Fonts",
					score_offset = 20, -- Tune by preference
					opts = { insert = true },
				},
				git = {
					module = "blink-cmp-git",
					name = "Git",
					score_offset = 0,
					enabled = function()
						return vim.tbl_contains({ "lazygit", "octo", "gitcommit", "markdown" }, vim.bo.filetype)
					end,
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					score_offset = -5,
					opts = {
						prefix_min_len = 4,
						backed = "gitgrep-or-ripgrep",
					},
				},
			},
		},
		keymap = {
			preset = "super-tab",
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				function() -- sidekick next edit suggestion
					return require("sidekick").nes_jump_or_apply()
				end,
				"fallback",
			},
		},
	},
}
