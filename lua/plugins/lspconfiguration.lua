return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			-- "williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.diagnostic.config({
				virtual_lines = { current_line = true },
				signs = true,
				underline = true,
				update_in_insert = true,
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						if func == nil then
							print("error: Nil function for keybinding:" .. keys)
							return
						end
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eference")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[name]")
					map("<leader>ff", vim.lsp.buf.format, "[F]ormat [F]ile")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]elaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			vim.lsp.config["clangd"] = {
				cmd = { "clangd", "--background-index" },
				root_markers = { ".clangd", "compile_flags.txt", ".vs" },
				filetypes = { "c", "cpp", "objc", "cuda", "proto" },
				capabilities = {
					textDocument = {
						semanticTokens = {
							multilineTokenSupport = true,
						},
					},
				},
			}

			vim.lsp.config["qmlls"] = {
				cmd = { "qmlls", "-E" },
				root_markers = { ".qmlls.ini", "CMakeLists.txt", ".git" },
			}

			vim.lsp.config["luals"] = {
				-- Command and arguments to start the server.
				cmd = { "lua-language-server" },
				-- Filetypes to automatically attach to.
				filetypes = { "lua" },
				-- Sets the "workspace" to the directory where any of these files is found.
				-- Files that share a root directory will reuse the LSP server connection.
				-- Nested lists indicate equal priority, see |vim.lsp.Config|.
				root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
				-- Specific settings to send to the server. The schema is server-defined.
				-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}
			vim.lsp.enable("stylua")
			vim.lsp.enable("luals")
			vim.lsp.enable("clangd")
			-- vim.lsp.enable("qmlls")

			require("mason").setup()
			local ensure_installed = {
				"clang-format",
				"cmake-language-server",
				"lua-language-server",
				"glsl_analyzer",
				"clangd",
			}
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		end,
	},
}
