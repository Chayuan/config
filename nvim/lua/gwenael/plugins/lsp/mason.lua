return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			automatic_enable = {
				exlude = {},
			},
			ensure_installed = {
				"html",
				"eslint",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
			},
		})
	end,
}
