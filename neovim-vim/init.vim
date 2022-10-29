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

" theme plugins
Plug 'vim-airline/vim-airline'                                                  " Fancy top and bottom status lines
Plug 'vim-airline/vim-airline-themes'                                           " Themes support for Airline
Plug 'arcticicestudio/nord-vim'                                                 " Nord theme that matches everything
Plug 'ryanoasis/vim-devicons'                                                   " icons for nerdtree

Plug 'scrooloose/nerdtree'                                                      " Tree style file browser
Plug 'gcmt/taboo.vim'                                                           " Allow easy naming of tabs
Plug 'moll/vim-bbye'                                                            " Close buffers without closing the pane
Plug 'tpope/vim-fugitive'                                                       " Git tool for vim
Plug 'mhinz/vim-startify'                                                       " A start screen when opening vim (my form of project management)
Plug 'christoomey/vim-tmux-navigator'                                           " Ctrl+HJKL move between vim panes first then Tmux panes
Plug 'sickill/vim-pasta'                                                        " Handle whitespace better when pasting
Plug 'tpope/vim-surround'                                                       " Add the verb s for surround (ds' = delete surrounding ')
"Plug 'mhinz/vim-signify'                                                        " Add gutter for git differences
Plug 'jiangmiao/auto-pairs'                                                     " Make pairs of quotes / brackets easier
Plug 'godlygeek/tabular'                                                        " Space align text using :Tab
Plug 'jceb/vim-orgmode'                                                         " note taking and organization file type
Plug 'dhruvasagar/vim-table-mode'                                               " orgmode style tables
Plug 'tpope/vim-speeddating'                                                    " fast dates
Plug 'gioele/vim-autoswap'                                                      " automatically deal with swap files
Plug 'dhruvasagar/vim-zoom'                                                     " toggle making a pane fullscreen
Plug 'maksimr/vim-jsbeautify'                                                   " easy beautification of javascript
Plug 'mattn/emmet-vim'                                                          " emmet expansion (eg. ul>li*5)
Plug 'vimlab/split-term.vim'                                                    " by default :term opens in the current, this fixes it.
Plug 'will133/vim-dirdiff'                                                      " adds :DirDiff for comparing folders

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                             " fuzzy file finder, auto updating hook
"Plug 'junegunn/fzf.vim'                                                         " default fzf commands

" Plugins that are mirrored by a vim-scripts GitHub bot (no longer updated)
Plug 'vim-scripts/restore_view.vim'                                             " Save folds and cursor position on save

" plugins only compatible with neovim 0.5.0+
if has("nvim-0.5.0")
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
end

" Syntax plugins
Plug 'cespare/vim-toml'

" coc plugins
" Enable coc with ~/.config/nvim/coc.vim
"if filereadable(expand("~/.config/nvim/coc.vim"))
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}                                 " VSCode style autocomplete? Look into it.
"    source ~/.config/nvim/coc.vim
"endif
"@TODO replace with neovim lsp

call plug#end()

lua << EOF
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            ".git"
        }
    },
    extensions = {
        fzf = {
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup {
    ensure_installed = { "vim", "lua" },
    -- highlight = { enable = true },
    }
-- fix for folds
--[[
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
--]]
EOF


"""" Appearance

"syntax enable

" colorscheme monokai_nobg
colorscheme nord

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
set scrolloff=8                     " scroll screen 8 lines earlier

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

set autoread                        " automatically reloads files changed externally

" autoread only triggers when certain events happen, like checktime
" may be unneeded in 0.5?
augroup autoreadFix
    autocmd!
    autocmd FocusGained,BufEnter * :checktime
augroup END

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
let g:airline_theme = "nord"
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


"" vim-jsbeautify
command! JSBeautify :call JsBeautify()
command! JSONBeautify :call JsonBeautify()
command! JSXBeautify :call JsxBeautify()
command! HTMLBeautify :call HtmlBeautify()
command! CSSBeautify :call CssBeautify()

"" fzf.vim
" add Fzf to the start of all fzf.vim commands for less confusion
let g:fzf_command_prefix = "Fzf"



"""" keymaps

" Leader key
nnoremap <SPACE> <Nop>
let mapleader = "\<SPACE>"

" reload vimrc
nnoremap <Leader>R :source $MYVIMRC<CR>

" Word wrap is on, j and k should not skip past wrapped lines.
nmap j gj
nmap k gk

" swap 0 and ^ for getting to the beginning of a line.
nnoremap 0 ^
nnoremap ^ 0

" Clear search when pressing enter in normal mode.
nnoremap <expr> <CR> v:hlsearch==1 ? '<Cmd>nohlsearch<CR>' : '<CR>'

" Disable arrow keys
noremap <left> <Nop>
noremap <down> <Nop>
noremap <up> <Nop>
noremap <right> <Nop>
inoremap <left> <Nop>
inoremap <down> <Nop>
inoremap <up> <Nop>
inoremap <right> <Nop>

" vim-zoom
nmap <Leader>z <C-W>m

" NERDTree related
noremap <Leader>t <Cmd>NERDTreeToggle<CR>

" Switch buffers
noremap <Leader>n <Cmd>bnext<CR>
noremap <Leader>N <Cmd>bprevious<CR>
noremap <Leader>l <Cmd>blast<CR>
noremap <Leader>b <Cmd>Telescope buffers<CR>

" Telescope.vim
noremap <Leader>ff <Cmd>Telescope find_files<CR>
noremap <Leader>fe <Cmd>Telescope live_grep<CR>
noremap <Leader>fb <Cmd>Telescope buffers<CR>
noremap <Leader>fh <Cmd>Telescope help_tags<CR>
noremap <Leader>fc <Cmd>Telescope command_history<CR>
noremap <Leader>fs <Cmd>Telescope search_history<CR>

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

