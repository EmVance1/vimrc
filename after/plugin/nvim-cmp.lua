local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}


cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = {
        -- {name = 'nvim_lua'},
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'luasnip'}, --keyword_length = 2},
        -- {name = 'buffer'}, --keyword_length = 3},
    },
})

