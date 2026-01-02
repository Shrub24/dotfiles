return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			animate = { enabled = true },
			debug = { enabled = true },
			image = { enabled = true },
			keymap = { enabled = true },
			lazygit = { enabled = true },
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				opts = {
					config = {
						center = {
							{
								action = "lua LazyVim.pick()()",
								desc = " Find File",
								icon = " ",
								key = "f",
							},
							{
								action = "ene | startinsert",
								desc = " New File",
								icon = " ",
								key = "n",
							},
							{
								action = 'lua LazyVim.pick("oldfiles")()',
								desc = " Recent Files",
								icon = " ",
								key = "r",
							},
							{
								action = 'lua LazyVim.pick("live_grep")()',
								desc = " Find Text",
								icon = " ",
								key = "g",
							},
							{
								action = "lua LazyVim.pick.config_files()()",
								desc = " Config",
								icon = " ",
								key = "c",
							},
							{
								action = 'lua require("pick-resession").pick()',
								desc = " Restore Session",
								icon = " ",
								key = "s",
							},
							{
								action = "Lazy",
								desc = " Lazy",
								icon = "󰒲 ",
								key = "l",
							},
							{
								action = function()
									vim.api.nvim_input("<cmd>qa<cr>")
								end,
								desc = " Quit",
								icon = " ",
								key = "q",
							},
						},
					},
				},
			},
			explorer = {
				replace_netrw = true,

				layout = {
					layout = {
						position = "left",
						width = 30,
					},
				},

				keys = {
					-- Edit Actions (The Oil way)
					["cw"] = "rename",
					["dd"] = "delete",
					["yy"] = "copy",
					["p"] = "paste",
					["o"] = "add",

					-- Navigation
					["<CR>"] = "edit",
					["l"] = "edit",
					["h"] = "close",
					["<Esc>"] = "close",
				},
			},
			indent = { enabled = true },
			input = { enabled = true },
			picker = {
				enabled = true,
				-- sources = {
				-- 	explorer = { enabled = false },
				-- },
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},

	{
		"folke/sidekick.nvim",
		version = "*",
		enabled = true,
		lazy = false,
		opts = {
			-- add any options here
			cli = {
				mux = {
					backend = "zellij",
					enabled = true,
				},
			},
		},
		keys = {
			-- {
			-- 	"<tab>",
			-- 	function()
			-- 		-- if there is a next edit, jump to it, otherwise apply it if any
			-- 		if not require("sidekick").nes_jump_or_apply() then
			-- 			return "<Tab>" -- fallback to normal tab
			-- 		end
			-- 	end,
			-- 	expr = true,
			-- 	desc = "Goto/Apply Next Edit Suggestion",
			-- },
			{
				"<c-.>",
				function()
					require("sidekick.cli").toggle()
				end,
				desc = "Sidekick Toggle",
				mode = { "n", "t", "i", "x" },
			},
		},
	},
}
