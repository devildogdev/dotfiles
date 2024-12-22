return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'json',
        'query',
        'go',
        'python',
        'javascript',
        'html',
        'css',
        'bash'
      },
      auto_install = false,
      highlight = {
        enable = true,
      },
    },
  },
}

