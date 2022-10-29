local status, lualine = pcall(require, "lualine")
if (not status) then return end

local ignored_filetypes = {
    'NvimTree',
}

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        disabled_filetypes = ignored_filetypes,
        ignore_focus = ignored_filetypes,
        globalstatus = true,
    }
}
