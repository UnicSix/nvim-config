return{ -- use telescope to intergrate with this plugin
	"UnicSix/project.nvim",
	config = function ()
		require('project_nvim').setup({
			patterns = { ".git", "CMakeLists.txt", ".clangd", ".vs"}
		})
		local builtin = require('telescope').load_extension('projects')
		vim.keymap.set('n', '<leader>tp', builtin.projects, { desc = '[T]elescope [P]rojects ' })
	end
}
