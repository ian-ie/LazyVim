-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader><enter>", "<cmd>ReachOpen buffers<cr>", { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>BufferLineSortByDirectory<cr>", { desc = "Sort by directory" })
vim.keymap.set("n", "<leader>bS", "<cmd>BufferLineSortByExtension<cr>", { desc = "Sort by extension" })
vim.keymap.set("n", "<leader>bf", "<cmd>BufferLinePick<cr>", { desc = "Jump Pick Buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>BufferLinePickClose<cr>", { desc = "Close Pick Buffer" })
vim.keymap.set("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Goto Buffer 1" })
vim.keymap.set("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Goto Buffer 2" })
vim.keymap.set("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Goto Buffer 3" })
vim.keymap.set("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Goto Buffer 4" })
vim.keymap.set("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Goto Buffer 5" })
vim.keymap.set("n", "<leader>A", "ggVG", { desc = "Select All" })

vim.keymap.set({ "n", "x", "o" }, "H", "^")
vim.keymap.set({ "n", "x", "o" }, "L", "$")
vim.keymap.set({ "n", "x", "o" }, "go", "%")

-- windows
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Vsplit Window", remap = true })
vim.keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Window Only", remap = true })

-- user
vim.keymap.set("n", "<leader>p", ":FormatJsonPaste<CR>", { desc = "Paste FormatJson" })
vim.keymap.set("n", "<leader>tp", ":ShowChinaTime<CR>", { desc = "Convert timestamp" })
