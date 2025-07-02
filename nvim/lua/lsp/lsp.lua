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

		vim.lsp.config("vue_ls", {
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			cmd = { "vue-language-server", "--stdio" },
			init_options = {
				vue = {
					hybridMode = false,
				},
				typescript = {
					tsdk = "/home/lsdrfrx/.config/yarn/global/node_modules/typescript/lib",
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
		})

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
