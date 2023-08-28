local status, telescope = pcall(require, 'telescope')
if (not status) then return end

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            ".git"
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        file_browser = {
            hijack_netrw = false,
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fe', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>b', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fc', builtin.command_history, {})
vim.keymap.set('n', '<Leader>fs', builtin.search_history, {})

vim.keymap.set('n', '<Leader>fb', "<Cmd>Telescope file_browser<CR>", {})
