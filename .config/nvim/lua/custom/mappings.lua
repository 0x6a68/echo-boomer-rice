local M = {}
M.telescope = {
   n = {},
}

M.whichkey = {
   n = {
      ["<leader>h1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Jump to file 1" },
      ["<leader>h2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Jump to file 2" },
      ["<leader>h3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Jump to file 3" },
      ["<leader>h4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Jump to file 4" },
      ["<leader>ha"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
      ["<leader>hh"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
   },
}

return M
