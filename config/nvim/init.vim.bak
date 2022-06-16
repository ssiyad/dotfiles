call plug#begin(stdpath('data') . '/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'rhysd/committia.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set nocompatible
set updatetime=750
set termguicolors
set noshowmode
set cursorline
set completeopt=menu,menuone,noselect
set signcolumn=yes:1
set autoread
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set ff=unix
set guicursor=

syntax on

lua require('_autopairs')
lua require('_blankline')
lua require('_colorizer')
lua require('_devicons')
lua require('_gitsigns')
lua require('_hlslens')
lua require('_lspconfig')
lua require('_lualine')
lua require('_scrollbar')
lua require('_telescope')
lua require('_todo-comments')
lua require('_tokyonight')
lua require('_tree')
lua require('_treesitter')

