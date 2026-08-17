require 'configs.keys.functions'

local map = vim.keymap.set
vim.g.mapleader = ' '

map('n', '<leader>lg', '<cmd>LazyGit<Enter>', { desc = 'Open LazyGit' })

map('n', '<leader>/', 'gcc', { desc = 'Toggle comment line', remap = true })
map('v', '<leader>/', 'gc,', { desc = 'Toggle comment block', remap = true })

map('n', '<leader>ff', '<cmd>Telescope find_files<Enter>', { desc = 'Workspace global file search' })
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })
map('n', '<leader>gd', Keys.defs, { desc = 'Show the current function definition', noremap = true, silent = true })
map('n', '<leader>gr', Keys.refs, { desc = 'Show the current token references', noremap = true, silent = true })

map('n', '<C-n>', '<cmd>NvimTreeToggle<Enter>', { desc = 'Open the file tree' })
map('n', '<C-h>', '<C-w>h', { desc = 'Focus windows on left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus window on right' })

map('n', '<leader>q', Keys.delete_buffer, { desc = 'Close buffer' })
map('n', '<C-q>', Keys.delete_buffer, { desc = 'Close buffer' })

map('n', '<leader>t', '<cmd>tabnew<Enter>', { desc = 'New tab' })
map('n', '<Tab>', '<cmd>BufferLineCycleNext<Enter>', { desc = 'Go to next tab' })
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<Enter>', { desc = 'Go to previous tab' })

map({ 'n', 't' }, '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
map('n', '<leader>ntt', '<cmd>tabnew term://zsh<Enter>a', { desc = 'Open a new tab with a terminal' })
map('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit TERMINAL mode' })

map('n', '<A-j>', '<cmd>:m+1<Enter>')
map('n', '<A-k>', '<cmd>:m-2<Enter>')

map(
  'n',
  '<leader>qf',
  Keys.quick_fix,
  { desc = 'Apply quick fix on errors where available', noremap = true, silent = true }
)

map('n', '<leader>fm', Keys.format, { desc = 'format file' })
