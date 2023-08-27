---- ZeekDaGeek's .vimrc
-- RIP backwards compatability with vim.
require('zeekdageek.base')
require('zeekdageek.maps')
if not vim.g.vscode then
    require('zeekdageek.plugins')
end

-- helper functions
local fn = vim.fn
local opt = vim.opt
--local cmd = vim.cmd

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




-- Highlight only when passing 80 characters
vim.cmd [[
    highlight TooFar ctermfg=14 guifg=#EBCB8B
    highlight WayTooFar ctermfg=4 guifg=#BF616A

    call matchadd('TooFar', '\%81v.', 100)
    call matchadd('WayTooFar', '\%121v.', 100)
]]
-- Example of a too long line affected from above. -----------------------------------------------------------------------

-- Show tabs and trailing whitespace characters
vim.cmd [[
    exec "set listchars=tab:\uBB\\ ,trail:\uB7"
    set list
]]
