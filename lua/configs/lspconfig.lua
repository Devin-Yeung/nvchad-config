-- lsp config
local on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
  -- neovim support inlay_hint natively after neovim 0.10
  -- Note: that the hints are only visible after rust-analyzer has finished loading and you have to edit the file to trigger a re-render.
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  -- for those who use (0.8 < neovim < 0.10)
  -- require("lsp-inlayhints").on_attach(client, bufnr)
end

local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "rust_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- rust-analyzer
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
  on_init = on_init,
  capabilities = capabilities,
}
