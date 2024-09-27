return{
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function ()
		require("toggleterm").setup({
			shell = "pwsh",
			direction = 'vertical',
			open_mapping = [[<c-t]],
			shade_filetype = {},
		})
		vim.keymap.set('t', '<C-t>', ':ToggleTerm direction=vertical size=40<CR>',
			{ noremap = true })
		vim.keymap.set('n', '<C-n>', ':ToggleTerm direction=horizontal size=10<CR>',
			{ noremap = true })
		vim.keymap.set('n', '<C-f>', ':ToggleTerm direction=float<CR>',
			{ noremap = true })
	end
}
