return {

    -- A start screen when opening vim (my form of project management)
    {
        'mhinz/vim-startify', --vim
        config = function ()

            vim.cmd([[
            let g:startify_session_persistence = 1       " Save sessions automatically.
            let g:startify_session_dir = '~/.config/nvim/sessions'

            let g:startify_lists = [
                    \ { 'type': 'sessions',  'header': ['  Saved Sessions'] },
                    \ { 'type': 'bookmarks', 'header': ['  Bookmarks']      },
                    \ { 'type': 'commands',  'header': ['  Commands']       },
                \ ]
            "        \ { 'type': 'files',     'header': ['  Recent Files']   },

            let g:startify_session_before_save = [
                    \ 'silent! NvimTreeClose'
                \ ]

            let g:startify_bookmarks = [
                    \ '/c/Users/ZeekPC/Documents/Curse/Minecraft/Instances/'
                \ ]
            ]])

        end,
    },

    --  Close buffers without closing the pane
    'moll/vim-bbye',

    -- Ctrl+HJKL move between vim panes first then Tmux panes
    'christoomey/vim-tmux-navigator', --vim

    -- automatically deal with swap files
    'gioele/vim-autoswap', --vim

    -- toggle making a pane fullscreen
    {
        'dhruvasagar/vim-zoom', --vim
        config = function()
            vim.keymap.set('n', '<Leader>z', function()
                local view = require('nvim-tree.view')
                if view.is_visible() then
                    view.close()
                end
                vim.fn['zoom#toggle']()
            end)
        end,
    },

    --  Tree style file browser
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
            auto_reload_on_write = true,
            sync_root_with_cwd = true,
            reload_on_bufenter = true,
            renderer = {
                group_empty = true,
                -- highlight_opened_files = 'all', -- too inconsistant
            },
            actions = {
                change_dir = {
                    global = true,
                },
            },
            git = {
                ignore = false,
            },
            update_focused_file = {
                enable = true,
            },
        },
        config = function()
            vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')

            -- If you type :q and the last thing open is NvimTree then close
            -- Prevents instances of :q<CR>:q<CR>
            vim.api.nvim_create_autocmd("QuitPre", {
              callback = function()
                local tree_wins = {}
                local floating_wins = {}
                local wins = vim.api.nvim_list_wins()
                for _, w in ipairs(wins) do
                  local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                  if bufname:match("NvimTree_") ~= nil then
                    table.insert(tree_wins, w)
                  end
                  if vim.api.nvim_win_get_config(w).relative ~= '' then
                    table.insert(floating_wins, w)
                  end
                end
                if 1 == #wins - #floating_wins - #tree_wins then
                  -- Should quit, so we close all invalid windows.
                  for _, w in ipairs(tree_wins) do
                    vim.api.nvim_win_close(w, true)
                  end
                end
              end
            })
        end,
    },

    -- a floating window search utility
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            },
            'nvim-telescope/telescope-file-browser.nvim',
        },
        opts = {
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
        },
        config = function ()

            local telescope = require('telescope')

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

        end,
    },

}
