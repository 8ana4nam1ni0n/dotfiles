-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- theme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require('rose-pine').setup()
            vim.cmd('colorscheme rose-pine')
        end
    })
    -- Native LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional
            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use ('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' })

    -- Devicons
    use 'kyazdani42/nvim-web-devicons'

    -- Harpoon
    use 'theprimeagen/harpoon'

    -- Git
    use 'tpope/vim-fugitive'
    use 'nvim-lualine/lualine.nvim'

    -- Format
    use 'lukas-reineke/indent-blankline.nvim'
    use 'numToStr/Comment.nvim'

    -- Markdown
    use ({
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install' ,
        setup = function()
            vim.g.mkdp_filetypes = {'markdown'}
        end,
        ft = {'markdown'}
    })
end)

