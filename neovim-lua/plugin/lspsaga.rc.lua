local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
    server_filetype_map = {
        typescript = 'typescript'
    }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>dj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('i', '<leader>dk', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

--vim.keymap.set('n')
