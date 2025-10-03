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

vim.o.completeopt = 'menuone,noselect'
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = false
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.mouse = 'nv'
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.scrolloff = 10
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = false

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>ef', ':Explore<CR>')
vim.keymap.set({ 'n', 'v' }, "<leader>y", [["+y]])
vim.keymap.set({ 'n', 'v' }, "<leader>yy", [["+yy]])
vim.keymap.set({ 'n' }, '<leader>Y', [["+Y]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.diagnostic.config({
  virtual_text = true
})

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
