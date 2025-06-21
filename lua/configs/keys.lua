local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<leader>lg', ':LazyGit<Enter>', { desc = 'Open LazyGit' })

-- TODO: refactor these maybe
map('n', '<leader>/', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Comment line' })
map('v', '<leader>/', function()
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle block comment' })

-- telescope
map('n', '<leader>ff', ':Telescope find_files<Enter>', { desc = 'Workspace global file search' })

-- nvim tree
map('n', '<C-n>', ':NvimTreeToggle<Enter>', { desc = 'Open the file tree' })
map('n', '<C-h>', ':NvimTreeFocus<Enter>', { desc = 'Focus on the file tree' })

-- buffers things
map('n', '<leader>q', ':bd<Enter>', { desc = 'Close buffer' })
map('n', '<C-q>', ':bd<Enter>', { desc = 'Close buffer' })

-- tabs and things
map('n', '<leader>t', ':tabnew<Enter>', { desc = 'New tab' })
map('n', '<Tab>', ':BufferLineCycleNext<Enter>', { desc = 'Go to next tab' })
map('n', '<S-Tab>', ':BufferLineCyclePrev<Enter>', { desc = 'Go to previous tab' })

-- terminal
map('n', '<leader>ntt', ':tabnew term://zsh<Enter>a', { desc = 'Open a new tab with a termina' })
map('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit TERMINAL mode' })
