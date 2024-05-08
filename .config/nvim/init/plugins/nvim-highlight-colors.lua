-- path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/nvim-highlight-colors.lua
-- author: klassiker [mrdotx]
-- github: https://github.com/mrdotx/dotfiles
-- date:   2024-05-08T08:51:40+0200

require("nvim-highlight-colors").setup {
    -- Render style
    -- @usage 'background'|'foreground'|'virtual'
    render = 'background',

    -- Set virtual symbol (requires render to be set to 'virtual')
    virtual_symbol = '██',

    -- Highlight named colors, e.g. 'green'
    enable_named_colors = true,

    -- Highlight tailwind colors, e.g. 'bg-blue-500'
    enable_tailwind = false,

    -- Set custom colors
    -- Label must be properly escaped with '%' to adhere to `string.gmatch`
    --  :help string.gmatch
    -- custom_colors = {
    --     { label = '%-%-theme%-primary%-color', color = '#4185d7' },
    --     { label = '%-%-theme%-secondary%-color', color = '#1f5393' },
    -- }
}
