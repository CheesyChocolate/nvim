-- https://neovim.io/doc/user/lua.html#vim.cmd()
-- Save file as sudo on files that require root permission
-- TODO: change name > "WriteSudo" to "W!!"
vim.cmd([[command! -nargs=0 WriteSudo execute 'silent! write !sudo tee % >/dev/null' | edit!]])
