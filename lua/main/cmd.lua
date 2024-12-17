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
local h = {hidden_all = 0}

function Toggle_hidden_all()
	local hideOptions = {}
	if h.hidden_all == 0 then
		h.hidden_all = 1
		vim.opt.showmode = false
		vim.opt.ruler = false
		vim.opt.laststatus = 0
		vim.opt.showcmd = false
		vim.opt.cmdheight = 0

	else
		h.hidden_all = 0
		vim.opt.showmode = true
		vim.opt.ruler = true
		vim.opt.laststatus = 2
		vim.opt.showcmd = true
		vim.opt.cmdheight = 1
	end
end
