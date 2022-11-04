-- helper variables
local map = vim.keymap
local remap = { remap = false }

-- Leader key
map.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Word wrap is on, j and k should not skip past wrapped lines.
map.set('n', 'j', 'gj', remap)
map.set('n', 'k', 'gk', remap)

-- swap 0 and ^ for getting to the beginning of a line.
map.set('n', '0', '^')
map.set('n', '^', '0')

-- Clear search when pressing enter in normal mode.
map.set('n', '<CR>', function()
    return vim.v.hlsearch == 1 and "<Cmd>nohlsearch<CR>" or "<CR>"
end, { expr = true })


-- Disable arrow keys
map.set('n', '<left>', '<Nop>')
map.set('n', '<down>', '<Nop>')
map.set('n', '<up>', '<Nop>')
map.set('n', '<right>', '<Nop>')
map.set('i', '<left>', '<Nop>')
map.set('i', '<down>', '<Nop>')
map.set('i', '<up>', '<Nop>')
map.set('i', '<right>', '<Nop>')

-- vim-zoom @TODO: move
map.set('', '<leader>z', '<C-W>m', remap)


-- Easy exit for Terminal mode
map.set('t', '<Esc>', '<C-\\><C-n>')

-- Easy sourcing
map.set('n', '<leader>R', '<Cmd>source $MYVIMRC<CR>')
map.set('n', '<leader>S', '<Cmd>source %<CR>')



