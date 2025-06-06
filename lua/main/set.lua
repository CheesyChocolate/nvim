-- global settings

-- disable nvim intro
vim.opt.shortmess:append("sI")

vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = true
vim.opt.encoding = "utf-8"

-- tab settings
vim.o.shiftround = true

-- disable providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- faster load time
vim.loader.enable()

-- relative line number
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

-- indent wrapped lines
vim.opt.breakindent = true

-- search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
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

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
