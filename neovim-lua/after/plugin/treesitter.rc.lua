local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end


treesitter.setup {
    auto_install = true,
    ensure_installed = {
        "lua",
        "org",
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
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
