local keymap_set = require('utils.keymap_set')

keymap_set('n', '<Leader>l', ':noh<CR>')
keymap_set('n', '<Leader>t', ':vs | term<CR> | i')
