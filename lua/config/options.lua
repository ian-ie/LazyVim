-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = false
vim.opt.fileencodings = "utf-8,gb2312,gbk"
vim.opt.formatoptions = ""
vim.opt.mouse = ""

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font Mono,等距更纱黑体 SC:h11"
    vim.g.neovide_remember_window_size = false
    vim.g.neovide_transparency = 0.98
    vim.g.neovide_cursor_vfx_mode = "wireframe"
end
