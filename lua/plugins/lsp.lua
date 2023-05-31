return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = {},
      },
      {
        "williamboman/mason.nvim",
      },
      {
        "williamboman/mason-lspconfig.nvim",
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          return require("lazy.core.config").plugins["nvim-cmp"] ~= nil
        end,
      },
      {
        "b0o/SchemaStore.nvim",
      },
    },
    keys = {
      { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "gr",vim.lsp.buf.references, desc = "Goto References" },
      { "<leader>v", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, desc = "Code Action" },
    },
    opts = function()
      local schemastore = require("schemastore")
      return {
        -- add any global capabilities here
        capabilities = {},
        -- Automatically format on save
        autoformat = true,
        -- Enable this to show formatters used in a notification
        -- Useful for debugging formatter issues
        format_notify = false,
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        servers = {
          -- awk
          awk_ls = {},
          -- bash
          bashls = {},
          -- c, cpp
          clangd = {},
          -- docker
          dockerls = {},
          -- docker compose
          docker_compose_language_service = {},
          -- cmake
          neocmake = {},
          -- golang
          gopls = {},
          -- json
          jsonls = {
            settings = {
              json = {
                schemas = schemastore.json.schemas(),
                validate = { enable = true },
              },
            },
          },
          -- lua
          lua_ls = {
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          },
          -- markdown
          marksman = {},
          -- python
          pylsp = {
            settings = {
              pylsp = {
                plugins = {
                  autopep8 = {
                    enabled = true,
                  },
                  flake8 = {
                    enabled = true,
                  },
                  mccabe = {
                    enabled = true,
                  },
                  preload = {
                    enabled = true,
                  },
                  pycodestyle = {
                    enabled = true,
                  },
                  pydocstyle = {
                    enabled = true,
                  },
                  pyflakes = {
                    enabled = true,
                  },
                  pylint = {
                    enabled = true,
                  },
                  yapf = {
                    enabled = true,
                  },
                },
              },
            },
          },
          -- rust
          rust_analyzer = {},
          -- sql
          sqlls = {},
          -- toml
          taplo = {},
          vimls = {},
          -- yaml
          yamlls = {
            settings = {
              yaml = {
                schemaStore = { enable = false },
                schemas = schemastore.yaml.schemas(),
                validate = true,
              },
            },
          },
        },
    }
    end,
    config = function(_, opts)
      local servers = opts.servers
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities or {}
      )
      -- setup by lspconfig
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        require("lspconfig")[server].setup(server_opts)
      end
      -- get all the servers that are available thourgh mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    build = ":MasonUpdate",
    keys = {
      { "<leader>ms", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      local plugin = require("mason")
      plugin.setup(opts)
    end,
  },
}
