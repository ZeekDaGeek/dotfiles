-- colorscheme specific overrides
-- As of Neovim 0.8.0
--   lua removes the original and replaces with the new settings
--   vim script edits only the modified sections

--vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = '#3B4252' })

-- Tired of adding and removing debug code? Me too!
local _DEBUG = false

function GetHighlight(group)

    local hl = pcall(vim.cmd, 'silent hi ' .. group)

    if hl then

        vim.cmd.redir('=> g:_tmp_current_hl')
        vim.cmd('silent highlight ' .. group)
        vim.cmd.redir('END')


        if (_DEBUG == true) then
            print(group .. ' highlight result: ' .. vim.g._tmp_current_hl)
        end

        -- Check for link
        local link = string.match(vim.g._tmp_current_hl, 'links to (%w+)')
        if (not (link == nil)) then
            return GetHighlight(link)
        end

        local args = {}

        for k,v in string.gmatch(vim.g._tmp_current_hl, '(%w+)=([#]*%w+)') do
            args[k] = v
        end

        if (_DEBUG == true) then
            vim.pretty_print(args)
        end

        return args

    else

        if (_DEBUG == true) then
            print('Cannot find a highlight group with the name: ' .. group)
        end

        return {}

    end

end

-- Get the current :highlight result then change only sepecific results
function ChangeHighlight(group, newvalues)

    local args = {
        group,
    }

    local currentvalues = GetHighlight(group)

    -- add all of the key=values to the vim.cmd args
    for k,v in pairs(currentvalues) do
        table.insert(args, string.format('%s=%s', k, tostring(v)))
    end

    -- every previous key=values are overwritten by later key=values
    -- no extra processing needs to happen, just add them to end
    for k,v in pairs(newvalues) do
        table.insert(args, string.format('%s=%s', k, tostring(v)))
    end

    if (_DEBUG == true) then
        vim.pretty_print(args)
    end

    vim.cmd.highlight(args)

end

local function clearBG(group)

    ChangeHighlight(group, { guibg = 'NONE', ctermbg = 'NONE' })

end

_TransparentBGToggle = false
_TransparentBGRestore = {}

function TransparentBG(groups, state)

    -- maybe you only want to change one value?
    if (not (type(groups) == 'table')) then
        error('expected argument #1 to be a list of highlights')
    end

    if (state == nil) then
        state = not _TransparentBGToggle
    end

    if (state) then

        -- already transparent
        if (_TransparentBGToggle) then
            return false
        end

        for _, group in pairs(groups) do
            -- ensure it's not already transparent
            if (_TransparentBGRestore[group] == nil) then
                _TransparentBGRestore[group] = GetHighlight(group)
                clearBG(group)
            end
        end

        _TransparentBGToggle = true

        return true

    else

        if (not _TransparentBGToggle) then
            return false
        end

        for _, group in ipairs(groups) do
            -- can't restore a value that wasn't saved
            if (not (_TransparentBGRestore[group] == nil)) then
                ChangeHighlight(group, _TransparentBGRestore[group])
                _TransparentBGRestore[group] = nil
            end
        end

        _TransparentBGToggle = false

        return true

    end

end


-- NvimTree with custom background
local _, nvimtree = pcall(require, 'nvim-tree')
if (nvimtree) then

    -- You can't set highlight groups unitl after setup
    nvimtree.setup {}

    ChangeHighlight(
        'NvimTreeVertSplit',
        {
            guibg = '#3B4252',
            ctermbg = '8',
        }
    )

    ChangeHighlight(
        'NvimTreeWinSeparator',
        {
            guibg = '#3B4252',
            ctermbg = '8',
        }
    )

    ChangeHighlight(
        'NvimTreeNormal',
        {
            guibg = '#3B4252',
            ctermbg = '8',
        }
    )

end

vim.g.TransparentBGGroups = { 'Normal', 'VertSplit', 'SignColumn' }

-- Create a command for :TransparentBG
vim.cmd [[
    command! TransparentBG call luaeval('TransparentBG(vim.g.TransparentBGGroups)')
]]

-- Since Windows Terminal has fancy background transparency lets take advantage.
-- I automatically start specific Terminals in ~/.config/term/windowsterminal
-- for example, then .bashrc or .zshrc can automatically export TRANSPARENCY
if (vim.env.TRANSPARENCY) then
    TransparentBG(vim.g.TransparentBGGroups)
end

-- When working with colors so much a hotkey for searching highlights is nice
local telescope = pcall(require, 'telescope')
if (telescope) then
    vim.keymap.set('n', '<leader>fi', '<Cmd>Telescope highlights<CR>')
end
