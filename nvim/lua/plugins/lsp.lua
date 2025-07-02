return {
	"neovim/nvim-lspconfig",
	config = function(_, opts)
		local util = require("lspconfig.util")

		vim.lsp.config["crystalline"] = {
			cmd = { "crystalline" },
			filetypes = { "crystal" },
			root_markers = { "shard.yml", ".git" },
		}

		vim.lsp.config["lua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
		}

		vim.lsp.config["nixd"] = {
			cmd = { "nixd" },
			filetypes = { "nix" },
			root_markers = { "flake.nix", "git" },
		}

		vim.lsp.config["cssls"] = {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "css", "scss", "less", "vue" },
			init_options = { provideFormatter = true },
			root_markers = { "package.json", ".git" },
			settings = {
				css = { validate = true },
				scss = { validate = true },
				less = { validate = true },
			},
		}

		vim.lsp.config["emmet_ls"] = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = {
				"astro",
				"css",
				"eruby",
				"html",
				"htmlangular",
				"htmldjango",
				"javascriptreact",
				"less",
				"pug",
				"sass",
				"scss",
				"svelte",
				"templ",
				"typescriptreact",
				"vue",
			},
			root_markers = { ".git" },
		}

		vim.lsp.config["ts_ls"] = {
			init_options = { hostInfo = "neovim" },
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"typescript",
				"vue",
			},
			root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
			handlers = {
				-- handle rename request for certain code actions like extracting functions / types
				["_typescript.rename"] = function(_, result, ctx)
					local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
					vim.lsp.util.show_document({
						uri = result.textDocument.uri,
						range = {
							start = result.position,
							["end"] = result.position,
						},
					}, client.offset_encoding)
					vim.lsp.buf.rename()
					return vim.NIL
				end,
			},
			on_attach = function(client, bufnr)
				-- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
				-- `vim.lsp.buf.code_action()` if specified in `context.only`.
				vim.api.nvim_buf_create_user_command(bufnr, "LspTypescriptSourceAction", function()
					local source_actions = vim.tbl_filter(function(action)
						return vim.startswith(action, "source.")
					end, client.server_capabilities.codeActionProvider.codeActionKinds)

					vim.lsp.buf.code_action({
						context = {
							only = source_actions,
						},
					})
				end, {})
			end,
		}

		vim.lsp.config["vue_ls"] = {
			cmd = { "vue-language-server", "--stdio" },
			filetypes = { "vue" },
			root_markers = { "package.json" },
			init_options = {
				typescript = {
					tsdk = "",
				},
			},
			before_init = function(_, config)
				if
					config.init_options
					and config.init_options.typescript
					and config.init_options.typescript.tsdk == ""
				then
					config.init_options.typescript.tsdk = util.get_typescript_server_path(config.root_dir)
				end
			end,
		}

		vim.lsp.enable({
			"nixd",
			"crystalline",
			"lua_ls",
			"cssls",
			"emmet_ls",
			"ts_ls",
			"vue_ls",
		})
	end,
}
