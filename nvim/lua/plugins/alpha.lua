return {
	"goolord/alpha-nvim", -- Greeter
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"⠀⠀⢮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧",
			"⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠠",
			"⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇",
			"⠀⢸⣿⣿⣿⣿⣿⡿⣽⠇⢸⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆",
			"⠀⠈⠘⢿⣿⡿⢿⣇⣹⠇⠨⢎⣿⢿⣿⣿⡿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃",
			"⠀⠀⠀⢸⣿⡇⣷⣤⣩⡃⠘⠈⢸⠉⡤⣿⣅⡐⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠆",
			"⠀⠀⠀⠈⠃⢿⠘⠛⠛⠃⠀⠀⠀⠀⠀⢿⣤⣉⡓⠻⣿⣿⣿⣿⣿⡳⣿⣿⡿⠀",
			"⠀⠀⠀⠀⠀⠈⣆⠀⠐⠀⢀⠀⠀⠀⠀⠈⠛⠿⠛⠁⠁⣿⣿⣿⣏⣽⣿⡟⠇⠀",
			"⠀⠀⠀⠀⠀⠀⠈⢦⡀⢀⠯⣤⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⡿⠿⠿⠻⠁⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⢹⣄⡀⠀⠄⠀⡀⠀⠀⠀⢀⣠⢷⣿⣿⣿⡆⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⠑⢤⣈⣄⣤⣤⢶⣟⠯⠃⢹⣿⣿⣿⣷⣄⠀⠀⠀⠀",
			"⠀⢀⣠⣴⣾⣿⣿⣿⣿⡏⢀⣦⣿⡞⠓⠋⠉⠀⠀⠀⢸⣿⣿⣿⣿⣿⣷⣄⠀⠀",
			"⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣷⡀⠂⠄⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣯⣧⡀",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶",
			"⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", " Edit this folder", ":e .<CR>"),
			dashboard.button("r", "󰦖 Recent", ":Telescope projects<CR>"),
			dashboard.button("c", " Config", ":e ~/.config/nvim<CR>"),
			dashboard.button("q", "󰿅 Quit Maekju", ":q<CR>"),
		}
		alpha.setup(dashboard.opts)
	end,
}
