local tabline = require("tabline")

require('lualine').setup({
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { tabline.tabline_buffers },
        lualine_x = { tabline.tabline_tabs },
        lualine_y = {},
        lualine_z = {},
    },
})

tabline.setup({ enable = false })

