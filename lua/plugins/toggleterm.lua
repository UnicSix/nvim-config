return{
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function ()
		require("toggleterm").setup({
			shell = "pwsh",

		})
		vim.keymap.set('n', '<C-n>', ':ToggleTerm<CR>', { noremap = true })
	end
}
