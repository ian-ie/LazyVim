return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({ use_default_keymaps = false, max_join_length = 500 })
  end,
  keys = { { "<leader>ts", "<cmd>TSJToggle<cr>", desc = "Splitting/Joining Blocks" } },
  cmd = "TSJToggle",
}

