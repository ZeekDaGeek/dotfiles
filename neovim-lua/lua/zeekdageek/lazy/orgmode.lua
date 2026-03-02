return {

    -- note taking and organization file type
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            'nvim-orgmode/org-bullets.nvim',
        },
        event = 'VeryLazy',
        ft = { 'org' },
        config = function ()
            require('orgmode').setup({
                org_agenda_files = { '/Dropbox/Notes/org/**/*' },
                org_default_notes_file = '/Dropbox/Notes/org/notes.org',

                org_hide_leading_stars = true,
                win_split_mode = 'float',
            })

            vim.lsp.enable('org')

            require('org-bullets').setup {}
        end,
    },

    -- orgmode style tables
    'dhruvasagar/vim-table-mode',

}
