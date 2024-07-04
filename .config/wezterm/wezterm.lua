local wezterm = require("wezterm")

-- wezterm.on("gui-startup", function(cmd)
-- 	local _, _, window = wezterm.mux.spawn_window(cmd or {})
-- 	window:gui_window():maximize()
-- end)

local window_background_gradient = {
	-- Can be "Vertical" or "Horizontal".  Specifies the direction
	-- in which the color gradient varies.  The default is "Horizontal",
	-- with the gradient going from left-to-right.
	-- Linear and Radial gradients are also supported; see the other
	-- examples below
	orientation = "Vertical",

	-- Specifies the set of colors that are interpolated in the gradient.
	-- Accepts CSS style color specs, from named colors, through rgb
	-- strings and more
	colors = {
		"#002633",
		"#000000",
	},

	-- Instead of specifying `colors`, you can use one of a number of
	-- predefined, preset gradients.
	-- A list of presets is shown in a section below.
	-- preset = "Warm",

	-- Specifies the interpolation style to be used.
	-- "Linear", "Basis" and "CatmullRom" as supported.
	-- The default is "Linear".
	interpolation = "Linear",

	-- How the colors are blended in the gradient.
	-- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
	-- The default is "Rgb".
	blend = "Rgb",

	-- To avoid vertical color banding for horizontal gradients, the
	-- gradient position is randomly shifted by up to the `noise` value
	-- for each pixel.
	-- Smaller values, or 0, will make bands more prominent.
	-- The default value is 64 which gives decent looking results
	-- on a retina macbook pro display.
	-- noise = 64,

	-- By default, the gradient smoothly transitions between the colors.
	-- You can adjust the sharpness by specifying the segment_size and
	-- segment_smoothness parameters.
	-- segment_size configures how many segments are present.
	-- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
	-- 1.0 is a soft edge.

	-- segment_size = 11,
	-- segment_smoothness = 0.0,
}
local enabled_harfbuzz_features = {
	-- "ss06",
	-- "ss09",
	-- "ss01",
	-- "ss02",
	-- "ss03",
	-- "ss19",
	-- "ss20",
	-- "cv29",
	-- "cv30",
	-- "clig",
} -- ->
return {
	-- color_scheme = "Modus-Vivendi",
	dpi = 96,
	background = {
		{
			source = {
				File = "/home/kemboiray/Pictures/cyberwave.png",
			},
			opacity = 0.95,
		},
	},
	color_scheme = "Catppuccin Mocha (Gogh)",
	-- window_background_gradient = window_background_gradient,
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	default_cursor_style = "BlinkingBar",
	animation_fps = 1,
	cursor_blink_rate = 700,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	disable_default_key_bindings = true,
	exit_behavior = "Close",
	font = wezterm.font({
		family = "CaskaydiaCove Nerd Font Mono",
		weight = "Regular",
		style = "Normal",
		harfbuzz_features = enabled_harfbuzz_features,
	}),
	font_size = 11,
	-- font_rules = {
	-- 	{
	-- 		intensity = "Bold",
	-- 		italic = true,
	-- 		font = wezterm.font({
	-- 			family = "FiraCode Nerd Font",
	-- 			weight = "Bold",
	-- 			style = "Italic",
	-- 		}),
	-- 	},
	-- 	{
	-- 		italic = true,
	-- 		intensity = "Half",
	-- 		font = wezterm.font({
	-- 			family = "FiraCode Nerd Font",
	-- 			weight = "DemiBold",
	-- 			style = "Italic",
	-- 		}),
	-- 	},
	-- 	{
	-- 		italic = true,
	-- 		intensity = "Normal",
	-- 		font = wezterm.font({
	-- 			family = "FiraCode Nerd Font",
	-- 			style = "Italic",
	-- 			weight = "Medium",
	-- 		}),
	-- 	},
	-- },

	force_reverse_video_cursor = true,
	hide_mouse_cursor_when_typing = true,
	hide_tab_bar_if_only_one_tab = true,
	keys = {
		{ action = wezterm.action.ActivateCommandPalette, mods = "CTRL|SHIFT", key = "p" },
		{ action = wezterm.action.CopyTo("Clipboard"), mods = "CTRL|SHIFT", key = "c" },
		{ action = wezterm.action.PasteFrom("Clipboard"), mods = "CTRL|SHIFT", key = "v" },
		{ action = wezterm.action.DecreaseFontSize, mods = "CTRL", key = "-" },
		{ action = wezterm.action.IncreaseFontSize, mods = "CTRL", key = "=" },
		{ action = wezterm.action.ResetFontSize, mods = "CTRL", key = "0" },
		{ action = wezterm.action.Nop, mods = "ALT", key = "Enter" },
	},
	mouse_bindings = {
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(wezterm.action.ClearSelection, pane)
				else
					window:perform_action(wezterm.action({ PasteFrom = "Clipboard" }), pane)
				end
			end),
		},
		-- Shift-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "SHIFT",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	scrollback_lines = 10000,
	show_update_window = true,
	use_dead_keys = false,
	unicode_version = 15,
	macos_window_background_blur = 100,
	window_close_confirmation = "NeverPrompt",
}
