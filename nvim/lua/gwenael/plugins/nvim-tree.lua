return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1

		local keymap = vim.keymap
		--  vim.keymap.set("n", "<leader>so", nvimtree.system_open, opts("Open"))

		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
		nvimtree.setup({
			--  renderer = {
			--   icons = {
			--     glyphs = {
			--       folder = {
			--         arrow_closed = "", -- arrow when folder is closed
			--         arrow_open = "", -- arrow when folder is open
			--       },
			--     },
			--   },
			-- },
			--
			git = {
				ignore = false,
			},
			view = {
				-- this makes the width dynamic based on the longest line
				width = {},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}

--  vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
