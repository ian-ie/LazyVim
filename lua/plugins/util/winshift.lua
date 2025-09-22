return {
  "sindrets/winshift.nvim",
  config = function()
    -- Lua
    require("winshift").setup({
      window_picker = function()
        return require("win-picker").pick_win()
      end,
    })
  end,
  keys = {
    { "<leader>wM", "<cmd>WinShift<cr>", desc = "Window Move" },
    { "<leader>ws", "<cmd>WinShift swap<cr>", desc = "Window Swap" },
  },
}

