local Rmap = require("sharp.keymap")
local nnoremap = Rmap.nnoremap

-- Set up lspconfig.
-- Define capabilities for cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Define on_attach function for lsp keybinds
local on_attach = function()
    nnoremap("K", vim.lsp.buf.hover, {buffer=0})
    nnoremap("gd", vim.lsp.buf.definition, {buffer=0}) 
    nnoremap("gD", vim.lsp.buf.declaration, {buffer=0})
    nnoremap("gt", vim.lsp.buf.type_definition, {buffer=0}) 
    nnoremap("gi", vim.lsp.buf.implementation, {buffer=0}) 
    nnoremap("<leader>df", vim.diagnostic.goto_next, {buffer=0}) 
    nnoremap("<leader>dp", vim.diagnostic.goto_prev, {buffer=0}) 
    nnoremap("<leader>r", vim.lsp.buf.rename, {buffer=0})
end

-- Configuration function to pass to all LSPs
local function config(_custom_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
    }, _custom_config or {})
end 

-- Setup LSPs Native
require'lspconfig'.gopls.setup(config()) -- Go lsp
require'lspconfig'.pyright.setup(config()) -- Python lsp

vim.opt.completeopt = {"menu", "menuone", "noselect"} -- setting vim values

-- Set up nvim-cmp for autocomplete.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})
