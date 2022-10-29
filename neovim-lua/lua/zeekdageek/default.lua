---- ZeekDaGeek's .vimrc
-- RIP backwards compatability with vim.
require('zeekdageek.base')
require('zeekdageek.maps')
require('zeekdageek.plugins')

-- helper functions
local fn = vim.fn
local opt = vim.opt
--local cmd = vim.cmd


-- makes colors clearer
if (fn.has('termguicolors')) then
    opt.termguicolors = true
end

-- restore_view.vim
opt.viewoptions = "cursor,folds,slash,unix"

-- vim-orgmode
--[[
vim.cmd [[
let g:org_indent = 1
let g:org_todo_keywords = ['TODO', '|', 'LATE', 'ONTIME', 'FAIL']
let g:org_todo_keyword_faces = [
        \ [ 'TODO', [':foreground blue', ':background none'] ],
        \ [ 'LATE', [':foreground yellow', ':background none'] ],
        \ [ 'ONTIME', [':foreground green', ':background none'] ],
        \ [ 'FAIL', [':foreground red', ':background none'] ],
    \ ]
--]]

-- vim-auto-pairs
vim.g.AutoPairsMapSpace = 0


-- fzf.vim
-- add Fzf to the start of all fzf.vim commands for less confusion
vim.g.fzf_command_prefix = "Fzf"



---- Other

-- Highlight only when passing 80 characters
vim.cmd [[
    call matchadd('ColorColumn', '\%81v.', 100)
    call matchadd('ColorColumn', '\%121v.', 100)
]]

-- Show tabs and trailing whitespace characters
vim.cmd [[
    exec "set listchars=tab:\uBB\\ ,trail:\uB7"
    set list
]]
