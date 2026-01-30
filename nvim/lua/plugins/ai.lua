return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		event = "VeryLazy",
		config = function()
			require("codeium").setup({
				enable_chat = false,
				virtual_text = {
					enabled = true,
					key_bindings = {
						accept = "<M-f>",
						next = "<M-]>",
						prev = "<M-[>",
						clear = "<C-]>",
					},
				},
			})
		end,
		opts = {
			get_status = get_codeium_status,
		},
	},
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			---@module 'snacks'
			{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {}
			vim.o.autoread = true

			-- 基础提问 (原 <C-a>)
			vim.keymap.set({ "n", "x" }, "<leader>va", function()
				require("opencode").ask("@this: ", { submit = true })
			end, { desc = "AI 提问" })

			-- 选择动作 (原 <C-x>)
			vim.keymap.set({ "n", "x" }, "<leader>vx", function()
				require("opencode").select()
			end, { desc = "AI 动作选择" })

			-- 开关界面 (原 <C-.>)
			vim.keymap.set({ "n", "t" }, "<leader>vv", function()
				require("opencode").toggle()
			end, { desc = "开关 AI 界面" })

			-- 算子操作 (Range/Line)
			vim.keymap.set({ "n", "x" }, "<leader>vo", function()
				return require("opencode").operator("@this ")
			end, { desc = "添加选中范围到 AI", expr = true })

			vim.keymap.set("n", "<leader>vol", function()
				return require("opencode").operator("@this ") .. "_"
			end, { desc = "添加当前行到 AI", expr = true })

			-- 滚动操作 (翻页)
			vim.keymap.set("n", "<leader>vu", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "AI 界面向上翻页" })

			vim.keymap.set("n", "<leader>vd", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "AI 界面向下翻页" })

			vim.keymap.set("n", "+", "<C-a>", { desc = "数字自增", noremap = true })
			vim.keymap.set("n", "-", "<C-x>", { desc = "数字自减", noremap = true })
		end,
	},
}
