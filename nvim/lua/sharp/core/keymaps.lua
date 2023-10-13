local nnoremap = require('sharp.core.remap').nnoremap
local vnoremap = require('sharp.core.remap').vnoremap
local xnoremap = require('sharp.core.remap').xnoremap
local inoremap = require('sharp.core.remap').inoremap

-- out of insert mode
inoremap('<C-c>', '<esc>')

-- Explorer
nnoremap("<leader>,", vim.cmd.Ex)

-- save/quit
nnoremap("<C-s>", ":w<cr>")
nnoremap("<C-q>", ":q!<cr>")
nnoremap("<leader>q", ":q<cr>")

-- fast vertical movement
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- move lines up and down
vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- easy search and replace globally
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
