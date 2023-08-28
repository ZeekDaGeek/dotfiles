-- Automatically install lazy.nvim on load
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Nord theme that matches everything
-- screen causes 256color issues, detect it
vim.cmd [[
    if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\([-\.].*\)\?$'
        set notermguicolors
    elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\([-\.].*\)\?$'
        set termguicolors
    elseif $TERM =~ '^\(xterm\)\([-\.].*\)\?$'
        set termguicolors
    end
]]

local plugins = {
    'wbthomason/packer.nvim',

    -- Sorry for the excess comments, it helps me keep track of plugins that
    -- I'm not actually using and should be uninstalled.

    -- anything marked --vim is not yet lua

    -- required for many plugins
    'nvim-tree/nvim-web-devicons',

    -- Fancy top and bottom status lines
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup {}
        end
    },
    'nvim-lualine/lualine.nvim',


    -- only when no gui colors
    { 'arcticicestudio/nord-vim', cond = function() return (not vim.opt.termguicolors:get()) end },
    -- only with gui colors
    { 'shaunsingh/nord.nvim', cond = function() return (vim.opt.termguicolors:get()) end },

    --  Tree style file browser
    {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly'
    },

    --  Close buffers without closing the pane
    'moll/vim-bbye',

    --  Git tool for vim
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- A start screen when opening vim (my form of project management)
    'mhinz/vim-startify', --vim

    -- Ctrl+HJKL move between vim panes first then Tmux panes
    'christoomey/vim-tmux-navigator', --vim

    -- Handle whitespace better when pasting
    --use 'sickill/vim-pasta' --vim

    -- Add the verb s for surround (ds' = delete surrounding ')
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup()
        end,
    },

    -- Make pairs of quotes / brackets easier
    'windwp/nvim-autopairs',

    -- Space align text using :Tab
    'godlygeek/tabular', --vim

    -- gS and gJ to expand / contract one-liners
    'AndrewRadev/splitjoin.vim', --vim

    -- use qcalc cli in neovim
    'Apeiros-46B/qalc.nvim', --vim

    -- note taking and organization file type
    'nvim-orgmode/orgmode',
    {
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup {}
        end
    },
    -- orgmode style tables
    'dhruvasagar/vim-table-mode',

    -- automatically deal with swap files
    'gioele/vim-autoswap', --vim

    -- toggle making a pane fullscreen
    'dhruvasagar/vim-zoom',

    -- emmet expansion (eg. ul>li*5)
    'mattn/emmet-vim',

    -- adds :DirDiff for comparing folders
    'will133/vim-dirdiff',

    -- a floating window search utility
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    "nvim-telescope/telescope-file-browser.nvim",

    -- a engine for syntax highlighing
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- language server providers
    'onsails/lspkind-nvim', -- vscode-like pictograms
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
    'hrsh7th/cmp-path', -- nvim-cmp source for file paths
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
    'hrsh7th/nvim-cmp', -- Completion
    'neovim/nvim-lspconfig', -- LSP
    'jose-elias-alvarez/null-ls.nvim', -- to inject LSP diagnostics, code actions, and more
    'williamboman/mason.nvim', -- auto install + manage LSPs
    'williamboman/mason-lspconfig.nvim',

    'glepnir/lspsaga.nvim', -- LSP UIs
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    ---- Plugins that are mirrored by a vim-scripts GitHub bot (no longer updated)
    -- Save folds and cursor position on save
    'vim-scripts/restore_view.vim',

}

local opts = {}

require("lazy").setup(plugins, opts)
