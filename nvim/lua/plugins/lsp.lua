return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'williamboman/mason.nvim', config = true},
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function ()
          local builtin = require('telescope.builtin')
          vim.keymap.set('n', 'gd', builtin.lsp_definitions)
          vim.keymap.set('n', 'gr', builtin.lsp_references)
          vim.keymap.set('n', 'gI', builtin.lsp_implementations)
          vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions)
          vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols)
          vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols)
          vim.keymap.set('n', '<leader>xx', vim.diagnostic.setloclist)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
          vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
        end
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local servers = {
        clangd = {},
        gopls = {},
        eslint = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              workspace = {
                checkThirdParty = false,
                library = { '${3rd}/love2d/library' },
              },
            },
          },
        },
      }
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers or {}),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}

