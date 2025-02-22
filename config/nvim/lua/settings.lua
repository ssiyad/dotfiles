local opt = vim.opt

opt.autoindent = true
opt.autoread = true
opt.cmdheight = 0
opt.cursorline = true
opt.ff = 'unix'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99
opt.foldmethod = 'expr'
opt.guicursor = ''
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 3
opt.mouse = ''
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 0
opt.shortmess:append('WIFS')
opt.showmode = false
opt.signcolumn = 'yes:1'
opt.smartcase = true
opt.smartindent = true
opt.spell = true
opt.tabstop = 4
opt.termguicolors = true
opt.updatetime = 750
