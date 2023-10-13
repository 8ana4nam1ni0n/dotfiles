return {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
        require('rose-pine').setup({
            disable_background = true,
        })

        -- load colorscheme in here
        vim.cmd([[colorscheme rose-pine]])
    end,
}
