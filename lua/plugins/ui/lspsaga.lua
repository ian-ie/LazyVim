return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                show_file = false,
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
    keys = { -- 核心配置：keys 字段
        -- 预览定义
        { "gpd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
        -- 悬停文档
        -- { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
        -- 代码操作
        -- { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action", mode = { "n", "v" } },
        -- 重命名
        { "<leader>cr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
        -- 诊断导航
        { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev Diagnostic" },
        { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
        -- 查找引用/实现 (LSP finder)
        { "gh", "<cmd>Lspsaga finder<CR>", desc = "LSP Finder" },
    },
}
