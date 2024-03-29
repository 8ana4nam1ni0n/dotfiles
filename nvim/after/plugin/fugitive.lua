local Remap = require("sharp.keymap")

Remap.nnoremap('<leader>gs', vim.cmd.Git)

-- Create custom group for fugitive keybinds
local SharpFugitive = vim.api.nvim_create_augroup('SharpFugitive', {})

-- Autocmd that detects fugitive window and sets keybinds for it.
local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWinEnter', {
    group = SharpFugitive,
    pattern = '*',
    callback = function()
        if vim.bo.ft ~= 'fugitive' then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        Remap.nnoremap('<leader>p', function()
                vim.cmd.Git('push')
            end,
            opts
        )

        Remap.nnoremap('<leader>P', function()
                vim.cmd.Git({'pull', ' --rebase'})
            end,
            opts
        )

        -- Note: It allows me to set the branch I'm pushing and any tracking
        -- needed if I did not set the branch up correctly
        Remap.nnoremap('<leader>t', ':Git push -u origin ', opts)
    end,
})
