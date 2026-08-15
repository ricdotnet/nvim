return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  opts = {
    formatters = {
      prettierd = {
        cwd = function(_, ctx)
          -- TODO: update with more files that could be seen as root for formatters
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
      python = { 'ruff_format' },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
