return {

    -- a engine for syntax highlighing
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            auto_install = true,
            ensure_installed = {
                "lua",
                -- "org",
                "vim",
                "php",
                "json",
                "yaml",
                "tsx",
                "typescript",
                "toml",
                "css",
                "html",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'org' },
            },
            indent = {
                enable = true,
            },
        },
        --[[
        config = function()
            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
        end,
        --]]
    },

    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    ---- Plugins that are mirrored by a vim-scripts GitHub bot (no longer updated)
    -- Save folds and cursor position on save
    'vim-scripts/restore_view.vim',

}
