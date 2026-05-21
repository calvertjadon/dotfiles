-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional   ptions here

vim.env.PATH = "/usr/local/go/bin:" .. vim.env.PATH
--
-- Native inline completions don't support being shown as regular completions
vim.g.ai_cmp = false

vim.opt.inccommand = "split"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.scrolloff = 8
