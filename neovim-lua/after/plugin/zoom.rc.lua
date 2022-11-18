-- Can't use require to check for a classic vim plugin?
--local status, _ = pcall(require, 'vim-zoom')
--if (not status) then return end

-- Zooming closes nvim-tree, or else an orphan buffer is created

vim.keymap.set('n', '<Leader>z', function()
    local view = require('nvim-tree.view')
    if view.is_visible() then
        view.close()
    end
    vim.fn['zoom#toggle']()
end)
