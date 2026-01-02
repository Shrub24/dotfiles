return {
	{
		"kbwo/vim-shareedit",
		dependencies = { "vim-denops/denops.vim" },
	},
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		opts = {
			multiplexer_integration = "wezterm",
		},
	},
	{
		"https://codeberg.org/esensar/nvim-dev-container",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	{
		"luukvbaal/statuscol.nvim",
	},
	{
		"pwntester/octo.nvim",
		opts = {
			picker = "snacks",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	"karb94/neoscroll.nvim",
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				shfmt = {},
			},
		},
	},
	{
		"tummetott/unimpaired.nvim",
		event = "VeryLazy",
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"folke/snacks.nvim",
		},
		opts = {
			options = {
				picker = "snacks",
			},
		},
		ft = "python",
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" },
		},
	},
	{
		"petertriho/nvim-scrollbar",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"kevinhwang91/nvim-hlslens",
		},
		opts = {
			handlers = {
				gitsigns = true,
				search = true,
			},
		},
	},
	{
		"kevinhwang91/nvim-hlslens",
		keys = {
			{
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				desc = "Next Search Result",
			},
			{
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				desc = "Prev Search Result",
			},
			{
				"*",
				[[*<Cmd>lua require('hlslens').start()<CR>]],
				desc = "Search Word Forward",
			},
			{
				"#",
				[[#<Cmd>lua require('hlslens').start()<CR>]],
				desc = "Search Word Backward",
			},
			{
				"g*",
				[[g*<Cmd>lua require('hlslens').start()<CR>]],
				desc = "Search Word Forward (Fuzzy)",
			},
			{
				"g#",
				[[g#<Cmd>lua require('hlslens').start()<CR>]],
				desc = "Search Word Backward (Fuzzy)",
			},
			{
				"<leader>l",
				"<cmd>nohlsearch<cr>",
				desc = "Clear Highlights",
			},
		},
	},
	-- {
	-- 	"lewis6991/satellite.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		current_only = false,
	-- 		winblend = 0,
	-- 		width = 10,
	-- 		zindex = 40,
	-- 		excluded_filetypes = { "NvimTree", "neo-tree", "dashboard", "snacks_dashboard" },
	-- 		overlay = false,
	-- 		handlers = {
	-- 			cursor = {
	-- 				enabled = false,
	-- 			},
	-- 			search = { enable = true },
	-- 			diagnostic = { enable = true },
	-- 			gitsigns = { enable = true },
	-- 			marks = {
	-- 				enable = true,
	-- 				key = "",
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
	},
}
