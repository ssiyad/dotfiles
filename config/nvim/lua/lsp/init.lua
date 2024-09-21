local clients_path = vim.fn.stdpath("config") .. "/lua/lsp/clients"
local dir_content = vim.fn.readdir(clients_path, [[v:val =~ '\.lua$']])

local lspconfig = require("lspconfig")
local capabilities = require("lsp.capabilites")
local on_attach = require("lsp.on_attach")
local handlers = require("lsp.handlers")

for _, file in pairs(dir_content) do
	---@type string[]
	local m = vim.fn.split(file, "\\.")
	local server_name = m[1]
	local server = lspconfig[server_name]

	---@type table
	local config = require("lsp.clients." .. server_name)

	config.capabilities = config.capabilities or capabilities()
	config.on_attach = config.on_attach or on_attach
	config.handlers = config.handlers or handlers

	server.setup(config)
end
