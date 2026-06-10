vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>w", ":close<CR>")

-- split windws
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically

keymap.set("n", "<leader>ne", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>pe", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

-- In caps because it's kindda dangerous !
keymap.set("n", "<leader>GR", "<cmd>!git checkout -- %<CR>", { noremap = true, silent = false })

-- Close all buffers
vim.keymap.set('n', '<leader>ba', '<cmd>%bd<CR>', { desc = 'Close all buffers' })

-- Close all buffers except the current one
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#|bd#<CR>', { desc = 'Close all buffers except current' })

vim.keymap.set('n', 'L', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', 'H', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
