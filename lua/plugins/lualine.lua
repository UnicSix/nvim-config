return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  lazy = true,
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = 'dracula',
        theme = 'rose-pine',
        -- theme = 'nord',
        sections = {
          lualine_a = {'branch'},
          lualine_b = {'g:coc_status', 'bo:filetype'},
        },
      },
    }
  end
}
