return {
    -- NOTE: LuaSnip settings
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        config = function()
            local luasnip = require 'luasnip'
            local cmp = require 'cmp'
            vim.keymap.set('n', '<leader>ss', require('luasnip.loaders').edit_snippet_files, { desc = 'Edit snippets' })
            require('luasnip.loaders.from_lua').load()
            cmp.setup {

                -- ... Your other configuration ...

                mapping = {

                    -- ... Your other mappings ...
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm {
                                    select = true,
                                }
                            end
                        else
                            fallback()
                        end
                    end),

                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    -- ... Your other mappings ...
                },

                -- ... Your other configuration ...
            }
        end,
    },


}
