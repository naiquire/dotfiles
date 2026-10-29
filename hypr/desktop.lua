local theme = require("hyprland-colors")

hl.monitor({
    output      = "eDP-1",
    mode        = "2880x1800@120",
    scale       = 2,
    disabled    = true
})

hl.monitor({
    output  	= "DP-1",
    mode 		= "1920x1080@144",
    scale   	= 1,
    disabled 	= false
})


local terminal      = "kitty"
local fileManager   = "thunar"
local menu          = "rofi -show drun"
local browser       = "firefox"
local editor        = "code"
local music         = "Spotify"
local comms         = "discord"

hl.on("hyprland.start", function () 
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("dunst")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("hyprsunset")
    
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("fileManager", fileManager)
hl.env("menu", menu)
hl.env("terminal", terminal)
hl.env("comms", comms)
hl.env("music", music)
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")

hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 2,

        col = {
	    active_border   = { colors = { theme.primary, theme.primary_container }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border    = false,
        allow_tearing       = false,
        layout              = "dwindle"
    },

    decoration = {
        rounding        = 4,
        rounding_power  = 2,

        active_opacity      = 0.9,
        inactive_opacity    = 0.8,

        shadow = {
            enabled         = false,
            range           = 4,
            render_power    = 3,
            color           = 0xee1a1a1a
        },

        blur = {
            enabled             = true,
            size                = 5,
            passes              = 3,
            vibrancy            = 0.12,
	        vibrancy_darkness   = 0.05
        }
    },

    animations = {
        enabled = true,
    }
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true
    }
})

hl.config({
    master = {
        new_status = "master"
    }
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true
    }
})

hl.config({
    input = {
        kb_layout = "gb",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true
        },

        tablet = {
            output = "DP-1",
            absolute_region_position = true,

            active_area_size = {64, 36},
            active_area_position = {20, 10}
        }
    }    
})

hl.device({
    name = "wacom-one-by-wacom-s-pen",
    scroll_button = 0,
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "down",
    action = "special",
    workspace_name = music
})

hl.gesture({
    fingers = 3,
    direction = "up",
    action = "special",
    workspace_name = comms,
})


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
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))

-- workspace navigation
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- monitor toggles
hl.bind(mainMod .. " + SPACE",	hl.dsp.dpms({ action = "toggle", monitor = "eDP-1" }))
hl.bind(altMod .. " + SPACE",	hl.dsp.dpms({ action = "toggle", monitor = "DP-1" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false }))
end

-- special workspaces
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(music))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:" .. music, follow = false }))

hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special(comms))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:" .. comms, follow = false }))

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


-- window rules


hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true
})

hl.window_rule({
    name = "youtube-transparency",
    match = { title = ".*YouTube.*" },
    opaque = true
})

hl.window_rule({
    name = "twitch-transparency",
    match = { title = ".*Twitch.*" },
    opaque = true
})

hl.window_rule({
    name = "mpv-transparency",
    match = { class = ".*mpv.*" },
    opaque = true
})

hl.window_rule({
    name = "floating-windows",
    match = { class = "" },
    float = true
})

hl.window_rule({
    name = music,
    match = { class = music },
    workspace = "special:" .. music .. " silent"
})

hl.window_rule({
    name = comms,
    match = { class = comms },
    workspace = "special:" .. comms .. " silent"
})

hl.window_rule({
    name = "disable-transparency-special",
    match = { workspace = "special:special" },
    opaque = true
})

hl.window_rule({
    name = "disable-transparency-music",
    match = { workspace = "special:" .. music },
    opaque = true
})

hl.window_rule({
    name = "disable-transparency-comms",
    match = { workspace = "special:" .. comms },
    opaque = true
})

hl.layer_rule({
    name = "waybar",
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.2
})
