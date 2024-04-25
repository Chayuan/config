return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
     "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap
    -- enable keybinds for available lsp server
    local on_attach = function(client, bufnr)
      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      keymap.set("n", "gr", require('telescope.builtin').lsp_references, opts)
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      -- typescript specific keymaps (e.g. rename file and update imports)
      if client.name == "tsserver" then
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
      end
    end

    -- used to enable autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Rust
    lspconfig["rust_analyzer"].setup({
      flags = flags,
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
          ['rust-analyzer'] = {
              cargo = {
                  allFeatures = true,
              },
              checkOnSave = {
                  allFeatures = true,
                  command = 'clippy',
              },
              procMacro = {
                  ignored = {
                      ['async-trait'] = { 'async_trait' },
                      ['napi-derive'] = { 'napi' },
                      ['async-recursion'] = { 'async_recursion' },
                  },
              },
          },
      },
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    }) 

    -- configure typescript server with plugin
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    })

  end,
}


