return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				tex = { "tex-fmt" },
				go = { "gofmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ buffer = 0, async = true })
		end, { desc = "Format buffer" })
	end,
}
