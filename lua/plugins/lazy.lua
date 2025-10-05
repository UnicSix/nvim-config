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

	require("plugins.rainbow-delimiters"),
	require("plugins.oil"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.lspconfiguration"),
	-- require("plugins.dashboard"),
	require("plugins.autocompletion"),
	require("plugins.notify"),
	require("plugins.noice"),
	-- require("plugins.codecompanion"),
	-- require("plugins.markview"),
	-- require("plugins.flow"),
	require("plugins.rose_pine"),
	require("plugins.lengendary"),
	require("plugins.smartsplit"),
	require("plugins.toggleterm"),
	require("plugins.project"),
	-- require("plugins.neocodeium"),
	-- require("plugins.dap"),
	-- require("plugins.dapui"),
	-- require("plugins.lldb-dap"),
	require("plugins.trouble"),
	require("plugins.lualine"),
	-- require("plugins.ale"),
	-- require("plugins.fugitive"),
	-- require("plugins.mason-nvim-dap"),
	--'tpope/vim-sleuth',
	{ "numToStr/Comment.nvim",          opts = {} },
	{ "alexghergh/nvim-tmux-navigation" },
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
	require("plugins.snacks"),
	require("plugins.rainbow-delimiters"),
	require("plugins.oil"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.lspconfiguration"),
	-- require("plugins.dashboard"),
	require("plugins.autocompletion"),
	require("plugins.notify"),
	require("plugins.noice"),
	-- require("plugins.codecompanion"),
	-- require("plugins.markview"),
	-- require("plugins.flow"),
	require("plugins.rose_pine"),
	require("plugins.lengendary"),
	require("plugins.smartsplit"),
	require("plugins.toggleterm"),
	require("plugins.project"),
	-- require("plugins.neocodeium"),
	require("plugins.trouble"),
	require("plugins.lualine"),
	-- require("plugins.ale"),
	-- require("plugins.fugitive"),
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
	require("plugins.render-markdown"),
	{                 -- which key plugin
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()
		end,
	},
})
