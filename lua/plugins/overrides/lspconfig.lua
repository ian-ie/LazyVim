return {
    "neovim/nvim-lspconfig",
    opts = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        -- change a keymap
        keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" }
        keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action", mode = { "n", "v" } }
        keys[#keys + 1] = { "<leader>cr", "<cmd>Lspsaga rename<CR>", desc = "Rename" }

        -- disable a keymap
        -- keys[#keys + 1] = { "K", false }
        -- add a keymap
        -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
}
