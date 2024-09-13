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
	priority = 1000,
	config = function()
		local theme = require("onedark")
		theme.setup({
			style = "darker",
		})
		theme.load()
	end,
}

-- return {
-- 	"rose-pine/neovim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "dawn", -- auto, main, moon, or dawn
-- 		})
-- 	end,
-- }
