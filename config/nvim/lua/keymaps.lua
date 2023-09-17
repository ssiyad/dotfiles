local keymap_set = require("utils.keymap_set")

keymap_set("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
keymap_set("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
keymap_set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]])
keymap_set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]])
keymap_set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]])
keymap_set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]])

keymap_set("n", "<Leader>l", ":noh<CR>")

keymap_set("n", "<Leader>t", ":vs | term<CR> | i")
