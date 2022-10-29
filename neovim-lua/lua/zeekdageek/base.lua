---- Helper variables

local opt = vim.opt
local cmd = vim.cmd


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

---- Appearance

cmd [[silent! colorscheme nord]]

vim.g.nord_uniform_diff_background = 1

opt.mouse = '' -- disable mouse

opt.number = true -- show line numbers
opt.numberwidth = 4 -- line numbers should be 4 wide
opt.relativenumber = true -- show number relative to current line.
opt.signcolumn = 'yes' -- always show sign column
opt.wrap = true -- wrap lines
opt.encoding = 'utf-8' -- set encoding to UTF-8 (default for nvim?)
opt.wildmenu = true -- menu for tab completion of command menu
opt.showmatch = true -- highlight matching backets
opt.laststatus = 2 -- always show bottom bar with file
opt.ruler = true -- display cursor position in bottom right
opt.belloff = 'all' -- disable all dings on errors
opt.scrolloff = 8 -- scroll screen 8 lines earlier

opt.tabstop = 4 -- width of tabs
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- number of spaces to use for each step of (auto)indent
opt.softtabstop = 4 -- backspace after pressting tab will remove up to this many spaces

opt.autoindent = true
opt.smartindent = true -- auto indent in blocks of text

opt.incsearch = true -- search as characters are entered
opt.hlsearch = true -- highlights matches
opt.ignorecase = true -- ignore case must be on for smartcase
opt.smartcase = true -- case insensitive search unless the search string has capitals

opt.hidden = true -- hide buffers when switching, allowing unsaved edits to a buffer

opt.splitbelow = true -- open horizontal splits below by default
opt.splitright = true -- open veritical splits to the right by default

opt.autoread = true -- automatically reloads files changed externally

opt.clipboard:prepend { 'unnamed', 'unnamedplus' } -- OS clipboards

-- Better git diff algorithm (usually)
opt.diffopt:append('algorithm:patience')
opt.diffopt:append('indent-heuristic')
