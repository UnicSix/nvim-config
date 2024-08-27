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
					"markdown",
					"markdown_inline",
					"html",
					"yaml",
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				modules = {},
				sync_install = false,
				ignore_install = {},
				auto_install = true,
			})
		end,
	},
}
