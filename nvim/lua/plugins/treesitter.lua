return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"cpp",
				"markdown",
				"lua",
				"python",
				"bash",
				"vim",
				"c",
				"dockerfile",
				"cmake",
				"make",
				"toml",
				"yaml",
				"json",
				"vimdoc",
				"rasi",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
