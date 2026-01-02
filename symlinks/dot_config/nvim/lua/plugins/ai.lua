return {
	{
		"folke/sidekick.nvim",
		opts = {
			cli = {
				-- keys = {},
				watch = true,
			},
		},
		-- keys = {
		-- 	{ "<tab>", LazyVim.cmp.map({ "ai_nes" }, "<tab>"), mode = { "n" }, expr = true },
		-- },
	},
	-- {
	-- 	"NickvanDyke/opencode.nvim",
	-- 	dependencies = {
	-- 		"folke/snacks.nvim",
	-- 		"folke/sidekick.nvim",
	-- 	},
	-- 	config = function()
	-- 		vim.o.autoread = true
	--      vim.keymap.set({"n", "x"}, "<leader>a", "", { desc = "+ai" })
	-- 		vim.keymap.set({ "n", "x" }, "<leader>at", function()
	-- 			require("opencode").ask("@this: ", { submit = true })
	-- 		end, { desc = "Ask opencode" })
	-- 		vim.keymap.set({ "n", "x" }, "<leader>ax", function()
	-- 			require("opencode").select()
	-- 		end, { desc = "Execute opencode action…" })
	-- 		vim.keymap.set({ "n", "t" }, "<C-.>", function()
	-- 			require("opencode").toggle()
	-- 		end, { desc = "Toggle opencode" })
	--
	-- 		vim.keymap.set({ "n", "x" }, "go", function()
	-- 			return require("opencode").operator("@this ")
	-- 		end, { expr = true, desc = "Add range to opencode" })
	-- 		vim.keymap.set("n", "goo", function()
	-- 			return require("opencode").operator("@this ") .. "_"
	-- 		end, { expr = true, desc = "Add line to opencode" })
	--
	-- 		vim.keymap.set("n", "<S-C-u>", function()
	-- 			require("opencode").command("session.half.page.up")
	-- 		end, { desc = "opencode half page up" })
	-- 		vim.keymap.set("n", "<S-C-d>", function()
	-- 			require("opencode").command("session.half.page.down")
	-- 		end, { desc = "opencode half page down" })
	--
	-- 		-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
	-- 		vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
	-- 		vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
	-- 	end,
	-- },
}
