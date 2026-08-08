return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  opts = {
    formatters = {
      prettierd = {
        cwd = function(self, ctx)
          -- Searches upwards from the current buffer to find the /ui project root
          return vim.fs.root(ctx.buf, { '.prettierrc.json', '.prettierrc', 'package.json' })
        end,
      },
    },

    formatters_by_ft = {
      lua = { 'stylua' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      vue = { 'prettierd' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      json = { 'prettierd' },
      -- javascriptjsx = { "prettierd", "prettier" },
      -- typescripttsx = { "prettierd", "prettier" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
