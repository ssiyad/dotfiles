call plug#begin(stdpath('data') . '/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'airblade/vim-gitgutter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'junegunn/fzf.vim'
call plug#end()

lua << EOF
require'navigator'.setup()
require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "none"
  }
})
require'compe'.setup {}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
EOF

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
set ff=unix

syntax on

let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:rainbow_active = 1
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename'],
  \             [ 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ],
  \              [ 'gitbranch' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ 
  \}

let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_root_folder_modifier = ':~:.'
let g:nvim_tree_git_hl = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.vscode' ]
let g:nvim_tree_lsp_diagnostics = 1

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:true
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> <C-s> :NvimTreeToggle<CR><C-s>

nnoremap <silent> <C-q> :ToggleTerminal<Enter>
tnoremap <silent> <C-q> <C-\><C-n>:ToggleTerminal<Enter>
tnoremap <C-w> <C-\><C-n><C-w>

highlight link CompeDocumentation NormalFloat

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)

autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight CursorLineNr guifg=White
autocmd ColorScheme * highlight LineNr guifg=#3d3d3d

colorscheme onedark

