-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		-- load the colorscheme here
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

return {
	"navarasu/onedark.nvim",
	dependencies = {
		"folke/tokyonight.nvim",
		"catppuccin/nvim",
	},
	priority = 1000,
	config = function()
		local dayTheme = require("tokyonight")
		local theme = require("onedark")
		local keymap = vim.keymap

		function enableDarkTheme()
			theme.setup({
				style = "dark",
			})

			vim.g.background = "dark"
			vim.opt.background = "dark"
			theme.load()
		end

		function enableLightTheme()
			vim.g.background = "light"
			vim.opt.background = "light"
			vim.cmd("colorscheme catppuccin-latte")
		end

		function toggleTheme()
			if vim.g.background == "dark" then
				enableLightTheme()
			else
				enableDarkTheme()
			end
		end

		enableDarkTheme()
		keymap.set("n", "<leader>ct", toggleTheme, { noremap = true, silent = true })
	end,
}

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

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local theme = require("tokyonight")
--
-- 		theme.setup({
-- 			variant = "day",
-- 		})
--
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

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
