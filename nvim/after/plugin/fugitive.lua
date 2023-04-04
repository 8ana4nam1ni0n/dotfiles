local Rmap = require("sharp.keymap")
local nnoremap = Rmap.nnoremap

nnoremap("<leader>gs", vim.cmd.Git)
