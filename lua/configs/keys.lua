local map = vim.keymap.set
local api = vim.api
local fn = vim.fn

vim.g.mapleader = ' '

map('n', '<leader>lg', '<cmd>LazyGit<Enter>', { desc = 'Open LazyGit' })

map('n', '<leader>/', 'gcc', { desc = 'Toggle comment line' })
map('v', '<leader>/', 'gc,', { desc = 'Toggle comment block' })

map('n', '<leader>ff', '<cmd>Telescope find_files<Enter>', { desc = 'Workspace global file search' })
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })

map('n', '<C-n>', '<cmd>NvimTreeToggle<Enter>', { desc = 'Open the file tree' })
map('n', '<C-h>', '<C-w>h', { desc = 'Focus windows on left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus window on right' })

map('n', '<leader>q', '<cmd>bd<Enter>', { desc = 'Close buffer' })
map('n', '<C-q>', '<cmd>bd<Enter>', { desc = 'Close buffer' })

map('n', '<leader>t', '<cmd>tabnew<Enter>', { desc = 'New tab' })
map('n', '<Tab>', '<cmd>BufferLineCycleNext<Enter>', { desc = 'Go to next tab' })
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<Enter>', { desc = 'Go to previous tab' })

map('n', '<leader>ntt', '<cmd>tabnew term://zsh<Enter>a', { desc = 'Open a new tab with a termina' })
map('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit TERMINAL mode' })
