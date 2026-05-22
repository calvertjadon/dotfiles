local parser_config = {
  install_info = {
    url = "https://github.com/fredrikaverpil/tree-sitter-godoc",
    files = { "src/parser.c" },
    version = "*",
  },
  filetype = "godoc",
}

return {
  "fredrikaverpil/godoc.nvim",
  version = "*",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      opts = function(_, opts)
        -- Runs while nvim-treesitter is loading, so parsers module is available
        require("nvim-treesitter.parsers").godoc = parser_config
        vim.treesitter.language.register("godoc", "godoc")
        -- TSUpdate reloads the parsers list, wiping custom registrations
        vim.api.nvim_create_autocmd("User", {
          pattern = "TSUpdate",
          callback = function()
            require("nvim-treesitter.parsers").godoc = parser_config
          end,
        })
      end,
    },
  },
  build = function()
    require("nvim-treesitter.parsers").godoc = parser_config
    vim.cmd("TSUpdate go godoc")
  end,
  cmd = { "GoDoc" },
  ft = "godoc",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "godoc",
      callback = function(ev)
        vim.treesitter.start(ev.buf, "godoc")
      end,
    })
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.godoc",
      callback = function()
        vim.bo.filetype = "godoc"
      end,
    })
  end,
  opts = {
    adapters = {
      {
        name = "go",
        opts = {
          command = "GoDoc",
          get_syntax_info = function()
            return {
              filetype = "godoc",
              language = "godoc",
            }
          end,
        },
      },
    },
    picker = {
      type = "snacks",
    },
  },
}

