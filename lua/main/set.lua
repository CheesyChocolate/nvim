-- global settings
vim.g.node_host_prog = '/usr/bin/neovim-node-host'

vim.opt.title = true
vim.opt.go = "a"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = false
vim.opt.encoding = "utf-8"

-- I don't like this
-- vim.opt.guicursor = ""

-- faster load time
-- vim.loader.enable() -- TODO: enable this

-- relative line number
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

-- colors
vim.opt.bg = "dark"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- column bar at 80 characters
vim.opt.colorcolumn = "80"

-- window split position ( bottom, right )
vim.opt.splitbelow = true
vim.opt.splitright = true

-- autocompletion
vim.opt.wildmode = { "longest", "list", "full" }

-- netrw settings -- TODO: enable this after mastering netrw
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
