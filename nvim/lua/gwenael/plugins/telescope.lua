return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		-- local trouble = require("trouble")
		-- local trouble_telescope = require("trouble.providers.telescope")

		-- or create your custom action
		-- local custom_actions = transform_mod({
		--		open_trouble_qflist = function(prompt_bufnr)
		--			trouble.toggle("quickfix")
		--		end,
		--	})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		local action_state = require("telescope.actions.state")

		-- allow buffer deletion with dd
		vim.keymap.set("n", "<leader>kb", function()
			builtin.buffers({
				initial_mode = "normal",
				attach_mappings = function(prompt_bufnr, map)
					local delete_buf = function()
						local current_picker = action_state.get_current_picker(prompt_bufnr)
						current_picker:delete_selection(function(selection)
							vim.api.nvim_buf_delete(selection.bufnr, { force = true })
						end)
					end

					map("n", "d", delete_buf)

					return true
				end,
			}, {
				sort_lastused = true,
				sort_mru = true,
				theme = "dropdown",
			})
		end)
	end,
}
