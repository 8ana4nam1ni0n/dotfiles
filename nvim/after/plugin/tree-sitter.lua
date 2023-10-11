require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        "cpp",
        "go",
        "yaml",
        "json",
        "python",
        "rust",
        "java",
        "html",
        "markdown",
        "javascript",
        "typescript",
        "bash",
        "haskell"
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlight = false
    }
}
