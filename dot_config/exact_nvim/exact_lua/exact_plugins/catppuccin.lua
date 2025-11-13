return {
	"catppuccin/nvim",
	priority = 1000,
	lazy = true,
	name = "catppuccin",
	opts = {
		flavour = "mocha",
		auto_integrations = true,
	},
	specs = {
		{
			"akinsho/bufferline.nvim",
			optional = true,
			opts = function(_, opts)
				if (vim.g.colors_name or ""):find("catppuccin") then
					opts.highlights = require("catppuccin.special.bufferline").get_theme()
				end
			end,
		},
	},
}
