return{
	{ --dashboard, setting startup menu
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			local db = require('dashboard')
			--local builtin = require('telescope.builtin')
			local headers = {
				'plugins.headers.buda',
				'plugins.headers.ahego',
				'plugins.headers.peepoFlash',
				-- require('plugins.headers.boob1'),
				'plugins.headers.unaware',
				'plugins.headers.o7',
			}
			math.randomseed(os.time())
			local rd_header = require(headers[math.random(#headers)])
			local builtin = require('telescope.builtin')
			local function find_nvim_config()
				builtin.find_files{cwd=vim.fn.stdpath 'config'}
			end
			db.setup({  --hyper version setup
				theme = 'hyper',
				config = {
					week_header = {
						enable = true,
						append = rd_header,
					},
					shortcut = {
					{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Nvim Configs',
						group = 'DiagnosticHint',
						action = find_nvim_config,
						-- require(builtin.find_files{cwd=vim.fn.stdpath 'config'}),
						key = 'n',
					},
					{
						desc = '󰨖 Quit',
						group = 'Number',
						action = ':q',
						key = 'q',
					},
					},
				},
			})
		end,
		dependencies = {{'nvim-tree/nvim-web-devicons'}}
	},
}
