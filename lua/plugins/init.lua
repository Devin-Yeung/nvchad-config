return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- completion
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "nvchad.configs.cmp"
      -- I prefer not to select the first one (noselect)
      opts.completion.completeopt = "menu,menuone,noselect"
      -- credit: https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.lua
      opts.experimental = { ghost_text = true }
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- Mangae Lsp
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "prettier",
      },
    },
  },
  -- Tree sitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "html",
        "css",
        "rust",
      },
    },
  },
  -- Inlay hints for those (0.8 <= neovim < 0.10)
  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   init = function()
  --     -- https://github.com/mrcjkb/rustaceanvim/discussions/46#discussioncomment-7636177
  --     require("lsp-inlayhints").setup()
  --     -- override the InlayHint color with onedark bg
  --     vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "", bg = "#1e222a" })
  --     -- toggle
  --     require("lsp-inlayhints").toggle()
  --   end,
  -- },
}
