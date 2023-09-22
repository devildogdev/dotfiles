local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

-- THEME
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none'
              }
            }
          }
        }
      })
      require('kanagawa').load('dragon')
    end,
  },

-- GIT
-- TODO: Setup and keybinds
  'tpope/vim-fugitive',

-- DEVELOPMENT
  'tpope/vim-sleuth',
  { 'windwp/nvim-autopairs', opts = {} },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    opts = {},
  },

-- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        opts = {},
      },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Completion
      {
         'hrsh7th/nvim-cmp',
         config = function()
           local cmp = require('cmp')
           cmp.setup({
             mapping = {
               ['<CR>'] = cmp.mapping.confirm({select = false}),
             }
           })
         end,
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'onsails/lspkind.nvim' },
    config = function()
      local lsp = require('lsp-zero').preset({
        manage_nvim_cmp = {
          set_sources = 'recommended',
          set_extra_mappings = true
        },
      })
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)
      lsp.setup_servers({'tsserver', 'python-lsp-server', 'lua_ls'})
    end,
    },
  },
  -- TREESITTER
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    opts = {
      ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'python',
        'html',
        'css',
        'javascript',
        'json',
      },
    },
  },

-- STATUSLINE
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons' },
    },
    opts = {
      options = {
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', {'datetime', style = '%H:%M'}},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    },
  },

-- FILE EXPLORER
  {
    -- TODO: Read docs [Maybe use netrw instead]
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = { 'MunifTanjim/nui.nvim' },
    keys = {
      { '<leader>ef', '<cmd>Neotree toggle<cr>', },
    },
    opts = {},
  },

-- FUZZY FINDER
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
}, {})

