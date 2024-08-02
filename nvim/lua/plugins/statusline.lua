return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    { 'kyazdani42/nvim-web-devicons' },
  },
  opts = {
    options = {
      theme = 'kanagawa',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding'},
      lualine_y = {'location'},
      lualine_z = {'progress'}
    },
  },
}
