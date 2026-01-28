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
		test = {
			enabled = true,
		},
		cn = {
			enabled = true,
			translator = true,
		},
	},
}
