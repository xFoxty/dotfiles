return {
	"neovim/nvim-lspconfig",
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
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render_markdown.Config
		opts = {
			heading = {
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				signs = { "󰫎 " },
			},
			code = {
				style = "full",
				left_pad = 2,
				right_pad = 2,
				terminal_render = true,
			},
			checkbox = {
				unchecked = { icon = "󰄱 " },
				checked = { icon = "󰱒 " },
			},
		},
	},
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
			formatters_by_ft = _G.FORMATTERS_BY_FT,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
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
	-- 语法高亮插件
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
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = _G.treesitter_languages,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local ensure_installed = {}
			for _, tools in pairs(_G.FORMATTERS_BY_FT or {}) do
				for _, tool in ipairs(tools) do
					if type(tool) == "string" then
						table.insert(ensure_installed, tool)
					end
				end
			end
			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				auto_install = true,
			})
		end,
	},
}
