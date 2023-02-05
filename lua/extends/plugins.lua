local Plugins = {}

function Plugins.extends(use)
  -- cmdline
  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- })

  -- explore
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })
  -- theme
  use({ "svrana/neosolarized.nvim", requires = { { "tjdevries/colorbuddy.nvim" } } })
  use 'folke/tokyonight.nvim'

  -- lsp
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = { { "nvim-tree/nvim-web-devicons" } },
  })

  -- high
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- text
  use("rmagatti/alternate-toggler") -- true/false
  use("mg979/vim-visual-multi") -- C_n
  use("gcmt/wildfire.vim") -- ' ' ( {
  use("tpope/vim-surround") -- cs'" cs  ds yss) ds ysiw"
  use({ "numToStr/Comment.nvim" }) -- gcc
  use("windwp/nvim-autopairs")
  use("jose-elias-alvarez/null-ls.nvim")

  -- search
  use("nvim-lua/plenary.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use("nvim-telescope/telescope-file-browser.nvim")

  -- line
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

  -- CMP
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind.nvim")
  -- snip
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  --use { "akinsho/toggleterm.nvim", tag = '*' }
  --use 'voldikss/vim-translator'
  --use 'norcalli/nvim-colorizer.lua'
  --use 'xiyaowong/nvim-transparent'
  --use 'MunifTanjim/prettier.nvim'

  -- dap
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
  use("theHamsta/nvim-dap-virtual-text")

  -- markdown

  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use({ "img-paste-devs/img-paste.vim" })

  -- bookmark
  use("MattesGroeger/vim-bookmarks")
  use("tom-anders/telescope-vim-bookmarks.nvim")
  -- git
  use("f-person/git-blame.nvim")
  -- todo
  use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

  use 'petertriho/nvim-scrollbar'
  use "lukas-reineke/indent-blankline.nvim"
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'echasnovski/mini.animate'
end

return Plugins
