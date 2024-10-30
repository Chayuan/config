-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		-- load the colorscheme here
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

-- return {
-- 	"navarasu/onedark.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		local theme = require("onedark")
-- 		theme.setup({
-- 			style = "light",
-- 		})
-- 		theme.load()
-- 	end,
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	priority = 1000,
-- 	config = function()
-- 		local theme = require("rose-pine")
-- 		theme.setup({
-- 			variant = "dawn", -- auto, main, moon, or dawn
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local theme = require("tokyonight")

		theme.setup({
			variant = "day",
		})

		vim.cmd("colorscheme tokyonight")
	end,
}

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "latte",
-- 			background = {
-- 				light = "latte",
-- 				dark = "mocha",
-- 			},
-- 		})
-- 	end,
-- }
