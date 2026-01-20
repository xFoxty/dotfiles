local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"

config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 18
config.line_height = 1.1
config.color_scheme = "Nord (Gogh)"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 30

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBlock"
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}
config.initial_cols = 160
config.initial_rows = 45

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

return config
