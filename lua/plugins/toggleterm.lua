return{
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function ()
    require("toggleterm").setup({
      shell = "/bin/bash",
      direction = 'vertical',
      open_mapping = [[<c-t]],
      shade_filetype = {},
      highlights = require("rose-pine.plugins.toggleterm")
    })
    vim.keymap.set('t', '<C-t>', ':ToggleTerm direction=vertical size=40<CR>',
      { noremap = true })
    vim.keymap.set('n', '<C-n>', ':ToggleTerm direction=horizontal size=10<CR>',
      { noremap = true })
    vim.keymap.set('n', '<C-f>', ':ToggleTerm direction=float<CR>',
      { noremap = true })
  end
}
