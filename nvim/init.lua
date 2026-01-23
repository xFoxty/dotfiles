require("options")

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
local function add() end
vim.opt.rtp:prepend(lazypath)
-- 1. 定义基础解析器（只有高亮，不需要 LSP 的）
local base_languages = { "vim", "vimdoc", "query", "markdown_inline" }
-- 2. 定义核心语言（既要高亮，也要 LSP 的）
-- 格式：{ treesitter名字, lsp名字 }
local core_languages = {
	{ "lua", "lua_ls" },
	{ "typescript", "vtsls" },
	{ "python", "pyright" },
	{ "markdown", "marksman" },
	{ "json", "jsonls" },
}
_G.treesitter_languages = vim.tbl_values(base_languages)
_G.LSP_SERVERS = {}
for _, lang in ipairs(core_languages) do
	table.insert(_G.treesitter_languages, lang[1])
	table.insert(_G.LSP_SERVERS, lang[2])
end
---
require("lazy").setup("plugins")
---
local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

_G.LSP_CAPABILITIES = capabilities

for _, server in ipairs(_G.LSP_SERVERS) do
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
