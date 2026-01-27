return {
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- transparent_background = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.opts.hl = "NaviLogo"
			vim.api.nvim_set_hl(0, "NaviLogo", { fg = "#f17d3e", bold = true })
			dashboard.section.header.val = {
				[[██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗]],
				[[██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝]],
				[[██║   ██║███████╗    ██║     ██║   ██║██║  ██║█████╗  ]],
				[[╚██╗ ██╔╝╚════██║    ██║     ██║   ██║██║  ██║██╔══╝  ]],
				[[ ╚████╔╝ ███████║    ╚██████╗╚██████╔╝██████╔╝███████╗]],
				[[  ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]],
				[[:xFoxty]],
				[[❤️-> :)]],
			}
			local padding = function(n)
				return { type = "padding", val = n }
			end

			local layout = {
				padding(10),
				dashboard.section.header,
				padding(2),
			}
			dashboard.section.buttons.val = {}
			alpha.setup({ layout = layout })
		end,
	},
	{ "windwp/nvim-autopairs", config = true },
	{ "lewis6991/gitsigns.nvim", config = true },
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
}
