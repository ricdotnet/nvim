return function(capabilities, on_attach)
  require("lspconfig")["ts_ls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
