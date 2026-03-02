-- Automatically install lazy.nvim on load
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Nord theme that matches everything
-- screen causes 256color issues, detect it
vim.cmd [[
    if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\([-\.].*\)\?$'
        set notermguicolors
    elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\([-\.].*\)\?$'
        set termguicolors
    elseif $TERM =~ '^\(xterm\)\([-\.].*\)\?$'
        set termguicolors
    end
]]

-- All of the plugins are stored in categories in the lazy folder
require("lazy").setup({
    spec = {
        { import = "zeekdageek.lazy" },
    },
})
