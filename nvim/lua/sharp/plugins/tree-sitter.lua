return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        local treesitter = require('nvim-treesitter.configs')

        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlight = false,
            },
            indent = { enable = true },
            ensure_installed = {
                'lua',
                'python',
                'java',
                'javascript',
                'typescript',
                'bash',
                'markdown',
                'gitignore',
                'css',
                'yaml',
                'html',
                'markdown_inline',
                'go',
                'rust',
                'json',
                'haskell',
                'cpp',
            },
        })
    end,
}



