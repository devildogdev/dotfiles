return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    { 'kyazdani42/nvim-web-devicons' },
  },
  opts = {
    options = {
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { 'filename' },
      lualine_z = { 'location','progress' }
    },
  },
}
