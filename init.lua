local set = vim.opt

-- some options
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.wrap = true
set.breakindent = true

set.number = true
set.relativenumber = true

set.hlsearch = false

set.ignorecase = true
set.smartcase = true

set.tw = 120

set.showtabline = 2
set.colorcolumn = '120'

set.termguicolors = true

set.foldmethod = 'expr'
set.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
set.foldtext = ''
set.foldlevel = 99
set.foldlevelstart = 99

-- TODO: refactor out into a auto_cmd file
-- cheers chatgptitty
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(args)
    local current = args.buf

    if vim.api.nvim_buf_get_name(current) == '' then
      return
    end

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if
        buf ~= current
        and vim.api.nvim_buf_is_valid(buf)
        and vim.bo[buf].buflisted
        and vim.bo[buf].buftype == ''
        and vim.api.nvim_buf_get_name(buf) == ''
        and not vim.bo[buf].modified
      then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})

-- requires

require 'configs.keys'
require 'configs.lazy'

require('mason').setup()
require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        highlight = 'Directory', -- or "Normal"
        text_align = 'left',
        separator = false, -- adds a vertical separator
      },
    },
  },
}

vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

require('ricdotmarker').setup()
require('presence').setup()
