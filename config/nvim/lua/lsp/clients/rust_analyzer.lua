require('lspconfig').rust_analyzer.setup {
    on_attach = require 'lsp.on_attach',
    handlers = require 'lsp.handlers',
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' }
}

