local lsp = vim.lsp

local servers = { 'lua_ls', 'html', 'cssls', 'ts_ls', 'eslint', 'tailwindcss', 'gopls' }
lsp.enable(servers)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp_config()
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
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
    init_options = {
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
          languages = { 'vue' },
        },
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
