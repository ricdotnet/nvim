local lsp = vim.lsp

local servers = { 'lua_ls', 'html', 'cssls', 'ts_ls', 'vue_ls', 'eslint', 'tailwindcss', 'gopls' }
lsp.enable(servers)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

function lsp_config()
  lsp.config('lua_ls', {
    cmd = { 'lua-language-server', '--stdio' },
    filetypes = { 'lua' },
  })

  lsp.config('gopls', {
    filetypes = { 'go' },
  })

  lsp.config('ts_ls', {
    capabilities = capabilities,
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  })

  lsp.config('vue_ls', {
    filetypes = { 'vue' },
    init_options = {
      vue = {
        hybridMode = false,
      },
      typescript = {
        tsdk = vim.fn.expand '~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
      },
    },
  })

  lsp.config('tailwindcss', {
    filetypes = {
      'html',
      'css',
      'scss',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
    },
  })

  lsp.config('eslint', {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
    },
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    settings = {
      experimental = {
        useFlatConfig = true,
      },
    },
  })
end

return {
  'neovim/nvim-lspconfig',
  config = lsp_config(),
}
