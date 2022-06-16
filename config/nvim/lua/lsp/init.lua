vim.lsp.handlers["textDocument/definition"] = require('lsp.functions.goto_definition')('split')
-- vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

require('lsp.clients.tsserver')

