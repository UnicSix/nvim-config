return{
	"Civitasv/cmake-tools.nvim",
	lazy = true,
	init = function()
		vim.notify('Check Dir', vim.log.levels.INFO, nil)
		local loaded = false

		local function check()
			local cwd = vim.uv.cwd()
			if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
				require("lazy").load({ plugins = { "cmake-tools.nvim" } })
				loaded = true
			end
		end

		check()
		vim.api.nvim_create_autocmd("DirChanged", {
			callback = function ()
				if not loaded then
					check()
				end
			end,
		})
	end,
	config = function ()
		local cmake = require('cmake-tools')
		local cwd = vim.uv.cwd()
		require('cmake-tools').setup({
			cmake_generate_options = { "-DMAKE_EXPORT_COMPILE_COMMANDS=1" },
			-- cmake_build_directory = cwd .. "/out"
		})
		cmake.select_cwd(cwd)
		cmake.select_build_dir(cwd .. "/out/" )
	end,
	opts = {},
}
