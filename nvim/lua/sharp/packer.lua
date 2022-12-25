-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- tokyo night theme
    use 'folke/tokyonight.nvim'
    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- Native LSP
    use 'neovim/nvim-lspconfig'
    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use ('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' })
    -- Devicons
    use 'kyazdani42/nvim-web-devicons'
end)

