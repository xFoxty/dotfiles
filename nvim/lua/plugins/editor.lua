return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- =============================================================================
	-- [ nvim-surround ]
	-- 记住核心逻辑：动作(ys/cs/ds) + 范围(iw/is/ip/$) + 符号("')
	-- =============================================================================
	-- 1. 增加 (Add):
	--    ysiw"  -> 给当前单词(inner word)加双引号
	--    yss)   -> 给整行加圆括号
	--    ySiw]  -> 给当前单词加方括号（带换行缩进，大写S）
	-- 2. 修改 (Change):
	--    cs"'   -> 把双引号改为单引号
	--    cs(]   -> 把圆括号改为方括号
	--    cst"   -> 把 HTML 标签 (Tag) 改为双引号
	-- 3. 删除 (Delete):
	--    ds"    -> 删掉双引号
	--    dst    -> 删掉 HTML 标签
	-- 4. 可视模式 (Visual):
	--    选中文字后按大写 S，再输入符号 (如 S")
	-- 5. 括号小技巧:
	--    按左括号 ( [ { 会自动加空格: ( word )
	--    按右括号 ) ] } 不会加空格:   (word)
	-- =============================================================================
	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			-- 使用Ctrl-N选择单词（类似于Sublime Text/VS Code中的Ctrl-d）
			-- 使用Ctrl-Down/Ctrl-Up垂直创建光标
			-- 使用Shift键和箭头键一次选择一个字符
			-- 按 n/N 键可跳到下一个/上一个匹配项
			-- 按[/]选择下一个/上一个光标
			-- 按q键跳过当前事件并获取下一个事件
			-- 按Q键移除当前光标/选择内容
			-- 使用i、a、I、A键启动插入模式
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
			}, {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				css = true,
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.pairs").setup({})
			require("mini.jump2d").setup({
				mappings = {
					start_jumping = "<leader>j",
				},
			})
			require("mini.cursorword").setup({})
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
			require("mini.move").setup({
				mappings = {
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",

					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},
				options = {
					reindent_linewise = true,
				},
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
			},
			exclude = {
				filetypes = { "help", "dashboard", "lazy", "mason" },
			},
		},
		config = function(_, opts)
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261" })
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7" })

			require("ibl").setup(opts)
		end,
	},
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
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
		end,
		keys = {
			{
				"<leader>rp",
				function()
					require("grug-far").open()
				end,
				desc = "全局替换",
			},
		},
	},
	{
		"danilamihailov/beacon.nvim",
	},
	{
		"mikavilpas/yazi.nvim",
		keys = {
			{ "<leader>y", "<cmd>Yazi<cr>", desc = "打开 Yazi" },
		},
		---@type YaziConfig | {}
		opts = {
			floating_window_scaling_factor = 0.9,
			yazi_floating_window_border = "single",
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "打开 Oil 文件管理" })
		end,
	},
}
