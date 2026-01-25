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
vim.opt.rtp:prepend(lazypath)
-- 1. 定义基础解析器（只有高亮，不需要 LSP 的）
local base_languages = { "vim", "vimdoc", "query", "markdown_inline" }
-- 2. 定义核心语言（既要高亮，也要 LSP 的）
-- 格式：{ 文件类型，LSP 服务器名，格式化工具 }：
local lang_configs = {
	lua = { "lua", "lua_ls", { "stylua" } },
	go = { "go", "gopls", { "goimports" } },
	python = { "python", "pyright", { "isort", "black" } },
	markdown = { "markdown", "marksman", { "prettier" } },
	json = { "json", "jsonls", { "prettier" } },
	typescript = { "typescript", "vtsls", { "prettierd", "prettier", stop_after_first = true } },
}
lang_configs.javascript = lang_configs.typescript

_G.treesitter_languages = vim.tbl_values(base_languages)
_G.LSP_SERVERS = {}
_G.FORMATTERS_BY_FT = {}

local ts_set = {}
for ft, cfg in pairs(lang_configs) do
	local ts_name, lsp_name, formatters = cfg[1], cfg[2], cfg[3]

	if lsp_name then
		table.insert(_G.LSP_SERVERS, lsp_name)
	end

	_G.FORMATTERS_BY_FT[ft] = formatters

	if not ts_set[ts_name] then
		table.insert(_G.treesitter_languages, ts_name)
		ts_set[ts_name] = true
	end
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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
	end,
})

require("keymaps")
