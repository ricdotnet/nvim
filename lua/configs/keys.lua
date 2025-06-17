local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<Leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Comment line' })
map('v', '<leader>/', function()
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle block comment' })

-- nvim tree
map('n', '<C-n>', ':NvimTreeToggle<Enter>', { desc = 'Open the file tree' })

-- buffers things
map('n', '<Leader>q', ':bd<Enter>', { desc = 'Close buffer' })
map('n', '<C-q>', ':bd<Enter>', { desc = 'Close buffer' })

-- tabs and things
map('n', '<Leader>t', ':tabnew<Enter>', { desc = 'New tab' })
map('n', '<Tab>', ':BufferLineCycleNext<Enter>', { desc = 'Go to next tab' })
map('n', '<S-Tab>', ':BufferLineCyclePrev<Enter>', { desc = 'Go to previous tab' })
map('n', '<C-h>', ':NvimTreeFocus<Enter>', { desc = 'Focus on the file tree' })
