return {

    -- language server providers
    'onsails/lspkind-nvim', -- vscode-like pictograms
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
    'hrsh7th/cmp-path', -- nvim-cmp source for file paths
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
    'hrsh7th/nvim-cmp', -- Completion
    'neovim/nvim-lspconfig', -- LSP
    'nvimtools/none-ls.nvim', -- to inject LSP diagnostics, code actions, and more
    {
        'williamboman/mason.nvim', -- auto install + manage LSPs
        opts = {}
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function ()
            require('mason-lspconfig').setup {
                automatic_installation = true,
            }
        end,
    },

    'glepnir/lspsaga.nvim', -- LSP UIs
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

}
