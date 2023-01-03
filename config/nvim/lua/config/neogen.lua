local neogen = require('neogen')
local keymap_set = require('utils.keymap_set')

neogen.setup({})

keymap_set('n', '<Leader>d', neogen.generate)
