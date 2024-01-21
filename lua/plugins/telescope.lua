return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  opts = {
    defaults = {
      mappings = {
        n = {
          -- ["q"] = fb.actions.close,
        },
      },
    },
    extensions = {
      file_browser = {
        theme = "dropdown",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
          -- ["i"] = {
          --   ["<C-c>"] = fb.actions.create,
          --   ["<C-p>"] = fb.actions.goto_parent_dir,
          --   ["<C-w>"] = fb.actions.goto_cwd,
          --   ["<C-r>"] = fb.actions.rename,
          --   ["<C-d>"] = fb.actions.remove,
          -- },
          -- ["n"] = {
          --   ["c"] = fb.actions.create,
          --   ["p"] = fb.actions.goto_parent_dir,
          --   ["r"] = fb.actions.rename,
          --   ["d"] = fb.actions.remove,
          -- },
        },
      },
    },
  },
  config = function()
    local function telescope_buffer_dir()
      return vim.fn.expand("%:p:h")
    end

    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local telescope = require("telescope")
    local fb = telescope.extensions.file_browser

    telescope.load_extension("file_browser")
    telescope.load_extension("ui-select")

    Map("n", "ff", function()
      builtin.find_files({
        no_ignore = false,
        hidden = false,
      })
    end)
    Map("n", "fg", function()
      builtin.live_grep({
        previewer = true,
      })
    end)
    Map("n", "\\\\", function()
      builtin.buffers({
        previewer = false,
      })
    end)
    Map("n", "ft", function()
      builtin.help_tags({
        previewer = true,
      })
    end)
    Map("n", "fd", function()
      builtin.diagnostics()
    end)
    Map("n", "fb", function()
      fb.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = true,
        hidden = true,
        grouped = false,
        previewer = true,
        initial_mode = "insert",
        layout_config = { height = 40 },
      })
    end)
  end
}

