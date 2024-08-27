return{
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function ()
		require("markview").setup({
			modes = { "n", "no", "c" },
			hybrid_modes = { "n" },

			callbacks = {
				on_enable = function (_, win)
					vim.wo[win].conceallevel = 2;
					vim.wo[win].concealcursor = "c";
				end,
			},
			highlight_groups = {
				{
					group_name = "Heading1",
					value = { fg = "#1e1e2e", bg = "#a6e3a1" }
				},
				{
					group_name = "Heading1Corner",
					value = { fg = "#a6e3a1" }
				},
			},
			headings = {
				enable = true,
				shift_width = 0,

				heading_1 = {
					style = "label",

					padding_left = " ",
					padding_right = " ",

					corner_right = " ",
					corner_right_hl = "Heading1Corner",

					hl = "Heading1"
				}
			}
		})
		vim.cmd("Markview enableAll")
	end,
}
