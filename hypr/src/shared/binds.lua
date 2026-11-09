local vars = require("variables")

local mainMod   = "SUPER"
local altMod    = "SUPER + SHIFT + CTRL" -- binded to copilot key

local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- window managment
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Z", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(altMod .. " + O", hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))

-- waybar toggle
hl.bind(altMod .. " + P", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/waybar-toggle.sh"))

-- execs
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(vars.menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(vars.browser))

-- workspace navigation
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- monitor toggles // needs fixing
hl.bind(mainMod .. " + SPACE",	hl.dsp.dpms({ action = "toggle", monitor = "eDP-1" }))
hl.bind(altMod .. " + SPACE",	hl.dsp.dpms({ action = "toggle", monitor = "DP-1" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false }))
end

-- special workspaces
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(vars.music))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:" .. vars.music, follow = false }))

hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special(vars.comms))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:" .. vars.comms, follow = false }))

hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("special"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ workspace = "special:special", follow = false }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- brightness and audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl set 5%+"),                  { locked = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl set 5%-"),                  { locked = true })

hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
hl.bind("XF86Launch7",          hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
hl.bind("XF86AudioPrev",	hl.dsp.exec_cmd("playerctl --player=spotify previous"))
hl.bind("XF86AudioNext",	hl.dsp.exec_cmd("playerctl --player=spotify next"))

hl.bind(altMod .. " + left",    hl.dsp.exec_cmd("playerctl --player=spotify previous"))
hl.bind(altMod .. " + right",   hl.dsp.exec_cmd("playerctl --player=spotify next"))
hl.bind(altMod .. " + up",      hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind(altMod .. " + down",    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"))

-- hyprshot and wf-recorder
hl.bind("PRINT",            hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/hyprshot.sh"))
hl.bind("SHIFT + PRINT",    hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/hyprshot.sh save"))

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/record.sh"))

-- hyprsunset
hl.bind(altMod .. " + N", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/nightlight-toggle.sh"))

-- ani-cli and steam
hl.bind(altMod .. " + A", hl.dsp.exec_cmd("ani-cli --rofi"))
hl.bind(altMod .. " + S", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/steam.sh"))

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
