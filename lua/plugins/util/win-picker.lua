return {
  "meeehdi-dev/win-picker.nvim",
  opts = {
    chars = "ABCDEFGHIJKLMNOPQRSTUVUVWXYZ",
    filter = function(id)
      local bufid = vim.api.nvim_win_get_buf(id)
      local ft = vim.api.nvim_buf_get_option(bufid, "filetype")
      return not vim.tbl_contains({ "noice", "notify" }, ft)
    end,
    hl_group = "WinPicker",
  },
  config = function(_, opts)
    vim.api.nvim_command("hi def WinPicker gui=bold guifg=#1d202f guibg=#7aa2f7")
    require("win-picker").setup(opts)
  end,
  -- stylua: ignore
  keys = {
    { "<leader>wp", function() local win_id = require("win-picker").pick_win() if win_id then vim.api.nvim_set_current_win(win_id) end end, desc = "Windows Pick", },
    { "<leader>wx", function() local win_id = require("win-picker").pick_win() if win_id then vim.api.nvim_win_close(win_id, false) end end, desc = "Windows Close", },
    { "<leader>wO", function() local win_id = require("win-picker").pick_win() if win_id then vim.api.nvim_set_current_win(win_id) vim.api.nvim_command("only") end end, desc = "Windows Pcik Only", },
  },
}

