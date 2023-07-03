-- https://neovim.io/doc/user/lua.html#vim.cmd()
-- Save file as sudo on files that require root permission
-- TODO: change name > "WriteSudo" to "W!!"
vim.cmd([[command! -nargs=0 WriteSudo execute 'silent! write !sudo tee % >/dev/null' | edit!]])

-- Runs a script that cleans out tex build files whenever I close out of a .tex file.
vim.api.nvim_create_autocmd(
	"VimLeave", {
		pattern = "*.tex",
		command = "!texclear %"
	}
)

-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = "let currPos = getpos('.')"
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = [[%s/\s\+$//e]]
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = [[%s/\n\+\%$//e]]
	}
)
-- add trailing newline for ANSI C standard
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*.[ch]",
		command = [["%s/\%$/\r/e]]
	}
)
-- dash-dash-space signature delimiter in emails
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*neomutt*",
		command = [[%s/^--$/-- /e]]
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "*",
		command = "cal cursor(currPos[1], currPos[2])"
	}
)

-- When shortcut files are updated, renew bash and zsh and etc configs with new material
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "bm-files,bm-dirs",
		command = "!shortcuts"
	}
)

-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "Xresources,Xdefaults,xresources,xdefaults",
		command = "set filetype=xdefaults"
	}
)
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "Xresources,Xdefaults,xresources,xdefaults",
		command = "!xrdb %"
	}
)

-- Recompile dwmblocks on config edit.
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "~/.local/src/dwmblocks/config.h",
		command = "!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }"
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

	else
		h.hidden_all = 0
		vim.opt.showmode = true
		vim.opt.ruler = true
		vim.opt.laststatus = 2
		vim.opt.showcmd = true
	end
end
