return {
    "michaelb/sniprun",
    enabled = true,
    branch = "master",
    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
    config = function()
        require("sniprun").setup({
            -- your options
        })
    end,
    keys = {
        { "<Leader>rf", "<cmd>%SnipRun<cr>", desc = "run file" },
        { "<Leader>rr", "<Plug>SnipRun", desc = "run snip" },
        { "<Leader>rc", "<Plug>SnipClose", desc = "close" },
        { "<Leader>rR", "<Plug>SnipReset", desc = "reset" },
        { "<Leader>r", "<Plug>SnipRun", desc = "run", mode = "v" },
    },
}
