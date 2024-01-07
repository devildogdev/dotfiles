return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function()
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      experimental = {
        ghost_text = true,
      },
    })
  end
}
