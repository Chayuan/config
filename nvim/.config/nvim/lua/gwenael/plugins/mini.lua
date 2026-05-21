return { 
  'nvim-mini/mini.nvim', 
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  version = '*',
  config = function()
    local pick = require('mini.pick')
		local comment = require("mini.comment")
    local extra = require("mini.extra")
		local keymap = vim.keymap

    pick.setup()
    extra.setup()

    pick.registry.buffers = function(local_opts)
      local wipeout_func = function() vim.api.nvim_buf_delete(pick.get_picker_matches().current.bufnr, { force=true }) end

      pick.builtin.buffers(local_opts, { 
        mappings = { wipeout = { char = 'd', func = wipeout_func } },
        window = { prompt_cursor = '' },
      })
    end


	  keymap.set("n", "<leader>o", function() pick.builtin.files({ tool = 'git' }) end)
		keymap.set("n", "<leader>f", function() pick.builtin.grep_live() end, 
      { desc = "Find string in cwd" })
		keymap.set("n", "<leader>m", function() extra.pickers.git_hunks() end,
      { desc = "All modified files" })
		keymap.set("n", "<leader>kg", function() extra.pickers.git_files() end, 
      { desc = "Modified git files" })

		keymap.set("n", "<leader>b", function() pick.registry.buffers() end, 
      { desc = "Opened buffers" })

   		comment.setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})
  end,
}
