vim.cmd [[packadd packer.nvim]]

require('packer').init({
  git = {
    default_url_format = "git@github.com:%s.git",
  }
})

return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'
  require('extends.plugins').extends(use)
end,
  config = {
    display = {
      open_fn = require('packer.util').float
    }
  } })
