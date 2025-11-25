return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
	},
	-- Optional dependencies
	dependencies = {
		{ "nvim-mini/mini.icons", opts = {} },
		{ "JezerM/oil-lsp-diagnostics.nvim" },
		{ "benomahony/oil-git.nvim" },
	},

	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
