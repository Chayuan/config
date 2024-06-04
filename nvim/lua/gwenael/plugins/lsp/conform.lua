return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },

				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier", "eslint_d", "eslint" } },
				javascriptreact = { { "prettierd", "prettier", "eslint_d", "eslint" } },
				typescript = { { "prettierd", "prettier", "eslint_d", "eslint" } },
				typescriptreact = { { "prettierd", "prettier", "eslint_d", "eslint" } },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
				async = true,
			},
		})
	end,
}
