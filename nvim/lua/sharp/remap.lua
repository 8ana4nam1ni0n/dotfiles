local nnoremap = require("sharp.keymap").nnoremap
local vnoremap = require("sharp.keymap").vnoremap
local xnoremap = require("sharp.keymap").xnoremap
local inoremap = require("sharp.keymap").inoremap

-- out of insert mode
inoremap("<C-c>", "<esc>")

-- Explorer
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
