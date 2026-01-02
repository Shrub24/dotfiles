-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- in nvim/lua/config/autocmds.lua
local softwrap_group = vim.api.nvim_create_augroup("SoftwrapBuffers", { clear = true })
local color_group = vim.api.nvim_create_augroup("ColorSchemeChanged", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	group = color_group,
	callback = function()
		vim.schedule(function()
			local original_notify = vim.notify
			vim.notify = function() end

			local reloaded = {}
			local errors = {}

			local function try_reload(lib_name, plugin_name)
				if package.loaded[lib_name] then
					local ok, err = pcall(vim.cmd, "Lazy reload " .. plugin_name)
					if ok then
						table.insert(reloaded, plugin_name)
					else
						table.insert(errors, plugin_name .. ": " .. tostring(err))
					end
				end
			end

			try_reload("lualine", "lualine.nvim")
			try_reload("bufferline", "bufferline.nvim")
			try_reload("reactive", "reactive.nvim")

			vim.notify = original_notify

			if #errors > 0 then
				vim.notify(
					"Theme Reload Failed:\n" .. table.concat(errors, "\n"),
					vim.log.levels.ERROR,
					{ title = "Theme Manager" }
				)
			elseif #reloaded > 0 then
				vim.notify(
					"Refreshed: " .. table.concat(reloaded, ", "),
					vim.log.levels.INFO,
					{ title = "Theme Manager" }
				)
			end
		end)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = softwrap_group,
	pattern = "kulala_ui",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})
