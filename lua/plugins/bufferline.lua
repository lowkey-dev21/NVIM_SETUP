return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer next" },
      { "<Tab>", ":BufferLineCycleNext<CR>", desc = "Next Buffer (Tab)", noremap = true, silent = true },
      { "<S-Tab>", ":BufferLineCyclePrev<CR>", desc = "Previous Buffer (Shift+Tab)", noremap = true, silent = true },
      { "<leader>bc", ":bdelete<CR>", desc = "Close Current Buffer", noremap = true, silent = true },
    },
    opts = {
      options = {
        close_command = function(n) Snacks.bufdelete(n) end, -- Use a custom delete function
        right_mouse_command = function(n) Snacks.bufdelete(n) end, -- Delete on right click
        separator_style = "slant", -- Visually appealing separator
        always_show_bufferline = true, -- Always show the bufferline
        diagnostics = "nvim_lsp", -- Display diagnostics in the bufferline
        show_buffer_close_icons = true, -- Show close icon on each buffer
        close_icon = "", -- Customize the close icon
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        ---@param opts bufferline.IconFetcherOpts
        get_element_icon = function(opts) return LazyVim.config.icons.ft[opts.filetype] end,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)

      -- Fix bufferline behavior when restoring a session
      vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function() pcall(vim.cmd, "BufferLineRefresh") end)
        end,
      })
    end,
  },
}
