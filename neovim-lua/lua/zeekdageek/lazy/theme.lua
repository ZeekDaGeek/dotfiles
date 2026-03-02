return {

    -- required for many plugins
    'nvim-tree/nvim-web-devicons',

    -- Fancy top and bottom status lines
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            local bufferline = require('bufferline')

            bufferline.setup({
                options = {
                    mode = 'buffers',
                    always_show_bufferline = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true,
                    offsets = {
                        {
                            filetype = 'NvimTree',
                            text = ' File Explorer',
                            highlight = 'PanelHeading',
                        }
                    },
                },
                highlights = {
                    buffer_selected = {
                        bold = true,
                        italic = false,
                    },
                },
            })

            vim.keymap.set('n', '<leader>n', '<Cmd>BufferLineCycleNext<CR>', {})
            vim.keymap.set('n', '<leader>N', '<Cmd>BufferLineCyclePrev<CR>', {})
        end
    },
    'nvim-lualine/lualine.nvim',

    -- only when no gui colors
    { 'arcticicestudio/nord-vim', cond = function() return (not vim.opt.termguicolors:get()) end },
    -- only with gui colors
    { 'shaunsingh/nord.nvim', cond = function() return (vim.opt.termguicolors:get()) end },

}
