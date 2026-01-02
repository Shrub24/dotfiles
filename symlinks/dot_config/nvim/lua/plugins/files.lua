return {
	{
		"nvim-mini/mini.files",
		opts = {
			windows = {
				preview = true,
				width_focus = 30,
				width_preview = 30,
			},
			mappings = {
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "h",
				go_out_plus = "-",
				reset = "R",
				show_help = "?",
			},
		},
		keys = {
			{
				"<leader>W",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open Mini Files",
			},
		},
		config = function(_, opts)
			require("mini.files").setup(opts)

			local show_dotfiles = true
			local filter_show = function(fs_entry)
				return true
			end
			local filter_hide = function(fs_entry)
				return not vim.startswith(fs_entry.name, ".")
			end

			local toggle_dotfiles = function()
				show_dotfiles = not show_dotfiles
				local new_filter = show_dotfiles and filter_show or filter_hide
				require("mini.files").refresh({ content = { filter = new_filter } })
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					vim.keymap.set("n", "H", toggle_dotfiles, { buffer = buf_id })
				end,
			})
		end,
	},
	"mikavilpas/yazi.nvim",
	enabled = false,
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
}
