local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Plugins without setup
	{ "nvim-tree/nvim-web-devicons" }, -- Pretty icons
	{ "nvim-lua/plenary.nvim" }, -- Dependency for a lot of plugins
	{ "tpope/vim-commentary" }, -- Comment action
	{ "powerman/vim-plugin-ruscmd" }, -- Vim works on russian layout :^)
	{ "tpope/vim-fugitive" }, -- Git integration
	{ "nvzone/volt" },
	{ "MunifTanjim/nui.nvim" },
	{ "danihek/hellwal-vim" },
	{ "vim-crystal/vim-crystal" },
	{
		"mikavilpas/yazi.nvim",
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			-- vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	{
		"echaya/neowiki.nvim",
		opts = {
			wiki_dirs = {
				-- neowiki.nvim supports both absolute and relative paths
				{ name = "NeoWiki", path = "~/neowiki" },
			},
		},
		keys = {
			{ "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
		},
	},
	{
		"catgoose/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				mode = "virtualtext",
				virtualtext = "",
				virtualtext_inline = "before",
				names = false,
			},
		},
	},

	-- Plugins with empty setup
	{
		"Pocco81/true-zen.nvim", -- Zen mode
		config = function()
			require("true-zen").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{
		"kylechui/nvim-surround", -- Working with surrounds
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs", -- Autopair plugin, pretty simple
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"nvzone/timerly",
	},
	{
		"nvzone/floaterm",
	},
	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 60,
			top_down = false,
		},
	},

	-- Plugins with custom setup
	require("plugins.themes"),
	require("lsp.lsp"),
	require("plugins.blink"),
	require("plugins.conform"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.alpha"),
	require("plugins.lualine"),
	require("plugins.project"),
	require("plugins.blankline"),
	require("plugins.scratch"),
	require("plugins.cursorline"),
	require("plugins.render-markdown"),
})
