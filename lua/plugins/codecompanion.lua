return{
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- Optional
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
		},
		config = function()
			vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>",
				{ noremap = true, silent = true })
			vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>",
				{ noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>",
				{ noremap = true, silent = true })
			vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>",
				{ noremap = true, silent = true })
			vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>",
				{ noremap = true, silent = true })
			-- Expand 'cc' into 'CodeCompanion' in the command line
			vim.cmd([[cab cc CodeCompanion]])

			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "anthropic",
					},
					inline = {
						adapter = "anthropic",
					},
					agent = {
						adapter = "anthropic",
					},
				},
				adapters = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
								env = {
									api_key = "YOUR_API_KEY"
							},
						})
					end,
				},
			})
		end,
	},
}
