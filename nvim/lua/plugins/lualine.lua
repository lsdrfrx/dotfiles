return {
	"nvim-lualine/lualine.nvim", -- Bottom statusline
	config = function()
		local monochrome = require("lualine.themes.monochrome")
		monochrome.normal.b.bg = "NONE"
		monochrome.normal.c.bg = "NONE"
		monochrome.insert.b.bg = "NONE"
		monochrome.visual.b.bg = "NONE"
		monochrome.command.b.bg = "NONE"
		monochrome.replace.b.bg = "NONE"
		monochrome.inactive.c.bg = "NONE"

		require("lualine").setup({
			options = {
				theme = monochrome,
				section_separators = { left = "  ", right = " " },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics", "filename" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = {},
			},
		})
	end,
}
