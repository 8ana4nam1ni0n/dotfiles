local Remap = require('sharp.keymap')
local nnoremap = Remap.nnoremap
local builtin = require('telescope.builtin')

-- find files from nvim root
nnoremap('<leader>pf', builtin.find_files, {})

-- find files in git repo (project)
nnoremap('<C-p>', builtin.git_files, {})

-- Search string in Project
nnoremap('<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep> ")})
end, {})

-- Search buffers in Project
nnoremap('<leader>pb', builtin.buffers, {})

-- Search help tags (vim docs)
nnoremap('<leader>h', builtin.help_tags, {})

-- Search current buffer
nnoremap('<leader>pcb', function()
    builtin.current_buffer_fuzzy_find({
        sorting_strategy="ascending"
    })
end, {})

