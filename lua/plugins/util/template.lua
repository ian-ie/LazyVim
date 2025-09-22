return {
  "glepnir/template.nvim",
  cmd = "Template",
  config = function()
    require("template").setup({
      temp_dir = "~/.config/nvim/lua/templates",
    })
  end,
  keys = {
    { "<leader>tt", ":Template ", desc = "template" },
  },
}

