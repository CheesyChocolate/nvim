vim.api.nvim_create_user_command(
	'WriteSudo',
	function()
		vim.api.nvim_command('silent! write !sudo tee % >/dev/null')
		vim.api.nvim_command('edit!')
	end,
	{
		nargs = 0,
		desc = 'Save file with sudo on files that require root permission',
	}
)

-- Function for toggling the bottom statusbar:
local hidden_all = false
function Toggle_hidden_all()
	vim.opt.showmode = hidden_all
	vim.opt.ruler = hidden_all
	vim.opt.laststatus = hidden_all and 2 or 0
	vim.opt.showcmd = hidden_all
	vim.opt.cmdheight = hidden_all and 1 or 0
	hidden_all = not hidden_all
end
