-- Automatically set filetypes for .env files
vim.filetype.add({
  extension = {
    env = "sh", -- Associate .env files with 'sh' syntax
  },
})
