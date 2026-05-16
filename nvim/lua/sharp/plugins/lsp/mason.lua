return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "dockerls",
            "gopls",
            "rust_analyzer",
            "marksman",
            "pyright",
            "pylsp",
            "vtsls",
            "eslint",
            "tailwindcss",
            "html",
            "cssls",
            "jsonls",
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
-- return {
--     "williamboman/mason.nvim",
--     dependencies = {
--         "neovim/nvim-lspconfig",
--         "williamboman/mason-lspconfig.nvim",
--         "WhoIsSethDaniel/mason-tool-installer.nvim",
--     },
--     config = function()
--         local mason = require("mason")
--         local mason_lspconfig = require("mason-lspconfig")
--         local mason_tool_installer = require("mason-tool-installer")
--
--         mason.setup({})
--         mason_lspconfig.setup({
--             ensure_installed = {
--                 "lua_ls",
--                 "dockerls",
--                 "gopls",
--                 "rust_analyzer",
--                 "marksman",
--                 "pyright",
--                 "pylsp",
--                 "vtsls",
--                 "eslint",
--                 "tailwindcss",
--                 "html",
--                 "cssls",
--                 "jsonls",
--             },
--             automatic_installation = true,
--         })
--
--         mason_tool_installer.setup({
--             ensure_installed = {
--                 "stylua",
--                 "black",
--                 "prettierd",
--                 "goimports",
--                 "isort",
--                 "ruff",
--                 "eslint_d",
--                 "golangci-lint",
--             },
--         })
--     end,
-- }
