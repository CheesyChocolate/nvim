vim.api.nvim_create_autocmd(
	{"VimEnter"}, {
		pattern = {"*"},
		callback = function()
			if vim.bo.filetype == 'magit' then
				vim.api.nvim_command("Copilot! toggle")
			end
		end,
	}
)

return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-_>",
					--TODO: Look for better keymap
					accept_line = "<C-v>",
				},
			},
			filetypes = {
				["*"] = true,
			},
		}
	end
}
