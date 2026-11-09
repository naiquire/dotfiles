local theme = require("hyprland-colors")

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
    },

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
            output = "eDP-1",
            absolute_region_position = true,

            active_area_size = {64, 36},
            active_area_position = {20, 10}
        }
    },

	dwindle = {
        preserve_split = true
    },

	master = {
        new_status = "master"
    },

	scrolling = {
        fullscreen_on_one_column = true
    }
})
