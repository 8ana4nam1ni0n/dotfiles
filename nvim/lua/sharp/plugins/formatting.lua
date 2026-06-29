return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            go = { "gofmt", "goimports" },
            lua = { "stylua" },
            python = { "ruff", "isort" },
            typescript = { "prettierd", "prettier" },
            typescriptreact = { "prettierd", "prettier" },
            javascript = { "prettierd", "prettier" },
            javascriptreact = { "prettierd", "prettier" },
            json = { "prettierd", "prettier" },
            jsonc = { "prettierd", "prettier" },
            css = { "prettierd", "prettier" },
            scss = { "prettierd", "prettier" },
            html = { "prettierd", "prettier" },
            markdown = { "prettierd", "prettier" },
            yaml = { "yamlfmt" },
            yml = { "yamlfmt" },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
        formatters = {
            yamlfmt = {
                prepend_args = {
                    "-formatter",
                    "type=basic,force_array_style=block",
                },
            },
        },
    },
    keys = {
        {
            "<leader>mp",
            function()
                require("conform").format({
                    async = false,
                    lsp_format = "fallback",
                })
            end,
            mode = { "n", "v" },
            desc = "Format file or range (in visual mode)",
        },
    },
    -- config = function()
    --     local conform = require("conform")
    --
    --     conform.setup({
    --         formatters_by_ft = {
    --             go = { "gofmt", "goimports" },
    --             lua = { "stylua" },
    --             python = { "ruff", "isort" },
    --             typescriptreact = { { "prettierd", "prettier" } },
    --         },
    --         format_on_save = {
    --             lsp_fallback = true,
    --             async = false,
    --             timeout_ms = 500,
    --         },
    --     })
    --
    --     vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    --         conform.format({
    --             lsp_fallback = true,
    --             async = false,
    --             timeout_ms = 1000,
    --         })
    --     end, { desc = "Format file or range (in visual mode)" })
    -- end,
}
