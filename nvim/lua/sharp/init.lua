require("sharp.packer")
require("sharp.set")
require("sharp.remap")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local SharpGrp = augroup('SharpGroup', {})
local CustomShGrp = augroup('CustomShellHighlight', {})
local YankGrp = augroup('YankHighlightGroup', {})

-- Set Syntax Higligthing for Tmux conf files
autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '*.tmux',
    command = 'silent! set ft=tmux'
})

-- Set Syntax Higligthing for .alias files
autocmd({'BufRead', 'BufNewFile'}, {
    pattern = {'*.alias', 'init', 'env', '*.env'},
    command = 'silent! set ft=sh',
    group = CustomShGrp
})

autocmd('TextYankPost', {
    group = YankGrp,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({'BufWritePre'}, {
    group = SharpGrp,
    pattern = '*',
    command = "%s/\\s\\+$//e",
})

