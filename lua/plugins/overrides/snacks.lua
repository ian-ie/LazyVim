return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      width = 72,
      sections = {
        {
          section = "terminal",
          align = "center",
          cmd = "cat " .. vim.fn.stdpath("config") .. "/header.cat",
          height = 11,
          width = 72,
          padding = 1,
        },
        {
          align = "center",
          padding = 1,
          text = {
            { "  Update ", hl = "Label" },
            { "  Projects ", hl = "Number" },
            { "  Files ", hl = "DiagnosticInfo" },
            { "  Recent ", hl = "@string" },
            { "  Config ", hl = "@character" },
            { " 󱒯 Lazy ", hl = "@property" },
          },
        },
        { section = "startup", padding = 1 },
        { icon = "", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = "", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { text = "", key = "f", action = ":lua Snacks.dashboard.pick('files')" },
        { text = "", key = "l", action = ":Lazy sync" },
        { text = "", key = "p", action = "<leader>fp" },
        { text = "", key = "r", action = "<leader>fr" },
        { text = "", key = "c", action = "<leader>fc" },
        { text = "", key = "s", action = "<leader>qS" },
        { text = "", key = "q", action = ":qa" },
      },
    },

    indent = {
      scope = {
        hl = {
          "SnacksIndent1",
          "SnacksIndent2",
          "SnacksIndent3",
          "SnacksIndent4",
          "SnacksIndent5",
          "SnacksIndent6",
          "SnacksIndent7",
          "SnacksIndent8",
        },
      },
    },
  },
}

