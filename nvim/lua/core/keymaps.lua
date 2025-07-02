local map = vim.keymap.set

map("n", "<leader>e", "<cmd>Yazi toggle<CR>", { silent = true })
map("n", "<C-BS>", ":w<CR>:bd<CR>", { silent = true })
map("n", "<ESC>", ":noh<CR><ESC>", { silent = true })
map("i", "<C-BS>", "<C-w>", { silent = true })
map("i", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })

-- Telescope keymaps
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fm", ":Telescope marks<CR>", { silent = true })

map("n", "j", "h", { silent = true })
map("n", "k", "j", { silent = true })
map("n", "l", "k", { silent = true })
map("n", ";", "l", { silent = true })

map("v", "j", "h", { silent = true })
map("v", "k", "j", { silent = true })
map("v", "l", "k", { silent = true })
map("v", ";", "l", { silent = true })

map("n", "<A-t>", "<cmd>FloatermToggle<CR>", { silent = true })
map("t", "<A-t>", "<cmd>FloatermToggle<CR>", { silent = true })
map("n", "<leader>t", "<cmd>TimerlyToggle<CR>", { silent = true })

-- Move between panes
map("n", "<A-j>", ":wincmd h<CR>", { silent = true })
map("n", "<A-k>", ":wincmd j<CR>", { silent = true })
map("n", "<A-l>", ":wincmd k<CR>", { silent = true })
map("n", "<A-;>", ":wincmd l<CR>", { silent = true })

map("n", "<A-left>", ":wincmd h<CR>", { silent = true })
map("n", "<A-down>", ":wincmd j<CR>", { silent = true })
map("n", "<A-up>", ":wincmd k<CR>", { silent = true })
map("n", "<A-right>", ":wincmd l<CR>", { silent = true })

--
-- Git keymaps
--
map("n", "<leader>g", ":Git<CR>", { silent = true })
map("n", "<leader>gd", ":Gvdiffsplit<CR>", { silent = true })

-- Open float diagnostics
map("n", "K", function()
	vim.diagnostic.open_float()
end, { silent = true })

map("n", "<C-K>", vim.lsp.buf.hover, { silent = true })
