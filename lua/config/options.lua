-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 设置缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- 禁用光标行
vim.opt.cursorline = false
-- 设置文件编码
vim.opt.fileencodings = "utf-8,gb2312,gbk"
-- 禁用 snacks 动画
vim.g.snacks_animate = false
-- 禁用鼠标支持
vim.opt.mouse = ""
vim.g.root_spec = { "lsp", { ".git", ".svn", ".vscode", ".luarc.json", "lua" }, "cwd" }

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font Mono,等距更纱黑体 SC:h12"
    -- vim.o.guifont = "Maple Mono NF CN:h12"
    vim.g.neovide_remember_window_size = false
    vim.g.neovide_opacity = 0.95
    vim.g.neovide_cursor_vfx_mode = "railgun"
end
