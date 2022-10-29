-- Project/Startify
vim.cmd([[
let g:startify_session_persistence = 1       " Save sessions automatically.
let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['  Saved Sessions'] },
        \ { 'type': 'bookmarks', 'header': ['  Bookmarks']      },
        \ { 'type': 'commands',  'header': ['  Commands']       },
        \ { 'type': 'files',     'header': ['  Recent Files']   },
    \ ]

let g:startify_session_before_save = [
        \ 'silent! NvimTreeClose'
    \ ]

let g:startify_bookmarks = [
        \ '/c/Users/ZeekPC/Documents/Curse/Minecraft/Instances/'
    \ ]
]])
