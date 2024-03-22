-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("MyAutoCmd", { clear = true })

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   group = "MyAutoCmd",
--   pattern = "*",
--   command = "highlight WinSeparator ctermbg=NONE guibg=NONE",
-- })
