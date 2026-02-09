return {
	"mistweaverco/kulala.nvim",
	config = function()
		local keymap = vim.keymap
		local kulala = require("kulala")

		kulala.setup({
			split_direction = "vertical",
		})

		-- make vim recognize .http extension as http files
		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		})

		keymap.set("n", "<leader>kr", kulala.run, { noremap = true, silent = true })
		-- keymap.set("n", "<C-k>", kulala.jump_prev(), { noremap = true, silent = true })
		-- keymap.set("n", "<C-j>", kulala.jump_next(), { noremap = true, silent = true })
	end,
}
