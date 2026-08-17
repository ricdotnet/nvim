local api = vim.api
local cmd = vim.cmd

local function get_definitions()
  require('telescope.builtin').lsp_definitions { jump_type = 'never' }
end

local function get_references()
  require('telescope.builtin').lsp_references { jump_type = 'never' }
end

local function delete_buffer()
  local buffers = vim.tbl_filter(function(buf)
    return api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.bo[buf].buftype == ''
  end, api.nvim_list_bufs())

  local current_buf = api.nvim_get_current_buf()

  if #buffers > 1 then
    cmd 'bprevious'
    cmd('bdelete! ' .. current_buf)
  else
    cmd('bdelete! ' .. current_buf)
    cmd 'NvimTreeFocus'
  end
end

local function quick_fix()
  vim.lsp.buf.code_action {
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  }
end

local function format()
  local eslintLsp = vim.lsp.get_clients()

  for _, client in ipairs(eslintLsp) do
    if client.name == 'eslint' then
      cmd 'LspEslintFixAll'
    end
  end

  require('conform').format { lsp_fallback = true }
end

Keys = {
  delete_buffer = delete_buffer,
  quick_fix = quick_fix,
  format = format,
  defs = get_definitions,
  refs = get_references,
}
