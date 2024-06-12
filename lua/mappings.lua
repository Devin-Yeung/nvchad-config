require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- remap the buffer switch
map("n", "<S-L>", function() -- TAB
  require("nvchad.tabufline").next()
end, { desc = "goto next buffer" })

map("n", "<S-H>", function() -- S-TAB
  require("nvchad.tabufline").prev()
end, { desc = "goto prev buffer" })

-- open file search
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
