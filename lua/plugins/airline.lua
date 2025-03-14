return{
  'vim-airline/vim-airline',
  event = "BufNew",
  lazy = true,
  dependencies = {
    'vim-airline/vim-airline-themes'
  },
  config = function ()
    vim.cmd('AirlineTheme fruit_punch')
  end
}
