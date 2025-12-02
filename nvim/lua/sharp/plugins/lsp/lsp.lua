return {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/lazydev.nvim", opts = {} },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()
        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        -- vim.lsp.config("pyright", {
        --     settings = {
        --         python = {
        --             pythonPath = vim.fn.exepath("python3"),
        --         },
        --     },
        -- })

        -- vim.lsp.config("gopls", {
        --     settings = {
        --         gopls = {
        --             analyses = {
        --                 unusedparams = true,
        --             },
        --             staticcheck = true,
        --             gofumpt = true,
        --         },
        --     },
        -- })

        -- vim.lsp.config("ansiblels", {
        --     filetype = { "yaml.ansible" },
        -- })
    end,
}
