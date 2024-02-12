return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local nnoremap = require('sharp.core.remap').nnoremap
        local vnoremap = require('sharp.core.remap').vnoremap

        local on_attach = function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            opts.desc = 'Show docs for whats under the cursor'
            nnoremap("K", vim.lsp.buf.hover, opts)
            opts.desc = 'Show LSP Definitions'
            nnoremap("gd", '<cmd>Telescope lsp_definitions<CR>', opts)
            opts.desc = 'Go to declaration'
            nnoremap("gD", vim.lsp.buf.declaration, opts)
            opts.desc = 'Show type definitions'
            nnoremap("gt", '<cmd>Telescope lsp_type_definitions<CR>', opts)
            opts.desc = 'Show LSP implementation'
            nnoremap("gi", '<cmd>Telescope lsp_implementations<CR>', opts)
            opts.desc = 'Go to next diagnostic'
            nnoremap("<leader>df", vim.diagnostic.goto_next, opts)
            opts.desc = 'Go to prev diagnostic'
            nnoremap("<leader>dp", vim.diagnostic.goto_prev, opts)
            opts.desc = 'Smart rename'
            nnoremap("<leader>rn", vim.lsp.buf.rename, opts)
            opts.desc = 'Show LSP references'
            nnoremap("<leader>gR", '<cmd>Telescope lsp_references<CR>', opts)
            opts.desc = 'See available code actions'
            nnoremap("<leader>ca", vim.lsp.buf.code_action, opts)
            vnoremap("<leader>ca", vim.lsp.buf.code_action, opts)
            opts.desc = 'Show buffer diagnostics'
            nnoremap("<leader>D", '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
            opts.desc = 'Restart LSP'
            nnoremap("<leader>rs", ':LspRestart<CR>', opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig['pyright'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['gopls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['hls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['yamlls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig['ansiblels'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetype = { 'yaml.ansible' }
        })

        lspconfig['tsserver'].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
