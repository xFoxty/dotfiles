return {
	"kawre/leetcode.nvim",
	build = ":LeetCodeCache",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		lang = "golang",
		cn = {
			enabled = true,
			translator = true,
		},
	},
}
