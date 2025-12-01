return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	config = function()
		-- Key mappings for vim-fugitive
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Git status
		keymap("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

		-- Git commands

		-- keymap("n", "<leader>Gc", ":Git commit<CR>", { desc = "Git commit" })
		-- keymap("n", "<leader>Gp", ":Git push<CR>", { desc = "Git push" })
		-- keymap("n", "<leader>gP", ":Git pull<CR>", { desc = "Git pull" })
		-- keymap("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff split" })
		keymap("n", "<leader>Gb", ":Git blame<CR>", { desc = "Git blame" })
		keymap("n", "<leader>Gl", ":Git log<CR>", { desc = "Git log" })

		-- Git branch operations
		-- keymap("n", "<leader>gB", ":Git branch<CR>", { desc = "Git branch" })
		-- keymap("n", "<leader>gco", ":Git checkout<Space>", { desc = "Git checkout" })

		-- Additional useful commands
		--keymap("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git write (stage current file)" })
		--keymap("n", "<leader>gr", ":Gread<CR>", { desc = "Git read (checkout current file)" })

		-- Merge conflict resolution
		-- keymap("n", "<leader>gh", ":diffget //2<CR>", { desc = "Get left (HEAD) during merge" })
		-- keymap("n", "<leader>gj", ":diffget //3<CR>", { desc = "Get right (branch) during merge" })
	end,
}
