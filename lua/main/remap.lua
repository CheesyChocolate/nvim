-- set leader key
vim.g.mapleader = " "

-- scrolloff the end of file
-- vim.keymap.set("n", "j", "jzz")
-- vim.keymap.set("n", "k", "kzz")

-- center some quick navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- file preview with vim (preview file)
vim.keymap.set("n", "<leader>pf", ":!opout '%:p'<CR>", { silent = true })

-- file navigation with vim (preview directory)
vim.keymap.set("n", "<leader>pd", vim.cmd.Ex)

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- delete line to black hole
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- concatenates and put cursor at start
vim.keymap.set("n", "J", "mzJ`z")

-- keeping original buffer
vim.keymap.set("x", "<leader>p", [["_dP]])         -- paste over, without yanking
vim.keymap.set("n", "c", '"_c', { silent = true }) -- change without yanking

-- Replace ex mode with gq
vim.keymap.set("n", "Q", "gq")

-- TODO
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quick navigation among errors
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- keybindings for replace all
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word under cursor
vim.keymap.set("n", "S", ":%s//g<Left><Left>")                                           -- empty replce command

-- keybindings to ???
vim.keymap.set("n", ",,", [[:keepp /<++><CR>ca<]], { silent = true })
vim.keymap.set("i", ",,", "<Esc>:keepp /<++><CR>ca<", { silent = true })

-- Perform dot commands over visual blocks
vim.keymap.set("v", ".", ":normal .<CR>", { silent = true })

-- Spell-check set to <leader>o, 'o' for 'orthography'
vim.keymap.set("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>", { silent = true })

-- Open my bibliography file in split
vim.keymap.set("n", "<leader>b", ":vsp<space>$BIB<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":vsp<space>$REFER<CR>", { silent = true })

-- Compile document, be it groff/LaTeX/markdown/etc.
vim.keymap.set("n", "<leader>c", ":w! |!compiler '%:p'<CR>", { silent = true })

-- Go magic
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- keymap for toggling the bottom statusbar:
-- TODO: move to lualine conf
-- vim.keymap.set("n", "<leader>h", Toggle_hidden_all, { silent = true })

-- stay in visual mode after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- disable arrow keys
-- vim.keymap.set("n", "<up>", "<nop>")
-- vim.keymap.set("n", "<down>", "<nop>")
-- vim.keymap.set("n", "<left>", "<nop>")
-- vim.keymap.set("n", "<right>", "<nop>")
-- vim.keymap.set("v", "<up>", "<nop>")
-- vim.keymap.set("v", "<down>", "<nop>")
-- vim.keymap.set("v", "<left>", "<nop>")
-- vim.keymap.set("v", "<right>", "<nop>")
