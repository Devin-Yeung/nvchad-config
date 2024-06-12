require "nvchad.mappings"

-- Set mappings
local map = vim.keymap.set

-- Disable mappings
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- remap the buffer switch
map("n", "<S-L>", function() -- TAB
  require("nvchad.tabufline").next()
end, { desc = "goto next buffer" })

map("n", "<S-H>", function() -- S-TAB
  require("nvchad.tabufline").prev()
end, { desc = "goto prev buffer" })

-- remap the window switch
map("n", "<Tab>", "<C-w>w", { desc = "switch to next window" })

-- toggle terminal
map("n", "<leader>t", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "toggle terminal" })

-- unmap some useless keys
nomap({ "n", "t" }, "<A-v>")
nomap({ "n", "t" }, "<A-h>")
nomap({ "n", "t" }, "<A-i>")

-- open file search
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
