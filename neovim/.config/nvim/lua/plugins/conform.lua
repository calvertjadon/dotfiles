return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters.sqlfluff = {
        cwd = require("conform.util").root_file({ ".sqlfluff", ".git" }),
        require_cwd = false,
      }
      return opts
    end,
  },
}