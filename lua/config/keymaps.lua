local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)
keymap.set("n", "<Leader>r", ":NvimTreeRefresh<CR>", opts)

-- Move and paste files in NvimTree
keymap.set("n", "<Leader>m", ":lua require('nvim-tree.api').fs.cut()<CR>", opts) -- Mark file for moving
keymap.set("n", "<Leader>p", ":lua require('nvim-tree.api').fs.paste()<CR>", opts) -- Paste the file

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Move and paste files in NvimTree
keymap.set("n", "<Leader>m", function()
  require("nvim-tree.api").fs.cut() -- Mark file for moving
end, opts)

keymap.set("n", "<Leader>p", function()
  require("nvim-tree.api").fs.paste() -- Paste the file
end, opts)

-- Diagnostics
keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)

-- Toggle word wrap with Alt + Z
vim.api.nvim_set_keymap("n", "<A-z>", ":set wrap!<CR>", { noremap = true, silent = true })
