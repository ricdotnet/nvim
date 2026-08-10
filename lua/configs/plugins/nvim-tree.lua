local set = vim.keymap.set

local function on_attach(bufnr)
  local api = require 'nvim-tree.api'

  -- local function opts(desc)
  --   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  set('n', '<Enter>', api.node.open.horizontal)
  set('n', '?', api.tree.toggle_help)
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      on_attach = on_attach,
      disable_netrw = true,
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
        },
      },
      hijack_directories = {
        enable = true,
        auto_open = false,
      },
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
        indent_markers = { enable = true },
      },
      filters = {
        enable = true,
        dotfiles = false,
        git_ignored = true,
        custom = { '.DS_Store' },
      },
    }
  end,
}
