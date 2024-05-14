local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
require("awful.autofocus")
require("collision")()

pcall(require, "luarocks.loader")

-- >> Client borders and focus config << --
require("config.client")

-- >> Error handling << --
require("config.error-handling")

-- >> Variable definitions << --
user = {
	name = "Neon",
	image_path = os.getenv("HOME") .. "/.config/awesome/profile.png",
	dnd_status = false,
	fallback_password = "0000",
	terminal = "alacritty ",
	floating_terminal = "alacritty ",
	browser = "firefox ",
	file_manager = "alacritty --class file_manager -e ranger ",
	editor = "alacritty --class editor -e nvim",
	editor_cmd = "alacritty --class editor -e nvim",

	web_search_cmd = 'xdg open "https://duckduckgo.com/?q="',
}

modkey = "Mod4"

awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.tile.left,
	-- awful.layout.suit.tile.bottom,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.max,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}

-- Workspaces {{{
awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
end)
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- >> Main Menu (Right Click) << --
local mymainmenu = require("config.menu")

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end)

	-- Commenting these lines to disable scrolling between workspaces in homescreen
	-- awful.button({}, 4, awful.tag.viewnext),
	-- awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

	-- Go back
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Focus next window
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),

	-- Focus previous window
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	-- Switch posititon with next window
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),

	-- Switch posititon with previous window
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	-- Switch focus to next monitor
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),

	-- Switch focus to previous monitor
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),

	-- Switch focus to urgent client
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	-- Dismiss notifications
	awful.key({ modkey }, ";", function()
		awesome.emit_signal("elemental::dismiss")
		naughty.destroy_all_notifications()
	end, { description = "dismiss notification", group = "notifications" }),

	------------------------------------------------------------

	-- PROGRAMS --

	-- terminal
	awful.key({ modkey }, "Return", function()
		awful.spawn(user.terminal)
	end, { description = "open a terminal", group = "launcher" }),

	-- floating_terminal
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn(user.floating_terminal, { floating = true })
	end, { description = "spawn floating terminal", group = "launcher" }),

	-- broswer
	awful.key({ modkey }, "w", function()
		awful.spawn(user.browser)
	end, { description = "Open a web broswer", group = "launcher" }),

	-- Discord
	awful.key({ modkey }, "d", function()
		-- awful.spawn("./Applications/Discord/Discord --disable-gpu")
		awful.spawn("discord --disable-gpu")
		local screen = awful.screen.focused()
		local tag = screen.tags[8]
		if tag then
			tag:view_only()
		end
	end, { description = "Open Discord", group = "launcher" }),

	-- Spotify
	awful.key({ modkey }, "s", function()
		awful.spawn("spotify --disable-gpu")
		local screen = awful.screen.focused()
		local tag = screen.tags[9]
		if tag then
			tag:view_only()
		end
	end, { description = "Open Spotify", group = "launcher" }),

	-- ROFI STUFF--

	-- Rofi Run launcher
	awful.key({ modkey }, "space", function()
		awful.spawn("rofi -show run")
	end, { description = "Rofi (Command Launcher)", group = "launcher" }),

	-- Rofi Emoji
	awful.key({ modkey, "Shift" }, "e", function()
		awful.spawn("rofi -show emoji -modi emoji")
	end, { description = "Launch Rofi Emoji", group = "launcher" }),

	-- Rofi calc
	awful.key({ modkey, "Shift" }, "c", function()
		awful.spawn("rofi -show calc -modi calc -no-show-match -no-sort")
	end, { description = "Rofi Calculator (rofi-calc)", group = "launcher" }),

	awful.key({ modkey }, "u", function()
		awful.spawn("alacritty -e yay -Syu --noconfirm")
	end, { description = "update", group = "launcher" }),

	-- Take screenshot (selection)
	awful.key({ modkey, "Shift" }, "s", function()
		awful.spawn("flameshot gui")
		-- awful.util.spawn("scrot -e 'mv $f ~/Media/images/screenshots/ 2>/dev/null'", false)
		-- awful.util.spawn('notify-send "SCROT" "Screenshot created!"', false)
	end, { description = "Make screenshot to ~/Media/images/screenshots/", group = "awesome" }),

	------------------------------------------------------------

	-- Reload awesome
	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

	-- quit awesome (logout)
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	-- Increase window's size
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),

	-- decrease window's size
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	-- Move window to top/bottom
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),

	-- Move window to top/bottom
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),

	-- Switch layouts
	awful.key({ modkey }, "Tab", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),

	awful.key({ modkey }, ".", function()
		awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%")
	end, { description = "increase volume", group = "volume control" }),

	awful.key({ modkey }, ",", function()
		awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%")
	end, { description = "decrease volume", group = "volume control" })
)

clientkeys = gears.table.join(
	-- fullscreen window
	awful.key({ modkey, "Shift" }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),

	-- close window
	awful.key({ modkey }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),

	-- Make a window floating window
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),

	-- return to default layout
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),

	-- (un)maximize window both vertically and horizontally
	awful.key({ modkey }, "f", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			-- border_width = beautiful.border_width,
			-- border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
	{
		rule = { instance = "polybar" },
		properties = {
			border_width = 0,
		},
	},
	{
		rule = { class = "Firefox" },
		properties = {
			screen = 1,
			tag = "9",
			switchtotag = true,
		},
	},
	{
		id = "discord",
		rule = {
			class = "discord",
		},
		properties = {
			tag = "8", -- move discord to tag 8
		},
		callback = function(c)
			c:jump_to() -- switch to the workspace where discord is and focus it
		end,
	},

	{
		id = "spotify",
		rule = {
			class = "spotify",
		},
		properties = {
			tag = "9", -- move spotify to tag 9
		},
		callback = function(c)
			c:jump_to() -- switch to the workspace where spotify is and focus it
		end,
	},
}

-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
-- client.connect_signal("manage", function(c)
-- 	-- Set the windows at the slave,
-- 	-- i.e. put it at the end of others instead of setting it master.
-- 	-- if not awesome.startup then awful.client.setslave(c) end
--
-- 	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
-- 		-- Prevent clients from being unreachable after screen count changes.
-- 		awful.placement.no_offscreen(c)
-- 	end
-- end)

-- Launch theme
beautiful.init(awful.util.getdir("config") .. "theme.lua")

-- AUTOSTART --
os.execute("sh /home/neon/.config/awesome/autostart.sh")
awful.spawn.with_shell("picom --daemon")

-- -- >> Notifications << --
-- require("deco.notifications")
