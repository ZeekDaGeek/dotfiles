"" ZeekDaGeek's .vimrc Configs
" Made for nvim, hopefully portable to standard vim.

" Auto install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



"""" Load plugins
call plug#begin("~/.local/share/nvim/plugged")
Plug 'vim-airline/vim-airline'                                                  " Fancy top and bottom status lines
Plug 'vim-airline/vim-airline-themes'                                           " Themes support for Airline
Plug 'patstockwell/vim-monokai-tasty'                                           " A specific Monokai theme for Airline
Plug 'scrooloose/nerdtree'                                                      " Tree style file browser
Plug 'gcmt/taboo.vim'                                                           " Allow easy naming of tabs
Plug 'moll/vim-bbye'                                                            " Close buffers without closing the pane
Plug 'tpope/vim-fugitive'                                                       " Git tool for vim
Plug 'mhinz/vim-startify'                                                       " A start screen when opening vim (my form of project management)
Plug 'christoomey/vim-tmux-navigator'                                           " Ctrl+HJKL move between vim panes first then Tmux panes
Plug 'tmux-plugins/vim-tmux-focus-events'                                       " When focusing vim through tmux events are handled properly
Plug 'sickill/vim-pasta'                                                        " Handle whitespace better when pasting
Plug 'vim-syntastic/syntastic'                                                  " Validating syntax and offering suggestions @TODO
Plug 'ervandew/supertab'                                                        " Tab in insert for autocompletion, context aware
Plug 'kien/ctrlp.vim'                                                           " Open files easier with Ctrl+p
Plug 'rstacruz/sparkup'                                                         " Expand short hand for html (eg. div>ul>li*5)
Plug 'tpope/vim-surround'                                                       " Add the verb s for surround (ds' = delete surrounding ')
Plug 'mhinz/vim-signify'                                                        " Add gutter for git differences
Plug 'jiangmiao/auto-pairs'                                                     " Make pairs of quotes / brackets easier
Plug 'godlygeek/tabular'                                                        " Space align text using :Tab
Plug 'jceb/vim-orgmode'                                                         " note taking and organization file type
Plug 'dhruvasagar/vim-table-mode'                                               " orgmode style tables
Plug 'tpope/vim-speeddating'                                                    " fast dates
Plug 'gioele/vim-autoswap'                                                      " automatically deal with swap files
Plug 'dhruvasagar/vim-zoom'                                                     " toggle making a pane fullscreen
Plug 'ryanoasis/vim-devicons'                                                   " icons for nerdtree

" Plugins that are mirrored by a vim-scripts GitHub bot (no longer updated)
Plug 'vim-scripts/L9'                                                           " Library for FuzzyFinder
Plug 'vim-scripts/FuzzyFinder'                                                  " ??? Didn't do what I wanted.
Plug 'vim-scripts/restore_view.vim'                                             " Save folds and cursor position on save

" Syntax plugins
Plug 'cespare/vim-toml'

call plug#end()



"""" Appearance

syntax enable

" colorscheme monokai_nobg
colorscheme vim-monokai-tasty

" theme customization (needed colors borrowed from monokai-tasty)
"let s:charcoal = { "cterm": 235, "gui": "#262626" }

highlight Normal ctermbg=none guibg=none
"highlight LineNr ctermbg=235 guibg=#262626
highlight VertSplit ctermbg=none guibg=none



"""" General Config Flags

set number                          " show line numbers
set numberwidth=4                   " line numbers should be 4 wide
set relativenumber                  " show number relative to current line.
set signcolumn=yes                  " always show sign column
set wrap                            " wrap lines
set encoding=utf-8                  " set encoding to UTF-8 (default for nvim?)
set wildmenu                        " menu for tab completion of command menu
set showmatch                       " highlight matching backets
set laststatus=2                    " always show bottom bar with file
set ruler                           " display cursor position in bottom right
set belloff=all                     " disable all dings on errors

set tabstop=4                       " width of tabs
set expandtab                       " convert tabs to spaces
set shiftwidth=4                    " number of spaces to use for each step of (auto)indent
set softtabstop=4                   " backspace after pressting tab will remove up to this many spaces

set autoindent
set smartindent                     " auto indent in blocks of text

set incsearch                       " search as characters are entered
set hlsearch                        " highlights matches
set ignorecase                      " ignore case must be on for smartcase
set smartcase                       " case insensitive search unless the search string has capitals

set hidden                          " hide buffers when switching, allowing unsaved edits to a buffer (unsure if keeping)

set splitbelow                      " open horizontal splits below by default
set splitright                      " open veritical splits to the right by default

scriptencoding utf-8
set encoding=utf-8

" Better git diff algorithm (usually)
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic



"""" Plugin Config Flags

"" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "monokai_tasty"
"let g:airline_theme = "dark"

let g:airline_mode_map = {
        \ '__' : ' - ',
        \ 'n'  : ' N ',
        \ 'i'  : ' I ',
        \ 'R'  : ' R ',
        \ 'c'  : ' C ',
        \ 'v'  : ' V ',
        \ 'V'  : 'V-L',
        \ '^V' : 'V-B',
        \ 's'  : ' S ',
        \ 'S'  : 'S-L',
        \ '^S' : 'S-B',
    \ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.dirty = "!"

"" Project/Startify
let g:startify_session_persistence = 1       " Save sessions automatically.
let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['  Saved Sessions'] },
        \ { 'type': 'bookmarks', 'header': ['  Bookmarks']      },
        \ { 'type': 'commands',  'header': ['  Commands']       },
        \ { 'type': 'files',     'header': ['  Recent Files']   },
    \ ]

let g:startify_session_before_save = [
        \ 'silent! NERDTreeClose'
    \ ]

let g:startify_bookmarks = [
        \ '/c/Users/ZeekPC/Documents/Curse/Minecraft/Instances/'
    \ ]

"" restore_view.vim
set viewoptions=cursor,folds,slash,unix

"" vim-signify
let g:signify_vcs_list=['git']
let g:signify_realtime=1

"" vim-orgmode
let g:org_indent = 1
let g:org_todo_keywords = ['TODO', '|', 'LATE', 'ONTIME', 'FAIL']
let g:org_todo_keyword_faces = [
        \ ['TODO', [':foreground blue', ':background none']],
        \ ['LATE', [':foreground yellow', ':background none']],
        \ ['ONTIME', [':foreground green', ':background none']],
        \ ['FAIL', [':foreground red', ':background none']],
    \ ]

"" vim-auto-pairs
let g:AutoPairsMapSpace = 0

"" vim-zoom
nmap <leader>z <C-W>m

"" ctrlp
" Use CtrlPMixed by default when using Ctrl+P (Disabled for easier newfiles?)
let g:ctrlp_cmd = "CtrlPMixed"
" When creating a new file open it in the current window
let g:ctrlp_open_new_file = "r"



"""" Key bindings

" Leader key
let mapleader = ","

" reload vimrc
nnoremap <leader>R :source $MYVIMRC<CR>

" Word wrap is on, j and k should not skip past wrapped lines.
nmap j gj
nmap k gk

" swap 0 and ^ for getting to the beginning of a line.
nnoremap 0 ^
nnoremap ^ 0

" Clear search when pressing enter in normal mode.
nnoremap <expr> <CR> v:hlsearch==1 ? ':nohlsearch<CR>' : '<CR>'

" Disable arrow keys
noremap <left> <Nop>
noremap <down> <Nop>
noremap <up> <Nop>
noremap <right> <Nop>
inoremap <left> <Nop>
inoremap <down> <Nop>
inoremap <up> <Nop>
inoremap <right> <Nop>

" NERDTree related
noremap <Leader>t :NERDTreeToggle<CR>

" Switch buffers
noremap <Leader>n :bnext<CR>
noremap <Leader>p :bprevious<CR>
noremap <Leader>l :blast<CR>

" Easy exit for Terminal mode
tnoremap <Esc> <C-\><C-n>



"""" Other

" Highlight only when passing 80 characters
call matchadd("ColorColumn", "\\%81v", 100)
call matchadd("ColorColumn", "\\%121v", 100)

" Show tabs and trailing whitespace characters
exec "set listchars=tab:\uBB\\ ,trail:\uB7"
set list



"""" Borrowed configs from:

"" In order borrowed from
" https://chrisyeh96.github.io/2017/12/18/vimrc.html
" Damian Conway - More Instantly Better Vim



