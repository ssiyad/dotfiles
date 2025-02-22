vim.api.nvim_create_autocmd('CursorHold', {
  buffer = bufnr,
  callback = function()
    local opts = {
      border = 'solid',
      close_events = {
        'BufLeave',
        'CursorMoved',
        'InsertEnter',
        'FocusLost',
      },
      focusable = true,
      header = '',
      prefix = '',
      scope = 'line',
      source = 'if_many',
      style = 'minimal',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})
