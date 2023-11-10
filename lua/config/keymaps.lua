-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>BufferLineSortByDirectory", { desc = "Sort by directory" })
vim.keymap.set("n", "<leader>bS", "<cmd>BufferLineSortByExtension", { desc = "Sort by extension" })

vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "$")
vim.keymap.set({ "n", "x" }, "go", "%")
vim.keymap.set("n", "yaa", "<cmd>%y+<cr>", { desc = "copy all" })

vim.keymap.set( "n", "<leader>sr", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
