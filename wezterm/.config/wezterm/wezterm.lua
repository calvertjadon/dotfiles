local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action
local xdg_config_home = os.getenv("xdg_config_home")

local wezterm = require("wezterm")

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- Windows-specific config
  config.default_domain = "WSL:Ubuntu"
end

config.color_scheme = "Tokyo Night (Gogh)"
config.font = wezterm.font({ family = "CaskaydiaCove Nerd Font Mono" })
config.font_size = 13
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.95
config.background = {
{
	source = {
        File = xdg_config_home .. "/wezterm/backgrounds/nord_dark_city.png",
	},
		opacity = 1,
		hsb = { brightness = 0.3 },
	},
    
}

---
--- TAB BAR
---

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

---
--- KEYBINDINGS
---

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "p",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "/",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},
	{
		key = "o",
		mods = "LEADER|CTRL",
		action = wezterm.action.ActivateLastTab,
	},
	{
		key = "v",
		mods = "LEADER|CTRL",
		action = wezterm.action.ActivateCopyMode,
	},
}
config.key_tables = {
	resize_pane = {
		-- Press the leader (CTRL-a) then 'r' to enter this key table.
		-- Then, just press 'h', 'j', 'k', or 'l' to resize.
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

		-- Pressing Escape will exit this mode.
		{ key = "Escape", action = "PopKeyTable" },
		-- If you stop typing, the mode will automatically expire after 1000ms by default.
	},
}

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

return config
