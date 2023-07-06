# A normal vim config

Inspired by ThePrimeagen, Luke Smith, Chris Titus and others.

Structured of ThePrimeagen lua config, great take on simple and clean config by Luke Smith and great knowledge of Chris Titus.

## ThePrimeagen

### Inspired

* packer implementation
* config directory structure
* treesitter
* treesitter/playground
* undotree
* LSP, Autocompletion and cmp
* leader key as " "
* keymap: directory navigation (different keymap "<leader>pd")
* keymap: move selected lines
* keymap: paste without yank
* keymap: buffer format
* keymap: quick navigation
* keymap: replace all function
* keymap: ",," ?????
* keymap: lsp navigation and completion
* keymap: vim file manager "<leader>pv"
* theme: ColorMyPencils

### Not Used

* theme color plugin

## Luke Smith

### Inspired

* global varibles: title, go, clipboard, showmode, ruler, laststatus, showcmd, encoding, relativenumber, wildmode, split bottom and right,
* Disables automatic commenting
* Plugin: tpope/vim-surround
* plugin: vim-airline
* Plugin: tpope/vim-commentary
* Plugin: ap/vim-css-color
* plugin: Goyo (but key binded to "g")
* plugin: vimwiki
* plugin: nvim-telescope/telescope.nvim (lf and fzf instead)
* keymap: change wihout yank
* keymap: spell-check to "o"
* keymap: Replace ex mode with gq
* keymap: Open my bibliography file in split
* keymap: replace all function
* keymap: compile document
* keymap: file preview (different keymap "<leader>pf")
* keymap: Perform dot commands over visual blocks
* cmd: save as sudo (name changed to "WriteSudo")
* cmd: Runs a script that cleans out tex build files
* cmd: Automatically deletes all trailing whitespace
* cmd: function and keymap for toggling the bottom statusbar

### Not Used

* leader key as ","
* keymap: replace function (use ThePrimeagen)
* global varibles: syntax (treesitter instead), filetype plugin (default in neovim),
* plugin: nerdtree (native instead, mapped to "<leader>pd")
* plugin: vimling
* keymap: Check file in shellcheck (use linter instead)
* keymap: split navigation
* cmd: Turns off highlighting on the bits of code that are changed
* source shortcuts. (achived natively: work in progress)

## Chris Titus

### Inspired

* keymap: Stay in indent mode

### Not Used

* global variables: wrap, breakindent, tabstop, shiftwidth, expandtab,
* packer installation and inisialization
* packer in pop-up window
* Suppress errors in Windows
* Colorscheme
* Titus Custom Markdown HUGO Image Insert
* ltex.lua
* Plugin: nvim-lua/plenary.nvim
* Plugin: numToStr/Comment.nvim (no)
* Plugin: kyazdani42/nvim-web-devicons
* Plugin: kyazdani42/nvim-tree.lua (native instead)
* Plugin: ahmedkhalf/project.nvim (lf and tag instead)
* Plugin: akinsho/toggleterm.nvim (native instead)
* Plugin: lewis6991/impatient.nvim (deprecated)
* plugin: goolord/alpha-nvim
* plugin: lukas-reineke/indent-blankline.nvim (I use 8 space indent)
* plugin: RRethy/vim-illuminate
* plugin: nvim-telescope/telescope.nvim (lf and fzf instead)
* plugin: lewis6991/gitsigns.nvim (considered, maybe add in future)
* plugin: ekickx/clipboard-image.nvim (no use)
* plugin: wakatime/vim-wakatime
* plugin: Pocco81/auto-save.nvim
* plugin: Pocco81/true-zen.nvim (considered, maybe instead of goyo)
* keymap: Better window navigation
* keymap: Resize with arrows
* keymap: Navigate buffers
* keymap: Clear highlights
* keymap: Close buffers
* keymap: Better paste (use ThePrimeagen)
* keymap: Press jj fast to enter (considering)
* keymap: normal mode end of line
* keymap: [1-5]gt
* keymap: tabnew and tabclose

## Me

### Inspired

* github copilot
* node host varible
* theme color
* undotree layout
* global varibles: updatetime,
* faster load time (vim.loader.enable())
* goyo toggle (revert keymap)
