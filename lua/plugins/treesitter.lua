return {
  -- Treesitter setup
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "css",
        "gitignore",
        "graphql",
        "http",
        "json",
        "scss",
        "sql",
        "vim",
        "lua",
        "rust", -- Add Rust parser
        "bash",
      },
      highlight = {
        enable = true, -- Enable syntax highlighting
        additional_vim_regex_highlighting = false, -- Avoid conflicts with native highlighting
      },
      indent = {
        enable = true, -- Enable Treesitter-based indentation
      },
      incremental_selection = {
        enable = true, -- Enable incremental selection
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    },
  },

  -- Filetype detection for .env
  vim.filetype.add({
    extension = {
      env = "sh", -- Associate .env files with bash syntax
    },
  }),

  -- Mason.nvim setup for shellcheck and shfmt
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "shellcheck", -- Lint shell scripts (including .env files)
        "shfmt", -- Format shell scripts
      })
    end,
  },
}
