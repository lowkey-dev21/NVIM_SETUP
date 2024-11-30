return {
  {
    "nvim-tree/nvim-tree.lua", -- File explorer
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons for file types
    config = function()
      require("nvim-tree").setup({
        update_cwd = true,
        open_on_setup = true,
        open_on_setup_file = true,
        actions = {
          open_file = {
            resize_window = true,
          },
        },
        view = {
          side = "left", -- File explorer opens on the left
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        filters = {
          dotfiles = false, -- Show dotfiles
        },
        diagnostics = {
          enable = true, -- Show diagnostics (e.g., LSP errors/warnings)
        },
      })
    end,
  },
}
