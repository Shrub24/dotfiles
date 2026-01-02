-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Centralize all swap, backup, and undo files
local state_dir = vim.fn.stdpath("state") .. "/"

-- Keep swap files in one place
vim.opt.swapfile = true
vim.opt.directory = state_dir .. "swap"

-- Keep backup files in one place
vim.opt.backup = true
vim.opt.backupdir = state_dir .. "backup"

-- Keep undo files in one place
vim.opt.undofile = true
vim.opt.undodir = state_dir .. "undo"
--
--
vim.opt.scrolloff = 12
--
-- -- Make sure the directories exist
-- if vim.fn.isdirectory(vim.opt.directory) == 0 then
-- 	vim.fn.mkdir(vim.opt.directory, "p")
-- end
-- if vim.fn.isdirectory(vim.opt.backupdir) == 0 then
-- 	vim.fn.mkdir(vim.opt.backupdir, "p")
-- end
-- if vim.fn.isdirectory(vim.opt.undodir) == 0 then
-- 	vim.fn.mkdir(vim.opt.undodir, "p")
-- end
