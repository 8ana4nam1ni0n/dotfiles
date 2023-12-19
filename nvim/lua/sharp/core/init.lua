require('sharp.core.options')
require('sharp.core.remap')
require('sharp.core.keymaps')
require('sharp.core.filetype')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local SharpGrp = augroup('SharpGroup', {})
local CustomShGrp = augroup('CustomShellHighlight', {})
local YankGrp = augroup('YankHighlightGroup', {})

-- Set Syntax Highlighting for Tmux conf files
autocmd({'BufRead', 'BufNewFile'}, {
	pattern = '*.tmux',
	command = 'silent! set ft=sh'
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

-- Remove spaces at the end of lines
autocmd({'BufWritePre'}, {
    group = SharpGrp,
    pattern = '*',
    command = "%s/\\s\\+$//e",
})
