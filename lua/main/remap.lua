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

vim.keymap.set("n", "<leader>pf", ":!opout '%:p'<CR>", { silent = true, desc = "preview file" })

vim.keymap.set("n", "<leader>pd", vim.cmd.Ex, { desc = "preview directory" })

-- buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "delete buffer" })

-- NOTE: https://github.com/ziontee113/syntax-tree-surfer
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })

vim.keymap.set({ "n", "v" }, "<leader>d ", "\"_d", { desc = "delete line to black hole" })

-- concatenates and put cursor at start
vim.keymap.set("n", "J", "mzJ`z")

-- TODO: replace with lsp
-- format paragraph and keep cursor position
vim.keymap.set("n", "=ap", "ma=ap'a")

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste over, without yanking" })
vim.keymap.set("n", "c", '"_c', { silent = true, desc = "change without yanking" })

-- Replace ex mode with gq
vim.keymap.set("n", "Q", "gq")

-- TODO
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "open tmux sessionizer" })

-- quick navigation among errors
-- replaced by lsp
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "replace word under cursor" })
vim.keymap.set("n", "S", ":%s//g<Left><Left>", { desc = "empty replace command" })

vim.keymap.set({ "n", "v" }, ",,", ":keepp /<++><CR>ca<", { silent = true, desc = "Jump to next <++>" })
vim.keymap.set("i", ",,", "<Esc>:keepp /<++><CR>ca<", { silent = true, desc = "Jump to next <++>" })

vim.keymap.set("v", ".", ":normal .<CR>", { silent = true, desc = "dot command (repeat last change)" })

-- Spell-check set to <leader>o, 'o' for 'orthography'
vim.keymap.set("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>", { silent = true, desc = "toggle spell check" })

-- Open my bibliography file in split
vim.keymap.set("n", "<leader>bb", ":vsp<space>$BIB<CR>", { silent = true, desc = "open bibliography file" })
vim.keymap.set("n", "<leader>br", ":vsp<space>$REFER<CR>", { silent = true, desc = "open reference file" })

-- Compile document, be it groff/LaTeX/markdown/etc.
vim.keymap.set("n", "<leader>c", ":w! |!compiler '%:p'<CR>", { silent = true, desc = "compile document" })
vim.keymap.set("n", "<leader>cc", ":w! |split |terminal compiler '%:p'<CR>",
	{ silent = true, desc = "compile document in interactive mode" })

-- Go magic
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
	{ silent = true, desc = "GO error handling" })

-- keymap for toggling the bottom statusbar:
vim.keymap.set("n", "<leader>h", Toggle_hidden_all, { silent = true, desc = "toggle all UI elements" })

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
