-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require('rose-pine').setup({
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
      highlight_groups = {
        CurSearch = { fg = "base", bg = "leaf", inherit = false },
        Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
      },
    })
    vim.cmd("colorscheme rose-pine-moon")
  end

}
