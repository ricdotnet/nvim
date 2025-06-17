return {
  formatters = {
    prettierd = {
      require_cwd = true,
    },
  },

  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    vue = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    -- javascriptjsx = { "prettierd", "prettier" },
    -- typescripttsx = { "prettierd", "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
