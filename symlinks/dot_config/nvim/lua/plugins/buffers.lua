return {
	{ "tiagovla/scope.nvim", config = true },
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					if context.buffer:current() then
						return ""
					end
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				get_element_icon = function(element)
					local icon, hl =
						require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
					return icon, hl
				end,
				show_buffer_close_icons = false,
				show_close_icon = false,
				groups = {
					items = {
						require("bufferline.groups").builtin.pinned:with({ icon = "" }),

						{
							name = "Tests",
							icon = "",
							highlight = { link = "RainbowBgGreen" },
							matcher = function(buf)
								local n = buf.name
								return n:match("_spec") or n:match(".test") or n:match("/tests/")
							end,
							auto_close = true,
						},
						{
							name = "Docs",
							icon = "",
							matcher = function(buf)
								return buf.name:match("%.md") or buf.name:match("%.txt")
							end,
							auto_close = true,
						},
						{
							name = "Configs",
							icon = "",
							matcher = function(buf)
								return buf.name:match("%.yaml") or buf.name:match("%.json") or buf.name:match("%.toml")
							end,
							auto_close = true,
						},
						{
							name = "Dependencies",
							icon = "",
							highlight = { link = "RainbowBgBlue" }, -- Optional color (Cyan)
							matcher = function(buf)
								local path = buf.path

								return path:match("node_modules")
									or path:match("%.venv")
									or path:match("site%-packages")
									or path:match("target/")
									or path:match("vendor/")
									or path:match("/lib/")
							end,

							auto_close = true,
							priority = 2,
						},

						require("bufferline.groups").builtin.ungrouped,
					},
				},
			},
		},
		-- config = function()
		-- 	require("bufferline").setup({
		-- 		highlights = require("neopywal.theme.plugins.bufferline").setup(),
		-- 	})
		-- end,
	},
}
