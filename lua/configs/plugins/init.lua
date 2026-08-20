return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
  },

  { import = 'configs.plugins.telescope' },
  { import = 'configs.plugins.kanagawa' },
  { import = 'configs.plugins.lualine' },
  { import = 'configs.plugins.nvim-tree' },
  { import = 'configs.plugins.nvim-cmp' },
  { import = 'configs.plugins.lazygit' },
  { import = 'configs.plugins.mason' },
  { import = 'configs.plugins.conform' },
  { import = 'configs.plugins.lsp' },

  {
    'mason-org/mason.nvim',
    build = ':MasonUpdate',
    config = true,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    config = true,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local kanagawa = require 'kanagawa.colors'
      local palette_colors = kanagawa.setup().palette
      vim.api.nvim_set_hl(0, 'WhichKeyNormal', { bg = palette_colors.dragonBlack1 })

      return {
        triggers = {
          { '<leader>', mode = { 'n', 'v' } },
        },
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'typescript', 'tsx', 'javascript', 'go', 'vue', 'python', 'json' },
        highlight = { enable = true },
        auto_install = true,
      }
    end,
  },

  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
    opts = {
      enabled = true,
      message_template = ' <summary> • <date> • <author> • <<sha>>',
      date_format = '%d/%m/%Y %H:%M:%S',
      virtual_text_column = 1,
    },
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'numToStr/FTerm.nvim' },
  { 'ricdotnet/ricdotmarker', requires = 'nvim-lua/plenary.nvim' },
  { 'wakatime/vim-wakatime' },
  { 'ThePrimeagen/vim-be-good' },
}
