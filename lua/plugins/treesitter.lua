return{

	{ -- treesitter
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
        version = false,
        config = function()
            require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"cpp",
					"c",
					"lua",
					"vim",
					"vimdoc",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				}
			})
		end,
	},
}
