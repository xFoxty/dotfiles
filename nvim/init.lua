--leader key
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.o.timeout = true
vim.o.timeoutlen = 500

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
local servers = { "lua_ls", "vtsls" }
local treesitter_languages = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"markdown",
	"markdown_inline",
	"python",
	"javascript",
	"typescript",
	"json",
	"html",
	"css",
}
_G.treesitter_languages = treesitter_languages
_G.LSP_SERVERS = servers
require("lazy").setup("plugins")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

_G.LSP_CAPABILITIES = capabilities

for _, server in ipairs(servers) do
	local config = {}
	local ok, custom_config = pcall(require, "lsp." .. server)
	if ok then
		config = custom_config
	end
	config.capabilities = _G.LSP_CAPABILITIES
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end

require("keymaps")
require("options")
