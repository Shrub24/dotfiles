return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			pyright = {
				mason = false,
				enabled = false,
			},
			basedpyright = {
				enabled = true,
				settings = {
					basedpyright = {
						analysis = {
							diagnosticMode = "workspace",
						},
					},
				},
			},
		},
	},
}
