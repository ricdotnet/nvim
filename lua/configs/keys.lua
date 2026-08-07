local map = vim.keymap.set
local cmd = vim.cmd
local api = vim.api

vim.g.mapleader = ' '

map('n', '<leader>lg', '<cmd>LazyGit<Enter>', { desc = 'Open LazyGit' })

map('n', '<leader>/', 'gcc', { desc = 'Toggle comment line', remap = true })
map('v', '<leader>/', 'gc,', { desc = 'Toggle comment block', remap = true })

map('n', '<leader>ff', '<cmd>Telescope find_files<Enter>', { desc = 'Workspace global file search' })
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })
map('n', '<leader>gd', function()
  require('telescope.builtin').lsp_definitions { jump_type = 'never' }
end, { desc = 'Show the current function definition', noremap = true, silent = true })
map('n', '<leader>gr', function()
  require('telescope.builtin').lsp_references { jump_type = 'never' }
end, { desc = 'Show the current token references', noremap = true, silent = true })

map('n', '<C-n>', '<cmd>NvimTreeToggle<Enter>', { desc = 'Open the file tree' })
map('n', '<C-h>', '<C-w>h', { desc = 'Focus windows on left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus window on right' })

map('n', '<leader>q', '<cmd>bd<Enter>', { desc = 'Close buffer' })
map('n', '<C-q>', function()
  -- Get list of all listed, valid buffers (excluding special/unlisted buffers)
  local buffers = vim.tbl_filter(function(buf)
    return api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.bo[buf].buftype == ''
  end, api.nvim_list_bufs())

  local current_buf = api.nvim_get_current_buf()

  if #buffers > 1 then
    -- 1. If there are other buffers available, switch to the previous one first
    cmd 'bprevious'
    -- 2. Delete the original buffer safely
    cmd('bdelete! ' .. current_buf)
  else
    -- 3. If this was the last buffer, delete it and focus/expand NvimTree
    cmd('bdelete! ' .. current_buf)
    cmd 'NvimTreeFocus'
  end
end, { desc = 'Close buffer' })

map('n', '<leader>t', '<cmd>tabnew<Enter>', { desc = 'New tab' })
map('n', '<Tab>', '<cmd>BufferLineCycleNext<Enter>', { desc = 'Go to next tab' })
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<Enter>', { desc = 'Go to previous tab' })

map({ 'n', 't' }, '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
map('n', '<leader>ntt', '<cmd>tabnew term://zsh<Enter>a', { desc = 'Open a new tab with a terminal' })
map('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit TERMINAL mode' })

map('n', '<A-j>', '<cmd>:m+1<Enter>')
map('n', '<A-k>', '<cmd>:m-2<Enter>')

map('n', '<leader>qf', function()
  vim.lsp.buf.code_action {
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  }
end, { desc = 'Apply quick fix on errors where available', noremap = true, silent = true })

map('n', '<leader>fm', function()
  local eslintLsp = vim.lsp.get_clients()

  for _, client in ipairs(eslintLsp) do
    if client.name == 'eslint' then
      cmd 'LspEslintFixAll'
    end
  end

  require('conform').format { lsp_fallback = true }
end, { desc = 'format file' })
