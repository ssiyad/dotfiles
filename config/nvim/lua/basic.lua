-- -- require'navigator'.setup()
-- -- require "lsp_signature".setup({
-- --   bind = true, -- This is mandatory, otherwise border config won't get registered.
-- --   handler_opts = {
-- --     border = "none"
-- --   }
-- -- })
-- -- require'compe'.setup {}
-- -- local t = function(str)
-- --   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- -- end

-- -- local check_back_space = function()
-- --     local col = vim.fn.col('.') - 1
-- --     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
-- --         return true
-- --     else
-- --         return false
-- --     end
-- -- end

-- -- -- Use (s-)tab to:
-- -- --- move to prev/next item in completion menuone
-- -- --- jump to prev/next snippet's placeholder
-- -- _G.tab_complete = function()
-- --   if vim.fn.pumvisible() == 1 then
-- --     return t "<C-n>"
-- --   elseif vim.fn.call("vsnip#available", {1}) == 1 then
-- --     return t "<Plug>(vsnip-expand-or-jump)"
-- --   elseif check_back_space() then
-- --     return t "<Tab>"
-- --   else
-- --     return vim.fn['compe#complete']()
-- --   end
-- -- end
-- -- _G.s_tab_complete = function()
-- --   if vim.fn.pumvisible() == 1 then
-- --     return t "<C-p>"
-- --   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
-- --     return t "<Plug>(vsnip-jump-prev)"
-- --   else
-- --     -- If <S-Tab> is not working in your terminal, change it to <C-h>
-- --     return t "<S-Tab>"
-- --   end
-- -- end

-- -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- -- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- -- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- -- require'nvim-treesitter.configs'.setup {
-- --   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
-- --   highlight = {
-- --     enable = true,              -- false will disable the whole extension
-- --     additional_vim_regex_highlighting = false,
-- --   },
-- -- }

-- local lspkind = require('lspkind')
-- cmp.setup {
--   formatting = {
--     format = lspkind.cmp_format({
--       with_text = false, -- do not show text alongside icons
--       maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      
--       -- The function below will be called before any actual modifications from lspkind
--       -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
--       before = function (entry, vim_item)
--         -- ...
--         return vim_item
--       end
--     })
--   }
-- }

-- require'cmp'.setup {
--     sources = {
--       { name = 'nvim_lsp' }
--     }
--   }
  
--   -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  
--   -- The following example advertise capabilities to `clangd`.
--   require'lspconfig'.clangd.setup {
--     capabilities = capabilities,
--   }


let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_root_folder_modifier = ':~:.'
let g:nvim_tree_git_hl = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.vscode' ]
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_show_icons = v:false

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

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)

autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight CursorLineNr guifg=White
autocmd ColorScheme * highlight LineNr guifg=#3d3d3d