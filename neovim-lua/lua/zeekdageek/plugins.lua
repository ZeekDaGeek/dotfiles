-- Automatically install packer on load
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
    use 'wbthomason/packer.nvim'

    -- Sorry for the excess comments, it helps me keep track of plugins that
    -- I'm not actually using and should be uninstalled.

    -- anything marked --vim is not yet lua

    -- required for many plugins
    use 'kyazdani42/nvim-web-devicons'

    -- Fancy top and bottom status lines
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        config = function()
            require('bufferline').setup {}
        end
    }
    use 'nvim-lualine/lualine.nvim'

    -- Nord theme that matches everything
    use 'arcticicestudio/nord-vim'

    --  Tree style file browser
    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly'
    }

    --  Close buffers without closing the pane
    use 'moll/vim-bbye'

    --  Git tool for vim
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    -- A start screen when opening vim (my form of project management)
    use 'mhinz/vim-startify' --vim

    -- Ctrl+HJKL move between vim panes first then Tmux panes
    use 'christoomey/vim-tmux-navigator' --vim

    -- Handle whitespace better when pasting
    --use 'sickill/vim-pasta' --vim

    -- Add the verb s for surround (ds' = delete surrounding ')
    use {
        'kylechui/nvim-surround',
        tag = '*',
        config = function()
            require('nvim-surround').setup()
        end,
    }

    -- Make pairs of quotes / brackets easier
    use 'windwp/nvim-autopairs'

    -- Space align text using :Tab
    use 'godlygeek/tabular' --vim

    -- gS and gJ to expand / contract one-liners
    use 'AndrewRadev/splitjoin.vim' --vim

    -- note taking and organization file type
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup_ts_grammar()

            require('orgmode').setup {
                org_hide_leading_stars = true,
            }
        end
    }
    use {
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup {}
        end
    }
    -- orgmode style tables
    use 'dhruvasagar/vim-table-mode'

    -- automatically deal with swap files
    use 'gioele/vim-autoswap' --vim

    -- toggle making a pane fullscreen
    use 'dhruvasagar/vim-zoom'

    -- emmet expansion (eg. ul>li*5)
    use 'mattn/emmet-vim'

    -- adds :DirDiff for comparing folders
    use 'will133/vim-dirdiff'

    -- a floating window search utility
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- fuzzy file finder, auto updating hook
    use { 'junegunn/fzf', run = "./install --all" }

    -- a engine for syntax highlighing
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }

    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'neovim/nvim-lspconfig' -- LSP
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'L3MON4D3/LuaSnip'
    --use 'saadparwaiz1/cmp_luasnip'

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    ---- Plugins that are mirrored by a vim-scripts GitHub bot (no longer updated)
    -- Save folds and cursor position on save
    use 'vim-scripts/restore_view.vim'


    if packer_bootstrap then
        require('packer').sync()
    end

end,
})
