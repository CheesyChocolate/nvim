-- Use CTRL-b to call copilot accept.
-- TODO: Translate to lua
-- TODO: unbound <Tab> in insert mode
vim.cmd([[
	imap <silent><script><expr> <C-k> copilot#Accept("\<CR>")
]])
vim.g.copilot_no_tab_map = true -- let g:copilot_no_tab_map = v:true
