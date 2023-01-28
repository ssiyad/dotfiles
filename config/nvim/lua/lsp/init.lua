local clients_path = vim.fn.stdpath('config')..'/lua/lsp/clients'
local dir_content = vim.fn.readdir(clients_path, [[v:val =~ '\.lua$']])

for _, file in pairs(dir_content) do
	local m = vim.fn.split(file, '\\.')
	require('lsp.clients.' .. m[1])
end
