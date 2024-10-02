return {
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						initial_mode = "normal",
						theme = "ivy",
						hidden = true,
					},
				},
				pickers = {
					buffers = {
						initial_mode = "normal",
						theme = "ivy",
						show_all_buffers = true,
						sort_mru = true,
						mappings = {
							n = {
								["<c-d>"] = "delete_buffer",
							},
						},
					},
					find_files = {
						theme = "ivy",
					},
					live_grep = {
						theme = "ivy",
					},
				},
			})
			require("telescope").load_extension("projects")
		end,
	},
}
