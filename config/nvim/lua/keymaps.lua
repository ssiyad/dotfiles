local set = vim.keymap.set

local opts = {
    noremap = true,
    silent = true,
}

local lsp = vim.lsp

set('n', 'K', lsp.buf.hover, opts)
set('n', '<Leader>gD', lsp.buf.declaration, opts)
set('n', '<Leader>gd', lsp.buf.definition, opts)
set('n', '<Leader>gi', lsp.buf.implementation, opts)
set('n', '<Leader>gr', lsp.buf.references, opts)
set('n', '<Leader>rn', lsp.buf.rename, opts)
set('n', '<Leader>ca', lsp.buf.code_action, opts)

set('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', opts)
set('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', opts)
set('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', opts)
set('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', opts)

set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
set('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
set('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
set('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
set('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

set('n', '<Leader>l', ':noh<CR>', opts)

set('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
set('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
set('n', '<Leader>fr', ':Telescope lsp_references<CR>', opts)
set('n', '<Leader>ft', ':TodoTelescope<CR>', opts)
set('n', '<Leader>gc', ':Telescope git_commits<CR>', opts)

set('n', '<C-o>', ':NvimTreeToggle<CR>', opts)

