local nnoremap = require("sharp.keymap").nnoremap
local vnoremap = require("sharp.keymap").vnoremap
local xnoremap = require("sharp.keymap").xnoremap
local inoremap = require("sharp.keymap").inoremap

inoremap("<C-c>", "<esc>")

nnoremap("<leader>,", vim.cmd.Ex)

-- buffer ops
nnoremap("<leader>bn", ":bn<cr>") -- go next buffer
nnoremap("<leader>bp", ":bp<cr>") -- go prev buffer
nnoremap("<leader>bd", ":bd<cr>") -- go delete buffer
nnoremap("<leader>bD", ":%bd<cr>") -- go delete all buffers
nnoremap("<leader>bb", "<C-^>") -- go to last buffer
nnoremap("<leader>bl", ":ls<cr>") -- list buffers

-- save/quit
nnoremap("<C-s>", ":w<cr>")
nnoremap("<C-q>", ":q!<cr>")
nnoremap("<leader>q", ":q<cr>")


-- move to window
nnoremap("<leader>wl", "<C-w>l")
nnoremap("<leader>wh", "<C-w>h")
nnoremap("<leader>wk", "<C-w>k")
nnoremap("<leader>wj", "<C-w>j")

-- page up page down centered
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+y")

