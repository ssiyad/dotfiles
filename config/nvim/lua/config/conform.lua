local conform = require('conform')
local js = {
  'eslint_d',
  'prettier',
}

conform.setup({
  formatters_by_ft = {
    lua = {
      'stylua',
    },
    python = {
      'ruff_fix',
      'ruff_format',
      'ruff_organize_imports',
    },
    javascript = js,
    typescript = js,
    typescriptreact = js,
    vue = js,
  },
  format_after_save = {
    lsp_fallback = true,
  },
})
