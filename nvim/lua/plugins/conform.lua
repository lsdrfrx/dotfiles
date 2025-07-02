return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- python = { "black", "isort" },
					html = { "prettierd" },
					css = { "prettierd" },
					vue = { "prettierd" },
				},
			})
		end,
	},
}
