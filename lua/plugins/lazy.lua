local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	require("plugins.oil"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.lspconfig"),
	require("plugins.dashboard"),
	require("plugins.autocompletion"),
	require("plugins.edgy"),
	require("plugins.notify"),
	require("plugins.noice"),
	require("plugins.codecompanion"),
	require("plugins.markview"),
	-- require("plugins.cmaketools"),
	require("plugins.flow"),
	require("plugins.musicnvim"),
	require("plugins.lengendary"),
	require("plugins.smartsplit"),
	require("plugins.presence"),
	require("plugins.airline"),
	require("plugins.toggleterm"),
	require("plugins.project"),
	require("plugins.neocodeium"),
	--'tpope/vim-sleuth',
	{ "numToStr/Comment.nvim", opts = {} },
	{ -- auto-pair plugin
		"windwp/nvim-autopairs",
		event = "insertEnter",
		config = true,
	},
	{ -- mini.icon plugin
		"echasnovski/mini.nvim",
		version = false,
	},
	{ -- devicons plugin
		"nvim-tree/nvim-web-devicons",
		version = false,
		enabled = vim.g.have_nerd_font,
	},
	{ -- which key plugin
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			--['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
			-- visual mode
			-- require('which-key').register{
			-- 	{"<leader>h", desc = "Git [H]unk", mode = "v"},
			-- }
		end,
	},
})
