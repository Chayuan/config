vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>w", ":close<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>rt", ":NvimTreeFindFile<CR>")

-- split windws
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically

keymap.set("n", "<leader>ne", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>pe", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

-- In caps because it's kindda dangerous !
keymap.set("n", "<leader>GR", "<cmd>!git checkout -- %<CR>", { noremap = true, silent = false })

--  fzf lua
-- keymap.set("n", "<leader>ko", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
-- keymap.set("n", "<leader>kf", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
-- keymap.set("n", "<leader>kb", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

-- set keymaps

-- vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
