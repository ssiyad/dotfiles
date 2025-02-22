local lsp = vim.lsp
local keymap_set = require('utils.keymap_set')

local function f(client, bufnr)
  keymap_set('n', 'K', lsp.buf.hover)
  keymap_set('n', '<Leader>gD', lsp.buf.declaration)
  keymap_set('n', '<Leader>gd', lsp.buf.definition)
  keymap_set('n', '<Leader>gi', lsp.buf.implementation)
  keymap_set('n', '<Leader>gr', lsp.buf.references)
  keymap_set('n', '<Leader>rn', lsp.buf.rename)
  keymap_set('n', '<Leader>ca', lsp.buf.code_action)
  keymap_set('v', '<Leader>ca', lsp.buf.code_action)

  require('lsp.functions.float_diagnostics')
  require('lsp.functions.goto_definition')
  require('lsp.functions.symbol_highlight')(client, bufnr)
end

return f
