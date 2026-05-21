return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp"
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local lsp = function(scope)
      return function() require('mini.extra').pickers.lsp({ scope = scope }) end
    end

		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local opts = { silent = true, buffer = ev.buf }
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

        -- lsp pickers using mini lsp pickers
        keymap.set("n", "gr",         lsp('references'),       opts)  
        keymap.set("n", "gd",         lsp('definition'),       opts) 
        keymap.set("n", "gD",         lsp('declaration'),      opts)
        keymap.set("n", "gi",         lsp('implementation'),   opts)
        keymap.set("n", "gy",         lsp('type_definition'),  opts)
        keymap.set("n", "<leader>ds", lsp('document_symbol'),  opts)
        keymap.set("n", "<leader>ws", lsp('workspace_symbol'), opts)

				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})

		-- used to enable autocompletion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

 -- HTML
  vim.lsp.config.html = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ" },
    root_markers = { "package.json", ".git" },
    capabilities = capabilities,
  }

  -- CSS
  vim.lsp.config.cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_markers = { "package.json", ".git" },
    capabilities = capabilities,
  }

		-- TypeScript
  vim.lsp.config.ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json" },
    capabilities = capabilities,
  }

  -- ESLint
  vim.lsp.config.eslint = {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "package.json" },
    capabilities = capabilities,
  }
  -- Enable all configured servers
  vim.lsp.enable({
    "html",
    "cssls",
    "rust_analyzer",
    "tailwindcss",
    "ts_ls",
    "eslint",
  })
		end,
}
