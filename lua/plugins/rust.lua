return {
  {
    "neovim/nvim-lspconfig", -- LSP support
  },
  {
    "simrat39/rust-tools.nvim", -- Enhanced Rust features
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "hrsh7th/nvim-cmp", -- Completion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    },
  },
  {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    build = ":TSUpdate",
  },
  {
    "saecki/crates.nvim", -- Manage Cargo.toml dependencies
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },
}
