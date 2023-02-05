local state, tree_config = pcall(require, "nvim-treesitter.configs")
if not state then
  return
end
local langs = {}
if vim.fn.has('win32') == 0 then
  langs = { "c", "lua", "vim", "help" }
end
tree_config.setup({
  ensure_installed = langs,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
