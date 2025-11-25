return {
	{ "tiagovla/scope.nvim", config = true },
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
	"sindrets/diffview.nvim",
	{

		"tummetott/unimpaired.nvim",
		event = "VeryLazy",
	},
}
