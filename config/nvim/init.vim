call plug#begin(stdpath('data') . '/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'windwp/nvim-autopairs'
Plug 'andymass/vim-matchup'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'mhinz/vim-startify'
Plug 'luukvbaal/stabilize.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'rhysd/committia.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'

call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set number
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set nocompatible
set updatetime=100
set termguicolors
set noshowmode
set cursorline
set completeopt=menuone,noselect
set signcolumn=yes:1
set autoread
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set ff=unix

syntax on

lua require('_autopairs')
lua require('_barbar')
lua require('_blankline')
lua require('_colorizer')
lua require('_devicons')
lua require('_gitsigns')
lua require('_gps')
lua require('_lspconfig')
lua require('_lualine')
lua require('_stabilize')
lua require('_telescope')
lua require('_todo-comments')
lua require('_tokyonight')
lua require('_tree')
lua require('_treesitter')

