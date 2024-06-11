vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

-- keymap.set("n", "<leader>kh", "<C-w>v")
keymap.set("n", "<leader>w", ":close<CR>")

-- nvim-tree
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>")
keymap.set("n", "<leader>rt", ":NvimTreeFindFile<CR>")

-- split windws
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically

keymap.set("n", "<leader>ne", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>pe", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

--  fzf lua
-- keymap.set("n", "<leader>ko", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
-- keymap.set("n", "<leader>kf", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
-- keymap.set("n", "<leader>kb", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

-- set keymaps

keymap.set("n", "<leader>ko", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>of", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>kf", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>kb", "<cmd>Telescope buffers<cr>", { desc = "Opened buffers" })
keymap.set("n", "<leader>kg", "<cmd>Telescope git_files -m<cr>", { desc = "Opened buffers" })

-- vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
