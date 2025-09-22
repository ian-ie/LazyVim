return {
  "gen740/SmoothCursor.nvim",
  config = function()
    require("smoothcursor").setup({
      fancy = { enable = true },
      disable_float_win = true,
      disabled_filetypes = { "TelescopePrompt", "NvimTree", "json", "codecompanion" },
    })
  end,
}

