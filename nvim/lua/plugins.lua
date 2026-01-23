return {
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = _G.LSP_SERVERS or {},
				automatic_installation = true,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "项目诊断 (所有报错)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "当前文件诊断 (本文件报错)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "代码大纲 (符号列表)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP定义/引用列表",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "位置列表 (Location List)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix 列表",
			},
		},
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
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			require("cmp-config").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.opts.hl = "NaviLogo"
			vim.api.nvim_set_hl(0, "NaviLogo", { fg = "#2ac3de", bold = true })
			dashboard.section.header.val = {
				[[     ####                ]],
				[[    #+ ###               ]],
				[[   #*  ##################]],
				[[  ##=:::-+####*=##*    ##]],
				[[ ####-######++#:-##.  *# ]],
				[[###-#.######++# -###*##  ]],
				[[#+##:######### :#######  ]],
				[[###              +#####  ]],
				[[##                -####  ]],
				[[  #+.           :#####   ]],
				[[    ###*+-    :   -###   ]],
				[[       ##:  =#=  +##     ]],
				[[       ########*:-##     ]],
				[[:xFoxty]],
				[[❤️-> :)]],
			}
			local padding = function(n)
				return { type = "padding", val = n }
			end

			local layout = {
				padding(3),
				dashboard.section.header, -- 你的 Logo
				padding(2),
			}
			dashboard.section.buttons.val = {}
			alpha.setup({ layout = layout })
		end,
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
	{
		"williamboman/mason.nvim",
		lazy = false, -- 禁用延迟加载
		priority = 1000, -- 最高优先级
		config = function()
			require("mason").setup()
			local mason_path = vim.fn.stdpath("data") .. "/mason/bin"
			vim.env.PATH = mason_path .. ":" .. vim.env.PATH
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
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							preview_width = 0.5,
						},
						width = 0.9,
					},
					mappings = {
						n = {
							["d"] = require("telescope.actions").delete_buffer,
						},
					},
					file_ignore_patterns = { "node_modules", "%.git/" },
				},
			})
		end,
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
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					globalstatus = true,
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
}
