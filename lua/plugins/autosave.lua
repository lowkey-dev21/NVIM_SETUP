return {
  -- plugin: auto-save.nvim
  -- function: auto save changes
  -- src: https://github.com/pocco81/auto-save.nvim
  {
    "Pocco81/auto-save.nvim",
    opts = {
      enabled = true, -- Enable auto-save
      execution_message = {
        message = function()
          return ("Auto-saved at " .. vim.fn.strftime("%H:%M:%S"))
        end,
        cleaning_interval = 1000,
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- Trigger auto-save on these events
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        if
          fn.getbufvar(buf, "&modifiable") == 1
          and utils.not_in(fn.getbufvar(buf, "&filetype"), { "gitcommit", "markdown" })
        then
          return true
        end
        return false
      end,
      write_all_buffers = false,
      debounce_delay = 135,
      callbacks = {
        before_saving = function()
          -- Run formatter before saving
          if vim.lsp.buf.format then
            vim.lsp.buf.format({ async = false }) -- Use LSP-based formatting
          elseif vim.fn.exists(":Neoformat") then
            vim.cmd(":Neoformat") -- Fallback to Neoformat if installed
          end
        end,
      },
    },
  },
}
