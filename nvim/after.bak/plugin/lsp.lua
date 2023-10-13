local Rmap = require("sharp.keymap")
local nnoremap = Rmap.nnoremap
local inoremap = Rmap.inoremap
local lsp = require("lsp-zero")

-- Define on_attach function for lsp keybinds
local on_attach = function(client, bufrn)
    local opts = { buffer = bufrn, remap = false }
    nnoremap("K", vim.lsp.buf.hover, opts)
    nnoremap("gd", vim.lsp.buf.definition, opts)
    nnoremap("gD", vim.lsp.buf.declaration, opts)
    nnoremap("gt", vim.lsp.buf.type_definition, opts)
    nnoremap("gi", vim.lsp.buf.implementation, opts)
    nnoremap("<leader>df", vim.diagnostic.goto_next, opts)
    nnoremap("<leader>dp", vim.diagnostic.goto_prev, opts)
    nnoremap("<leader>r", vim.lsp.buf.rename, opts)
end

vim.opt.completeopt = {"menu", "menuone", "noselect"} -- setting vim values

lsp.preset("recommended")
lsp.ensure_installed({
    "gopls",
    "pyright",
    "eslint",
    "tsserver",
    "rust_analyzer",
    "yamlls"
})
-- Set up nvim-cmp for autocomplete.
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
lsp.on_attach(on_attach)
lsp.setup()
