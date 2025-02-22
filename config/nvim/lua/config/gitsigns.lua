local gitsigns = require('gitsigns')
local keymap_set = require('utils.keymap_set')

gitsigns.setup({
  attach_to_untracked = false,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'solid',
    style = 'minimal',
    relative = 'cursor',
  },
})

keymap_set('n', '<leader>hp', gitsigns.preview_hunk_inline)
keymap_set('n', '<leader>hr', gitsigns.reset_hunk)
keymap_set('n', '<leader>hs', gitsigns.stage_hunk)
keymap_set('n', '<leader>hu', gitsigns.undo_stage_hunk)
