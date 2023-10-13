return {
    'hrsh7th/nvim-cmp',
    even = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file system paths
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip', -- snippet engine
        'saadparwaiz1/cmp_luasnip', -- for autocompletion
        'rafamadriz/friendly-snippets', -- useful snippets
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        -- loads vscode style snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                completionopt = 'menu,menuone,preview,noselect',
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                 ['<C-k>'] = cmp.mapping.select_prev_item(), -- prev suggestion
                 ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
                 ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
                 ['<C-Space>'] = cmp.mapping.complete(), -- show completions
                 ['<C-e>'] = cmp.mapping.abort(), -- show completions
                 ['<C-e>'] = cmp.mapping.abort(), -- close completion window
                 ['<CR>'] = cmp.mapping.confirm({ select = false }),
             }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                 { name = "nvim-lsp" },
                 { name = "luasnip" }, -- snippets
                 { name = "buffer" }, -- text in current buffer
                 { name = "path" }, -- file system paths
            }),
            -- configure lspkind for vs-code like pictogram in completion menu
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end,
}



