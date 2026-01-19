-- leader key
vim.g.maplocalleader = " "
vim.g.mapleader = " "
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
vim.opt.cmdheight = 0
require("lazy").setup({
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			cursor_color = "#d3ebe9",
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true,
				stop_eof = true,
				respect_scrolloff = false,
				cursor_scroll_step = 2.1,
				easing_function = "quadratic",
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false, -- 禁用延迟加载
		priority = 1000, -- 最高优先级
		config = function()
			require("mason").setup()
		end,
	},
	-- leader 备忘录
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	-- gcc 注释
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"danilamihailov/beacon.nvim",
	},
	-- 语法高亮插件
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "markdown" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"mikavilpas/yazi.nvim",
		keys = {
			{ "<leader>y", "<cmd>Yazi<cr>", desc = "打开 Yazi" },
		},
	},
	{ "windwp/nvim-autopairs", config = true },
	-- Git 状态显示（行号旁边的加减号）
	{ "lewis6991/gitsigns.nvim", config = true },
	-- 底部状态栏美化
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- 注意这里加了 nvim- 前缀
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true, -- 显示文件状态（只读、已修改）
							path = 1, -- 0: 只显示文件名, 1: 相对路径, 2: 绝对路径
						},
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "格式化文件",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
})

local opt = vim.opt

opt.spell = true
opt.spelllang = { "en_us", "cjk" }
opt.number = true -- 显示行号
opt.relativenumber = true -- 相对行号
opt.cursorline = true -- 高亮当前行
opt.termguicolors = true -- 真彩色
opt.showmatch = true -- 匹配括号
opt.scrolloff = 3 -- 光标上下保留行数
opt.hlsearch = true -- 搜索高亮
opt.incsearch = true -- 增量搜索
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true -- 智能大小写
opt.tabstop = 4 -- Tab 宽度
opt.shiftwidth = 4
opt.expandtab = true -- Tab 转空格
opt.autoindent = true -- 自动缩进
opt.smartindent = true -- 智能缩进
opt.laststatus = 2 -- 状态栏
opt.mouse = "a" -- 鼠标支持
opt.swapfile = false -- 禁用 swp
opt.undofile = true -- 持久化撤销
opt.clipboard = "unnamedplus" -- 接入系统剪切板
-- 隐藏字符显示
opt.list = true
vim.opt.list = true
opt.listchars = { tab = "- ", space = "·", eol = "↵" }

local keymap = vim.keymap.set

-- 插入模式下的 jj 退出
keymap("i", "jj", "<Esc>")

-- 插入模式下移动光标
keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-l>", "<Right>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-j>", "<Down>")

-- 移动选中文本 (上下移动行)
keymap("v", "<leader>j", ":m '>+1<CR>gv=gv")
keymap("v", "<leader>k", ":m '<-2<CR>gv=gv")
keymap("n", "<leader>j", ":m .+1<CR>==")
keymap("n", "<leader>k", ":m .-2<CR>==")

-- x 不剪切
keymap("n", "x", '"_x')
-- telescope keys
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "查找文件" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "全文搜索" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "切换缓冲区" })
