return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant", -- Looks good like VS Code tabs
          always_show_bufferline = true, -- Always display the tabline
          diagnostics = "nvim_lsp", -- Show diagnostics in the tabline
          show_buffer_close_icons = true, -- Enable close (X) icon on each tab
          close_icon = "", -- Customize the close icon (this is the Nerd Font icon for "X")
        },
      })

      -- Keybindings for buffer navigation
      vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>bc", ":bdelete<CR>", { noremap = true, silent = true }) -- Close current buffer
    end,
  },
}
