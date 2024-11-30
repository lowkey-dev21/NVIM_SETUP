return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000, -- Ensure the theme is loaded first
    config = function()
      -- Configure the VS Code theme
      require("vscode").setup({
        style = "dark", -- Use "dark" for "Dark Modern"
        transparent = true, -- Optional: disable transparency
        italic_comments = true, -- Optional: enable italic comments
      })

      -- Apply the colorscheme
      vim.cmd.colorscheme("vscode")
    end,
  },
}
