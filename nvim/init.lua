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

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.netrw_banner = false

vim.g.loaded_perl_provider = false
vim.g.loaded_ruby_provider = false
vim.g.loaded_python3_provider = false
vim.g.loaded_node_provider = false

require('options')
require('keymaps')
require('lazy').setup({
  spec = {
    { import = 'plugins' }
  },
  rocks = {
    enabled = false,
    hererocks = false,
  },
  install = { colorscheme = { 'catppuccin-mocha' } },
})
