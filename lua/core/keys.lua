local map = vim.keymap.set

vim.opt.timeoutlen = 500
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<space>w", ":w<CR>")
map("n", "<space>q", ":q<CR>")
map("n", "H", "$")
map("n", "L", "^")
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")
map("n", "wd", "viwd")

-- window
map("n", "sc", "<C-w>c")
map("n", "so", "<C-w>o")
map("n", "ss", ":split<CR>")
map("n", "sv", ":vsplit<CR>")

map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")


local state, _= pcall(require, "nvim-tree")
if not state then 
  map('n',';e',":Vexplore<CR>")
end
