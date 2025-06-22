return {
  { import = 'configs.plugins.kanagawa' },
  { import = 'configs.plugins.lualine' },
  { import = 'configs.plugins.nvim-tree' },
  { import = 'configs.plugins.nvim-cmp' },
  { import = 'configs.plugins.lazygit' },
  { import = 'configs.plugins.mason' },
  { import = 'configs.plugins.telescope' },
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

  { 'ThePrimeagen/vim-be-good' },

  { 'ricdotnet/ricdotmarker', requires = 'nvim-lua/plenary.nvim' },
  { 'andweeb/presence.nvim' },
}
