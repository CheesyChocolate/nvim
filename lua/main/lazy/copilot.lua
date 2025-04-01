local force_toggle = {
	"magit",
	"copilot-chat",
}

vim.api.nvim_create_autocmd(
	{ "VimEnter" , "BufWinEnter" }, {
		callback = function()
			if vim.tbl_contains(force_toggle, vim.bo.filetype) then
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
