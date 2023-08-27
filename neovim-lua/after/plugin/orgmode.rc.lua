local status, orgmode = pcall(require, 'orgmode')
if (not status) then return end

orgmode.setup_ts_grammar()

-- Treesitter configuration
local tsStatus, tsConfigs = pcall(require, 'nvim-treesitter.configs')
if (tsStatus) then
    tsConfigs.setup {
      -- If TS highlights are not enabled at all, or disabled via `disable` prop,
      -- highlighting will fallback to default Vim syntax highlighting
      highlight = {
        enable = true,
        -- Required for spellcheck, some LaTex highlights and
        -- code block highlights that do not have ts grammar
        additional_vim_regex_highlighting = {'org'},
      },
      ensure_installed = {'org'}, -- Or run :TSUpdate org
    }
end

orgmode.setup {
    org_agenda_files = { '/Dropbox/Notes/org/**/*' },
    org_default_notes_file = '/Dropbox/Notes/org/notes.org',

    org_hide_leading_stars = true,
    win_split_mode = 'float',
}


