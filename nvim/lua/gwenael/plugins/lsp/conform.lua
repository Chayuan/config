return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- Use a sub-list to run only the first available formatter of the sub-list
				python = { "isort", "black" },
				javascript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
			},
			format_after_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
				async = true,
			},
		})
	end,
}
