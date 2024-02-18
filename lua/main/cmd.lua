-- https://neovim.io/doc/user/lua.html#vim.cmd()
-- Save file as sudo on files that require root permission
-- TODO: change name > "WriteSudo" to "W!!"
vim.cmd([[command! -nargs=0 WriteSudo execute 'silent! write !sudo tee % >/dev/null' | edit!]])

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

	else
		h.hidden_all = 0
		vim.opt.showmode = true
		vim.opt.ruler = true
		vim.opt.laststatus = 2
		vim.opt.showcmd = true
	end
end
