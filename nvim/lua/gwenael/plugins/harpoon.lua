return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		local keymap = vim.keymap

		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)
		keymap.set("n", "<leader>hj", function()
			harpoon:list():next()
		end)
		keymap.set("n", "<leader>hk", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end)
	end,
}
