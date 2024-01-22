-- local opts = { noremap = true, silent = true }

return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "folke/neodev.nvim" },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    HOME_PATH = os.getenv("HOME") .. "/"
    MASON_PATH = HOME_PATH .. ".local/share/nvim/mason/packages/"
    local codelldb_path = MASON_PATH .. "codelldb/extension/adapter/codelldb"
    local liblldb_path = MASON_PATH .. "codelldb/extension/lldb/lib/liblldb.so"

    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup {}

    Map('n', '<leader>e', vim.diagnostic.open_float)
    Map('n', '[d', vim.diagnostic.goto_prev)
    Map('n', ']d', vim.diagnostic.goto_next)
    Map('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        -- handled by Lspsaga
        --
        -- Map('n', 'gD', vim.lsp.buf.declaration, opts)
        -- Map('n', 'gd', vim.lsp.buf.definition, opts)
        -- Map('n', 'K', vim.lsp.buf.hover, opts)
        -- Map('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- Map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        -- Map('n', '<leader>rn', vim.lsp.buf.rename, opts)
        -- Map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        -- Map('n', 'gi', vim.lsp.buf.implementation, opts)
        -- Map('n', 'gr', vim.lsp.buf.references, opts)
        Map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        Map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        Map('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        Map('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

    local r = lspconfig.rust_analyzer

    local protocol = require("vim.lsp.protocol")

    -- Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    r.setup {
      tools = {
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },
      cmd = {
        "rustup", "run", "nightly", "rust-analyzer"
      },
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      on_attach = function(client, bufnr)
        r.hover_actions.auto_focus = true
        --
        -- handled by Lspsaga
        --
        -- vim.keymap.set("n", "K", r.hover_actions.hover_actions, { buffer = bufnr })
        -- Hover actions
        -- vim.keymap.set("n", "<C-space>", r.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        -- vim.keymap.set("n", "<leader>a", r.code_action_group.code_action_group, { buffer = bufnr })
      end,
      filetypes = { "rust" },
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
        }
      },
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end
}
