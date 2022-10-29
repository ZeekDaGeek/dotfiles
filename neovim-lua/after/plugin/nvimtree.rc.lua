local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end


nvimtree.setup {
    auto_reload_on_write = true,
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    renderer = {
        group_empty = true,
        --highlight_opened_files = 'all', -- too inconsistant
    },
    actions = {
        change_dir = {
            global = true,
        },
    },
}

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')


