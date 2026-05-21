return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      templ = {
        filetypes = { "templ" },
        settings = {
          enable_snippets = true,
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "templ",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "templ" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        templ = { "templ" },
      },
    },
  },
}
