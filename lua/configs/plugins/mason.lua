return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'lua_ls',
        'html',
        'cssls',
        'ts_ls',
        'vue_ls',
        'eslint',
        'tailwindcss',
        -- 'volar',

        'prettierd',
        'stylua',
      },
      auto_update = true,

      run_on_start = true,
      start_delay = 2000, -- optional: wait for Mason UI to load
    }
  end,
}
