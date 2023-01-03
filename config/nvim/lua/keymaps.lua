local lsp = vim.lsp
local keymap_set = require('utils.keymap_set')

keymap_set('n', 'K', lsp.buf.hover)
keymap_set('n', '<Leader>gD', lsp.buf.declaration)
keymap_set('n', '<Leader>gd', lsp.buf.definition)
keymap_set('n', '<Leader>gi', lsp.buf.implementation)
keymap_set('n', '<Leader>gr', lsp.buf.references)
keymap_set('n', '<Leader>rn', lsp.buf.rename)
keymap_set('n', '<Leader>ca', lsp.buf.code_action)

keymap_set('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>')
keymap_set('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>')
keymap_set('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>')
keymap_set('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>')

keymap_set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
keymap_set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
keymap_set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]])
keymap_set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]])
keymap_set('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]])
keymap_set('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]])

keymap_set('n', '<Leader>l', ':noh<CR>')

keymap_set('n', '<C-\\>', ':NvimTreeToggle<CR>')
