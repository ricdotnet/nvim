local set = vim.opt
local cmd = vim.cmd

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
