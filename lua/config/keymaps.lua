-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- CTRL-Space: Show history
vim.keymap.set("c", "<C-@>", "<C-f>")

-- CTRL-V: Paste from clipboard
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
-- vim.keymap.set("i", "<C-w>", "<C-g>u<C-w>")
-- vim.keymap.set("i", "<C-u>", "<C-g>u<C-u>")

-- Edit file from buffer folder
vim.keymap.set("n", "<C-w><C-e>", ":edit <C-r>=fnameescape(expand('%:p:~:.:h')) . '/'<CR>")

-- Edit buffer
vim.keymap.set("n", "<C-w>e", ":edit<Space>")

-- i.: inner WORD
vim.keymap.set({ "o", "x" }, "i.", "iW", {})
-- a.: a WORD
vim.keymap.set({ "o", "x" }, "a.", "aW", {})

-- ie: inner entire buffer
vim.keymap.set({ "o", "x" }, "ie", ":<C-u>mark '<Bar>keepjumps normal! gg^vGg_<CR>", { silent = true })
-- ae: an entire buffer
vim.keymap.set({ "o", "x" }, "ae", ":<C-u>mark '<Bar>keepjumps normal! gg0vG$<CR>", { silent = true })

-- ig: inner entire buffer
vim.keymap.set({ "o", "x" }, "ig", ":<C-u>mark '<Bar>keepjumps normal! gg^vGg_<CR>", { silent = true })
-- ag: an entire buffer
vim.keymap.set({ "o", "x" }, "ag", ":<C-u>mark '<Bar>keepjumps normal! gg0vG$<CR>", { silent = true })

-- il: inner line
vim.keymap.set({ "o", "x" }, "il", ":<C-u>mark '<Bar>keepjumps normal! ^vg_<CR>", { silent = true })
-- al: a line
vim.keymap.set({ "o", "x" }, "al", ":<C-u>mark '<Bar>keepjumps normal! 0v$<CR>", { silent = true })

-- iv: inner line
vim.keymap.set({ "o", "x" }, "iv", ":<C-u>mark '<Bar>keepjumps normal! ^vg_<CR>", { silent = true })
-- av: a line
vim.keymap.set({ "o", "x" }, "av", ":<C-u>mark '<Bar>keepjumps normal! 0v$<CR>", { silent = true })
-- Q: Disable Ex-mode. qq to record, Q to replay (remapped)
vim.keymap.set("n", "Q", "@q", { remap = true })

-- gQ: Q (remapped)
vim.keymap.set("n", "gQ", "Q")

-- .: repeats the last command on every line
vim.keymap.set("x", ".", ":normal .<CR>")

-- @: repeats macro on every line
vim.keymap.set("x", "@", ":normal @")

-- After indenting code, does not exit Visual mode
-- vim.keymap.set("x", ">", ">gv")
-- vim.keymap.set("x", "<", "<gv")

-- Tab / Shift-Tab: Indent code in Visual mode
vim.keymap.set("x", "<Tab>", ">", { remap = true })
vim.keymap.set("x", "<S-Tab>", "<", { remap = true })

-- Indent whole file
vim.keymap.set("n", "g=", "gg=G``")

-- gi already moves to "last place you exited insert mode"
-- gI: Move to last change (remapped)
vim.keymap.set("n", "gI", "`.`")

-- gV: Select the text that was last edited/pasted (remapped)
-- http://vimcasts.org/episodes/bubbling-text/
vim.keymap.set("n", "gV", "`[v`]", { remap = true })

-- U: Redo (remapped)
vim.keymap.set("n", "U", "<Cmd>redo<CR>")

-- Y: Yank to end line (remapped)
-- vim.keymap.set("n", "Y", "y$")

