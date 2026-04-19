return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = false },
		image = { enabled = false },
		dashboard = {
			enabled = true,
			sections = {
				{ pane = 2, icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "header" },
				{
					text = require("plugins.headers.peepoFlashSnacks"),
					height = 50,
				},
				{
					text = "\n\n"
				},
				{ section = "startup" },
			},
		},
	},
}
