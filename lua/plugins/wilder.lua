return {
    'gelguy/wilder.nvim',
    config = function()
        -- config goes here
        local wilder = require('wilder')
        wilder.setup({ modes = { ':', '/', '?' } })

        wilder.set_option('pipeline', {
            wilder.branch(
                wilder.cmdline_pipeline(),
                wilder.search_pipeline()
            ),
        })

        wilder.set_option('renderer', wilder.popupmenu_renderer({
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() },
            highlighter = wilder.basic_highlighter(),
            pumblend = 20,

        }))
    end
}

