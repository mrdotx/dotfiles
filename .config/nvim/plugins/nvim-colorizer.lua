-- path:       /home/klassiker/.config/nvim/plugins/nvim-colorizer.lua
-- author:     klassiker [mrdotx]
-- github:     https://github.com/mrdotx/dotfiles
-- date:       2020-04-30T01:00:20+0200

require'colorizer'.setup(
    {'*';},
    {
        RGB      = true;            -- #RGB hex codes
        RRGGBB   = true;            -- #RRGGBB hex codes
        names    = true;            -- "Name" codes like Blue
        RRGGBBAA = true;            -- #RRGGBBAA hex codes
        rgb_fn   = true;            -- CSS rgb() and rgba() functions
        hsl_fn   = true;            -- CSS hsl() and hsla() functions
        css      = false;           -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = false;           -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode     = 'background';    -- Set the display mode.
    }
)