-- Copy / cut to clipboard
vim.keymap.set("n", "cy", [["+y]], { remap = true })
vim.keymap.set("n", "cd", [["+d]], { remap = true })

vim.keymap.set("x", "gy", [["+y]], { remap = true })
vim.keymap.set("x", "gd", [["+d]], { remap = true })

-- Copy <cfile> (filename or url) under cursor to clipboard
vim.keymap.set(
  "n",
  "cu",
  [[<Cmd>let [@+, @*] = [expand('<cfile>'), expand('<cfile>')]<CR><Cmd>echo 'Copied: ' . @*<CR>]],
  { silent = true }
)

-- Copy yanked text to clipboard
vim.keymap.set("n", "cY", [[<Cmd>let [@+, @*] = [@", @"]<CR>]], { silent = true })

-- Paste from clipboard
vim.keymap.set("n", "cp", [["+p]], { silent = true })
vim.keymap.set("n", "cP", [["+P]], { silent = true })
vim.keymap.set("n", "cgp", [["+gp]], { silent = true })
vim.keymap.set("n", "cgP", [["+gP]], { silent = true })
vim.keymap.set("n", "c=p", [[o<Esc>"+pm``[=`]``^]], { silent = true })
vim.keymap.set("n", "c=P", [[O<Esc>"+Pm``[=`]``^]], { silent = true })
vim.keymap.set("n", "c=v", [[<Cmd>set paste<CR>"+p<Cmd>set nopaste<CR>]], { silent = true })
vim.keymap.set("n", "c=V", [[<Cmd>set paste<CR>"+P<Cmd>set nopaste<CR>]], { silent = true })

-- CTRL-V: Bracketed Paste in Insert mode
vim.keymap.set("i", "<C-v>", "<C-g>u<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>", { silent = true })
-- vim.keymap.set("i", "<C-v>", "<C-g>u<C-r><C-o>+", { silent = true })

-- Folding
-- vim.keymap.set("n", "zr", "zr<Cmd>setlocal foldlevel?<CR>", { silent = true })
-- vim.keymap.set("n", "zm", "zm<Cmd>setlocal foldlevel?<CR>", { silent = true })
-- vim.keymap.set("n", "zR", "zR<Cmd>setlocal foldlevel?<CR>", { silent = true })
-- vim.keymap.set("n", "zM", "zM<Cmd>setlocal foldlevel?<CR>", { silent = true })

-- vim.keymap.set("n", "z]", "<Cmd>let &foldcolumn = &foldcolumn + 1<CR><Cmd>setlocal foldcolumn?<CR>", { silent = true })
-- vim.keymap.set("n", "z[", "<Cmd>let &foldcolumn = &foldcolumn - 1<CR><Cmd>setlocal foldcolumn?<CR>", { silent = true })

-- Search and Replace
vim.keymap.set("n", "<Leader>R", ":%s//gc<Left><Left><Left>")
vim.keymap.set("n", "<Leader>sr", ":%s/<C-r><C-w>//gc<Left><Left><Left>")
vim.keymap.set("n", "<Leader>sx", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]])

vim.keymap.set("x", "<Leader>R", [[:s/\%V/gc<Left><Left><Left>]])
vim.keymap.set(
  "x",
  "<Leader>sr",
  [["vy:%s/<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>//gc<Left><Left><Left>]]
)
vim.keymap.set(
  "x",
  "<Leader>sx",
  [["vy:%s/\<<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>\>//gc<Left><Left><Left>]]
)

--- Search and Replace entries with same mappings in quickfix/locationlist with :cfdo and :lfdo
vim.api.nvim_create_autocmd("FileType", {
  group = "MyAutoCmd",
  pattern = "qf",
  callback = function()
    local cmd = ":silent " .. (vim.fn.getwininfo(vim.fn.win_getid())[1]["loclist"] == 1 and "lfdo" or "cfdo")

    vim.keymap.set("n", "<Leader>R", cmd .. " %s//eg<Left><Left><Left>", { buffer = true })
    vim.keymap.set("n", "<Leader>sr", cmd .. " %s/<C-r><C-w>//eg<Left><Left><Left>", { buffer = true })
    vim.keymap.set("n", "<Leader>sr", cmd .. [[ %s/\<<C-r><C-w>\>//eg<Left><Left><Left>]], { buffer = true })
    vim.keymap.set(
      "x",
      "<Leader>sr",
      [["vy]]
        .. cmd
        .. [[ %s/<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>//eg<Left><Left><Left>]],
      { buffer = true }
    )
    vim.keymap.set(
      "x",
      "<Leader>sx",
      [["vy]]
        .. cmd
        .. [[ %s/\<<C-r>=substitute(escape(getreg('v'), '^$.*\/~[]'), '\n', '\\n', 'g')<CR>\>//eg<Left><Left><Left>]],
      { buffer = true }
    )
    vim.keymap.set("x", "<Leader>R", "<Leader>sr", { buffer = true, remap = true })
  end,
})

-- Open Quickfix & LocationList
-- vim.keymap.set("n", "<Leader>Q", "<Cmd>copen<CR>", { silent = true })
-- vim.keymap.set("n", "<Leader>W", "<Cmd>cwindow<CR>", { silent = true })

-- Buffer-related mappings
-- gl: Go to Last buffer
vim.keymap.set("n", "gl", "<Cmd>buffer#<CR>", { silent = true })

-- Edit file from buffer folder
vim.keymap.set("n", "<C-w><C-e>", ":edit <C-r>=fnameescape(expand('%:p:~:.:h')) . '/'<CR>")

-- Edit buffer
vim.keymap.set("n", "<C-w>e", ":edit<Space>")

-- Yank whole buffer to clipboard
vim.keymap.set("n", "<Leader>by", "<Cmd>%y+<CR>", { silent = true })

-- Reload buffer
-- vim.keymap.set("n", "<Leader>be", "<Cmd>confirm edit<CR>", { silent = true })

-- Save/Write buffer
-- vim.keymap.set("n", "<Leader>w", "<Cmd>update<CR>", { silent = true })
-- vim.keymap.set("v", "<Leader>w", "<Esc><Leader>wgv", { remap = true })

-- vim.keymap.set("n", "<Leader>bw", "<Cmd>update<CR>", { silent = true })
-- vim.keymap.set("v", "<Leader>bw", "<Esc><Leader>bwgv", { remap = true })

vim.keymap.set("n", "<Leader>bu", "<Cmd>update<CR>", { silent = true })
vim.keymap.set("v", "<Leader>bu", "<Esc><Leader>bugv", { remap = true })

-- Insert date/time
vim.keymap.set("i", "<C-x>d", "<C-r>=strftime('%Y-%m-%d')<CR>", { silent = true })
vim.keymap.set("i", "<C-x>c", "<C-r>=strftime('%c')<CR>", { silent = true })
-- RFC822 Format
vim.keymap.set("i", "<C-x>r", "<C-r>=strftime('%a, %d %b %Y %H:%M:%S %z')<CR>", { silent = true })
-- ISO8601 / W3C Format
vim.keymap.set("i", "<C-x>t", "<C-r>=strftime('%Y-%m-%dT%T%z')<CR>", { silent = true })

-- vim-rsi
-- CTRL-A: <Home>
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-x><C-a>", "<C-a>")
-- CTRL-B: <Left>
vim.keymap.set("c", "<C-b>", "<Left>")
-- CTRL-F: <Right>
vim.keymap.set(
  "c",
  "<C-f>",
  [[getcmdpos() > strlen(getcmdline()) ? &cedit : "<Right>"]],
  { expr = true, replace_keycodes = false }
)
-- CTRL-D: Delete Forward
vim.keymap.set(
  "c",
  "<C-d>",
  [[getcmdpos() > strlen(.getcmdline()) ? "<C-d>" : "<Del"]],
  { expr = true, replace_keycodes = false }
)
-- CTRL-U: Delete Line
vim.keymap.set("c", "<C-u>", function()
  if vim.fn.getcmdpos() > 1 then
    vim.cmd("let @- = getcmdline()[:getcmdpos()-2]")
  end
  return "<C-u>"
end, { expr = true })
-- CTRL-Y
vim.keymap.set("c", "<C-y>", [[pumvisible() ? "<C-y>" : "<C-r>-"]], { expr = true, replace_keycodes = false })
