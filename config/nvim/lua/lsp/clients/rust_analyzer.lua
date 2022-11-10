require('lspconfig').rust_analyzer.setup {
    capabilities = require 'lsp.capabilites' (),
    cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
    handlers = require 'lsp.handlers',
    on_attach = require 'lsp.on_attach',
}

