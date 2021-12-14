call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'lukas-reineke/cmp-rg'
Plug 'ray-x/cmp-treesitter'
Plug 'onsails/lspkind-nvim'
Plug 'windwp/nvim-autopairs'
Plug 'andymass/vim-matchup'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'romgrk/nvim-treesitter-context'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'SmiteshP/nvim-gps'
Plug 'mhinz/vim-startify'
Plug 'luukvbaal/stabilize.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'numToStr/FTerm.nvim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'chaoren/vim-wordmotion'
Plug 'rhysd/committia.vim'
Plug 'kdheepak/lazygit.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'crivotz/nvim-colorizer.lua'
Plug 'famiu/feline.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ray-x/lsp_signature.nvim'

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
lua require('_cmp')
lua require('_colorizer')
lua require('_devicons')
lua require('_feline')
lua require('_fterm')
lua require('_gitsigns')
lua require('_gps')
lua require('_signature')
lua require('_stabilize')
lua require('_telescope')
lua require('_todo-comments')
lua require('_tree')
lua require('_treesitter')
lua require('_treesitter-context')

let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

nnoremap <C-e> :NvimTreeToggle<CR>
nnoremap <leader>gg :LazyGit<CR>
nnoremap <C-o> :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>tf <cmd>Telescope find_files<cr>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)

autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight CursorLineNr guifg=White
autocmd ColorScheme * highlight LineNr guifg=#3d3d3d

colorscheme onedark
