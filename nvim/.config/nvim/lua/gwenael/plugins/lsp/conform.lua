return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
    local javascriptFormatOptions = { "prettier", "eslint_d", stop_after_first = false }

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- Use a sub-list to run only the first available formatter of the sub-list
				python = { "black" },
				javascript = javascriptFormatOptions,
				javascriptreact = javascriptFormatOptions,
				typescript = javascriptFormatOptions,
				typescriptreact = javascriptFormatOptions,
			},
			format_after_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 5000,
				lsp_fallback = true,
				async = true,
			},
		})
	end,
}
