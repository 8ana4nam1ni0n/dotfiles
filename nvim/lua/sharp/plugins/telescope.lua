return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "sharkdp/fd",
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = " > ",
                color_devicons = true,
            },
        })

        local nnoremap = require("sharp.core.remap").nnoremap
        local builtin = require("telescope.builtin")

        -- find files from nvim root
        nnoremap("<leader>pf", builtin.find_files, {})

        -- find files in git repo (project)
        nnoremap("<C-p>", builtin.git_files, {})

        -- Search string in Project
        nnoremap("<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep> ") })
        end, {})

        -- Search buffers in Project
        nnoremap("<leader>pb", builtin.buffers, {})

        -- Search help tags (vim docs)
        nnoremap("<leader>ph", builtin.help_tags, {})

        -- Search current buffer
        nnoremap("<leader>pc", function()
            builtin.current_buffer_fuzzy_find({
                sorting_strategy = "ascending",
            })
        end, {})

        -- Search git worktree
        nnoremap("<leader>pw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {})
        nnoremap("<leader>pW", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})
    end,
}
