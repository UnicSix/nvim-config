vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.timeoutlen = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 1
vim.opt.expandtab = false -- Use tabs instead of spaces

--fold nethod
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--edgy related opts
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

--disable startup warnings
vim.diagnostic.config({virtual_text = false})

--background setting
-- vim.opt.termguicolors = true
-- vim.opt.background = 'dark'  -- or 'light' depending on your preference
-- vim.cmd([[
--   augroup TerminalBackground
--     autocmd!
--     autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
--   augroup END
-- ]])

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function ()
-- 		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- 		vim.cmd("hi Nontext guibg=NONE ctermbg=NONE")
-- 	end
-- })
