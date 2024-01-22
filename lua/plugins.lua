return {
  { "folke/which-key.nvim", lazy = true },
  { "folke/neoconf.nvim",   cmd = "Neoconf" },
  "nvim-lua/plenary.nvim",
  "folke/neodev.nvim",
  "L3MON4D3/LuaSnip",
  "simrat39/rust-tools.nvim",
  {
    "kyazdani42/nvim-web-devicons",
    opts = {
      default = false,
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },
  "windwp/nvim-ts-autotag",
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      "*",
    },
  },
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<C-w>o", "<cmd>ZenMode<cr>", { silent = true }
      }
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "lewis6991/gitsigns.nvim", lazy = true },
  { "mbbill/undotree",         lazy = true },
  {
    "tpope/vim-fugitive",
    lazy = true,
    opts = {
      keys = {
        -- Open git blame window
        blame = "<leader>gb",
        -- Open file/folder in git repository
        browse = "<leader>go",
      }
    }
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  { "RRethy/vim-illuminate",
    -- opts = {
    --   providers = {
    --     "lsp",
    --     "treesitter",
    --     "regex",
    --   },
    --   delay = 100,
    --   filetype_overrides = {},
    --   filetypes_denylist = {
    --     "dirbuf",
    --     "dirvish",
    --     "fugitive",
    --   },
    -- }
  },
}
