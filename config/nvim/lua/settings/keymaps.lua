local set = vim.keymap.set

local lsp = vim.lsp

local opts = {
    noremap = true,
    silent = true,
}

set('n', 'K', lsp.buf.hover, opts)
set('n', '<Leader>gD', lsp.buf.declaration, opts)
set('n', '<Leader>gd', lsp.buf.definition, opts)
set('n', '<Leader>gi', lsp.buf.implementation, opts)
set('n', '<Leader>gr', lsp.buf.references, opts)
set('n', '<Leader>rn', lsp.buf.rename, opts)
set('n', '<Leader>ca', lsp.buf.code_action, opts)

