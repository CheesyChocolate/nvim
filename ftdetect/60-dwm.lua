-- Recompile dwmblocks on config edit.
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "~/.local/src/dwmblocks/config.h",
		command = "!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }"
	}
)
