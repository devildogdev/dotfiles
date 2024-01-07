return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', },
    },
    opts = {},
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
