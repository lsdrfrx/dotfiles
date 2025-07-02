return {
	"nvim-lualine/lualine.nvim", -- Bottom statusline
	config = function()
		require("lualine").setup({
			options = {
				disabled_filetypes = { "neo-tree" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							local case = {
								["NORMAL"] = " ",
								["INSERT"] = " ",
								["VISUAL"] = " ",
								["COMMAND"] = " ",
							}

							if case[str] == nil then
								return case["NORMAL"]
							end
							return case[str]
						end,
					},
				},
				lualine_b = {
					{
						"bo:modified",
						fmt = function(isModified)
							if isModified == "true" then
								return " "
							end
							return ""
						end,
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "diagnostics", "filetype" },
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
