local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.updatetime = 750
opt.termguicolors = true
opt.showmode = true
opt.cursorline = true
opt.completeopt = 'menu,menuone,noselect' 
opt.signcolumn = 'yes:1'
opt.autoread = true
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99
opt.ff = 'unix'
opt.guicursor = ''

