local map = vim.keymap.set

map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-BS>", ":w<CR>:bd<CR>", { silent = true })
map("n", "<ESC>", ":noh<CR><ESC>", { silent = true })
map("i", "<C-BS>", "<C-w>", { silent = true })
map("i", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })

-- Telescope keymaps
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>b", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope file_browser<CR>", { silent = true })

-- Move between panes
map("n", "<A-h>", ":wincmd h<CR>", { silent = true })
map("n", "<A-j>", ":wincmd j<CR>", { silent = true })
map("n", "<A-k>", ":wincmd k<CR>", { silent = true })
map("n", "<A-l>", ":wincmd l<CR>", { silent = true })

--
-- Git keymaps
--
map("n", "<leader>g", ":Git<CR>", { silent = true })
map("n", "<leader>gd", ":Gvdiffsplit<CR>", { silent = true })
map("n", "<leader>gp", ":Git push<CR>", { silent = true })

--
-- Code actions keymaps
--
map("i", "<F2>", function()
	require("renamer").rename()
end, { noremap = true, silent = true })

map("n", "<F2>", function()
	require("renamer").rename()
end, { noremap = true, silent = true })

-- Run current buffer
map("n", "<F5>", function()
	local extension = vim.bo.filetype
	if extension == "python" then
		vim.cmd("!python " .. vim.fn.expand("%"))
	end
end, { noremap = true })

-- Open float diagnostics
map("n", "K", function()
	vim.diagnostic.open_float()
end, { silent = true })

map("n", "<C-K>", vim.lsp.buf.hover, { silent = true })
