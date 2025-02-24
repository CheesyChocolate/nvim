vim.api.nvim_create_autocmd(
	{ "VimEnter" }, {
		pattern = { "*" },
		callback = function()
			if vim.bo.filetype == 'magit' then
				vim.api.nvim_command("Copilot! toggle")
			end
		end,
	}
)

return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	config = function()
		require("copilot").setup {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 25,
				keymap = {
					accept = "<C-_>",
					--TODO: Look for better keymap
					accept_line = "<C-v>",
					next = false,
					prev = false,
					dismiss = false,
				},
			},
			filetypes = {
				["*"] = true,
			},
		}
	end
}
