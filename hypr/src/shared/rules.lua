local vars = require("variables")

-- window rules

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize"
})

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
	name = "pdf-transparency",
	match = { title = ".*\\.pdf.*" },
	opaque = true
})

hl.window_rule({
    name = "floating-windows",
    match = { class = "" },
    float = true
})

hl.window_rule({
    name = music,
    match = { class = vars.music },
    workspace = "special:" .. vars.music .. " silent"
})

hl.window_rule({
    name = comms,
    match = { class = vars.comms },
    workspace = "special:" .. vars.comms .. " silent"
})

hl.window_rule({
    name = "disable-transparency-special",
    match = { workspace = "special:special" },
    opaque = true
})

hl.window_rule({
    name = "disable-transparency-music",
    match = { workspace = "special:" .. vars.music },
    opaque = true
})

hl.window_rule({
    name = "disable-transparency-comms",
    match = { workspace = "special:" .. vars.comms },
    opaque = true
})

hl.layer_rule({
    name = "blur",
    match = { namespace = "waybar|rofi" },
    blur = true,
    ignore_alpha = 0.2
})
