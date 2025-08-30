vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.timeoutlen = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '│ ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
-- Set tab width to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 1
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp" },
  callback = function()
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gdscript" },
  callback = function()
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
    vim.opt_local.softtabstop = 0
  end,
})
--fold nethod
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--edgy related opts
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

--disable startup warnings
vim.diagnostic.config({virtual_text = false})

vim.cmd([[
    augroup glsl_filetype
        autocmd!
        autocmd BufNewFile,BufRead *.vert set filetype=glsl
        autocmd BufNewFile,BufRead *.frag set filetype=glsl
        autocmd BufNewFile,BufRead *.gemo set filetype=glsl
        autocmd BufNewFile,BufRead *.tesc set filetype=glsl
        autocmd BufNewFile,BufRead *.tese set filetype=glsl
        autocmd BufNewFile,BufRead *.comp set filetype=glsl
    augroup END
]])
vim.cmd([[
    augroup glsl_filetype
        autocmd!
        autocmd BufNewFile,BufRead *.vert.hlsl set filetype=hlsl
        autocmd BufNewFile,BufRead *.frag.hlsl set filetype=hlsl
        autocmd BufNewFile,BufRead *.gemo.hlsl set filetype=hlsl
        autocmd BufNewFile,BufRead *.tesc.hlsl set filetype=hlsl
        autocmd BufNewFile,BufRead *.tese.hlsl set filetype=hlsl
        autocmd BufNewFile,BufRead *.comp.hlsl set filetype=hlsl
    augroup END
]])
