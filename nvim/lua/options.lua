local opt = vim.opt
vim.g.maplocalleader = " "
vim.g.mapleader = " "
vim.o.timeout = true
vim.o.timeoutlen = 1500

opt.cmdheight = 0
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
-- 1. 开启折叠
opt.foldenable = true
-- 2. 设置折叠方式为 expr (表达式)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- 4. 默认展开所有代码
opt.foldlevel = 99
-- 拼写检查颜色
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#7FB4CA", italic = true })
		vim.api.nvim_set_hl(0, "SpellBad", { sp = "#7FB4CA", undercurl = true })
		vim.api.nvim_set_hl(0, "SpellCap", { sp = "#98BB6C", undercurl = true })
	end,
})
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#7FB4CA", italic = true })
vim.api.nvim_set_hl(0, "SpellBad", { sp = "#7FB4CA", undercurl = true })
