return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.install").update({ with_sync = true })
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end,
  opts = {
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    ensure_installed = {
      "markdown",
      "markdown_inline",
      "tsx",
      "toml",
      "json",
      "yaml",
      "css",
      "html",
      "lua"
    },
    autotag = {
      enable = true,
    },
  }
}

