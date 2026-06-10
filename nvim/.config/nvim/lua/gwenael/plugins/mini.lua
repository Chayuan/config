return { 
  'nvim-mini/mini.nvim', 
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  version = '*',
  config = function()
    local tabline = require('mini.tabline')
    local pick = require('mini.pick')
		local comment = require("mini.comment")
    local icons = require("mini.icons")
    local extra = require("mini.extra")
    local files = require("mini.files")
		local keymap = vim.keymap

    pick.setup()
    tabline.setup({
      format = function(buf_id, label)
        if vim.bo[buf_id].modified then label = "* " .. label end
        return tabline.default_format(buf_id, label)
      end,
    })
    extra.setup()

    local function set_tabline_hl()
      vim.api.nvim_set_hl(0, "MiniTablineCurrent",         { bold = true, fg = "#61afef", reverse = true })
      vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { bold = true, fg = "#e5c07b", reverse = true })
    end
    set_tabline_hl()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_tabline_hl })
    files.setup({
      mappings = {
        
      }
    })
    icons.setup()

    local minifiles_toggle = function()
      if not MiniFiles.close() then MiniFiles.open() end
    end

    keymap.set("n", "<leader>e", function() minifiles_toggle() end)

    keymap.set("n", "<leader>rt", function()
      local path = vim.api.nvim_buf_get_name(0)
      if path == "" or vim.fn.filereadable(path) == 0 then
        path = vim.fn.getcwd()
      end
      MiniFiles.open(path)
    end, { desc = "Reveal current file in mini.files" })

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
		keymap.set("n", "<leader>m", function() extra.pickers.git_files({ scope="modified" }) end,
      { desc = "All modified files" })
		keymap.set("n", "<leader>kg", function() extra.pickers.git_files() end, 
      { desc = "All git files" })
		keymap.set("n", "<leader>bb", function() pick.registry.buffers() end, 
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
