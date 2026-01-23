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
}
