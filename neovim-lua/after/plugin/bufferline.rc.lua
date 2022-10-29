local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

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
