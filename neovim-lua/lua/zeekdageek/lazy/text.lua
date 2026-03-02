return {

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
    {
        'windwp/nvim-autopairs',
        opts = {
            disable_filetype = { 'TelescopePrompt', 'NvimTree', 'vim' },
        },
    },

    -- Space align text using :Tab
    'godlygeek/tabular', --vim

    -- gS and gJ to expand / contract one-liners
    'AndrewRadev/splitjoin.vim', --vim

    -- emmet expansion (eg. ul>li*5)
    'mattn/emmet-vim',

}
