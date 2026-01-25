return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".git" },
	settings = {
		Lua = {
			hint = { enable = true },
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}
