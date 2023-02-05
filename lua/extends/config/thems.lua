local state, neo = pcall(require, 'neosolarized')
if not state then return end

-- Lua
-- require('neosolarized').setup({
--   comment_italics = true,
--   background_set = false,
-- })

vim.cmd [[colorscheme tokyonight]]
