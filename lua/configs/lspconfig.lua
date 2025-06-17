local servers = { 'luals', 'html', 'cssls', 'vue_ls', 'eslint', 'tsserver', 'tailwindcss' }
vim.lsp.enable(servers)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('luals', {
  cmd = { 'lua-language-server', '--stdio' },
  filetypes = { 'lua' },
})

vim.lsp.config('tsserver', {
  capabilities = capabilities,
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})

vim.lsp.config('vue_ls', {
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

vim.lsp.config('tailwindcss', {
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

vim.lsp.config('eslint', {
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
