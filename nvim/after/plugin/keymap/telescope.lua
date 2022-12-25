local Remap = require('sharp.keymap')
local nnoremap = Remap.nnoremap

-- TODO add more remaps for telescope this shit is awesome
nnoremap('<C-p>', ":Telescope")
-- Find Files
nnoremap('<leader>ff', function()
    require('telescope.builtin').find_files()
end)

-- Current Buffer
nnoremap('<leader>fcb', function()
    require('telescope.builtin').current_buffer_fuzzy_find({
        sorting_strategy="ascending"
    })
end)

-- Find Buffers
nnoremap('<leader>fb', function()
    require('telescope.builtin').buffers()
end)

