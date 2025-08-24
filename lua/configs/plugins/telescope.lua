return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  opts = {
    defaults = {
      prompt_prefix = '   ',
      selection_caret = ' ',
      entry_prefix = ' ',
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
    },
    on_setup = function(telescope)
      local actions = require('telescope.actions')

      telescope.setup {
        defaults = {
          mappings = {
            n = { ['q'] = actions.close },
          },
        },
      }
    end,

    extensions_list = { 'themes', 'terms' },
    extensions = {},
  },
}
