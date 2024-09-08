return{ -- use telescope to intergrate with this plugin
	"ahmedkhalf/project.nvim",
	config = function ()
		require('project_nvim').setup({
			patterns = { ".git", "CMakeLists.txt", ".clangd", ".vs"}
		})
		require('telescope').load_extension('projects')
	end
}
