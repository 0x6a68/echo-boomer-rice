local set = vim.keymap.set
-- map esc and stop pressing C-c
set({ "i" }, "jk", "<esc>", { desc = "Leave insert mode" })
-- fold
set({ "n" }, "<Enter>", "za")
set({ "n" }, "<leader><Enter>", "zA")
