-- Vim Settings
if vim.fn.has("nvim-0.9") ~= 1 then
    vim.notify("ZeroVim requires at least Neovim version v0.9.0 to work as expected.", vim.log.levels.WARN)
    vim.cmd([[sleep 3 | cquit]])
end

-- if vim.fn.has("vim_starting") == 1 then
--     vim.o.encoding = "utf-8"
-- end
-- vim.scriptencoding = "utf-8"

if string.match(vim.o.shell, "fish$") then
    if vim.fn.executable("zsh") == 1 then
        vim.o.shell = vim.fn.exepath("zsh")
    elseif vim.fn.executable("bash") == 1 then
        vim.o.shell = vim.fn.exepath("bash")
    end
end

-- stylua: ignore start
vim.o.ttimeout = true                              -- Time out for key codes
vim.o.ttimeoutlen = 50                             -- Wait up to 50ms after Esc for special key
vim.o.timeoutlen = 500                             -- Time out on mapings after 500ms

vim.o.visualbell = true                            -- Use visual bell instead of beeping

vim.o.updatetime = 250                             -- 250ms to save swap file and trigger CursorHold autocommand event

vim.o.mouse = "a"                                  -- Enable mouse in every mode
vim.o.mousemodel = "popup"                         -- Right mouse button pops up a menu

if vim.fn.has("nvim-0.10") == 1 then
    vim.o.smoothscroll = true
end

-- vim.o.fileformat = "unix"
vim.opt.fileformats = { "unix", "dos" }

vim.o.tabpagemax = 20
vim.o.lazyredraw = true                            -- Do not redraw while macro executing
-- vim.o.shortmess = "aoOtTIcC"                       -- Print current file name, cursor position and file status (press CTRL-G)
-- https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#messages-and-notifications-in-neovim
vim.opt.shortmess:append({
    W = true,
    I = true,
    c = true,
    C = true,
})
vim.o.laststatus = 2                               -- Always display statusline
vim.opt.display:append({ "lastline" })             -- When a line is long, do not omit it in @
vim.o.cmdheight = 2                                -- Height of command-line (easy-readable)
vim.o.history = 1000                               -- Store lots of command lines in history
vim.o.showcmd = false                              -- Do not show (partial) command in the last line of the screen
vim.o.ruler = false                                -- Do not show the line and column number of the cursor position (press CTRL-G or g CTRL-G)

vim.o.foldenable = false                           -- Disable fold by default
vim.opt.foldopen:append({ "insert", "jump" })      -- Folds will be opened for insert and jump commands as well
vim.o.foldmethod = "indent"                        -- Lines with equal indent form a fold
vim.o.foldlevel = 2                                -- Starting fold at level 2

vim.opt.nrformats:remove({ "octal" })
vim.opt.backspace = { "indent", "eol", "start" }   -- Enable backspace delete indent and newline
vim.o.virtualedit = "block"                        -- Enable virtualedit in visual block mode
vim.o.whichwrap = "b,s,h,l,<,>,[,]"                -- Allow wrap only when Backspace, h, l and cursor keys are used
vim.o.startofline = false                          -- The cursor is kept in the same column (if possible)
vim.o.scrolloff = 1                                -- Minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 5                            -- The minimal number of screen columns to keep to the left and to the right of the cursor
vim.o.splitbelow = true                            -- Splitting a window will put the new window below the current one
vim.o.splitright = true                            -- Splitting a window will put the new window right the current one
vim.o.splitkeep = "screen"                         -- Keep the text on the same screen line
vim.o.winminwidth = 5                              -- Hard minimal width of a window

vim.o.confirm = true                               -- Confirm to save changes before exiting modified buffer
-- vim.o.hidden = true                                -- Allow buffer switching without saving
vim.o.autowrite = true                             -- Enable auto write
-- vim.o.autoread = true                              -- Auto-reload if file is saved externally

-- vim.o.infercase = true                             -- Ignore case on insert completion
vim.o.ignorecase = true                            -- Ignore case search for normal letters
vim.o.smartcase = true                             -- Do case-sensitive search if pattern contains upper case letters
vim.o.incsearch = true                             -- Enable incremental search
-- vim.o.inccommand = "split"                         -- Show preview of :substitute in split window
vim.o.hlsearch = true                              -- Highlight search matches
-- vim.o.matchtime = 1                                -- 100 miliseconds to show the matching paren
-- vim.opt.cpoptions:remove({ "m" })                  -- A showmatch will wait a matchtime or until a character is typed

-- Default indent settings
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true                             -- Expand tab to space
-- vim.o.smarttab = true                              -- Smart insert / delete tab

-- vim.o.textwidth = 120
-- vim.o.colorcolumn = "+1"
-- vim.o.cursorline = true
-- vim.o.cursorlineopt = "number"

-- Use better separators
-- :help 'fillchars'
vim.opt.fillchars:append({ eob = " ", fold = " ", diff = "╱" })

-- Display tabs and trailing spaces
-- :help 'listchars'
-- vim.o.listchars = "tab:» ,leadmultispace:│ ,trail:·,nbsp:•,extends:›,precedes:‹,eol:§"
vim.opt.listchars = {
    tab = "» ",
    trail = "…",
    nbsp = "•",
    extends = "›",
    precedes = "‹",
    eol = "§",
}

vim.o.conceallevel = 2
vim.o.concealcursor = "nc"

vim.o.wrap = false                                 -- Disable wrapping long lines by default
vim.o.linebreak = true                             -- Wrap long lines at a character in 'breakat'
vim.o.showbreak = "↪ "                             -- String to put at the start of lines that have been wrapped.
-- vim.o.breakat = " \t!;:,?"
vim.o.breakindent = true
vim.opt.cpoptions:append({ n = true })             -- showbreak appears in between line numbers

vim.o.swapfile = false                             -- Do not use swapfile for buffer
vim.o.undofile = true

-- :help fo-table
-- t: Auto-wrap text using 'textwidth'
-- c: Auto-wrap comments using 'textwidth', inserting the current comment leader automatically
-- 1: Don't break a line after a one-letter word
-- j: Remove a comment leader when joining lines
vim.opt.formatoptions:append({
    t = true,
    c = true,
    ["1"] = true,
    j = true,
})

vim.o.tagbsearch = false                           -- Use linear search
vim.o.tagcase = "match"                            -- Use match case when searching tags

vim.opt_global.tags:remove({ "./tags", "./tags;" })
vim.opt_global.tags:prepend({ "./tags;" })

-- Completion settings
-- vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"               -- Command-line completion mode
vim.opt.wildoptions = { "pum", "tagfile" }

vim.o.pumheight = 10                               -- Maximum number of entries in a popup

-- Ignore the following file patterns when expanding wildcards, completing file or directory names
vim.opt.wildignore:append({
    "*/.git/*",
    "*/tmp/*",
    "*/__pycache__/*",
    "*/node_modules/*",
    "*/.next/*",
    "*/.terraform/*",
    "*/.shards/*",
    "*/_build/*",
    "*/.elixir_ls/*",
    "*.o",
    "*.obj",
    "*.dwarf",
    "*.pyc",
    "*.rbc",
    "*.rbo",
    "*.luac",
    "*.class",
    "*.gem",
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.bmp",
    "*.pdf",
    "*.zip",
    "*.rar",
    "*.7z",
    "*.tar",
    "*.gz",
    "*.bz2",
    "*.xz",
    "*.dmg",
    "*.pkg",
    "*.dll",
    "*.exe",
    "*.lnk",
    "*.ini",
    "*.dat",
    "*.DS_Store",
    "*.swp",
    "*~",
    "._*",
})

vim.opt.viewoptions:remove({ "options" })

if vim.fn.has("diff") == 1 then
    -- Use the new internal diff feature with options:
    -- - indent-heuristic: uses indentation to improve diffs
    -- - algorithm:patience: patience diff algorithm
    -- - algorithm:histogram: an improved patience algorithm as used in Git
    -- vim.opt.diffopt:append({ "internal", "algorithm:histogram", "indent-heuristic", "vertical", "context:8" })
    vim.opt.diffopt:append({ "internal", "algorithm:histogram", "vertical", "context:8" })
end
-- stylua: ignore end

-- Don't try to highlight lines longer than 500 characters
vim.o.synmaxcol = 500
-- vim.cmd("syntax sync minlines=256")

-- True Color settings
if (vim.env.COLORTERM == "truecolor" or vim.env.COLORTERM == "24bit") and vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end

-- Python 3
if vim.fn.executable("python3") == 1 then
    vim.g.python3_host_prog = vim.fn.exepath("python3")
end

-- Disable Ruby support
vim.g.loaded_ruby_provider = 0

-- Disable NodeJS support
vim.g.loaded_node_provider = 0

-- Disable perl support
vim.g.loaded_perl_provider = 0

-- Disable system plugins
vim.g.loaded_gzip = 1
vim.g.loaded_less = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- Disable sql mappings
vim.g.omni_sql_no_default_maps = 1

-- Correctly highlight $() and other modern affordances in filetype=sh.
if vim.g.is_posix == nil and vim.g.is_bash == nil and vim.g.is_kornshell == nil and vim.g.is_dash == nil then
    vim.g.is_posix = 1
end

-- Set augroup
vim.api.nvim_create_augroup("MyAutoCmd", { clear = true })

-- Share the histories
-- vim.api.nvim_create_autocmd("CursorHold", {
--     group = "MyAutoCmd",
--     pattern = "*",
--     command = "rshada | wshada",
-- })

-- -- Start insert when entering in term buffer
-- vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
--     group = "MyAutoCmd"
--     pattern = "term://*",
--     command = "startinsert",
-- })

-- -- Stop insert when leaving in term buffer
-- vim.api.nvim_create_autocmd("BufLeave", {
--     group = "MyAutoCmd"
--     pattern = "term://*",
--     command = "stopinsert",
-- })

-- Helpers
-- Find and source init.lua from root to current folder
-- ~/projects/hello $
-- .
-- └── /home/phong
--     ├── init.lua
--     └── projects
--         ├── init.lua
--         └── hello
--             ├── init.lua
--             └── ...
--
-- Files are sourced in order for the call Source("init.lua"):
--   /home/phong/init.lua
--   /home/phong/projects/init.lua
--   /home/phong/projects/hello/init.lua
function Source(name)
    local vimrcs = vim.fn.findfile(name, vim.fn.expand("~"), -1)
    vim.list_extend(vimrcs, vim.fn.reverse(vim.fn.findfile(name, ";", -1)))
    for _, vimrc in ipairs(vim.fn.uniq(vimrcs)) do
        vim.cmd("luafile " .. vim.fn.fnamemodify(vimrc, ":p"))
    end
end

-- Find and source first found init.lua in current folder up to root
-- ~/projects/hello $
-- .
-- └── /home/phong
--     ├── init.lua
--     └── projects
--         ├── init.lua
--         └── hello
--             ├── init.lua
--             └── ...
--
-- Files are sourced in order for the call SourceOnce("init.lua"):
--   /home/phong/init.lua
--   /home/phong/projects/hello/init.lua
function SourceOnce(name)
    local vimrcs = vim.fn.findfile(name, vim.fn.expand("~"), -1)
    local found_vimrc = vim.fn.findfile(name, ";")
    if vim.fn.empty(found_vimrc) == 0 then
        vim.list_extend(vimrcs, { found_vimrc })
    end
    for _, vimrc in ipairs(vim.fn.uniq(vimrcs)) do
        vim.cmd("luafile " .. vim.fn.fnamemodify(vimrc, ":p"))
    end
end

function Plug(repo, ...)
    vim.fn["plug#"](repo, ...)
end

function Enabled(plugin, ...)
    local current = vim.g.zero_vim_plugins[plugin] or 0
    local enabled = vim.fn.empty(current) == 0
    if enabled and select("#", ...) > 0 then
        return string.lower(tostring(current)) == string.lower(tostring(select(1, ...)))
    end
    return enabled
end

function EnabledGroup(group)
    return vim.fn.index(vim.g.zero_vim_groups, group) > -1
end

function Plugged(plugin)
    return vim.g.plugs[plugin] ~= nil
end

-- Helper to setup plugins
function ZeroVimPlugins(opts)
    if type(opts) == "table" and not vim.islist(opts) then
        vim.g.zero_vim_plugins = vim.g.zero_vim_plugins or vim.empty_dict()
        vim.g.zero_vim_plugins = vim.tbl_extend("force", vim.g.zero_vim_plugins, opts)
    end
end

-- Helper to setup groups
function ZeroVimGroups(opts)
    if type(opts) == "table" and vim.islist(opts) then
        vim.g.zero_vim_groups = vim.g.zero_vim_groups or {}
        vim.g.zero_vim_groups = vim.list_extend(vim.g.zero_vim_groups, opts)
        vim.g.zero_vim_groups = vim.fn.uniq(vim.fn.sort(vim.g.zero_vim_groups))
    elseif type(opts) == "table" then
        for group, enabled in pairs(opts) do
            if vim.fn.empty(enabled) == 0 then
                vim.g.zero_vim_groups = vim.tbl_filter(function(current)
                    return current ~= group
                end, vim.g.zero_vim_groups)
            else
                table.insert(vim.g.zero_vim_groups, group)
            end
        end
        vim.g.zero_vim_groups = vim.fn.uniq(vim.fn.sort(vim.g.zero_vim_groups))
    end
end

-- Helper to setup open folder mappings
function ZeroVimOpenFolderMappings(opts)
    if type(opts) == "table" and not vim.islist(opts) then
        vim.g.zero_vim_open_folder_mappings = vim.g.zero_vim_open_folder_mappings or vim.empty_dict()
        vim.g.zero_vim_open_folder_mappings = vim.tbl_extend("force", vim.g.zero_vim_open_folder_mappings, opts)
    end
end

-- Support old Neovim
if vim.api.nvim_create_user_command == nil then
    vim.api.nvim_create_user_command = vim.api.nvim_add_user_command
end

-- vim.tbl_islist is removed in Neovim 0.10.0
if vim.islist == nil then
    vim.islist = vim.tbl_islist
end

-- Default files
vim.g.zero_vim_bundle_file = vim.g.zero_vim_bundle_file or ".init.lua.bundles"
vim.g.zero_vim_local_file = vim.g.zero_vim_local_file or ".init.lua.local"

-- Default plugins
-- stylua: ignore start
vim.g.zero_vim_default_plugins = vim.g.zero_vim_default_plugins or {
    startuptime = 0,
    statusline = 0,
    dashboard = 1,
    ["buffer-explorer"] = 0,
    explorer = 1,
    finder = 1,
    ctrlsf = 1,
    ["any-jump"] = 1,
    sneak = 0,
    autoindent = 0,
    whitespace = 0,
    comment = 0,
    surround = 0,
    align = 0,
    ["change-case"] = 1,
    splitjoin = 0,
    ["git-conflict"] = 0,
    sideways = 0,
    ["textobj-indent"] = 0,
    matchup = 1,
    foldtext = 1,
    ["indent-guides"] = "scope",
    zen = 0,
    undotree = 1,
    ctags = 1,
    tagbar = 0,
    ["auto-pairs"] = 1,
    lsp = 0,
    completion = "cmp",
    formatter = 0,
    linter = 0,
    dap = 0,
    github = 1,
    git = 1,
    ["git-messenger"] = 0,
    ["git-gutter"] = 1,
    solarized = 0,
    ["which-key"] = 0,
}
-- stylua: ignore end

-- Find and source .init.lua.local from root to current folder
Source(vim.g.zero_vim_local_file)

-- Plugin settings
vim.g.zero_vim_plugins =
    vim.tbl_extend("force", vim.deepcopy(vim.g.zero_vim_default_plugins), vim.g.zero_vim_plugins or vim.empty_dict())

-- Enabled groups
vim.g.zero_vim_groups = vim.g.zero_vim_groups or {}

function vim.bool2num(value)
    if type(value) == "boolean" then
        return value and 1 or 0
    end
    return value
end

vim.g.zero_vim_nerdfont = vim.bool2num(vim.g.zero_vim_nerdfont or 0)
vim.g.zero_vim_transparent_background = vim.bool2num(vim.g.zero_vim_transparent_background or 0)
vim.g.zero_vim_transparent_vert_split = vim.g.zero_vim_transparent_vert_split or 1
vim.g.zero_vim_powerline_fonts = vim.bool2num(vim.g.zero_vim_powerline_fonts or vim.g.zero_vim_nerdfont)
vim.g.zero_vim_powerline_style = vim.g.zero_vim_powerline_style or "default"
vim.g.zero_vim_surround_mapping_style = vim.g.zero_vim_surround_mapping_style or "surround"
vim.g.zero_vim_git_branch = vim.g.zero_vim_git_branch or 1
vim.g.zero_vim_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs or 0
vim.g.zero_vim_find_tool = vim.g.zero_vim_find_tool or "fd"
vim.g.zero_vim_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs or 0
vim.g.zero_vim_follow_links = vim.g.zero_vim_follow_links or 1
vim.g.zero_vim_autolint = vim.g.zero_vim_autolint or 0
vim.g.zero_vim_autofix = vim.g.zero_vim_autofix or 0
vim.g.zero_vim_ctags_bin = vim.g.zero_vim_ctags_bin or "ctags"
vim.g.zero_vim_ctags_ignore = vim.g.zero_vim_ctags_ignore or vim.fn.expand("~/.config/ctags/ignore")
vim.g.zero_vim_universal_ctags = vim.g.zero_vim_universal_ctags
    or (string.match(vim.fn.system(vim.g.zero_vim_ctags_bin .. " --version"), "Universal Ctags") and 1 or 0)

-- Default signs
vim.g.zero_vim_signs = vim.tbl_extend("force", {
    error = "🅔",
    style_error = "ⓔ",
    warning = "🅦",
    style_warning = "ⓦ",
    information = "🅘",
    hint = "🅗",
    message = "🅜",
    virtual_text = "❯",
}, vim.g.zero_vim_signs or vim.empty_dict())

-- Map leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- :help default-mappings

-- Space: Leader
vim.keymap.set("n", "<Space>", "", { remap = true })
vim.keymap.set("x", "<Space>", "", { remap = true })

-- F1: Help
-- vim.keymap.set("n", "<F1>", ":help<Space>")
-- vim.keymap.set("i", "<F1>", "<Esc><F1>", { remap = true })

-- CTRL-Space: Show history
vim.keymap.set("c", "<C-@>", "<C-f>")

-- CTRL-V: Paste from clipboard
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- Reset Esc
vim.keymap.set("i", "<Esc>", "<Esc>", { nowait = true })
-- vim.keymap.set({ "n", "i"}, "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { nowait = true })

-- Enable undo for CTRL-W (Delete word) and CTRL-U (Delete line)
-- vim.keymap.set("i", "<C-w>", "<C-g>u<C-w>")
-- vim.keymap.set("i", "<C-u>", "<C-g>u<C-u>")

-- Add undo break-points
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", ";", ";<C-g>u")

-- CTRL-T: Insert tab
-- vim.keymap.set("i", "<C-t>", "<C-v><Tab>", { silent = true })

-- CTRL-L: Redraw
-- if vim.fn.has("diff") == 1 then
--     vim.keymap.set("n", "<C-l>", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-l><CR>", { silent = true })
-- else
--     vim.keymap.set("n", "<C-l>", "<Cmd>nohlsearch<Bar>normal! <C-l><CR>", { silent = true })
-- end

-- ig: inner entire / whole buffer
vim.keymap.set({ "x", "o" }, "ig", ":<C-u>mark '<Bar>keepjumps normal! gg^vGg_<CR>", { silent = true })
-- ag: an entire / whole buffer
vim.keymap.set({ "x", "o" }, "ag", ":<C-u>mark '<Bar>keepjumps normal! gg0vG$<CR>", { silent = true })

-- iv: inner line
vim.keymap.set({ "x", "o" }, "iv", ":<C-u>mark '<Bar>keepjumps normal! ^vg_<CR>", { silent = true })
-- av: a line
vim.keymap.set({ "x", "o" }, "av", ":<C-u>mark '<Bar>keepjumps normal! 0v$<CR>", { silent = true })

-- Q: Disable Ex-mode. qq to record, Q to replay (remapped)
vim.keymap.set("n", "Q", "@q", { remap = true })

-- Q: Use Q in Visual mode to execute a macro on each line of the selection
-- vim.keymap.set(
--     "x",
--     "Q",
--     "mode() == 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'",
--     { silent = true, expr = true }
-- )

-- gQ: Q (remapped)
vim.keymap.set("n", "gQ", "Q")

-- &: Use the same flags as the previous substitution
-- vim.keymap.set("n", "&", ":&&<CR>")

-- .: repeats the last command on every line
vim.keymap.set("x", ".", ":normal .<CR>")

-- @: repeats macro on every line
-- vim.keymap.set("x", "@", ":normal @")
-- vim.keymap.set(
--     "x",
--     "@",
--     "mode() == 'V' ? ':normal! @' . getcharstr() . '<CR>' : '@'",
--     { silent = true, expr = true }
-- )

-- After indenting code, does not exit Visual mode
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")

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
-- vim.keymap.set("n", "gV", "`[v`]", { remap = true })
vim.keymap.set(
    "n",
    "gV",
    "'`[' . strpart(getregtype(), 0, 1) . '`]'",
    { silent = true, expr = true, replace_keycodes = false }
)

-- g/: Search inside visually highlighted text
vim.keymap.set("x", "g/", "<Esc>/\\%V")

-- Search visually selected text
if vim.fn.has("nvim-0.10") == 0 then
    vim.keymap.set("x", "*", [[y/\V<C-r>=escape(@", '/\')<CR><CR>]], { silent = true })
    vim.keymap.set("x", "#", [[y?\V<C-r>=escape(@", '?\')<CR><CR>]], { silent = true })
end

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
vim.keymap.set("n", "zr", "zr<Cmd>setlocal foldlevel?<CR>", { silent = true })
vim.keymap.set("n", "zm", "zm<Cmd>setlocal foldlevel?<CR>", { silent = true })
vim.keymap.set("n", "zR", "zR<Cmd>setlocal foldlevel?<CR>", { silent = true })
vim.keymap.set("n", "zM", "zM<Cmd>setlocal foldlevel?<CR>", { silent = true })

vim.keymap.set("n", "z]", "<Cmd>let &foldcolumn = &foldcolumn + 1<CR><Cmd>setlocal foldcolumn?<CR>", { silent = true })
vim.keymap.set("n", "z[", "<Cmd>let &foldcolumn = &foldcolumn - 1<CR><Cmd>setlocal foldcolumn?<CR>", { silent = true })

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

vim.keymap.set("n", "<Leader>bw", "<Cmd>update<CR>", { silent = true })
vim.keymap.set("v", "<Leader>bw", "<Esc><Leader>bwgv", { remap = true })

vim.keymap.set("n", "<Leader>bu", "<Cmd>update<CR>", { silent = true })
vim.keymap.set("v", "<Leader>bu", "<Esc><Leader>bugv", { remap = true })

vim.keymap.set("n", "<C-s>", "<Cmd>update<CR>", { silent = true })
vim.keymap.set("v", "<C-s>", "<Esc><C-s>gv", { remap = true })
vim.keymap.set("i", "<C-s>", "<Esc><C-s>", { remap = true })

-- Save and Quit buffer
-- vim.keymap.set("n", "<Leader>x", "<Cmd>xit<CR>", { silent = true })
-- vim.keymap.set("v", "<Leader>x", "<Esc><Leader>xgv", { remap = true })

vim.keymap.set("n", "<Leader>bx", "<Cmd>xit<CR>", { silent = true })
vim.keymap.set("v", "<Leader>bx", "<Esc><Leader>bxgv", { remap = true })

-- Unload buffer and delete it from the buffer list
vim.keymap.set("n", "<Leader>bk", "<Cmd>confirm bdelete<CR>", { silent = true })

-- Exit Vim. Bring up a prompt when some buffers have been changed
-- vim.keymap.set("n", "ZE", "<Cmd>confirm qall<CR>", { silent = true })

-- Insert date/time
vim.keymap.set("i", "<C-x>d", "<C-r>=strftime('%Y-%m-%d')<CR>", { silent = true })
vim.keymap.set("i", "<C-x>c", "<C-r>=strftime('%c')<CR>", { silent = true })
-- RFC822 Format
vim.keymap.set("i", "<C-x>r", "<C-r>=strftime('%a, %d %b %Y %H:%M:%S %z')<CR>", { silent = true })
-- ISO8601 / W3C Format
vim.keymap.set("i", "<C-x>t", "<C-r>=strftime('%Y-%m-%dT%T%z')<CR>", { silent = true })

-- https://vimways.org/2018/death-by-a-thousand-files/
-- vim.cmd([[set wildcharm=<C-z>]])
-- vim.o.wildcharm = strin.byte(vim.api.nvim_replace_termcodes("<C-z>", true, true, true))
vim.o.wildcharm = vim.api.nvim_replace_termcodes("<C-z>", true, true, true):byte()
vim.opt.path:remove({ "/usr/include" })
vim.keymap.set("n", "<C-w>e", ":find **/*")
vim.keymap.set("n", "<C-w>E", ":edit **/*")

-- :help :DiffOrig
if vim.fn.exists(":DiffOrig") ~= 2 then
    vim.api.nvim_create_user_command(
        "DiffOrig",
        [[vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis]],
        {}
    )
end

-- Trim trailing whitespace
vim.api.nvim_create_user_command(
    "TrimWhitespace",
    [[silent execute (&readonly ? 'echo' : printf('keeppatterns keepjumps keepalt %s,%ssubstitute/\s\+$//e', <line1>, <line2>))]],
    { bar = true, range = "%" }
)
vim.keymap.set("n", "<Leader>bw", ":TrimWhitespace <Bar> update<CR>", { silent = true })
vim.keymap.set("v", "<Leader>bw", ":TrimWhitespace <Bar> update<CR>gv", { silent = true })

-- Handle large file
vim.g.zero_vim_large_file = vim.g.zero_vim_large_file or (1024 * 1024 * 1) -- 1 MB
vim.g.zero_vim_undoreload = vim.go.undoreload

vim.api.nvim_create_autocmd("BufReadPre", {
    pattern = "*",
    group = "MyAutoCmd",
    callback = function(opts)
        vim.opt_global.eventignore:remove("FileType")
        vim.opt_global.undoreload = vim.g.zero_vim_undoreload

        local bufnr = opts.buf or vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local ok, stats = pcall(vim.loop.fs_stat, bufname)
        local fsize = (ok and stats and stats.size) or 0

        if
            string.match(bufname, "[-_.]min%.js$")
            or string.match(bufname, "[-_.]min%.css$")
            or string.match(bufname, "[-_.]min%.scss$")
            or fsize > vim.g.zero_vim_large_file
        then
            vim.opt_global.eventignore:append("FileType")
            vim.opt_global.undoreload = 0

            vim.cmd("syntax clear")

            vim.api.nvim_buf_set_option(bufnr, "swapfile", false)
            vim.api.nvim_buf_set_option(bufnr, "bufhidden", "unload")
            vim.api.nvim_buf_set_option(bufnr, "undolevels", -1)
            vim.api.nvim_buf_set_option(bufnr, "syntax", "OFF")
            vim.api.nvim_buf_set_option(bufnr, "filetype", "")

            local winid = vim.fn.bufwinid(bufnr)
            vim.api.nvim_win_set_option(winid, "foldenable", false)
            vim.api.nvim_win_set_option(winid, "foldmethod", "manual")
            vim.api.nvim_win_set_option(winid, "wrap", false)
            vim.api.nvim_win_set_option(winid, "list", false)
        end
    end,
})

-- Find project dir from buffer based on root markers
vim.g.zero_vim_file_root_markers = {
    "Gemfile",
    "rebar.config",
    "mix.exs",
    "Cargo.toml",
    "shard.yml",
    "go.mod",
    ".root",
}

vim.g.zero_vim_vcs_root_markers = { ".git", ".hg", ".svn", ".bzr", "_darcs" }

vim.g.zero_vim_root_markers =
    vim.list_extend(vim.deepcopy(vim.g.zero_vim_vcs_root_markers), vim.g.zero_vim_file_root_markers)

vim.g.zero_vim_ignored_root_dirs = {
    "/",
    "/root",
    "/Users",
    "/home",
    "/usr",
    "/usr/local",
    "/opt",
    "/etc",
    "/var",
    vim.fn.expand("~"),
}

function vim.find_project_dir(starting_dir)
    if vim.fn.empty(starting_dir) == 1 then
        return ""
    end

    local root_dir = ""

    for _, root_marker in ipairs(vim.g.zero_vim_root_markers) do
        if vim.fn.index(vim.g.zero_vim_file_root_markers, root_marker) > -1 then
            root_dir = vim.fn.findfile(root_marker, starting_dir .. ";")
        else
            root_dir = vim.fn.finddir(root_marker, starting_dir .. ";")
        end

        if root_dir == root_marker then
            root_dir = "."
        else
            root_dir = vim.fn.substitute(root_dir, root_marker .. "$", "", "")
        end

        if vim.fn.strlen(root_dir) > 0 then
            root_dir = vim.fn.fnamemodify(root_dir, ":p:h")
            break
        end
    end

    if vim.fn.empty(root_dir) == 1 or vim.fn.index(vim.g.zero_vim_ignored_root_dirs, root_dir) > -1 then
        if vim.fn.index(vim.g.zero_vim_ignored_root_dirs, vim.fn.getcwd()) > -1 then
            root_dir = starting_dir
        elseif vim.fn.stridx(starting_dir, vim.fn.getcwd()) == 0 then
            root_dir = vim.fn.getcwd()
        else
            root_dir = starting_dir
        end
    end

    root_dir = vim.fn.fnamemodify(root_dir, ":p:h")

    return vim.fn.fnamemodify(root_dir, ":p:h:~")
end

function vim.find_buffer_project_dir()
    return vim.find_project_dir(vim.fn.expand("%:p:h"))
end

-- <C-r><C-h>: Innsert buffer project dir
vim.keymap.set({ "i", "c" }, "<C-r><C-h>", "<C-r>=v:lua.vim.find_buffer_project_dir()<CR>")

-- Setup mappings to open specific folders
vim.g.zero_vim_open_folder_mappings = vim.g.zero_vim_open_folder_mappings or vim.empty_dict()

vim.api.nvim_create_autocmd("VimEnter", {
    group = "MyAutoCmd",
    pattern = "*",
    callback = function()
        local cmd

        if vim.fn.exists(":TelescopeFiles") == 2 then
            cmd = "TelescopeFiles"
        elseif vim.fn.exists(":SnapFiles") == 2 then
            cmd = "SnapFiles"
        elseif vim.fn.exists(":Files") == 2 then
            cmd = "Files"
        else
            cmd = "FzfLuaFiles"
        end

        for mapping, folder in pairs(vim.g.zero_vim_open_folder_mappings) do
            vim.keymap.set("n", mapping, string.format("<Cmd>%s %s<CR>", cmd, folder), { silent = true })
        end
    end,
})

-- Plugins
vim.fn["plug#begin"]()

-- Startup
if vim.fn.has("nvim-0.9") ~= 1 then
    -- Improve startup time for Neovim
    Plug("lewis6991/impatient.nvim")
else
    -- https://neovim.io/doc/user/lua.html#vim.loader
    -- A builtin Lua module which byte-compiles and caches Lua files (speeds up load times).
    vim.loader.enable()
end

vim.api.nvim_exec_autocmds("User", { pattern = "ZeroVimPlugBegin", modeline = false })

if Enabled("startuptime") then
    -- A plugin for profiling Vim and Neovim startup time.
    Plug("dstein64/vim-startuptime")
end

-- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
Plug("nvim-lua/plenary.nvim")

-- UI
-- A fancy, configurable, notification manager for NeoVim
Plug("rcarriga/nvim-notify")

if Enabled("noice") then
    -- UI Component Library for Neovim.
    Plug("MunifTanjim/nui.nvim")
    -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    Plug("folke/noice.nvim")
end

-- Library of 40+ independent Lua modules improving overall Neovim (version 0.8 and higher) experience with minimal effort
Plug("echasnovski/mini.nvim")

if vim.g.zero_vim_nerdfont == 1 then
    -- vim-web-devicons for neovim
    -- Plug("nvim-tree/nvim-web-devicons")
    -- An universal palette for Nerd Fonts
    -- Plug("lambdalisue/vim-glyph-palette")

    -- Icon provider. Part of 'mini.nvim' library.
    Plug("echasnovski/mini.icons")
end

if Enabled("statusline", "airline") then
    -- My airline settings
    Plug("phongnh/airline-settings.vim")
    -- lean & mean status/tabline for vim that"s light as air
    Plug("vim-airline/vim-airline")
elseif Enabled("statusline", "crystalline") then
    -- My crystalline settings
    Plug("phongnh/crystalline-settings.vim")
    -- Build your own fancy statusline/tabline in Vim/Neovim
    Plug("rbong/vim-crystalline")
elseif Enabled("statusline", "simple") then
    -- My vim statusline
    Plug("phongnh/vim-statusline")
elseif Enabled("statusline", "lightline") then
    -- My lightline settings
    Plug("phongnh/lightline-settings.vim")
    -- A light and configurable statusline/tabline plugin for Vim
    Plug("itchyny/lightline.vim")
elseif Enabled("statusline", "lualine") then
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    Plug("nvim-lualine/lualine.nvim")
else
    -- A snazzy bufferline for Neovim
    Plug("akinsho/bufferline.nvim")
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    Plug("nvim-lualine/lualine.nvim")
end

if Enabled("dashboard", "alpha") then
    -- A Lua powered greeter like vim-startify / dashboard-nvim
    Plug("goolord/alpha-nvim")
elseif Enabled("dashboard") then
    -- Vim dashboard
    Plug("nvimdev/dashboard-nvim")
end

-- Explorer
if Enabled("buffer-explorer") then
    -- BufExplorer Plugin for Vim
    Plug("jlanzarotta/bufexplorer")
end

if Enabled("explorer", "oil") then
    -- Neovim file explorer: edit your filesystem like a buffer
    Plug("stevearc/oil.nvim")
elseif Enabled("explorer", "carbon") then
    -- The simple directory tree viewer for Neovim written in Lua.
    Plug("SidOfc/carbon.nvim")
elseif Enabled("explorer", "nvim-tree") then
    -- A file explorer tree for neovim written in lua
    Plug("nvim-tree/nvim-tree.lua")
elseif Enabled("explorer") then
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    Plug("nvim-lua/plenary.nvim")
    -- UI Component Library for Neovim.
    Plug("MunifTanjim/nui.nvim")
    -- This plugins prompts the user to pick a window and returns the window id of the picked window
    Plug("s1n7ax/nvim-window-picker")
    -- Neovim plugin to manage the file system and other tree like structures.
    Plug("nvim-neo-tree/neo-tree.nvim")
end

-- Fuzzy finder
if Enabled("finder", "telescope") then
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    Plug("nvim-lua/plenary.nvim")
    -- Find, Filter, Preview, Pick. All lua, all the time.
    Plug("nvim-telescope/telescope.nvim")
    Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
    -- Plug("nvim-telescope/telescope-fzy-native.nvim")
    -- Plug("nvim-telescope/telescope-github.nvim")
    Plug("LukasPietzschmann/telescope-tabs")
elseif Enabled("finder", "snap") then
    -- A fast finder system for neovim.
    Plug("camspiers/snap")
    Plug("phongnh/snap-settings.nvim")
elseif Enabled("finder", "fzf") then
    Plug("phongnh/fzf-settings.vim")
    -- A command-line fuzzy finder written in Go
    Plug("junegunn/fzf", { ["do"] = ":call fzf#install()" })
    Plug("junegunn/fzf.vim")
else
    -- A command-line fuzzy finder written in Go
    Plug("junegunn/fzf", { ["do"] = ":call fzf#install()" })
    -- Improved fzf.vim written in lua
    Plug("ibhagwan/fzf-lua")
end

-- Search
-- Helps you win at grep.
Plug("mhinz/vim-grepper")

if Enabled("ctrlsf") then
    -- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
    Plug("dyng/ctrlsf.vim")
end

if Enabled("any-jump") and vim.fn.executable("rg") == 1 then
    -- Jump to any definition and references IDE madness without overhead
    Plug("pechorin/any-jump.vim", { on = { "AnyJump", "AnyJumpVisual", "AnyJumpBack", "AnyJumpLastResults" } })
end

if Enabled("sneak", "leap") then
    -- Neovim's answer to the mouse
    Plug("ggandor/leap.nvim")
elseif Enabled("sneak") then
    -- Navigate your code with search labels, enhanced character motions and Treesitter integration
    Plug("folke/flash.nvim")
end

-- Core
if Enabled("autoindent") then
    -- Automatic indentation style detection for Neovim
    Plug("NMAC427/guess-indent.nvim")
end

-- Make Vim handle line and column numbers in file names with a minimum of fuss
Plug("wsdjeg/vim-fetch")

if vim.env.TMUX ~= nil then
    -- Vim plugin for handling tmux panes.
    Plug("jebaum/vim-tmuxify")
end

-- Helpers for UNIX
Plug("tpope/vim-eunuch")

-- Open URI with your favorite browser from your most favorite editor
Plug("tyru/open-browser.vim", {
    on = {
        "<Plug>(openbrowser-open)",
        "<Plug>(openbrowser-search)",
        "<Plug>(openbrowser-smart-search)",
        "OpenBrowser",
        "OpenBrowserSearch",
        "OpenBrowserSmartSearch",
    },
})

-- My Vim helpers
Plug("phongnh/zero.vim")

-- rsi.vim: Readline style insertion
Plug("tpope/vim-rsi")

-- Enable repeating supported plugin maps with "."
Plug("tpope/vim-repeat")

-- Pairs of handy bracket mappings
Plug("tpope/vim-unimpaired")

-- Toggle useful settings
Plug("phongnh/vim-toggler")

-- enhanced increment/decrement plugin for Neovim.
Plug("monaqa/dial.nvim")

-- Better quickfix window in Neovim, polish old quickfix window.
Plug("kevinhwang91/nvim-bqf")

-- Maximize current buffer
Plug("phongnh/ZoomWin", { on = { "<Plug>ZoomWin", "ZoomWin" } })

-- Master key for exiting or deleting nvim/vim buffers with respect to window splits and tabs.
Plug("marklcrns/vim-smartq")

if Enabled("whitespace", "retrail") then
    -- Whitespace management for Neovim
    Plug("kaplanz/retrail.nvim")
elseif Enabled("whitespace") then
    -- Neovim Lua plugin to manage trailspace (highlight and remove). Part of 'mini.nvim' library.
    -- Plug("echasnovski/mini.trailspace")
end

-- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
Plug("JoosepAlviste/nvim-ts-context-commentstring")

if Enabled("comment") then
    -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    Plug("numToStr/Comment.nvim")
else
    -- Neovim Lua plugin for fast and familiar per-line commenting. Part of 'mini.nvim' library.
    -- Plug("echasnovski/mini.comment")
end

-- Clarify and beautify your comments using boxes and lines.
Plug("LudoPinelli/comment-box.nvim")

if Enabled("surround") then
    -- Add/change/delete surrounding delimiter pairs with ease.
    Plug("kylechui/nvim-surround")
else
    -- Neovim Lua plugin with fast and feature-rich surround actions. Part of 'mini.nvim' library.
    -- Plug("echasnovski/mini.surround")
end

if Enabled("align", "tabular") then
    -- Vim script for text filtering and alignment
    Plug("godlygeek/tabular", { on = "Tabularize" })
elseif Enabled("align", "easy") then
    -- A Vim alignment plugin
    Plug("junegunn/vim-easy-align", { on = { "EasyAlign", "<Plug>(EasyAlign)" } })
else
    -- Neovim Lua plugin to align text interactively. Part of 'mini.nvim' library.
    -- Plug("echasnovski/mini.align")
end

if Enabled("change-case", "coerce") then
    -- A Neovim plugin for changing keyword case.
    Plug("gregorias/coerce.nvim")
elseif Enabled("change-case", "caser") then
    -- Easily change word casing with motions, text objects or visual mode.
    Plug("arthurxavierx/vim-caser")
elseif Enabled("change-case") then
    -- An all in one plugin for converting text case in Neovim
    Plug("johmsalas/text-case.nvim")
end

-- Multiple cursors plugin for vim/neovim
Plug("mg979/vim-visual-multi", { on = { "<Plug>(VM-Find-Under)", "<Plug>(VM-Find-Subword-Under)" } })

-- A Narrow Region Plugin for vim (like Emacs Narrow Region)
Plug("chrisbra/NrrwRgn", { on = "<Plug>NrrwrgnDo" })

-- Text edit operators. Part of 'mini.nvim' library.
-- Plug("echasnovski/mini.operators")

-- A simple Vim plugin to switch segments of text with predefined replacements
Plug("andrewradev/switch.vim", { on = { "<Plug>(Switch)", "<Plug>(SwitchReverse)", "Switch", "SwitchReverse" } })

if Enabled("splitjoin") then
    -- A vim plugin that simplifies the transition between multiline and single-line code
    Plug(
        "AndrewRadev/splitjoin.vim",
        { on = { "<Plug>SplitjoinSplit", "<Plug>SplitjoinJoin", "SplitjoinSplit", "SplitjoinJoin" } }
    )
end

if Enabled("git-conflict", "conflict-marker") then
    -- Weapon to fight against conflicts in Vim.
    Plug("rhysd/conflict-marker.vim")
else
    -- A plugin to visualise and resolve merge conflicts in neovim
    Plug("akinsho/git-conflict.nvim")
end

-- A better Vimdiff Git mergetool
Plug("whiteinge/diffconflicts", { on = { "DiffConflicts", "DiffConflictsWithHistory" } })

-- Text Objects
if Enabled("sideways") then
    -- A Vim plugin to move function arguments (and other delimited-by-something items) left and right.
    Plug("AndrewRadev/sideways.vim", {
        on = {
            "<Plug>SidewaysArgumentTextobjA",
            "<Plug>SidewaysArgumentTextobjI",
            "<Plug>SidewaysArgumentInsertBefore",
            "<Plug>SidewaysArgumentAppendAfter",
            "<Plug>SidewaysArgumentInsertFirst",
            "<Plug>SidewaysArgumentAppendLast",
            "SidewaysLeft",
            "SidewaysRight",
            "SidewaysJumpLeft",
            "SidewaysJumpRight",
        },
    })
end

-- Vim plugin: Create your own text objects
Plug("kana/vim-textobj-user")
Plug("glts/vim-textobj-comment") -- c

if Enabled("textobj-indent") then
    Plug("kana/vim-textobj-indent") -- iI
else
    -- Vim plugin that defines a new text object representing lines of code at the same indent level.
    Plug("michaeljsmith/vim-indent-object") -- iI
end

-- Neovim Lua plugin to extend and create `a`/`i` textobjects. Part of 'mini.nvim' library.
-- Plug("echasnovski/mini.ai")

-- Editor
if Enabled("matchup") then
    -- vim match-up: even better %
    Plug("andymass/vim-matchup")
end

if Enabled("foldtext", "readable") then
    -- A Vim plugin to improve foldtext for better looks
    Plug("lambdalisue/vim-readablefold")
elseif Enabled("foldtext", "simple") then
    -- Custom vim folding function
    Plug("jrudess/vim-foldtext", { as = "jrudess-vim-foldtext" })
elseif Enabled("foldtext", "phongnh") then
    -- Custom text for folded lines in vim
    Plug("phongnh/vim-foldtext", { as = "phongnh-vim-foldtext" })
elseif Enabled("foldtext") then
    -- Foldtext customization in Neovim
    Plug("phongnh/pretty-fold.nvim")
end

if Enabled("indent-guides", "mini") then
    -- A minimal and blazing fast indentline plugin
    Plug("nvimdev/indentmini.nvim")
elseif Enabled("indent-guides", "scope") then
    -- Neovim Lua plugin to visualize and operate on indent scope. Part of 'mini.nvim' library.
    -- Plug("echasnovski/mini.indentscope")
elseif Enabled("indent-guides") then
    -- Indent guides for Neovim
    Plug("lukas-reineke/indent-blankline.nvim")
end

-- Distraction-free
if Enabled("zen") then
    -- Clean and elegant distraction-free writing for NeoVim
    Plug("pocco81/true-zen.nvim")
else
    -- Distraction-free coding for Neovim
    Plug("folke/zen-mode.nvim")
end

-- Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
Plug("folke/twilight.nvim")

-- Undo history
if Enabled("undotree") then
    -- The ultimate undo history visualizer for VIM
    Plug("mbbill/undotree")
end

-- Ctags
if vim.fn.executable(vim.g.zero_vim_ctags_bin) == 1 and vim.g.zero_vim_universal_ctags == 1 then
    if Enabled("ctags") then
        -- A Vim plugin that manages your tag files
        Plug("ludovicchabant/vim-gutentags")
    end

    if Enabled("tagbar") then
        -- A class outline viewer for Vim
        Plug("preservim/tagbar", { on = "TagbarToggle" })
    end
end

-- Treesitter
-- Nvim Treesitter configurations and abstraction layer
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-textobjects")
-- Plug("nvim-treesitter/nvim-treesitter-context")
-- Neovim plugin for splitting/joining blocks of code
Plug("Wansmer/treesj")

-- Coding
if Enabled("auto-pairs", "autopairs") then
    -- autopairs for neovim written by lua
    Plug("windwp/nvim-autopairs")
elseif Enabled("auto-pairs", "ultimate") then
    -- A treesitter supported autopairing plugin with extensions, and much more
    Plug("altermo/ultimate-autopair.nvim")
elseif Enabled("auto-pairs") then
    -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
    -- Plug("echasnovski/mini.pairs")
end

if Enabled("lsp") then
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
    Plug("williamboman/mason-lspconfig.nvim")
    Plug("neovim/nvim-lspconfig")
end

if Enabled("completion", "cmp") then
    Plug("hrsh7th/nvim-cmp")
    Plug("lukas-reineke/cmp-under-comparator")
    Plug("hrsh7th/cmp-buffer")
    Plug("hrsh7th/cmp-path")
    if Plugged("nvim-lspconfig") then
        Plug("hrsh7th/cmp-nvim-lsp")
        Plug("hrsh7th/cmp-nvim-lsp-signature-help")
    end
    if Enabled("snippet", "vsnip") then
        Plug("rafamadriz/friendly-snippets")
        Plug("hrsh7th/vim-vsnip")
        Plug("hrsh7th/cmp-vsnip")
    else
        Plug("rafamadriz/friendly-snippets")
        Plug("L3MON4D3/LuaSnip", { ["do"] = "make install_jsregexp" })
        Plug("saadparwaiz1/cmp_luasnip")
    end
    Plug("hrsh7th/cmp-nvim-lua")
elseif Enabled("completion", "coq") and vim.fn.has("python3") == 1 then
    Plug("ms-jpq/coq_nvim", { branch = "coq" })
    Plug("ms-jpq/coq.artifacts", { branch = "artifacts" })
    Plug("ms-jpq/coq.thirdparty", { branch = "3p" })
elseif Enabled("completion", "mucomplete") then
    Plug("lifepillar/vim-mucomplete")
    Plug("rafamadriz/friendly-snippets")
    Plug("hrsh7th/vim-vsnip")
    Plug("hrsh7th/vim-vsnip-integ")
elseif Enabled("completion") then
    Plug("https://git.sr.ht/~ackyshake/VimCompletesMe.vim")
end

-- Formatting
if Enabled("formatter", "none-ls") then
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
    -- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    Plug("nvimtools/none-ls.nvim")
elseif Enabled("formatter", "formatter") then
    -- A format runner for Neovim.
    Plug("mhartington/formatter.nvim")
elseif Enabled("formatter") then
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
    -- Lightweight yet powerful formatter plugin for Neovim
    Plug("stevearc/conform.nvim")
end

-- Syntax Checking/Linting
if Enabled("linter", "none-ls") then
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
    -- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    Plug("nvimtools/none-ls.nvim")
elseif Enabled("linter", "neomake") then
    -- Asynchronous linting and make framework for Neovim/Vim
    Plug("neomake/neomake")
elseif Enabled("linter", "ale") then
    -- Asynchronous Lint Engine
    Plug("dense-analysis/ale")
elseif Enabled("linter") then
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
    -- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
    Plug("mfussenegger/nvim-lint")
end

-- Debug
if Enabled("dap") then
    -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug("williamboman/mason.nvim", { ["do"] = ":MasonUpdate" })
    Plug("jay-babu/mason-nvim-dap.nvim")
    -- Debug Adapter Protocol client implementation for Neovim
    Plug("mfussenegger/nvim-dap")
    Plug("rcarriga/nvim-dap-ui")
    Plug("theHamsta/nvim-dap-virtual-text")
end

-- Run your tests at the speed of thought
Plug("vim-test/vim-test", { on = { "TestNearest", "TestFile", "TestLast", "TestSuite", "TestVisit" } })

-- Git
if Enabled("github") then
    -- Open URI with your favorite browser from your most favorite editor
    Plug("tyru/open-browser.vim", {
        on = {
            "<Plug>(openbrowser-open)",
            "<Plug>(openbrowser-search)",
            "<Plug>(openbrowser-smart-search)",
            "OpenBrowser",
            "OpenBrowserSearch",
            "OpenBrowserSmartSearch",
            "OpenGithubFile",
            "OpenGithubIssue",
            "OpenGithubPullReq",
            "OpenGithubProject",
            "OpenGithubCommit",
        },
    })
    -- Open GitHub URL of current file, etc. from Vim editor (supported GitHub Enterprise)
    Plug(
        "tyru/open-browser-github.vim",
        { on = { "OpenGithubFile", "OpenGithubIssue", "OpenGithubPullReq", "OpenGithubProject", "OpenGithubCommit" } }
    )
end

if Enabled("git") then
    -- An awesome Git wrapper so awesome
    Plug("tpope/vim-fugitive")

    -- rhubarb.vim: GitHub extension for fugitive.vim
    Plug("tpope/vim-rhubarb")

    -- A git commit browser in Vim
    Plug("junegunn/gv.vim", { on = "GV" })
end

if Enabled("git-messenger") then
    -- Vim and Neovim plugin to reveal the commit messages under the cursor
    Plug("rhysd/git-messenger.vim", { on = { "GitMessenger", "<Plug>(git-messenger)" } })
end

if Enabled("git-gutter") then
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    Plug("nvim-lua/plenary.nvim")
    -- Git integration for buffers
    Plug("lewis6991/gitsigns.nvim")
end

-- Color schemes
-- True Color
if Enabled("solarized") then
    Plug("ishan9299/nvim-solarized-lua")
else
    Plug("maxmx03/solarized.nvim")
end
Plug("craftzdog/solarized-osaka.nvim")
Plug("Tsuzat/NeoSolarized.nvim")
Plug("ellisonleao/gruvbox.nvim")
Plug("f4z3r/gruvbox-material.nvim")
Plug("neanias/everforest-nvim")
Plug("folke/tokyonight.nvim")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("EdenEast/nightfox.nvim")

if Enabled("which-key") then
    -- Vim plugin that shows keybindings in popup
    Plug("folke/which-key.nvim")
end

-- OrgMode
if EnabledGroup("neorg") then
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    Plug("nvim-lua/plenary.nvim")
    -- Nvim Treesitter configurations and abstraction layer
    Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
    -- Modernity meets insane extensibility. The future of organizing your life in Neovim.
    Plug("nvim-neorg/neorg", { ["do"] = ":Neorg sync-parsers" })
elseif EnabledGroup("orgmode") then
    -- Nvim Treesitter configurations and abstraction layer
    Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
    -- Orgmode clone written in Lua for Neovim
    Plug("nvim-orgmode/orgmode")
end

-- Web Editing
if EnabledGroup("editing") then
    -- emmet for vim: http://emmet.io
    Plug("mattn/emmet-vim", {
        on = {
            "<Plug>(emmet-expand-abbr)",
            "<Plug>(emmet-expand-word)",
            "<Plug>(emmet-anchorize-url)",
            "<Plug>(emmet-anchorize-summary)",
        },
    })

    -- ragtag.vim: ghetto HTML/XML mappings
    Plug("tpope/vim-ragtag", {
        ["for"] = {
            "html",
            "eruby",
            "eelixir",
            "xml",
            "vue",
            "javascriptreact",
            "typescriptreact",
        },
    })
end

-- Syntax
if EnabledGroup("web") then
    Plug("hail2u/vim-css3-syntax")
    Plug("HerringtonDarkholme/yats.vim")
    Plug("pangloss/vim-javascript")
    Plug("MaxMEllon/vim-jsx-pretty")
    Plug("jparise/vim-graphql")
    Plug("heavenshell/vim-jsdoc", {
        ["do"] = "make install",
        ["for"] = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    })
    Plug("kana/vim-textobj-user")
    Plug("inside/vim-textobj-jsxattr")
end

if EnabledGroup("coffee-script") then
    Plug("kchmck/vim-coffee-script")
    Plug("joukevandermaas/vim-ember-hbs")
end

if EnabledGroup("yaml") then
    Plug("stephpy/vim-yaml")
end

if EnabledGroup("ruby") then
    Plug("vim-ruby/vim-ruby")
    Plug("noprompt/vim-yardoc")
    Plug("keith/rspec.vim")
end

if EnabledGroup("rbs") then
    Plug("jlcrochet/vim-ruby", { as = "jlcrochet-vim-ruby" })
    Plug("jlcrochet/vim-rbs")
    Plug("noprompt/vim-yardoc")
    Plug("keith/rspec.vim")
end

if EnabledGroup("rails") then
    Plug("tpope/vim-projectionist")
    Plug("tpope/vim-rake")
    Plug("tpope/vim-rails")
    Plug("keith/rspec.vim")
end

if EnabledGroup("rubocop") then
    Plug("phongnh/vim-rubocop", { on = { "RuboCop", "RuboCopProject" } })
end

if EnabledGroup("reek") then
    Plug("phongnh/vim-reek", { on = { "RunReek" } })
end

if EnabledGroup("crystal") then
    Plug("vim-crystal/vim-crystal")
    Plug("elorest/vim-slang")
end

if EnabledGroup("python") then
    Plug("vim-python/python-syntax")
end

if EnabledGroup("go") then
    Plug("fatih/vim-go")
    Plug("zchee/vim-go-stdlib")
end

if EnabledGroup("rust") then
    Plug("rust-lang/rust.vim")
end

if EnabledGroup("erlang") then
    Plug("vim-erlang/vim-erlang-runtime")
    Plug("vim-erlang/vim-erlang-compiler")
    Plug("kana/vim-textobj-user")
    Plug("edkolev/erlang-motions.vim")
end

if EnabledGroup("elixir") then
    Plug("elixir-editors/vim-elixir")
    Plug("kana/vim-textobj-user")
    Plug("andyl/vim-textobj-elixir", { ["for"] = "elixir" })
end

if EnabledGroup("terraform") then
    Plug("hashivim/vim-terraform")
end

if EnabledGroup("dbml") then
    -- Database Markup Langauge
    Plug("jidn/vim-dbml")
end

if EnabledGroup("fish") then
    -- Vim configuration for Fish
    Plug("nickeb96/fish.vim", { ["for"] = "fish" })
end

-- Add custom bundle
SourceOnce(vim.g.zero_vim_bundle_file)

vim.api.nvim_exec_autocmds("User", { pattern = "ZeroVimPlugEnd", modeline = false })

vim.fn["plug#end"]()

-- https://github.com/junegunn/vim-plug
vim.keymap.set("n", "<Leader>vv", "<Cmd>PlugUpdate<CR>", { silent = true })

if Plugged("impatient.nvim") then
    --  lewis6991/impatient.nvim
    require("impatient")
end

-- https://github.com/rcarriga/nvim-notify
vim.api.nvim_create_autocmd("VimEnter", {
    group = "MyAutoCmd",
    pattern = "*",
    callback = function()
        require("notify").setup({
            stages = "static",
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end,
        })
        vim.notify = require("notify")
    end,
})

-- https://github.com/MunifTanjim/nui.nvim

-- https://github.com/folke/noice.nvim
if Plugged("noice.nvim") then
    vim.o.lazyredraw = false

    require("noice").setup({
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "%d+L, %d+B" },
                        { find = "; after #%d+" },
                        { find = "; before #%d+" },
                    },
                },
                view = "mini",
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
    })
end

if Plugged("nvim-web-devicons") then
    -- https://github.com/nvim-tree/nvim-web-devicons
    require("nvim-web-devicons").setup({
        color_icons = true,
        default = true,
        strict = true,
        override_by_filename = {
            [".code.ignore"] = { icon = "", color = "#41535b", cterm_color = "239", name = "CodeIgnore" },
            [".fdignore"] = { icon = "", color = "#41535b", cterm_color = "239", name = "FdIgnore" },
            [".ignore"] = { icon = "", color = "#41535b", cterm_color = "239", name = "Ignore" },
            ["ignore"] = { icon = "", color = "#41535b", cterm_color = "239", name = "Ignore" },
            [".env.sample"] = { icon = "", color = "#faf743", cterm_color = "227", name = "Env" },
            [".envrc"] = { icon = "", color = "#faf743", cterm_color = "227", name = "EnvRC" },
            ["gvimrc"] = { icon = "", color = "#019833", cterm_color = "28", name = "GVimrc" },
            ["vimrc"] = { icon = "", color = "#019833", cterm_color = "28", name = "Vimrc" },
            [".editor.vimrc.bundles"] = { icon = "", color = "#019833", cterm_color = "28", name = "Vim" },
            [".editor.vimrc.local"] = { icon = "", color = "#019833", cterm_color = "28", name = "Vim" },
            [".vimrc.bundles"] = { icon = "", color = "#019833", cterm_color = "28", name = "Vim" },
            [".vimrc.local"] = { icon = "", color = "#019833", cterm_color = "28", name = "Vim" },
            ["vimrc.local"] = { icon = "", color = "#019833", cterm_color = "28", name = "Vim" },
            [".editor.lua.bundles"] = { icon = "", color = "#51a0cf", cterm_color = "74", name = "Lua" },
            [".editor.lua.local"] = { icon = "", color = "#51a0cf", cterm_color = "74", name = "Lua" },
            [".init.lua.bundles"] = { icon = "", color = "#51a0cf", cterm_color = "74", name = "Lua" },
            [".init.lua.local"] = { icon = "", color = "#51a0cf", cterm_color = "74", name = "Lua" },
            ["init.lua.local"] = { icon = "", color = "#51a0cf", cterm_color = "74", name = "Lua" },
        },
    })

    vim.cmd([[
    function! WebDevIconsFind(filename) abort
        let l:fname = fnamemodify(a:filename, ':t')
        let l:ext = fnamemodify(fname, ':e')
        return v:lua.require'nvim-web-devicons'.get_icon(l:fname, l:ext, { 'default': v:true, 'strict': v:true })
    endfunction
    ]])

    if Plugged("vim-airline") then
        -- https://github.com/vim-airline/vim-airline
        vim.cmd("let g:AirlineWebDevIconsFind = funcref('WebDevIconsFind')")
    end

    if Plugged("lightline.vim") then
        -- https://github.com/itchyny/lightline.vim
        vim.cmd("let g:LightlineWebDevIconsFind = funcref('WebDevIconsFind')")
    end

    if Plugged("vim-crystalline") then
        -- https://github.com/rbong/vim-crystalline
        vim.cmd("let g:CrystallineWebDevIconsFind = funcref('WebDevIconsFind')")
    end

    -- https://github.com/lambdalisue/vim-glyph-palette
    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = { "alpha", "dashboard", "NvimTree", "neo-tree", "carbon.explorer", "oil" },
        command = "call glyph_palette#apply()",
    })
end

if Plugged("mini.icons") then
    -- https://github.com/echasnovski/mini.icons
    package.preload["nvim-web-devicons"] = function()
        require("mini.icons").setup({
            [".code.ignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
            [".fdignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
            [".ignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
            ["ignore"] = { glyph = "󰒓", hl = "MiniIconsPurple" },
            [".env.sample"] = { glyph = "", hl = "MiniIconsPurple" },
            [".envrc"] = { glyph = "", hl = "MiniIconsPurple" },
            ["envrc"] = { glyph = "", hl = "MiniIconsPurple" },
            ["vimrc"] = { glyph = "", hl = "MiniIconsGreen" },
            ["gvimrc"] = { glyph = "", hl = "MiniIconsGreen" },
            ["vimrc.local"] = { glyph = "", hl = "MiniIconsGreen" },
            [".vimrc.bundles"] = { glyph = "", hl = "MiniIconsGreen" },
            [".vimrc.local"] = { glyph = "", hl = "MiniIconsGreen" },
            [".editor.vimrc.bundles"] = { glyph = "", hl = "MiniIconsGreen" },
            [".editor.vimrc.local"] = { glyph = "", hl = "MiniIconsGreen" },
            ["init.lua.local"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
            [".init.lua.bundles"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
            [".init.lua.local"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
            [".editor.lua.bundles"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
            [".editor.lua.local"] = { glyph = "󰢱", hl = "MiniIconsAzure" },
        })
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
    end

    vim.cmd([[
    function! WebDevIconsFind(filename) abort
        let l:ext = fnamemodify(a:filename, ':e')
        return v:lua.MiniIcons.get('file', l:ext)
    endfunction
    ]])

    if Plugged("vim-airline") then
        -- https://github.com/vim-airline/vim-airline
        vim.cmd("let g:AirlineWebDevIconsFind = funcref('WebDevIconsFind')")
    end

    if Plugged("lightline.vim") then
        -- https://github.com/itchyny/lightline.vim
        vim.cmd("let g:LightlineWebDevIconsFind = funcref('WebDevIconsFind')")
    end

    if Plugged("vim-crystalline") then
        -- https://github.com/rbong/vim-crystalline
        vim.cmd("let g:CrystallineWebDevIconsFind = funcref('WebDevIconsFind')")
    end
end

if Plugged("vim-airline") then
    -- https://github.com/vim-airline/vim-airline
    vim.g.airline_powerline_fonts = vim.g.zero_vim_powerline_fonts
    vim.g.airline_powerline_style = vim.g.airline_powerline_style or vim.g.zero_vim_powerline_style
    vim.g.airline_show_dev_icons = vim.g.zero_vim_nerdfont
    vim.g.airline_show_git_branch = vim.g.zero_vim_git_branch
end

if Plugged("vim-cyrstalline") then
    -- https://github.com/rbong/vim-crystalline
    vim.g.crystalline_powerline_fonts = vim.g.zero_vim_powerline_fonts
    vim.g.crystalline_powerline_style = vim.g.crystalline_powerline_style or vim.g.zero_vim_powerline_style
    vim.g.crystalline_show_dev_icons = vim.g.zero_vim_nerdfont
    vim.g.crystalline_show_git_branch = vim.g.zero_vim_git_branch
end

if Plugged("vim-statusline") then
    -- https://github.com/phongnh/vim-statusline
    vim.g.statusline_powerline_fonts = vim.g.zero_vim_powerline_fonts
    vim.g.statusline_powerline_style = vim.g.statusline_powerline_style or vim.g.zero_vim_powerline_style
    vim.g.statusline_show_dev_icons = vim.g.zero_vim_nerdfont
    vim.g.statusline_show_git_branch = vim.g.zero_vim_git_branch
end

if Plugged("lightline.vim") then
    -- https://github.com/itchyny/lightline.vim
    vim.g.lightline_powerline_fonts = vim.g.zero_vim_powerline_fonts
    vim.g.lightline_powerline_style = vim.g.lightline_powerline_style or vim.g.zero_vim_powerline_style
    vim.g.lightline_show_dev_icons = vim.g.zero_vim_nerdfont
    vim.g.lightline_show_git_branch = vim.g.zero_vim_git_branch
end

if Plugged("lualine.nvim") then
    -- https://github.com/nvim-lualine/lualine.nvim
    vim.g.lualine_show_branch = vim.g.zero_vim_git_branch
    vim.g.lualine_show_linenr = vim.g.lualine_show_linenr or false
    vim.g.lualine_show_devicons = Plugged("nvim-web-devicons") or Plugged("mini.icons")

    vim.g.lualine_symbols = {
        dos = "[dos]",
        mac = "[mac]",
        unix = "[unix]",
        tabs = "TABS",
        space = " ",
        bomb = "🅑 ",
        noeol = "∉ ",
        clipboard = "🅒 ",
        paste = "🅟 ",
        readonly = "",
        linenr = "☰",
        branch = "⎇ ",
        clock = "",
    }

    if vim.g.lualine_show_devicons then
        vim.g.lualine_symbols = vim.tbl_extend("force", vim.g.lualine_symbols, {
            dos = "",
            mac = "",
            unix = "",
            tabs = " ",
            bomb = " ",
            noeol = " ",
            readonly = "",
            linenr = "",
            branch = "",
            clock = " ",
        })
    end

    local setup_lualine = function()
        local lualine_require = require("lualine_require")
        lualine_require.require = require

        vim.o.laststatus = vim.g.lualine_laststatus

        local datetime_status = function()
            if vim.api.nvim_win_get_width(0) >= 100 then
                return vim.g.lualine_symbols.clock .. os.date("%R")
            end
            return ""
        end

        local indentation_status = function()
            local shiftwidth = vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.bo.shiftwidth
            local compact = vim.api.nvim_win_get_width(0) < 100
            if compact then
                return string.format(vim.bo.expandtab and "SPC: %d" or "TAB: %d", shiftwidth)
            else
                return string.format(vim.bo.expandtab and "Spaces: %d" or "Tab Size: %d", shiftwidth)
            end
        end

        if vim.g.lualine_globalstatus then
            vim.o.laststatus = 3 -- Always statusline and ONLY in the last window
        end

        require("lualine").setup({
            options = {
                icon_enabled = vim.g.lualine_show_devicons,
                theme = "auto",
                globalstatus = vim.o.laststatus == 3,
                disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
            },
            sections = {
                lualine_a = {
                    { "mode" },
                    {
                        function()
                            return vim.g.lualine_symbols.clipboard
                        end,
                        cond = function()
                            return string.find(vim.o.clipboard or "", "unnamed") ~= nil
                        end,
                    },
                    {
                        function()
                            return vim.g.lualine_symbols.paste
                        end,
                        cond = function()
                            return vim.o.paste
                        end,
                    },
                    {
                        function()
                            return string.upper((vim.o.spelllang or ""):gsub(",", "/"))
                        end,
                        cond = function()
                            return vim.o.spell
                        end,
                    },
                },
                lualine_b = vim.g.lualine_show_branch and { "branch" } or {},
                lualine_c = {
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, shorting_target = 40 },
                },
                lualine_x = {
                    {
                        function()
                            local encoding = (vim.bo.fileencoding or ""):len() > 0 and vim.bo.fileencoding
                                or vim.o.encoding
                            encoding = (encoding == "utf-8") and "" or (encoding .. " ")
                            local bomb = vim.bo.bomb and vim.g.lualine_symbols.bomb .. " " or ""
                            local noeol = vim.bo.eol and "" or vim.g.lualine_symbols.noeol .. " "
                            local format = vim.g.lualine_symbols[vim.bo.fileformat] or "[empty]"
                            format = format == "[unix]" and "" or format .. " "
                            return encoding .. bomb .. noeol .. format
                        end,
                        cond = function()
                            return vim.api.nvim_win_get_width(0) >= 60
                        end,
                    },
                },
                lualine_y = {
                    {
                        "progress",
                        cond = function()
                            return vim.api.nvim_win_get_width(0) >= 100
                        end,
                        -- fmt = function(text, _context)
                        --     return vim.api.nvim_win_get_width(0) >= 100 and text or ""
                        -- end,
                        separator = " ",
                        padding = { left = 1, right = 0 },
                    },
                    {
                        "location",
                        cond = function()
                            return vim.api.nvim_win_get_width(0) >= 100
                        end,
                        padding = { left = 0, right = 1 },
                    },
                    { indentation_status },
                },
                lualine_z = {
                    { "filetype", icon_only = false, separator = " ", padding = { left = 0, right = 1 } },
                    { datetime_status },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    { "filename", path = 3, shorting_target = 40 },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            extensions = Plugged("neo-tree.nvim") and { "neo-tree" } or {},
            tabline = Plugged("bufferline.nvim") and {} or {
                lualine_a = {
                    {
                        "tabs",
                        tab_max_length = 30,
                        max_length = function()
                            return vim.o.columns * 2 / 3
                        end,
                        mode = 2,
                        path = 0,
                        use_mode_colors = false,
                        tabs_color = {
                            active = "lualine_a_normal",
                            inactive = "lualine_b_normal",
                        },
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })

        if vim.g.lualine_show_devicons then
            require("lualine").setup({
                sections = {
                    lualine_z = {
                        { datetime_status },
                    },
                },
            })
        else
            require("lualine").setup({
                lualine_c = {
                    { "filename", path = 1, shorting_target = 40 },
                },
            })
        end

        if not vim.g.lualine_show_linenr then
            require("lualine").setup({
                sections = {
                    lualine_y = {
                        { indentation_status },
                    },
                },
            })
        end

        vim.api.nvim_create_autocmd("VimEnter", {
            group = "MyAutoCmd",
            pattern = "*",
            callback = function()
                vim.opt_global.showtabline = 1
            end,
        })
    end

    setup_lualine()
end

if Plugged("bufferline.nvim") then
    -- https://github.com/akinsho/bufferline.nvim
    require("bufferline").setup({
        options = {
            mode = "tabs",
            themable = false,
            diagnostics = false,
            show_duplicate_prefix = false,
            -- separator_style = "slant",
            -- enforce_regular_tabs = true,
            -- always_show_bufferline = false,
            -- auto_toggle_bufferline = false,
        },
    })
end

-- stylua: ignore start
vim.g.zero_vim_logo = [[
███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
]]
-- stylua: ignore end

if Plugged("alpha-nvim") then
    -- https://github.com/goolord/alpha-nvim
    vim.g.alpha_theme = vim.g.alpha_theme or "startify"

    local setup_alpha = function()
        local mru_ignore = function(path, ext)
            if vim.tbl_contains({ "fugitiveblame", "gitcommit", "gitrebase", "help" }, ext) then
                return true
            end

            for _, pattern in ipairs({
                "^/usr/",
                "^/opt/",
                "^/etc/",
                "^/var/",
                "^/tmp/",
                "^/private/",
                "[.]git/",
                "/?[.]gems/",
                "[.]vim/plugged/",
                "[.]fugitiveblame$",
                "COMMIT_EDITMSG$",
                "git-rebase-todo$",
            }) do
                if string.find(path, pattern) then
                    return true
                end
            end

            return false
        end

        local build_dashboard_buttons = function()
            local icons = {
                new_file = "",
                recent_files = "",
                find_files = "",
                live_grep = "",
                update = "",
                quit = "",
            }
            if Plugged("nvim-web-devicons") or Plugged("mini.icons") then
                icons = {
                    new_file = "  ",
                    recent_files = "  ",
                    find_files = "  ",
                    live_grep = "  ",
                    update = "󰊳  ",
                    quit = "  ",
                }
            end

            local dashboard = require("alpha.themes.dashboard")

            return {
                dashboard.button("e", icons.new_file .. "New file", "<Cmd>enew<CR>"),
                dashboard.button("SPC o", icons.recent_files .. "Recent files"),
                dashboard.button("SPC f", icons.find_files .. "Find files"),
                dashboard.button("SPC /", icons.live_grep .. "Live grep"),
                dashboard.button("u", icons.update .. "Update", "<Cmd>PlugUpdate<CR>"),
                dashboard.button("q", icons.quit .. "Quit", "<Cmd>qa<CR>"),
            }
        end

        if vim.g.alpha_theme == "theta" then
            local theta = require("alpha.themes.theta")
            theta.header.val = vim.split(vim.g.zero_vim_logo, "\n")
            theta.nvim_web_devicons.enabled = Plugged("nvim-web-devicons") or Plugged("mini.icons")
            theta.mru_opts.ignore = mru_ignore
            theta.buttons.val = vim.list_extend({
                { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
            }, build_dashboard_buttons())
            require("alpha").setup(theta.config)
        elseif vim.g.alpha_theme == "dashboard" then
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = vim.split(vim.g.zero_vim_logo, "\n")
            dashboard.section.buttons.val = build_dashboard_buttons()
            dashboard.section.footer.val = require("alpha.fortune")()
            require("alpha").setup(dashboard.config)
        else
            local startify = require("alpha.themes.startify")
            startify.section.header.val = {}
            -- startify.section.mru.val = { { type = "padding", val = 0 } }
            startify.nvim_web_devicons.enabled = Plugged("nvim-web-devicons") or Plugged("mini.icons")
            startify.mru_opts.ignore = mru_ignore
            require("alpha").setup(startify.config)
        end
    end

    setup_alpha()
elseif Plugged("dashboard-nvim") then
    -- https://github.com/nvimdev/dashboard-nvim
    vim.g.dashboard_theme = (Plugged("nvim-web-devicons") or Plugged("mini.icons"))
            and (vim.g.dashboard_theme or "doom")
        or "doom"

    local setup_dashboard = function()
        local build_actions = function()
            if Plugged("telescope.nvim") then
                return {
                    find_files = function()
                        vim.cmd("Telescope find_files")
                    end,
                    recent_files = function()
                        vim.cmd("Telescope oldfiles")
                    end,
                    live_grep = function()
                        vim.cmd("Telescope live_grep")
                    end,
                    open_project = function(path)
                        vim.cmd("TelescopeFiles " .. path)
                    end,
                }
            elseif Plugged("snap") then
                return {
                    find_files = function()
                        vim.cmd("Snap files")
                    end,
                    recent_files = function()
                        vim.cmd("Snap oldfiles")
                    end,
                    live_grep = function()
                        vim.cmd("Snap live_grep")
                    end,
                    open_project = function(path)
                        vim.cmd("SnapFiles " .. path)
                    end,
                }
            elseif Plugged("fzf.vim") then
                return {
                    find_files = function()
                        vim.cmd("Files")
                    end,
                    recent_files = function()
                        vim.cmd("Mru")
                    end,
                    live_grep = function()
                        vim.cmd("Rg!")
                    end,
                    open_project = function(path)
                        vim.cmd("Files " .. path)
                    end,
                }
            else
                return {
                    find_files = function()
                        vim.cmd("FzfLua files")
                    end,
                    recent_files = function()
                        vim.cmd("FzfLua oldfiles")
                    end,
                    live_grep = function()
                        vim.cmd("FzfLua live_grep")
                    end,
                    open_project = function(path)
                        vim.cmd("FzfLuaFiles " .. path)
                    end,
                }
            end
        end

        local actions = build_actions()

        if vim.g.dashboard_theme == "doom" then
            local build_shortcuts = function()
                local icons = {
                    new_file = " ",
                    recent_files = " ",
                    find_files = " ",
                    live_grep = " ",
                    update = " ",
                    quit = " ",
                }
                if Plugged("nvim-web-devicons") or Plugged("mini.icons") then
                    icons = {
                        new_file = "  ",
                        recent_files = "  ",
                        find_files = "  ",
                        live_grep = "  ",
                        update = "󰊳  ",
                        quit = "  ",
                    }
                end
                local shortcuts = {
                    -- stylua: ignore start
                    { desc = "New file",     icon = icons.new_file,     action = "enew",               key = "n" },
                    { desc = "Find files",   icon = icons.find_files,   action = actions.find_files,   key = "f" },
                    { desc = "Recent files", icon = icons.recent_files, action = actions.recent_files, key = "r" },
                    { desc = "Live grep",    icon = icons.live_grep,    action = actions.live_grep,    key = "g" },
                    { desc = "Update",       icon = icons.update,       action = "PlugUpdate",         key = "u" },
                    { desc = "Quit",         icon = icons.quit,         action = "qa",                 key = "q" },
                    -- stylua: ignore end
                }
                local length = (Plugged("nvim-web-devicons") or Plugged("mini.icons")) and 40 or 42
                for _, button in ipairs(shortcuts) do
                    button.desc = button.desc .. string.rep(" ", length - #button.desc)
                    button.key_format = " %s"
                end
                return shortcuts
            end

            require("dashboard").setup({
                theme = "doom",
                hide = {
                    statusline = false,
                },
                config = {
                    header = vim.split(string.rep("\n", 5) .. vim.g.zero_vim_logo .. "\n\n", "\n"),
                    center = build_shortcuts(),
                    footer = {},
                },
            })
        else
            require("dashboard").setup({
                theme = "hyper",
                -- shortcut_type = "number",
                config = {
                    header = vim.split(vim.g.zero_vim_logo, "\n"),
                    week_header = { enable = false },
                    disable_move = true,
                    shortcut = {
                        -- stylua: ignore start
                        { desc = "󰊳  Update",       action = "PlugUpdate",         key = "u" },
                        { desc = "  Find files",   action = actions.find_files,   key = "f" },
                        { desc = "  Recent files", action = actions.recent_files, key = "r" },
                        { desc = "  Live grep",    action = actions.live_grep,    key = "g" },
                        { desc = "  Quit",         action = "qa",                 key = "q" },
                        -- stylua: ignore end
                    },
                    packages = { enable = false },
                    -- Read projects from ~/.cache/nvim/dashboard/cache
                    project = { limit = 8, action = actions.open_project },
                    mru = { limit = 10, cwd_only = true },
                    footer = {},
                },
            })
        end

        vim.api.nvim_create_autocmd("FileType", {
            group = "MyAutoCmd",
            pattern = { "dashboard" },
            callback = function()
                vim.opt_local.ruler = false
                vim.b.minitrailspace_disable = true
            end,
        })
    end

    setup_dashboard()
else
    -- https://github.com/echasnovski/mini.starter
    local setup_ministarter = function()
        local build_actions = function()
            if Plugged("telescope.nvim") then
                return {
                    find_files = "Telescope find_files",
                    recent_files = "Telescope oldfiles",
                    live_grep = "Telescope live_grep",
                }
            elseif Plugged("snap") then
                return {
                    find_files = "Snap files",
                    recent_files = "Snap oldfiles",
                    live_grep = "Snap live_grep",
                }
            elseif Plugged("fzf.vim") then
                return {
                    find_files = "Files",
                    recent_files = "Mru",
                    live_grep = "Rg!",
                }
            else
                return {
                    find_files = "FzfLua files",
                    recent_files = "FzfLua oldfiles",
                    live_grep = "FzfLua live_grep",
                }
            end
        end

        local actions = build_actions()

        local starter = require("mini.starter")
        starter.setup({
            evaluate_single = true,
            header = vim.g.zero_vim_logo,
            footer = string.rep(" ", 12) .. os.date(),
            items = {
                -- stylua: ignore start
                { name = "Find files",   action = actions.find_files,   section = "Quick links" },
                { name = "Recent files", action = actions.recent_files, section = "Quick links" },
                { name = "Live grep",    action = actions.live_grep,    section = "Quick links" },
                { name = "Update",       action = "PlugUpdate",         section = "Quick links" },
                { name = "New file",     action = "enew",               section = "Built-in"    },
                { name = "Quit",         action = "qa",                 section = "Built-in"    },
                -- stylua: ignore end
            },
            content_hooks = {
                starter.gen_hook.adding_bullet(),
                starter.gen_hook.aligning("center", "center"),
            },
        })

        vim.api.nvim_create_autocmd("User", {
            group = "MyAutoCmd",
            pattern = { "MiniStarterOpened" },
            callback = function()
                vim.b.miniindentscope_disable = true
                vim.b.minitrailspace_disable = true
                vim.keymap.set("n", "e", "<Cmd>enew<CR>", { buffer = true, silent = true })
                vim.keymap.set("n", "j", function()
                    MiniStarter.update_current_item("next")
                end, { buffer = true, silent = true })
                vim.keymap.set("n", "k", function()
                    MiniStarter.update_current_item("prev")
                end, { buffer = true, silent = true })
            end,
        })
    end

    setup_ministarter()
end

if Plugged("bufexplorer") then
    -- https://github.com/jlanzarotta/bufexplorer
    vim.g.bufExplorerDisableDefaultKeyMapping = 1
    vim.g.bufExplorerShowDirectories = 0
    vim.g.bufExplorerShowRelativePath = 1

    vim.keymap.set("n", "gb", "<Cmd>ToggleBufExplorer<CR>", { silent = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
    group = "MyAutoCmd",
    pattern = "*",
    callback = function()
        if vim.fn.maparg("gb", "n"):len() == 0 then
            vim.keymap.set("n", "gb", "<Leader>bb", { remap = true })
        end
    end,
})

-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = -35
vim.g.netrw_preview = 1
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+,(^\\|\\ss\\)ntuser\\.\\S\\+"

vim.api.nvim_create_autocmd("FileType", {
    group = "MyAutoCmd",
    pattern = "netrw",
    callback = function()
        vim.keymap.set("n", "H", "u", { buffer = true, remap = true })
        vim.keymap.set("n", "h", "-^", { buffer = true, remap = true })
        vim.keymap.set("n", "l", "<CR>", { buffer = true, remap = true })
        vim.keymap.set("n", "gq", "<Leader>bk", { buffer = true, remap = true })
        vim.keymap.set("n", "gl", "<Cmd>edit #<CR>", { buffer = true, silent = true })
        vim.keymap.set("n", "<Leader>e", "<Cmd>Lexplore<CR>", { buffer = true, silent = true })
    end,
})

vim.keymap.set("n", "<Leader>e", "<Cmd>Lexplore<CR>", { silent = true })
vim.keymap.set("n", "<Leader>E", "<Cmd>Explore .<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bf", "<Cmd>Explore<CR>", { silent = true })

if Plugged("oil.nvim") then
    -- https://github.com/stevearc/oil.nvim
    require("oil").setup({
        keymaps = {
            ["q"] = "actions.close",
            ["gq"] = "actions.close",
            ["gy"] = "actions.copy_entry_path",
            ["g:"] = "actions.open_cmdline",
            ["<C-d>"] = "actions.preview_scroll_down",
            ["<C-u>"] = "actions.preview_scroll_up",
        },
    })

    vim.keymap.set("n", "<Leader>e", "<Cmd>Oil .<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>E", "<Cmd>Oil <C-r>=fnameescape(getcwd())<CR><CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bf", "<Cmd>Oil<CR>", { silent = true })
end

if Plugged("carbon.nvim") then
    -- https://github.com/SidOfc/carbon.nvim
    require("carbon").setup({
        auto_open = false,
        keep_netrw = false,
        sidebar_width = 40,
        float_settings = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * 0.5
            local window_h = screen_h * 0.6
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
                relative = "editor",
                style = "minimal",
                border = "rounded",
                width = math.floor(window_w),
                height = math.floor(window_h),
                col = center_x,
                row = center_y,
            }
        end,
        actions = {
            up = { "[", "h" },
            down = { "]", "l" },
            edit = { "o", "<CR>" },
        },
    })

    vim.api.nvim_create_user_command("CloseCarbon", function()
        require("carbon.view").close_sidebar()
        require("carbon.view").close_float()
    end, { bar = true })

    vim.keymap.set("n", "<Leader>e", "<Cmd>ToggleSidebarCarbon<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>E", "<Cmd>CloseCarbon<CR><Cmd>Fcarbon<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bf", "<Cmd>CloseCarbon<CR>:Lcarbon <C-r>=strlen(expand('%')) ? expand('%:p:h') : '.'<CR><CR>", { silent = true })

    -- Auto close Sidebar on open file
    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            local view = require("carbon.view")
            local handle_sidebar_or_float = view.handle_sidebar_or_float
            view.handle_sidebar_or_float = function()
                handle_sidebar_or_float()
                view.close_sidebar()
            end
        end,
    })
end

if Plugged("nvim-tree.lua") then
    -- https://github.com/nvim-tree/nvim-tree.lua
    require("nvim-tree").setup({
        hijack_cursor = false,
        sort_by = "case_sensitive",
        view = {
            side = "left",
            width = 40,
        },
        renderer = {
            group_empty = true,
            add_trailing = false,
        },
        filters = {
            dotfiles = false,
            custom = {
                ".git",
                ".node_modules",
                ".cache",
            },
        },
        git = {
            ignore = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- Default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Custom mappings
            vim.keymap.set("n", "?", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "gd", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
            vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        end,
    })

    vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bf", "<Cmd>NvimTreeFindFile<CR>", { silent = true })
end

if Plugged("neo-tree.nvim") then
    -- https://github.com/s1n7ax/nvim-window-picker
    if Plugged("nvim-window-picker") then
        require("window-picker").setup({
            hint = "statusline-winbar",
            picker_config = {
                statusline_winbar_picker = {
                    selection_display = function(char, windowid)
                        return "%#Pmenu#%=" .. char .. ": %f" .. "%="
                    end,

                    use_winbar = "smart",
                },
            },
            filter_rules = {
                autoselect_one = true,
                include_current_win = false,
                bo = {
                    filetype = { "neo-tree", "neo-tree-popup", "qf" },
                    buftype = { "terminal", "quickfix" },
                },
            },
        })
    end

    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    vim.g.neo_tree_remove_legacy_commands = 1

    require("neo-tree").setup({
        sources = { "filesystem", "buffers", "git_status" },
        enable_git_status = false,
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        default_component_configs = {
            indent = {
                with_expanders = true,
            },
        },
        commands = {
            copy_path_to_clipboard = function(state)
                local node = state.tree:get_node()
                if node.type == "message" then
                    return
                end
                local path = node:get_id()
                vim.fn.setreg("+", path, "c")
                require("neo-tree.log").info("Copied '" .. path .. "' to clipboard")
            end,
        },
        window = {
            mappings = {
                ["<Space>"] = "none",
                ["l"] = "open",
                ["h"] = "close_node",
                -- ["<Tab>"] = "next_source",
                -- ["<S-Tab>"] = "prev_source",
                ["O"] = { "toggle_preview", config = { use_float = false } },
                ["Y"] = "copy_path_to_clipboard",
            },
        },
        filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            filtered_items = {
                never_show = {
                    ".DS_Store",
                },
            },
        },
    })
    vim.keymap.set("n", "<Leader>e", "<Cmd>Neotree left toggle<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>E", "<Cmd>Neotree float toggle<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bf", "<Cmd>Neotree reveal<CR>", { silent = true })
end

if Plugged("telescope.nvim") then
    -- https://github.com/nvim-telescope/telescope.nvim
    vim.g.telescope_find_tool = vim.g.zero_vim_find_tool
    vim.g.telescope_find_tool = (vim.g.telescope_find_tool == "rg" and vim.fn.executable("rg")) and "rg" or "fd"
    vim.g.telescope_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs
    vim.g.telescope_follow_links = vim.g.zero_vim_follow_links
    vim.g.telescope_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs

    function vim.build_telescope_find_command()
        local find_commands = {
            fd = { "fd", "--type", "file", "--color", "never", "--hidden" },
            rg = { "rg", "--files", "--color", "never", "--ignore-dot", "--ignore-parent", "--hidden" },
        }

        if vim.g.telescope_find_tool == "rg" then
            vim.g.telescope_find_command = find_commands["rg"]
        else
            vim.g.telescope_find_command = find_commands["fd"]
        end

        if vim.g.telescope_follow_links == 1 then
            table.insert(vim.g.telescope_find_command, "-L")
        end
        if vim.g.telescope_find_no_ignore_vcs == 1 then
            table.insert(vim.g.telescope_find_command, "--no-ignore-vcs")
        end

        return vim.g.telescope_find_command
    end

    function vim.build_telescope_find_all_command()
        local find_all_commands = {
            fd = { "fd", "--type", "file", "--color", "never", "--no-ignore", "--hidden", "--follow" },
            rg = { "rg", "--files", "--color", "never", "--no-ignore", "--hidden", "--follow" },
        }

        if vim.g.telescope_find_tool == "rg" then
            vim.g.telescope_find_all_command = find_all_commands["rg"]
        else
            vim.g.telescope_find_all_command = find_all_commands["fd"]
        end

        return vim.g.telescope_find_all_command
    end

    function vim.build_telescope_vimgrep_arguments()
        local vimgrep_arguments = {
            "rg",
            "--color=never",
            "-H",
            "--no-heading",
            "-n",
            "--column",
            "-S",
            "--hidden",
            "--trim",
        }

        if vim.g.telescope_follow_links == 1 then
            table.insert(vimgrep_arguments, "-L")
        end
        if vim.g.telescope_grep_no_ignore_vcs == 1 then
            table.insert(vimgrep_arguments, "--no-ignore-vcs")
        end

        vim.g.telescope_vimgrep_arguments = vimgrep_arguments
        return vim.g.telescope_vimgrep_arguments
    end

    vim.api.nvim_create_user_command("TelescopeFiles", function(opts)
        require("telescope.builtin").find_files({ cwd = opts.args })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("TelescopeAllFiles", function(opts)
        require("telescope.builtin").all_files({ cwd = opts.args })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("TelescopeRoot", function()
        require("telescope.builtin").root()
    end, {})

    vim.api.nvim_create_user_command("ToggleTelescopeFollowLinks", function()
        if vim.g.telescope_follow_links == 0 then
            vim.g.telescope_follow_links = 1
            print("telescope.nvim follows symlinks!")
        else
            vim.g.telescope_follow_links = 0
            print("telescope.nvim does not follow symlinks!")
        end

        require("telescope").setup({
            defaults = {
                vimgrep_arguments = vim.build_telescope_vimgrep_arguments(),
            },
            pickers = {
                find_files = {
                    find_command = vim.build_telescope_find_command(),
                },
            },
        })
    end, {})

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.build_telescope_find_command()
            vim.build_telescope_find_all_command()
            vim.build_telescope_vimgrep_arguments()

            local actions = require("telescope.actions")
            local action_layout = require("telescope.actions.layout")
            local sorters = require("telescope.sorters")
            local previewers = require("telescope.previewers")

            require("telescope.builtin").all_files = function(opts)
                opts = opts or {}
                opts.find_command = vim.g.telescope_find_all_command
                require("telescope.builtin").find_files(opts)
            end

            require("telescope.builtin").root = function(opts)
                opts = opts or {}
                opts.cwd = vim.find_buffer_project_dir()
                require("telescope.builtin").find_files(opts)
            end

            require("telescope.builtin").buffer_dir = function(opts)
                opts = opts or {}
                opts.cwd = "%" .. vim.fn["repeat"](":h", vim.v.count1)
                require("telescope.builtin").find_files(opts)
            end

            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = vim.g.telescope_vimgrep_arguments,
                    prompt_prefix = " ❯ ",
                    selection_caret = "» ",
                    entry_prefix = "  ",
                    layout_strategy = "flex",
                    layout_config = {
                        width = 0.8,
                        height = 0.8,
                        horizontal = {
                            mirror = false,
                            preview_width = 0.55,
                        },
                        vertical = {
                            mirror = false,
                            preview_height = 0.5,
                            preview_cutoff = 35,
                        },
                        flex = {
                            flip_columns = 135,
                        },
                    },
                    cycle_layout_list = { "vertical", "flex" },
                    preview = {
                        hide_on_startup = vim.g.telescope_preview_hide_on_startup or false,
                    },
                    winblend = 0,
                    disable_devicons = not (Plugged("nvim-web-devicons") or Plugged("mini.icons")),
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" },
                    generic_sorter = sorters.get_generic_fuzzy_sorter,
                    file_sorter = sorters.get_fuzzy_file,
                    file_ignore_patterns = {},
                    file_previewer = previewers.vim_buffer_cat.new,
                    grep_previewer = previewers.vim_buffer_vimgrep.new,
                    qflist_previewer = previewers.vim_buffer_qflist.new,
                    buffer_previewer_maker = previewers.buffer_previewer_maker,
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close,
                            ["<C-g>"] = actions.close,
                            ["<C-o>"] = { "<Esc>", type = "command" },
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                            ["<C-s>"] = action_layout.cycle_layout_next,
                            [";"] = action_layout.toggle_preview,
                            ["<C-\\>"] = action_layout.toggle_preview,
                            ["<C-y>"] = actions.preview_scrolling_up,
                            ["<C-e>"] = actions.preview_scrolling_down,
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        },
                        n = {
                            ["<Esc>"] = actions.close,
                            ["<C-g>"] = actions.close,
                            ["<C-o>"] = { "i", type = "command" },
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
                            ["<C-s>"] = action_layout.cycle_layout_next,
                            ["<C-\\>"] = action_layout.toggle_preview,
                            ["<C-y>"] = actions.preview_scrolling_up,
                            ["<C-e>"] = actions.preview_scrolling_down,
                            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        find_command = vim.g.telescope_find_command,
                    },
                    buffers = {
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<C-q>"] = actions.delete_buffer,
                                ["<C-d>"] = actions.delete_buffer,
                            },
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    },
                },
            })

            require("telescope").load_extension("fzf")
            if Plugged("telescope-fzy-native.nvim") then
                require("telescope").load_extension("fzy_native")
            end

            if Plugged("noice.nvim") then
                require("telescope").load_extension("noice")
            end
        end,
    })

    vim.keymap.set("n", "yoa", "<Cmd>ToggleTelescopeFollowLinks<CR>", { silent = true })

    vim.keymap.set("n", "<Leader><Leader>", "<Leader>f", { remap = true })

    vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope find_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>a", "<Cmd>Telescope all_files<CR>", { silent = true })
    vim.keymap.set("n", "<C-p>", "<Cmd>Telescope root<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>p", "<Cmd>Telescope git_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>o", "<Cmd>Telescope old_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>O", "<Cmd>Telescope old_files only_cwd=true<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>d", "<Cmd>Telescope buffer_dir<CR>", { silent = true })

    vim.keymap.set("n", [[<Leader>\]], "<Cmd>Telescope tags<CR>", { silent = true })

    -- Buffer-related mappings
    vim.keymap.set("n", "<Leader>bb", "<Cmd>Telescope buffers<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
    vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
    vim.keymap.set("n", "<Leader>bl", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bt", "<Cmd>Telescope current_buffer_tags<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bo", "<Cmd>Telescope current_buffer_tags<CR>", { silent = true })

    vim.keymap.set("n", "<C-w><C-a>", function()
        require("telescope-tabs").list_tabs()
    end, { silent = true })

    vim.keymap.set("n", "<Leader>;", "<Cmd>Telescope commands<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>:", "<Cmd>Telescope command_history<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>?", "<Cmd>Telescope search_history<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>'", "<Cmd>Telescope marks<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>Y", "<Cmd>Telescope registers<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>q", "<Cmd>cclose<CR><Cmd>Telescope quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>q", "<Cmd>lclose<CR><Cmd>Telescope loclist<CR>", { silent = true })

    vim.keymap.set(
        "n",
        "<Leader>si",
        [[:<C-u>lua require("telescope.builtin").grep_string({ search = "" })<Left><Left><Left><Left>]]
    )
    vim.keymap.set("n", "<Leader>sc", function()
        require("telescope.builtin").grep_string({ use_regex = true, search = vim.fn["zero#CCword"]() })
    end, { silent = true })
    vim.keymap.set(
        "x",
        "<Leader>sc",
        [[:<C-u>lua require("telescope.builtin").grep_string({ search = vim.fn["zero#Vword"]() })<CR>]],
        { silent = true }
    )
    vim.keymap.set("n", "<Leader>/", "<Cmd>Telescope live_grep<CR>", { silent = true })
    vim.keymap.set(
        "x",
        "<Leader>/",
        [[:<C-u>lua require("telescope.builtin").grep_string({ search = vim.fn["zero#Vword"]() })<CR>]],
        { silent = true }
    )

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "TelescopeResults",
        command = "setlocal startofline",
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "TelescopePrompt",
        callback = function() end,
    })
end

if Plugged("snap") then
    -- How to install https://github.com/swarn/fzy-lua
    -- $ luarocks install --force --lua-version=5.1 fzy
    -- $ mkdir -p ~/.config/nvim/lua
    -- $ cp ~/.luarocks/lib/lua/5.1/fzy_native.so ~/.config/nvim/lua/
    -- $ cp ~/.luarocks/share/lua/5.1/{fzy,fzy_lua}.lua ~/.config/nvim/lua/
    -- https://github.com/camspiers/snap
    require("snap_settings").setup({
        find_tool = vim.g.zero_vim_find_tool,
        find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs,
        follow_links = vim.g.zero_vim_follow_links,
        grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs,
        preview = vim.g.snap_preview or false,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.keymap.set("n", "yoa", "<Cmd>ToggleSnapFollowLinks<CR>", { silent = true })

            vim.keymap.set("n", "<Leader><Leader>", "<Cmd>Snap files<CR>", { silent = true })

            vim.keymap.set("n", "<Leader>f", "<Cmd>Snap files<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>a", "<Cmd>Snap all_files<CR>", { silent = true })
            vim.keymap.set("n", "<C-p>", "<Cmd>Snap root<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>p", "<Cmd>Snap git_files<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>o", "<Cmd>Snap oldfiles<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>O", "<Cmd>Snap oldfiles<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>d", "<Cmd>Snap buffer_dir<CR>", { silent = true })

            -- Buffer-related mappings
            vim.keymap.set("n", "<Leader>bb", "<Cmd>Snap buffers<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
            vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
            vim.keymap.set("n", "<Leader>bt", "<Cmd>Snap boutline<CR>", { remap = true })
            vim.keymap.set("n", "<Leader>bo", "<Cmd>Snap boutline<CR>", { remap = true })

            vim.keymap.set("n", "<Leader>si", "<Cmd>Snap live_grep<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>sc", "<Cmd>Snap live_grep_cword<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>sc", "<Cmd>Snap live_grep_selection<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>/", "<Cmd>Snap live_grep<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>/", "<Cmd>Snap live_grep_selection<CR>", { silent = true })
        end,
    })
end

if Plugged("fzf-lua") then
    -- https://github.com/ibhagwan/fzf-lua
    vim.g.fzf_find_tool = vim.g.zero_vim_find_tool
    vim.g.fzf_find_tool = (vim.g.fzf_find_tool == "rg" and vim.fn.executable("rg") == 1) and "rg" or "fd"
    vim.g.fzf_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs
    vim.g.fzf_follow_links = vim.g.zero_vim_follow_links
    vim.g.fzf_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs

    function vim.build_fzf_find_command()
        local find_commands = {
            fd = "fd --type file --color never --hidden",
            rg = "rg --files --color never --ignore-dot --ignore-parent --hidden",
        }

        if vim.g.fzf_find_tool == "rg" then
            vim.g.fzf_find_command = find_commands["rg"]
        else
            vim.g.fzf_find_command = find_commands["fd"]
        end

        vim.g.fzf_find_command = vim.g.fzf_find_command .. (vim.g.fzf_follow_links == 1 and " --follow" or "")
        vim.g.fzf_find_command = vim.g.fzf_find_command
            .. (vim.g.fzf_find_no_ignore_vcs == 1 and " --no-ignore-vcs" or "")

        return vim.g.fzf_find_command
    end

    function vim.build_fzf_find_all_command()
        local find_all_commands = {
            fd = "fd --type file --color never --no-ignore --hidden --follow",
            rg = "rg --files --color never --no-ignore --hidden --follow",
        }

        if vim.g.fzf_find_tool == "rg" then
            vim.g.fzf_find_all_command = find_all_commands["rg"]
        else
            vim.g.fzf_find_all_command = find_all_commands["fd"]
        end

        return vim.g.fzf_find_all_command
    end

    function vim.build_fzf_rg_opts()
        vim.g.fzf_rg_opts = "--color always -H --no-heading --line-number --smart-case --hidden --max-columns=4096"
        vim.g.fzf_rg_opts = vim.g.fzf_rg_opts .. (vim.g.fzf_follow_links == 1 and " --follow" or "")
        vim.g.fzf_rg_opts = vim.g.fzf_rg_opts .. (vim.g.fzf_grep_no_ignore_vcs == 1 and " --no-ignore-vcs" or "")
        return vim.g.fzf_rg_opts
    end

    require("fzf-lua").all_files = function(opts)
        opts = opts or {}
        opts.cmd = vim.g.fzf_find_all_command
        opts.toggle_ignore_flag = "--no-ignore"
        opts.cwd = vim.fn.empty(opts.cwd) ~= 1 and opts.cwd or vim.fn.getcwd()
        require("fzf-lua").files(opts)
    end

    require("fzf-lua").root = function(opts)
        opts = opts or {}
        opts.cwd = vim.find_buffer_project_dir()
        opts.cwd = vim.fn.empty(opts.cwd) ~= 1 and opts.cwd or vim.fn.getcwd()
        require("fzf-lua").files(opts)
    end

    require("fzf-lua").buffer_dir = function(opts)
        opts = opts or {}
        opts.cwd = "%" .. vim.fn["repeat"](":h", vim.v.count1)
        require("fzf-lua").files(opts)
    end

    vim.api.nvim_create_user_command("FzfLuaFiles", function(opts)
        require("fzf-lua").files({ cwd = vim.fn.empty(opts.args) ~= 1 and opts.args or vim.fn.getcwd() })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("FzfLuaAllFiles", function(opts)
        require("fzf-lua").all_files({ cwd = opts.args })
    end, { nargs = "?", complete = "dir" })

    vim.api.nvim_create_user_command("FzfLuaRoot", function()
        require("fzf-lua").root()
    end, {})

    vim.api.nvim_create_user_command("ToggleFzfFollowLinks", function()
        if vim.g.fzf_follow_links == 0 then
            vim.g.fzf_follow_links = 1
            print("fzf-lua follows symlinks!")
        else
            vim.g.fzf_follow_links = 0
            print("fzf-lua does not follow symlinks!")
        end

        require("fzf-lua").setup({
            files = {
                cmd = vim.build_fzf_find_command(),
            },
            grep = {
                rg_opts = vim.build_fzf_rg_opts(),
            },
        })
    end, {})

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.build_fzf_rg_opts()
            vim.build_fzf_find_command()
            vim.build_fzf_find_all_command()

            require("fzf-lua").setup({
                "default",
                defaults = {
                    git_icons = false,
                },
                winopts = {
                    weigth = 0.85,
                    height = 0.75,
                    preview = {
                        -- default = "bat",
                        hidden = "hidden",
                    },
                },
                fzf_opts = {
                    ["--layout"] = "default",
                },
                files = {
                    cwd_header = false,
                    cwd_prompt = true,
                    cmd = vim.g.fzf_find_command,
                    fd_opts = "--type file --color never --hidden --follow",
                    rg_opts = "--files --color never --ignore-dot --ignore-parent --hidden --follow",
                    -- formatter = "path.filename_first",
                    toggle_ignore_flag = "--no-ignore-vcs",
                },
                grep = {
                    rg_opts = vim.g.fzf_rg_opts,
                },
                keymap = {
                    builtin = {
                        ["<C-z>"] = "toggle-fullscreen",
                        ["<C-y>"] = "toggle-preview-cw",
                        [":"] = "toggle-preview-wrap",
                        [";"] = "toggle-preview",
                        ["<F1>"] = "toggle-help",
                        ["<F2>"] = "toggle-fullscreen",
                        ["<F3>"] = "toggle-preview-wrap",
                        ["<F4>"] = "toggle-preview",
                        ["<F5>"] = "toggle-preview-ccw",
                        ["<F6>"] = "toggle-preview-cw",
                        ["<S-Down>"] = "preview-page-down",
                        ["<S-Up>"] = "preview-page-up",
                        ["<S-Left>"] = "preview-page-reset",
                    },
                    fzf = {
                        [":"] = "toggle-preview-wrap",
                        [";"] = "toggle-preview",
                    },
                },
            })
        end,
    })

    vim.keymap.set("n", "<Leader><Leader>", "<Cmd>FzfLua files formatter=path.filename_first<CR>", { silent = true })

    vim.keymap.set("n", "yoa", "<Cmd>ToggleFzfFollowLinks<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>f", "<Cmd>FzfLua files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>a", "<Cmd>FzfLua all_files<CR>", { silent = true })
    vim.keymap.set("n", "<C-p>", "<Cmd>FzfLua root<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>p", "<Cmd>FzfLua git_files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>o", "<Cmd>FzfLua oldfiles<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>O", "<Cmd>FzfLua oldfiles cwd_only=true<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>d", "<Cmd>FzfLua buffer_dir<CR>", { silent = true })
    vim.keymap.set("n", [[<Leader>\]], "<Cmd>FzfLua tags<CR>", { silent = true })

    -- Buffer-related mappings
    vim.keymap.set("n", "<Leader>bb", "<Cmd>FzfLua buffers<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
    vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
    vim.keymap.set("n", "<Leader>bl", "<Cmd>FzfLua blines<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bt", "<Cmd>FzfLua btags<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bo", function()
        require("fzf-lua").btags({
            ctags_bin = vim.g.zero_vim_ctags_bin,
            ctags_autogen = true,
            ctags_args = "-f - --sort=no --excmd=combine",
        })
    end, { silent = true })

    vim.keymap.set("n", "<C-w><C-a>", "<Cmd>FzfLua tabs<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>;", "<Cmd>FzfLua commands<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>:", "<Cmd>FzfLua command_history<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>?", "<Cmd>FzfLua search_history<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>'", "<Cmd>FzfLua marks<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>Y", "<Cmd>FzfLua registers<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>q", "<Cmd>cclose<CR><Cmd>FzfLua quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>l", "<Cmd>lclose<CR><Cmd>FzfLua loclist<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>si", "<Cmd>FzfLua live_grep_glob<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sc", "<Cmd>FzfLua grep_cword<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sc", ":FzfLua grep_visual<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>/", "<Cmd>FzfLua live_grep<CR>", { silent = true })
    vim.keymap.set(
        "x",
        "<Leader>/",
        [[:<C-u>lua require("fzf-lua").live_grep({ search = vim.fn["zero#Vword"]() })<CR>]],
        { silent = true }
    )
end

if Plugged("fzf.vim") then
    -- https://github.com/junegunn/fzf
    -- https://github.com/junegunn/fzf.vim
    vim.g.fzf_find_tool = vim.g.zero_vim_find_tool
    vim.g.fzf_find_no_ignore_vcs = vim.g.zero_vim_find_no_ignore_vcs
    vim.g.fzf_follow_links = vim.g.zero_vim_follow_links
    vim.g.fzf_grep_no_ignore_vcs = vim.g.zero_vim_grep_no_ignore_vcs
    vim.g.fzf_ctags_bin = vim.g.zero_vim_ctags_bin
    vim.g.fzf_ctags_ignore = vim.g.zero_vim_ctags_ignore
    vim.g.fzf_universal_ctags = vim.g.zero_vim_universal_ctags

    vim.api.nvim_create_user_command("PFiles", function(opts)
        if opts.bang then
            vim.cmd("Files! " .. vim.find_buffer_project_dir())
        else
            vim.cmd("Files " .. vim.find_buffer_project_dir())
        end
    end, { bang = true })

    vim.keymap.set("n", "<Leader><Leader>", "<Leader>f", { remap = true })

    vim.keymap.set("n", "yoa", "<Cmd>ToggleFzfFollowLinks<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>f", "<Cmd>Files<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>a", "<Cmd>AFiles<CR>", { silent = true })
    vim.keymap.set("n", "<C-p>", "<Cmd>PFiles<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>p", "<Cmd>GitFiles<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>o", "<Cmd>Mru<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>O", "<Cmd>MruCwd<CR>", { silent = true })
    vim.keymap.set(
        "n",
        "<Leader>d",
        ":<C-u>Files <C-r>=expand('%' . repeat(':h', v:count1))<CR><CR>",
        { silent = true }
    )

    vim.keymap.set("n", [[<Leader>\]], "<Cmd>Tags!<CR>", { silent = true })

    -- Buffer-related mappings
    vim.keymap.set("n", "<Leader>bb", "<Cmd>Buffers<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bd", "<Leader>d", { remap = true })
    vim.keymap.set("n", "<Leader>bp", "<Leader>p", { remap = true })
    vim.keymap.set("n", "<Leader>bl", "<Cmd>BLines<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bt", "<Cmd>BTags<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bo", "<Cmd>BOutline<CR>", { silent = true })

    vim.keymap.set("n", "<C-w><C-a>", "<Cmd>Windows<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>;", "<Cmd>Commands<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>:", "<Cmd>History:<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>?", "<Cmd>History/<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>'", "<Cmd>Marks<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>Y", "<Cmd>Registers<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>q", "<Cmd>cclose<CR><Cmd>Quickfix<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>l", "<Cmd>lclose<CR><Cmd>LocationList<CR>", { silent = true })

    vim.keymap.set("n", "<Leader>si", ":<C-u>RgRaw!<Space>")
    vim.keymap.set("n", "<Leader>sc", ":<C-u>RgRaw! -- <C-r>=zero#shell#CCword()<CR><CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sc", ":<C-u>RgRaw! -- <C-r>=zero#shell#Vword()<CR><CR>", { silent = true })
    vim.keymap.set("n", "<Leader>/", "<Cmd>Rg!<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>/", ":<C-u>RgRaw! -- <C-r>=zero#shell#Vword()<CR><CR>", { silent = true })
end

if Plugged("vim-grepper") then
    -- https://github.com/mhinz/vim-grepper
    vim.g.grepper = {
        open = 1,
        switch = 1,
        jump = 0,
        prompt = 1,
        prompt_mapping_tool = "<C-\\>",
        stop = 2000,
        repo = vim.list_extend(vim.deepcopy(vim.g.zero_vim_vcs_root_markers), vim.g.zero_vim_file_root_markers),
        tools = { "rg", "git" },
        rg = {
            grepprg = "rg -H --no-heading -n -S --hidden"
                .. (vim.g.zero_vim_follow_links == 1 and " -L" or "")
                .. (vim.g.zero_vim_grep_no_ignore_vcs == 1 and " --no-ignore-vcs" or ""),
            escape = "\\^$.*+?()[]{}|-",
            grepformat = "%f:%l:%c:%m,%f:%l:%m",
        },
    }

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            local default_opts = { nargs = "*", complete = "customlist,grepper#complete" }
            local opts = vim.tbl_extend("force", default_opts, { bang = true })
            local visual_opts = vim.tbl_extend("force", opts, { range = true })

            vim.api.nvim_create_user_command("PGrepper", "Grepper -dir repo,filecwd,cwd <args>", default_opts)
            vim.api.nvim_create_user_command("DGrepper", "Grepper -dir file,repo,cwd <args>", default_opts)
            vim.api.nvim_create_user_command("LGrepper", "Grepper -noquickfix <args>", default_opts)
            vim.api.nvim_create_user_command("BGrepper", "LGrepper -buffer <args>", default_opts)

            vim.api.nvim_create_user_command(
                "GrepperCCword",
                "execute 'Grepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>",
                opts
            )
            vim.api.nvim_create_user_command(
                "GrepperCword",
                "execute 'Grepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()",
                opts
            )
            vim.api.nvim_create_user_command(
                "GrepperWord",
                "execute 'Grepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()",
                opts
            )
            vim.api.nvim_create_user_command(
                "GrepperVword",
                "execute 'Grepper'  (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()",
                visual_opts
            )

            vim.api.nvim_create_user_command(
                "LGrepperCCword",
                "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>",
                opts
            )
            vim.api.nvim_create_user_command(
                "LGrepperCword",
                "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()",
                opts
            )
            vim.api.nvim_create_user_command(
                "LGrepperWord",
                "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()",
                opts
            )
            vim.api.nvim_create_user_command(
                "LGrepperVword",
                "execute 'LGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()",
                visual_opts
            )

            vim.api.nvim_create_user_command(
                "PGrepperCCword",
                "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') '-cword' <q-args>",
                opts
            )
            vim.api.nvim_create_user_command(
                "PGrepperCword",
                "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Cword()",
                opts
            )
            vim.api.nvim_create_user_command(
                "PGrepperWord",
                "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Word()",
                opts
            )
            vim.api.nvim_create_user_command(
                "PGrepperVword",
                "execute 'PGrepper' (<bang>0 ? '-noprompt' : '') <q-args> '-query' zero#grepper#Vword()",
                visual_opts
            )

            vim.keymap.set("n", "<Leader>S", "<Cmd>Grepper<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>S", ":GrepperVword<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>s;", "<Cmd>GrepperCCword<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>s;", ":GrepperVword<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>ss", "<Cmd>GrepperCCword!<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>ss", ":GrepperVword!<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>s.", "<Cmd>GrepperWord!<CR>", { silent = true })
            vim.keymap.set(
                "n",
                "<Leader>sg",
                "<Cmd>PGrepperCCword! -tool git -grepprg git grep -nIP<CR>",
                { silent = true }
            )
            vim.keymap.set("x", "<Leader>sg", ":PGrepperVword! -tool git<CR>", { silent = true })
            -- Grepper with current buffer dir
            vim.keymap.set("n", "<Leader>sd", "<Cmd>LGrepperCCword! -dir file,repo,cwd<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>sd", ":LGrepperVword! -dir file,repo,cwd<CR>", { silent = true })

            -- Buffer search
            vim.keymap.set("n", "<Leader>B", "<Cmd>PGrepper -noquickfix<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>B", ":PGrepperVword -noquickfix<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>b;", "<Cmd>PGrepperCCword -noquickfix<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>b;", ":PGrepperVword -noquickfix<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>bs", "<Cmd>PGrepperCCword! -noquickfix<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>bs", ":PGrepperVword! -noquickfix<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>b.", "<Cmd>PGrepperWord! -noquickfix<CR>", { silent = true })
            vim.keymap.set(
                "n",
                "<Leader>bg",
                "<Cmd>PGrepperCCword! -noquickfix -tool git -grepprg git grep -nIP<CR>",
                { silent = true }
            )
            vim.keymap.set("x", "<Leader>bg", ":PGrepperVword! -noquickfix -tool git<CR>", { silent = true })
        end,
    })
end

if Plugged("ctrlsf.vim") then
    -- https://github.com/dyng/ctrlsf.vim
    vim.g.ctrlsf_default_root = "cwd"
    vim.g.ctrlsf_extra_root_markers = {
        ".git",
        ".hg",
        ".svn",
        ".bzr",
        "_darcs",
        "Gemfile",
        "rebar.config",
        "mix.exs",
        "Cargo.toml",
        "shard.yml",
        "go.mod",
    }
    vim.g.ctrlsf_follow_symlinks = vim.g.zero_vim_follow_links
    vim.g.ctrlsf_populate_qflist = vim.g.ctrlsf_populate_qflist or 0
    vim.g.ctrlsf_preview_position = "inside"
    vim.g.ctrlsf_auto_focus = {
        at = "start",
    }

    -- Prefer rg
    if vim.fn.executable("rg") == 1 then
        vim.g.ctrlsf_backend = "rg"
        vim.g.ctrlsf_extra_backend_args = {
            rg = vim.g.zero_vim_grep_no_ignore_vcs == 1 and "--no-ignore-vcs" or "",
        }
    end

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.cmd([[
            function! PCtrlSF(...) abort
                try
                    let l:current = g:ctrlsf_default_root
                    let g:ctrlsf_default_root = 'project+fw'
                    call ctrlsf#Search(join(a:000, ' '))
                finally
                    let g:ctrlsf_default_root = l:current
                endtry
            endfunction
            ]])

            local opts = { nargs = "*", complete = "customlist,ctrlsf#comp#Completion" }
            local visual_opts = vim.tbl_extend("force", opts, { range = true })

            vim.api.nvim_create_user_command("CtrlSFCCword", "execute 'CtrlSF' <q-args> zero#ctrlsf#CCword()", opts)
            vim.api.nvim_create_user_command("CtrlSFCword", "execute 'CtrlSF' <q-args> zero#ctrlsf#Cword()", opts)
            vim.api.nvim_create_user_command("CtrlSFWord", "execute 'CtrlSF' <q-args> zero#ctrlsf#Word()", opts)
            vim.api.nvim_create_user_command(
                "CtrlSFVword",
                "execute 'CtrlSF' <q-args> zero#ctrlsf#Vword()",
                visual_opts
            )

            vim.api.nvim_create_user_command("PCtrlSF", "call PCtrlSF(<f-args>)", opts)
            vim.api.nvim_create_user_command("PCtrlSFCCword", "call PCtrlSF(<q-args>, zero#ctrlsf#CCword())", opts)
            vim.api.nvim_create_user_command("PCtrlSFCword", "call PCtrlSF(<q-args>, zero#ctrlsf#Cword())", opts)
            vim.api.nvim_create_user_command("PCtrlSFWord", "call PCtrlSF(<q-args>, zero#ctrlsf#Word())", opts)
            vim.api.nvim_create_user_command("PCtrlSFVword", "call PCtrlSF(<q-args>, zero#ctrlsf#Vword())", visual_opts)

            vim.keymap.set("c", "<C-r><C-i>", "<C-r>=zero#InsertInput()<CR>")

            vim.keymap.set("n", "<Leader>F", ":CtrlSF<Space>")
            vim.keymap.set("x", "<Leader>F", ":CtrlSFVword<Space>")
            vim.keymap.set("n", "<Leader>sf", "<Cmd>CtrlSFCCword<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>sf", ":CtrlSFVword<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>sw", "<Cmd>CtrlSFWord<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>so", "<Cmd>CtrlSFToggle<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>su", "<Cmd>CtrlSFUpdate<CR>", { silent = true })
            -- CtrlSF with current buffer project / repo
            vim.keymap.set("n", "<Leader>sp", "<Cmd>PCtrlSFCCword<CR>", { silent = true })
            vim.keymap.set("x", "<Leader>sp", ":PCtrlSFVword<CR>", { silent = true })
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "ctrlsf",
        callback = function()
            local move_ctrlsf_main_window = function(position)
                vim.g.ctrlsf_position = position
                vim.fn["ctrlsf#Quit"]()
                vim.fn["ctrlsf#Open"]()
                vim.print(string.format("CtrlSF Position: %s!", vim.g.ctrlsf_position))
            end

            vim.keymap.set("n", "<C-w>H", function()
                move_ctrlsf_main_window("left")
            end, { buffer = true, silent = true })
            vim.keymap.set("n", "<C-w>J", function()
                move_ctrlsf_main_window("bottom")
            end, { buffer = true, silent = true })
            vim.keymap.set("n", "<C-w>K", function()
                move_ctrlsf_main_window("top")
            end, { buffer = true, silent = true })
            vim.keymap.set("n", "<C-w>L", function()
                move_ctrlsf_main_window("right")
            end, { buffer = true, silent = true })
        end,
    })
end

if Plugged("any-jump.vim") then
    -- https://github.com/pechorin/any-jump.vim
    -- Disable default any-jump keybindings
    vim.g.any_jump_disable_default_keybindings = true

    -- Any-jump window size & position options
    vim.g.any_jump_window_width_ratio = 0.85
    vim.g.any_jump_window_height_ratio = 0.75
    vim.g.any_jump_window_top_offset = 4

    -- Hide Help section
    vim.g.any_jump_show_help_section = false

    -- Disable search engine ignore vcs untracked files
    vim.g.any_jump_disable_vcs_ignore = false

    -- Custom ignore files
    vim.g.any_jump_ignored_files = vim.g.any_jump_ignored_files or {}

    vim.keymap.set("n", "<Leader>sa", "<Cmd>AnyJump<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>sa", ":AnyJumpVisual<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sb", "<Cmd>AnyJumpBack<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>sl", "<Cmd>AnyJumpLastResults<CR>", { silent = true })
end

if Plugged("leap.nvim") then
    -- https://github.com/ggandor/leap.nvim
    local leap = require("leap")
    leap.opts.safe_labels = {}
    leap.opts.labels = {}
    leap.opts.special_keys = {
        next_target = ";",
        prev_target = ",",
        next_group = "<Enter>",
        prev_group = ",",
        multi_accept = ";",
        multi_revert = "<Backspace>",
    }

    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)", { silent = true, desc = "Leap forward to" })
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)", { silent = true, desc = "Leap backward to" })
end

if Plugged("flash.nvim") then
    -- https://github.com/folke/flash.nvim
    require("flash").setup({})

    vim.api.nvim_create_user_command("ToggleFlash", function()
        require("flash").toggle()
    end, {})
    vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("flash").jump()
    end, { desc = "Flash" })
    vim.keymap.set({ "n", "x", "o" }, "S", function()
        require("flash").treesitter()
    end, { desc = "Flash Treesitter" })
    vim.keymap.set("o", "r", function()
        require("flash").remote()
    end, { desc = "Remote Flash" })
    vim.keymap.set({ "x", "o" }, "R", function()
        require("flash").treesitter_search()
    end, { desc = "Treesitter Search" })
end

if Plugged("guess-indent.nvim") then
    -- https://github.com/NMAC427/guess-indent.nvim
    require("guess-indent").setup({})
end

if Plugged("vim-tmuxify") then
    -- https://github.com/jebaum/vim-tmuxify
    vim.g.tmuxify_custom_command = "tmux split-window -d -l 30%"
    vim.g.tmuxify_map_prefix = "<Leader>m"
    vim.g.tmuxify_global_maps = 1

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.cmd([[
            function! TmuxifySendKeys(keys, bang) abort
                let keys = empty(a:keys) ? input('TxSendKeys> ') : a:keys
                for key in split(keys)
                    call tmuxify#pane_send_raw(key, a:bang)
                endfor
            endfunction
            ]])

            -- TxSendText: Send current line or selected lines
            vim.api.nvim_create_user_command(
                "TxSendText",
                "<line1>,<line2>yank m | TxSend<bang>(@m)",
                { bar = true, bang = true, range = true }
            )

            vim.api.nvim_create_user_command("TxSendBuffer", "%TxSendText<bang>", { bar = true, bang = true })
            vim.api.nvim_create_user_command("TxSendLastText", "TxSend<bang>(@m)", { bar = true, bang = true })
            vim.api.nvim_create_user_command(
                "TxSendClear",
                "call tmuxify#pane_send(<q-bang>, 'clear')",
                { bar = true, bang = true }
            )
            vim.api.nvim_create_user_command(
                "TxSendQuit",
                "call TmuxifySendKeys('C-u q C-u C-d C-u C-\\ C-u', <q-bang>) | redraw!",
                { bar = true, bang = true }
            )

            -- Overwrite TxClear and TxSendKey commands
            vim.api.nvim_create_user_command(
                "TxClear",
                "call TmuxifySendKeys('C-u C-l C-u', <q-bang>) | redraw!",
                { bar = true, bang = true }
            )
            vim.api.nvim_create_user_command(
                "TxSendKey",
                "call TmuxifySendKeys(<q-args>, <q-bang>)",
                { nargs = "?", bar = true, bang = true }
            )

            vim.keymap.set("n", "<Leader>mf", "<Cmd>TxSendClear!<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>md", "<Cmd>TxSendQuit!<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>ma", "<Cmd>TxSendLastText!<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>mi", "<Cmd>TxSend!<CR>", { silent = true })
            vim.keymap.set("n", "<Leader>ml", "mm^vg_<Leader>ms`m", { remap = true })
            vim.keymap.set("n", "<Leader>mv", "mmV<Leader>ms`m", { remap = true })
            vim.keymap.set("n", "<Leader>mw", "mmviw<Leader>ms`m", { remap = true })

            -- Overwrite <Leader>ms to send inner paragraph to Tmux pane
            vim.keymap.set("n", "<Leader>ms", "mmvip<Leader>ms`m", { remap = true, silent = true })
        end,
    })
end

-- https://github.com/tyru/open-browser.vim
vim.g.openbrowser_message_verbosity = 1
vim.g.openbrowser_allowed_schemes = { "http", "https", "ftp" }

if vim.fn.empty(vim.env.BROWSER) == 0 then
    vim.g.openbrowser_browser_commands = {
        {
            name = vim.env.BROWSER,
            args = { "{browser}", "{uri}" },
        },
    }
end

vim.g.netrw_nogx = 1

vim.keymap.set({ "n", "v" }, "gx", "<Plug>(openbrowser-smart-search)", { remap = true })

-- https://github.com/monaqa/dial.nvim
vim.api.nvim_create_autocmd("VimEnter", {
    group = "MyAutoCmd",
    pattern = "*",
    callback = function()
        local augend = require("dial.augend")

        require("dial.config").augends:register_group({
            -- default augends used when no group name is specified
            default = {
                augend.integer.alias.decimal_int,
                augend.constant.alias.bool,
                augend.integer.alias.hex,
                augend.date.alias["%Y-%m-%d"],
                augend.date.alias["%m/%d/%Y"],
                augend.date.new({
                    pattern = "%b %-d %Y",
                    default_kind = "day",
                    only_valid = true,
                }),
                augend.date.new({
                    pattern = "%b %d, %Y",
                    default_kind = "day",
                    only_valid = true,
                }),
                augend.date.new({
                    pattern = "%B %d, %Y",
                    default_kind = "day",
                    only_valid = true,
                }),
                augend.date.alias["%H:%M:%S"],
                augend.date.alias["%H:%M"],
                augend.date.new({
                    pattern = "%a, %d %b %Y %H:%M:%S",
                    default_kind = "day",
                    only_valid = true,
                }),
                augend.date.new({
                    pattern = "%Y-%m-%dT%H:%M:%S",
                    default_kind = "day",
                    only_valid = true,
                }),
            },
        })

        local dial_manipulate = function(direction, mode)
            return function()
                require("dial.map").manipulate(direction, mode)
            end
        end

        vim.keymap.set("n", "<C-a>", dial_manipulate("increment", "normal"))
        vim.keymap.set("n", "<C-x>", dial_manipulate("decrement", "normal"))
        vim.keymap.set("n", "g<C-a>", dial_manipulate("increment", "gnormal"))
        vim.keymap.set("n", "g<C-x>", dial_manipulate("decrement", "gnormal"))
        vim.keymap.set("v", "<C-a>", dial_manipulate("increment", "visual"))
        vim.keymap.set("v", "<C-x>", dial_manipulate("decrement", "visual"))
        vim.keymap.set("v", "g<C-a>", dial_manipulate("increment", "gvisual"))
        vim.keymap.set("v", "g<C-x>", dial_manipulate("decrement", "gvisual"))
    end,
})

if Plugged("nvim-bqf") then
    -- https://github.com/kevinhwang91/nvim-bqf
    require("bqf").setup({
        auto_resize_height = true,
        preview = {
            auto_preview = true,
            -- border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
            delay_syntax = 80,
            win_height = 12,
            win_vheight = 12,
            winblend = 0,
        },
    })
end

if Plugged("ZoomWin") then
    -- https://github.com/phongnh/ZoomWin
    vim.keymap.set("n", "<C-w>m", "<Plug>ZoomWin", { remap = true, silent = true })
    vim.keymap.set("v", "<C-w>m", "<Esc><C-w>mgv", { remap = true })
    vim.keymap.set({ "n", "v" }, "<Leader>bm", "<C-w>m", { remap = true })
end

-- https://github.com/marklcrns/vim-smartq
vim.g.smartq_default_mappings = 0
vim.g.smartq_no_exit = 1

vim.keymap.set("n", "<C-w>q", "<Plug>(smartq_this_force", { remap = true })
vim.keymap.set("n", "<Leader>bk", "<Plug>(smartq_this)", { remap = true })

if Plugged("retrail.nvim") then
    -- https://github.com/kaplanz/retrail.nvim
    require("retrail").setup({
        hlgroup = "Search",
        filetype = {
            strict = false,
            exclude = {
                "",
                "diff",
                "git",
                "gitcommit",
                "ctrlsf",
                "qf",
                "fugitive",
                "fugitiveblame",
                "aerial",
                "alpha",
                "dashboard",
                "checkhealth",
                "cmp_menu",
                "diff",
                "lazy",
                "lspinfo",
                "man",
                "mason",
                "TelescopePrompt",
                "toggleterm",
                "Trouble",
                "WhichKey",
            },
        },
        buftype = {
            strict = false,
            exclude = {
                "help",
                "nofile",
                "prompt",
                "quickfix",
                "terminal",
            },
        },
        trim = {
            auto = false,
            whitespace = true,
            blanklines = false,
        },
    })

    vim.keymap.set("n", "yo<Space>", ":RetrailToggle<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bw", ":RetrailTrimWhitespace<CR>", { silent = true })
elseif Enabled("whitespace") then
    -- https://github.com/echasnovski/mini.trailspace
    vim.g.minitrailspace_disable = true
    require("mini.trailspace").setup({})

    vim.api.nvim_create_user_command("ToggleMiniTrailspace", function()
        vim.g.minitrailspace_disable = not vim.g.minitrailspace_disable
    end, {})

    vim.api.nvim_create_user_command("StripWhitespace", function()
        require("mini.trailspace").trim()
    end, { range = "%" })

    vim.keymap.set("n", "yo<Space>", ":ToggleMiniTrailspace<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>bw", ":StripWhitespace<CR>", { silent = true })

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.cmd("highlight link MiniTrailspace Search")
            vim.g.minitrailspace_disable = false
        end
    })
end

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
require("ts_context_commentstring").setup({
    enable_autocmd = false,
})

if Plugged("Comment.nvim") then
    -- https://github.com/numToStr/Comment.nvim
    require("Comment").setup({
        padding = true,
        sticky = true,
        toggler = {
            line = "gcc",
            block = "gbc",
        },
        opleader = {
            line = "gc",
            block = "gb",
        },
        mappings = {
            basic = true,
            extra = false,
            extended = false,
        },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
elseif vim.fn.has("nvim-0.10") == 1 then
    vim.get_filetype_option = vim.filetype.get_option
    vim.filetype.get_option = function(filetype, option)
        return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
            or vim.get_filetype_option(filetype, option)
    end
else
    -- https://github.com/echasnovski/mini.comment
    require("mini.comment").setup({
        options = {
            custom_commentstring = function()
                return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
            end,
        },
        mappings = {
            textobject = "gc",
        },
    })
end

-- https://github.com/LudoPinelli/comment-box.nvim
require("comment-box").setup({})

if Plugged("nvim-surround") then
    -- https://github.com/kylechui/nvim-surround
    if vim.g.zero_vim_surround_mapping_style == "sandwich" then
        require("nvim-surround").setup({
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
            },
        })
        vim.keymap.set("n", "sa", "<Plug>(nvim-surround-normal)", { silent = true, remap = true })
        vim.keymap.set("n", "saa", "<Plug>(nvim-surround-normal-cur)", { silent = true, remap = true })
        vim.keymap.set("n", "sA", "<Plug>(nvim-surround-normal-line)", { silent = true, remap = true })
        vim.keymap.set("n", "sAA", "<Plug>(nvim-surround-normal-cur-line)", { silent = true, remap = true })
        vim.keymap.set("x", "sa", "<Plug>(nvim-surround-visual)", { silent = true, remap = true })
        vim.keymap.set("x", "sA", "<Plug>(nvim-surround-visual-line)", { silent = true, remap = true })
        vim.keymap.set("n", "sd", "<Plug>(nvim-surround-delete)", { silent = true, remap = true })
        vim.keymap.set("n", "sr", "<Plug>(nvim-surround-change)", { silent = true, remap = true })
        vim.keymap.set("n", "sR", "<Plug>(nvim-surround-change-line)", { silent = true, remap = true })
    else
        require("nvim-surround").setup({})
    end
elseif vim.g.zero_vim_surround_mapping_style == "sandwich" then
    -- https://github.com/echasnovski/mini.surround
    require("mini.surround").setup({
        mappings = {
            add = "sa", -- Add surrounding in Normal and Visual modes
            delete = "sd", -- Delete surrounding
            find = "sf", -- Find surrounding (to the right)
            find_left = "sF", -- Find surrounding (to the left)
            highlight = "sh", -- Highlight surrounding
            replace = "sr", -- Replace surrounding
            update_n_lines = "sn", -- Update `n_lines`
            suffix_last = "l", -- Suffix to search with "prev" method
            suffix_next = "n", -- Suffix to search with "next" method
        },
    })
else
    -- https://github.com/echasnovski/mini.surround
    require("mini.surround").setup({
        mappings = {
            add = "ys", -- Add surrounding in Normal and Visual modes
            delete = "ds", -- Delete surrounding
            find = "", -- Find surrounding (to the right)
            find_left = "", -- Find surrounding (to the left)
            highlight = "", -- Highlight surrounding
            replace = "cs", -- Replace surrounding
            update_n_lines = "", -- Update `n_lines`
            suffix_last = "l", -- Suffix to search with "prev" method
            suffix_next = "n", -- Suffix to search with "next" method
        },
        search_method = "cover_or_next",
    })

    -- Remap adding surrounding to Visual mode selection
    vim.keymap.del("x", "ys")
    vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

    -- Make special mapping for "add surrounding for line"
    vim.keymap.set("n", "yss", "ys_", { remap = true })
end

if Plugged("tabular") then
    -- https://github.com/godlygeek/tabular
    -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
    -- Tabularize /^[^|]*\zs|/
    -- :help /\zs - Vim’s zero-width ‘pattern start’ search atom
    -- :help /\@<= - Vim also has a ‘positive lookbehind’ assertion
    -- Tim Pope’s insert mode cucumber alignment gist https://gist.github.com/tpope/287147
    vim.keymap.set("x", "<Enter>", ":Tabularize<Space>/")
elseif Plugged("vim-easy-align") then
    -- https://github.com/junegunn/vim-easy-align
    vim.keymap.set("x", "<Enter>", "<Plug>(EasyAlign)", { remap = true })
else
    -- https://github.com/echasnovski/mini.align
    require("mini.align").setup({
        mappings = {
            start = "ga",
            start_with_preview = "gA",
        },
    })
    vim.keymap.set("x", "<Enter>", "gA", { remap = true })
end

if Plugged("coerce.nvim") then
    -- https://github.com/gregorias/coerce.nvim
    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            local case = require("coerce.case")
            local selector = require("coerce.selector")
            local transformer = require("coerce.transformer")

            require("coerce").setup({
                cases = {
                    { keymap = "m", case = case.to_pascal_case, description = "PascalCase" },
                    { keymap = "p", case = case.to_pascal_case, description = "PascalCase" },
                    { keymap = "c", case = case.to_camel_case, description = "camelCase" },
                    { keymap = "_", case = case.to_snake_case, description = "snake_case" },
                    { keymap = "s", case = case.to_snake_case, description = "snake_case" },
                    { keymap = "u", case = case.to_upper_case, description = "UPPER_CASE" },
                    { keymap = "U", case = case.to_upper_case, description = "UPPER_CASE" },
                    { keymap = "-", case = case.to_kebab_case, description = "kebab-case" },
                    { keymap = "k", case = case.to_kebab_case, description = "kebab-case" },
                    { keymap = "n", case = case.to_numerical_contraction, description = "numeronym (n7m)" },
                    { keymap = ".", case = case.to_dot_case, description = "dot.case" },
                    { keymap = "/", case = case.to_path_case, description = "path/case" },
                },
                modes = {
                    {
                        vim_mode = "n",
                        keymap_prefix = "cr",
                        selector = selector.select_current_word,
                        transformer = function(selected_region, apply)
                            return transformer.transform_lsp_rename_with_failover(
                                selected_region,
                                apply,
                                transformer.transform_local
                            )
                        end,
                    },
                    {
                        vim_mode = "v",
                        keymap_prefix = "ga",
                        selector = selector.select_current_visual_selection,
                        transformer = transformer.transform_local,
                    },
                },
            })
        end,
    })
end

if Plugged("vim-caser") then
    -- https://github.com/arthurxavierx/vim-caser
    vimg.g.caser_no_mappings = 1

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.keymap.set("o", "<Plug>CaserCword", "iw")

            vim.keymap.set("n", "crm", "<Plug>CaserMixedCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crp", "<Plug>CaserMixedCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crc", "<Plug>CaserCamelCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "cr_", "<Plug>CaserSnakeCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crs", "<Plug>CaserSnakeCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "cru", "<Plug>CaserUpperCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crU", "<Plug>CaserUpperCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crt", "<Plug>CaserTitleCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crS", "<Plug>CaserSentenceCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "cr<Space>", "<Plug>CaserSpaceCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "cr-", "<Plug>CaserKebabCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crk", "<Plug>CaserKebabCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "crK", "<Plug>CaserTitleKebabCase<Plug>CaserCword", { remap = true })
            vim.keymap.set("n", "cr.", "<Plug>CaserDotCase<Plug>CaserCword", { remap = true })

            vim.keymap.set("n", "gam", "<Plug>CaserVMixedCase", { remap = true })
            vim.keymap.set("n", "gap", "<Plug>CaserVMixedCase", { remap = true })
            vim.keymap.set("n", "gac", "<Plug>CaserVCamelCase", { remap = true })
            vim.keymap.set("n", "ga_", "<Plug>CaserVSnakeCase", { remap = true })
            vim.keymap.set("n", "gas", "<Plug>CaserVSnakeCase", { remap = true })
            vim.keymap.set("n", "gau", "<Plug>CaserVUpperCase", { remap = true })
            vim.keymap.set("n", "gaU", "<Plug>CaserVUpperCase", { remap = true })
            vim.keymap.set("n", "gat", "<Plug>CaserVTitleCase", { remap = true })
            vim.keymap.set("n", "gaS", "<Plug>CaserVSentenceCase", { remap = true })
            vim.keymap.set("n", "ga<Space>", "<Plug>VCaserSpaceCase", { remap = true })
            vim.keymap.set("n", "ga-", "<Plug>CaserVKebabCase", { remap = true })
            vim.keymap.set("n", "gak", "<Plug>CaserVKebabCase", { remap = true })
            vim.keymap.set("n", "gaK", "<Plug>CaserVTitleKebabCase", { remap = true })
            vim.keymap.set("n", "ga.", "<Plug>CaserVDotCase", { remap = true })
        end,
    })
end

if Plugged("text-case.nvim") then
    -- https://github.com/johmsalas/text-case.nvim
    require("textcase").setup({
        default_keymappings_enabled = false,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            local mappings = {
                { key = "m", fn = "to_pascal_case" },
                { key = "p", fn = "to_pascal_case" },
                { key = "c", fn = "to_camel_case" },
                { key = "_", fn = "to_snake_case" },
                { key = "s", fn = "to_snake_case" },
                { key = "u", fn = "to_constant_case" },
                { key = "U", fn = "to_constant_case" },
                { key = "t", fn = "to_title_case" },
                { key = "<Space>", fn = "to_phrase_case" },
                { key = "-", fn = "to_dash_case" },
                { key = "k", fn = "to_dash_case" },
                { key = "K", fn = "to_title_dash_case" },
                { key = ".", fn = "to_dot_case" },
                { key = "/", fn = "to_path_case" },
            }

            for _, mapping in ipairs(mappings) do
                vim.keymap.set("n", "cr" .. mapping.key, function()
                    require("textcase").current_word(mapping.fn)
                end, {})
                vim.keymap.set("x", "ga" .. mapping.key, function()
                    require("textcase").quick_replace(mapping.fn)
                end, {})
            end
        end,
    })
end

-- Autocompletion plugins should define these functions to
-- integrate with vim-visual-multi plugin
vim.cmd([[
function! MultipleCursorsStart() abort
endfunction

function! MultipleCursorsExit() abort
endfunction
]])

-- https://github.com/mg979/vim-visual-multi
vim.g.VM_custom_remaps = {
    ["<C-p>"] = "N",
    ["<C-x>"] = "q",
    ["<C-c>"] = "<Esc>",
}

vim.keymap.set("n", "<C-n>", "<Plug>(VM-Find-Under)", { nowait = true, remap = true })
vim.keymap.set("x", "<C-n>", "<Plug>(VM-Find-Subword-Under)", { nowait = true, remap = true })

vim.api.nvim_create_autocmd("User", {
    group = "MyAutoCmd",
    pattern = "visual_multi_start",
    callback = function()
        vim.b.minipairs_disable = true
        local has_autopairs, autopairs = pcall(require, "nvim-autopairs")
        if has_autopairs then
            autopairs.disable()
        end
        vim.fn["MultipleCursorsStart"]()
    end,
})

vim.api.nvim_create_autocmd("User", {
    group = "MyAutoCmd",
    pattern = "visual_multi_exit",
    callback = function()
        vim.b.minipairs_disable = vim.g.minipairs_disable or false
        local has_autopairs, autopairs = pcall(require, "nvim-autopairs")
        if has_autopairs then
            autopairs.enable()
        end
        vim.fn["MultipleCursorsExit"]()
    end,
})

vim.api.nvim_create_autocmd("User", {
    group = "MyAutoCmd",
    pattern = "visual_multi_mappings",
    callback = function()
        vim.keymap.set("i", "<C-c>", "<Esc><Esc>", { nowait = true, buffer = true, remap = true })
    end,
})

-- https://github.com/chrisbra/NrrwRgn
vim.g.nrrw_topbot_leftright = "belowright"
vim.g.nrrw_rgn_nomap_nr = 1
vim.g.nrrw_rgn_nomap_Nr = 1
vim.g.nrrw_rgn_resize_window = "relative"
vim.g.nrrw_rgn_rel_min = 50
vim.g.nrrw_rgn_rel_max = 50

vim.keymap.set("n", "<Leader>bn", function()
    return vim.fn.exists(":WR") == 2 and ":WR!<CR>" or "vip<Plug>NrrwrgnDo"
end, { remap = true, silent = true, expr = true })
vim.keymap.set("x", "<Leader>bn", function()
    return vim.fn.exists(":WR") == 2 and "<Esc>:WR!<CR>" or "<Plug>NrrwrgnDo"
end, { remap = true, silent = true, expr = true })

vim.keymap.set({ "n", "x" }, "<Leader>n", "<Leader>bn", { remap = true })

if Plugged("vim-airline") then
    -- TODO: Hack for the case NrrwRgn is being lazyloaded
    vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "NrrwRgn",
        callback = function()
            vim.fn["airline#extensions#load"]()
        end,
    })
elseif Plugged("lightline.vim") then
    -- TODO: Find a better way to setup NrrwRgn buffer
    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.b.nrrw_aucmd_create = "call lightline#update()"
        end,
    })
elseif Plugged("vim-crystalline") then
    -- TODO: Find a better way to setup NrrwRgn buffer
    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            vim.b.nrrw_aucmd_create = "call crystalline#UpdateStatusline(win_getid())"
        end,
    })
end

-- https://github.com/echasnovski/mini.operators
require("mini.operators").setup({
    evaluate = {
        prefix = "ca",
    },
    exchange = {
        prefix = "cx",
    },
    multiply = {
        prefix = "cm",
    },
    replace = {
        prefix = "gr",
    },
    sort = {
        prefix = "cz",
    },
})

-- https://github.com/andrewradev/switch.vim
vim.g.switch_mapping = "+"
vim.g.switch_reverse_mapping = "_"

vim.keymap.set("n", "+", "<Plug>(Switch)", { remap = true })
vim.keymap.set("n", "_", "<Plug>(SwitchReverse)", { remap = true })

if Plugged("splitjoin.vim") then
    -- https://github.com/AndrewRadev/splitjoin.vim
    vim.g.splitjoin_split_mapping = "gS"
    vim.g.splitjoin_join_mapping = "gJ"

    vim.keymap.set("n", "gS", "<Plug>SplitjoinSplit", { remap = true })
    vim.keymap.set("n", "gJ", "<Plug>SplitjoinJoin", { remap = true })
else
    -- https://github.com/echasnovski/mini.splitjoin
    require("mini.splitjoin").setup({
        mappings = {
            toggle = "gM",
            split = "gS",
            join = "gJ",
        },
    })
end

if Plugged("git-conflict.nvim") then
    -- https://github.com/akinsho/git-conflict.nvim
    require("git-conflict").setup({})
end

-- https://github.com/AndrewRadev/sideways.vim
if Plugged("sideways.vim") then
    vim.g.sideways_search_timeout = 50

    vim.keymap.set({ "x", "o" }, "aa", "<Plug>SidewaysArgumentTextobjA", { remap = true, silent = true })
    vim.keymap.set({ "x", "o" }, "ia", "<Plug>SidewaysArgumentTextobjI", { remap = true, silent = true })

    vim.keymap.set("n", "cai", "<Plug>SidewaysArgumentInsertBefore", { remap = true, silent = true })
    vim.keymap.set("n", "caa", "<Plug>SidewaysArgumentAppendAfter", { remap = true, silent = true })
    vim.keymap.set("n", "cab", "<Plug>SidewaysArgumentInsertFirst", { remap = true, silent = true })
    vim.keymap.set("n", "cae", "<Plug>SidewaysArgumentAppendLast", { remap = true, silent = true })

    vim.keymap.set("n", "cah", "<Plug>SidewaysLeft", { remap = true, silent = true })
    vim.keymap.set("n", "cal", "<Plug>SidewaysRight", { remap = true, silent = true })

    vim.keymap.set("n", "cak", "<Cmd>SidewaysJumpLeft<CR>", { silent = true })
    vim.keymap.set("n", "caj", "<Cmd>SidewaysJumpRight<CR>", { silent = true })
end

-- https://github.com/echasnovski/mini.ai
if Plugged("nvim-treesitter") then
    require("mini.ai").setup({
        custom_textobjects = {
            o = require("mini.ai").gen_spec.treesitter({
                a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            k = require("mini.ai").gen_spec.treesitter({
                a = { "@parameter.outer", "@call.outer" },
                i = { "@parameter.inner", "@call.inner" },
            }, {}),
            f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
            d = require("mini.ai").gen_spec.treesitter({
                a = { "@function.outer", "@class.outer" },
                i = { "@function.inner", "@class.inner" },
            }, {}),
            C = require("mini.ai").gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
            t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
        n_lines = 500,
    })
else
    require("mini.ai").setup({
        custom_textobjects = {
            t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
        n_lines = 500,
    })
end

if Plugged("vim-matchup") then
    -- https://github.com/andymass/vim-matchup
    require("match-up").setup({
        matchparen = {
            enabled = 1,
            hi_surround_always = vim.g.matchup_matchparen_hi_surround_always or 1,
            hi_background = vim.g.matchup_matchparen_hi_background or 0,
            deferred = 1,
            deferred_show_delay = 100, -- 50
            deferred_hide_delay = 500, -- 700
            offscreen = vim.g.matchup_matchparen_offscreen or vim.empty_dict(), -- { method = "popup" }
            pumvisible = 0,
            nomode = "i",
        },
    })

    vim.g.matchup_matchpref = {
        html = { tagnameonly = 1 },
        eruby = { tagnameonly = 1 },
    }

    -- Use mappings that are easier to reach
    vim.keymap.set({ "x", "o" }, "io", "i%", { remap = true })
    vim.keymap.set({ "x", "o" }, "ao", "a%", { remap = true })
    vim.keymap.set({ "n", "x", "o" }, "z<Space>", "z%", { remap = true })

    vim.api.nvim_create_user_command("ShowMatchupInfo", function()
        vim.cmd("MatchupWhereAmI?")
        local current = vim.g.matchup_matchparen_hi_background
        pcall(function()
            vim.g.matchup_matchparen_hi_background = 2
            vim.fn["matchup#matchparen#highlight_surrounding"]()
        end)
        vim.g.matchup_matchparen_hi_background = current
    end, {})

    vim.keymap.set("n", "<Leader>H", "<Cmd>ShowMatchupInfo<CR>", { silent = true })
end

if Plugged("indentmini.nvim") then
    -- https://github.com/nvimdev/indentmini.nvim
    vim.g.indentmini_enabled = true
    vim.g.indentmini_char = "│"
    -- vim.g.indentmini_char = "┊"
    -- vim.g.indentmini_char = "┆"

    require("indentmini").setup({
        char = vim.g.indentmini_enabled and vim.g.indentmini_char or "",
        exclude = {
            "fzf",
            "help",
            "alpha",
            "dashboard",
            "ministarter",
            "NvimTree",
            "neo-tree",
            "carbon.explorer",
            "mason",
            "notify",
        },
    })

    vim.api.nvim_create_user_command("ToggleIndentMini", function()
        vim.g.indentmini_enabled = not vim.g.indentmini_enabled
        require("indentmini").setup({
            char = vim.g.indentmini_enabled and vim.g.indentmini_char or "",
        })
    end, {})

    vim.keymap.set("n", "<Leader>bi", "<Cmd>ToggleIndentMini<CR>", { silent = true })
    vim.keymap.set("v", "<Leader>bi", "<Esc><Leader>bigv", { remap = true })

    vim.api.nvim_create_autocmd({ "VimEnter", "Colorscheme" }, {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            -- vim.cmd("highlight! link IndentLine IblIndent")
            -- vim.cmd("highlight! link IndentLineCurrent IblScope")
            vim.cmd("highlight! link IndentLine Comment")
            vim.cmd("highlight! link IndentLineCurrent Normal")
        end,
    })
end

if Plugged("indent-blankline.nvim") then
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    require("ibl").setup({
        enabled = false,
        indent = {
            char = vim.list_extend({ "│" }, vim.fn.split(vim.fn["repeat"]("┊", 20), "\\zs")),
        },
        scope = { enabled = false },
        whitespace = { remove_blankline_trail = false },
        exclude = {
            filetypes = {
                "fzf",
                "help",
                "alpha",
                "dashboard",
                "ministarter",
                "NvimTree",
                "neo-tree",
                "carbon.explorer",
                "mason",
                "notify",
            },
            buftypes = { "terminal", "nofile" },
        },
    })

    vim.keymap.set("n", "<Leader>bi", "<Cmd>IBLToggle<CR>", { silent = true })
    vim.keymap.set("v", "<Leader>bi", "<Esc><Leader>bigv", { remap = true })
end

if Enabled("indent-guides", "scope") then
    -- https://github.com/echasnovski/mini.indentscope
    vim.g.miniindentscope_disable = false

    require("mini.indentscope").setup({
        symbol = "│",
        -- symbol = "┊",
        options = { try_as_border = true },
        draw = {
            -- animation = require("mini.indentscope").gen_animation.none(),
            animation = require("mini.indentscope").gen_animation.linear({ duration = 100, unit = "total" }),
        },
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = {
            "fzf",
            "help",
            "alpha",
            "dashboard",
            "ministarter",
            "NvimTree",
            "neo-tree",
            "carbon.explorer",
            "mason",
            "notify",
        },
        callback = function()
            vim.b.miniindentscope_disable = true
        end,
    })

    vim.api.nvim_create_user_command("ToggleIndentScope", function(args)
        if args.bang then
            vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable
        else
            vim.b.miniindentscope_disable = vim.b.miniindentscope_disable ~= nil and vim.b.miniindentscope_disable
                or vim.g.miniindentscope_disable
            vim.b.miniindentscope_disable = not vim.b.miniindentscope_disable
        end
    end, { bang = true })

    vim.keymap.set("n", "<Leader>bi", "<Cmd>ToggleIndentMini<CR>", { silent = true })
    vim.keymap.set("v", "<Leader>bi", "<Esc><Leader>bigv", { remap = true })
end

-- https://github.com/jrudess/vim-foldtext
-- https://github.com/phongnh/vim-foldtext
if vim.fn.has("multi_byte") == 1 then
    vim.g.FoldText_placeholder = "❲⋯❳" -- '❬…❭'
    vim.g.FoldText_line = "␊"
    vim.g.FoldText_whole = "◉"
    vim.g.FoldText_level = "␌"
    vim.g.FoldText_multiplication = "⁝"
    vim.g.FoldText_expansion = " · " -- ' ․ '
else
    vim.g.FoldText_placeholder = "<!>"
    vim.g.FoldText_expansion = " . "
end

if Plugged("pretty-fold.nvim") then
    -- https://github.com/phongnh/pretty-fold.nvim
    require("pretty-fold").setup()
end

if Plugged("true-zen.nvim") then
    -- https://github.com/pocco81/true-zen.nvim
    require("true-zen").setup({
        modes = {
            ataraxis = {
                backdrop = 0,
                quit_untoggles = false,
                minimum_writing_area = {
                    width = 70,
                    height = 40,
                },
                padding = {
                    left = 50,
                    right = 50,
                    top = 3,
                    bottom = 3,
                },
                callbacks = {
                    open_pre = function()
                        vim.o.scrolloff = 999
                        vim.o.cursorline = true
                    end,
                    close_pre = function()
                        vim.o.scrolloff = 1
                        vim.o.cursorline = false
                        vim.o.number = false
                        vim.o.relativenumber = false
                    end,
                },
            },
            minimalist = {
                callbacks = {
                    open_pre = function()
                        vim.o.showmode = true
                        vim.o.showtabline = 0
                        vim.o.cmdheight = 1
                    end,
                    close_pre = function()
                        vim.o.showmode = false
                        vim.o.showtabline = 1
                        vim.o.cmdheight = 2
                        vim.o.number = false
                        vim.o.relativenumber = false
                    end,
                },
            },
            narrow = {
                folds_style = "invisible", -- "informative" | "invisible"
                run_ataraxis = false,
            },
        },
        integrations = {
            twilight = false,
            lualine = Plugged("lualine.nvim"),
        },
    })

    vim.keymap.set("n", "<Leader><Enter>", "<Cmd>TZAtaraxis<CR>", { silent = true })
    vim.keymap.set("v", "<Leader><Enter>", "<Esc><Leader><Enter>gv", { remap = true })

    -- <C-w><C-m>
    vim.keymap.set("n", "<C-w><Enter>", "<Cmd>TZAtaraxis<CR>", { silent = true })
    vim.keymap.set("v", "<C-w><Enter>", "<Esc><C-w><Enter>gv", { remap = true })

    -- <Leader>n
    vim.keymap.set({ "n", "x" }, "<Leader>n", ":TZNarrow<CR>", { silent = true })
end

if Plugged("zen-mode.nvim") then
    -- https://github.com/folke/zen-mode.nvim
    vim.g.zen_mode_height = vim.g.zen_mode_height or 0.85

    local cycle_zen_window_mode = function(direction)
        return function()
            local zen_mode = require("zen-mode")
            local options = require("zen-mode.config").options
            options.current_window_mode = options.current_window_mode + direction
            if options.current_window_mode > #options.window_modes then
                options.current_window_mode = 1
            elseif options.current_window_mode < 1 then
                options.current_window_mode = #options.window_modes
            end
            local window_mode = options.window_modes[options.current_window_mode]
            zen_mode.close()
            zen_mode.open({ window = window_mode })
            vim.print(string.format("ZenMode: %sx%s", window_mode.width, window_mode.height))
        end
    end

    require("zen-mode").setup({
        current_window_mode = 1,
        window_modes = {
            { backdrop = 1, width = 0.7, height = vim.g.zen_mode_height },
            { backdrop = 1, width = 150, height = vim.g.zen_mode_height },
            { backdrop = 1, width = 120, height = vim.g.zen_mode_height },
            { backdrop = 1, width = 100, height = vim.g.zen_mode_height },
            { backdrop = 1, width = 80, height = vim.g.zen_mode_height },
        },
        window = {
            backdrop = 1,
            width = 0.7,
            height = 0.85,
        },
        plugins = {
            options = {
                enabled = true,
                showmode = true,
            },
            twilight = { enabled = false },
            gitsigns = { enabled = Plugged("gitsigns.nvim") },
        },
        on_open = function(win)
            vim.wo[win].scrolloff = 999
            vim.wo[win].cursorline = true
            vim.keymap.set("n", "<C-w>m", cycle_zen_window_mode(1), { silent = true })
            vim.keymap.set("n", "<C-w>M", cycle_zen_window_mode(-1), { silent = true })
        end,
        on_close = function()
            vim.keymap.del("n", "<C-w>m")
            vim.keymap.del("n", "<C-w>M")
        end,
    })

    vim.keymap.set("n", "<Leader><Enter>", "<Cmd>ZenMode<CR>", { silent = true })
    vim.keymap.set("v", "<Leader><Enter>", "<Esc><Leader><Enter>gv", { remap = true })

    -- <C-w><C-m>
    vim.keymap.set("n", "<C-w><Enter>", "<Cmd>ZenMode<CR>", { silent = true })
    vim.keymap.set("v", "<C-w><Enter>", "<Esc><C-w><Enter>gv", { remap = true })
end

-- https://github.com/folke/twilight.nvim
require("twilight").setup({
    dimming = {
        alpha = vim.g.twilight_dimming_alpha or 0.25,
        inactive = false,
    },
    context = 10,
    treesitter = Plugged("nvim-treesitter"),
    exclude = {},
})

vim.keymap.set({ "n", "x" }, "<Leader>L", "<Cmd>Twilight<CR>", { silent = true })

if Plugged("undotree") then
    -- https://github.com/mbbill/undotree
    vim.g.undotree_SplitWidth = 35
    vim.g.undotree_WindowLayout = 4
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_ShortIndicators = 1

    vim.keymap.set("n", "<Leader>U", "<Cmd>UndotreeToggle<CR>", { silent = true })
end

if Plugged("vim-gutentags") then
    -- https://github.com/ludovicchabant/vim-gutentags
    -- Enable only ctags module
    vim.g.gutentags_modules = { "ctags" }

    -- Generate datebases in my cache directory, prevent gtags files polluting my project
    vim.g.gutentags_cache_dir = vim.fn.expand("~/.cache/vim/gutentags")
    vim.g.gutentags_ctags_executable = vim.g.zero_vim_ctags_bin

    -- Universal Ctags
    if vim.fn.filereadable(vim.g.zero_vim_ctags_ignore) == 1 then
        vim.g.gutentags_ctags_exclude = { "@" .. vim.g.zero_vim_ctags_ignore }
    end

    -- Ignored directories
    vim.g.gutentags_exclude_project_root = {
        vim.fn.expand("~/.vim/plugged"),
        vim.fn.expand("~/src"),
        vim.env.HOME,
        "/etc",
        "/opt",
        "/usr",
        "/var",
    }

    -- Ignored file types
    vim.g.gutentags_exclude_filetypes = {
        "html",
        "xml",
        "css",
        "sass",
        "scss",
        "coffee",
        "less",
        "eruby",
        "haml",
        "hamlc",
        "text",
        "git",
        "gitcommit",
        "gitrebase",
        "fugitiveblame",
    }

    -- Define advanced commands
    vim.g.gutentags_define_advanced_commands = 1
end

if Plugged("tagbar") then
    -- https://github.com/preservim/tagbar
    vim.g.tagbar_sort = 0
    vim.g.tagbar_autofocus = 1
    vim.g.tagbar_autoclose = 0
    vim.g.tagbar_iconchars = { "▶", "▼" }
    vim.g.tagbar_ctags_bin = vim.g.zero_vim_ctags_bin
    vim.g.tagbar_universal_ctags = vim.g.zero_vim_universal_ctags

    vim.keymap.set("n", "<Leader>T", "<Cmd>TagbarToggle<CR>", { silent = true })
end

if Plugged("nvim-treesitter") then
    -- https://github.com/nvim-treesitter/nvim-treesitter
    -- stylua: ignore start
    vim.g.zero_vim_treesitter_ensure_installed = vim.g.zero_vim_treesitter_ensure_installed or {
        "bash",
        "c", "comment", "cpp", "css", "csv",
        "dart", "diff", "dockerfile",
        "eex", "elm", "elixir", "erlang",
        "fish",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
        "go", "gomod", "gosum", "gowork", "graphql",
        "hcl", "heex", "html", "http",
        "javascript", "jq", "jsdoc", "json", "jsonc", "json5",
        "llvm", "lua", "luadoc", "luap",
        "make", "markdown", "markdown_inline",
        "ninja", "nix",
        "psv", "puppet", "python",
        "org",
        "query",
        "regex", "rst", "ruby", "rust",
        "scss", "sql", "styled",
        "terraform", "todotxt", "toml", "tsv", "tsx", "typescript",
        "vim", "vimdoc", "vue",
        "xml",
        "yaml",
        "zig",
    }
    -- stylua: ignore end
    vim.g.zero_vim_treesitter_highlight_disabled = vim.g.zero_vim_treesitter_highlight_disabled or {}

    require("nvim-treesitter.configs").setup({
        ensure_installed = vim.g.zero_vim_treesitter_ensure_installed,
        highlight = {
            enable = true,
            disable = function(lang, buf)
                if vim.b[buf].treesitter_highlight_disabled ~= nil then
                    return vim.b[buf].treesitter_highlight_disabled
                end
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > vim.g.zero_vim_large_file then
                    vim.b[buf].treesitter_highlight_disabled = true
                else
                    vim.b[buf].treesitter_highlight_disabled =
                        vim.tbl_contains(vim.g.zero_vim_treesitter_highlight_disabled, lang)
                end
                return vim.b[buf].treesitter_highlight_disabled
            end,
            additional_vim_regex_highlighting = { "org" },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "+",
                node_incremental = "+",
                node_decremental = "_",
                scope_incremental = "^",
            },
        },
        indent = {
            enable = true,
            disable = vim.g.zero_vim_treesitter_indent_disabled or {},
        },
    })

    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    require("nvim-treesitter.configs").setup({
        textobjects = {
            move = {
                enable = true,
                goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
                goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
                goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
                goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
            },
        },
    })

    -- When in diff mode, we want to use the default vim text objects c & C instead of the treesitter ones.
    local setup_move_mappings = function()
        local move = require("nvim-treesitter.textobjects.move")
        local configs = require("nvim-treesitter.configs")
        for name, fn in pairs(move) do
            if name:find("goto") == 1 then
                move[name] = function(q, ...)
                    if vim.wo.diff then
                        local config = configs.get_module("textobjects.move")[name]
                        for key, query in pairs(config or {}) do
                            if q == query and key:find("[%]%[][cC]") then
                                vim.cmd("normal! " .. key)
                                return
                            end
                        end
                    end
                    return fn(q, ...)
                end
            end
        end
    end

    setup_move_mappings()

    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    if Plugged("nvim-treesitter-context") then
        require("treesitter-context").setup({
            enabled = true,
            mode = "cursor",
            max_lines = 3,
        })
    end

    if Plugged("vim-matchup") then
        -- https://github.com/andymass/vim-matchup
        require("nvim-treesitter.configs").setup({
            matchup = {
                enable = true,
                disable = vim.g.zero_vim_treesitter_matchup_disabled or {},
            },
        })
    end

    vim.keymap.set("n", "<Leader>bh", function()
        vim.b.treesitter_highlight_disabled = vim.b.treesitter_highlight_disabled or false
        vim.cmd("TSBufToggle highlight")
        vim.b.treesitter_highlight_disabled = not vim.b.treesitter_highlight_disabled
    end, { silent = true })
end

if Plugged("treesj") then
    -- https://github.com/Wansmer/treesj
    require("treesj").setup({
        use_default_keymaps = false,
    })

    vim.api.nvim_create_user_command("TSJRecursiveToggle", function()
        require("treesj").toggle({ split = { recursive = true } })
    end, {})
end

if Plugged("nvim-autopairs") then
    -- https://github.com/windwp/nvim-autopairs
    require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
        map_cr = true,
    })
elseif Enabled("ultimate-autopair.nvim") then
    -- https://github.com/altermo/ultimate-autopair.nvim
    require("ultimate-autopair").setup({})
elseif Enabled("auto-pairs") then
    -- https://github.com/echasnovski/mini.pairs
    vim.g.minipairs_disable = false
    require("mini.pairs").setup()
end

-- LSP Settings
vim.g.zero_vim_lsp_diagnostics = vim.g.zero_vim_lsp_diagnostics or 0
vim.g.zero_vim_lsp_highlight_references = vim.g.zero_vim_lsp_highlight_references or 0

-- Signs
vim.g.zero_vim_lsp_signs = vim.tbl_extend("force", {
    error = "E>",
    warning = "W>",
    information = "I>",
    hint = "H>",
    message = "M>",
    virtual_text = "<!>",
}, vim.g.zero_vim_lsp_signs or vim.empty_dict())

-- Available Language Servers
vim.g.zero_vim_available_language_servers = {
    ["bash-language-server"] = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
    },
    ccls = {
        cmd = { "ccls" },
        filetypes = { "c", "cpp" },
    },
    clangd = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp" },
    },
    crystalline = {
        cmd = { "crystalline" },
        filetypes = { "crystal" },
    },
    deno = {
        cmd = { "deno", "lsp" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    ["docker-langserver"] = {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
    },
    ["efm-langserver"] = {
        cmd = { "efm-langserver" },
        filetypes = { "*" },
    },
    ["elixir-ls"] = {
        cmd = { "elixir-ls" },
        filetypes = { "elixir" },
        root_markers = { "mix.exs" },
    },
    ["erlang-ls"] = {
        cmd = { "erlang-ls" },
        filetypes = { "erlang" },
        root_markers = { "rebar.config" },
    },
    flow = {
        cmd = { "flow", "lsp", "--from", "vim" },
        filetypes = { "javascript", "javascriptreact" },
    },
    ["golangci-lint-langserver"] = {
        cmd = { "golangci-lint-langserver" },
        filetypes = { "go" },
    },
    gopls = {
        cmd = { "gopls" },
        filetypes = { "go" },
    },
    ["graphql-lsp"] = {
        cmd = { "graphql-lsp", "server", "--method", "stream" },
        filetypes = { "graphql" },
    },
    ["lua-language-server"] = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
    },
    pylsp = {
        cmd = { "pylsp" },
        filetypes = { "python" },
    },
    ["pyright-langserver"] = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
    },
    ["ruby-lsp"] = {
        cmd = { "ruby-lsp" },
        filetypes = { "ruby" },
        initialization_options = {
            experimentalFeaturesEnabled = "false",
            enabledFeatures = {
                "codeActions",
                "codeLens",
                "completion",
                "definition",
                "diagnostics",
                "documentHighlights",
                "documentLink",
                "documentSymbols",
                "foldingRanges",
                "formatting",
                "hover",
                "inlayHint",
                "onTypeFormatting",
                "selectionRanges",
                "semanticHighlighting",
            },
            formatter = "auto",
        },
        root_markers = { "Gemfile" },
    },
    ruby_language_server = {
        cmd = { "ruby_language_server" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile" },
    },
    ["rust-analyzer"] = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
    },
    scry = {
        cmd = { "scry" },
        filetypes = { "crystal" },
    },
    solargraph = {
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        initialization_options = { diagnostics = true },
        root_markers = { "Gemfile" },
    },
    sorbet = {
        cmd = { "srb", "tc", "--lsp" },
        filetypes = { "ruby" },
        root_markers = { "Gemfile" },
    },
    ["terraform-ls"] = {
        cmd = { "terraform-ls", "serve" },
        filetypes = { "terraform" },
    },
    ["terraform-lsp"] = {
        cmd = { "terraform-lsp" },
        filetypes = { "terraform" },
    },
    ["typescript-language-server"] = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    ["vim-language-server"] = {
        cmd = { "vim-language-server", "--stdio" },
        filetypes = { "vim" },
    },
}

vim.g.zero_vim_language_servers = vim.tbl_extend(
    "force",
    vim.g.zero_vim_available_language_servers,
    vim.g.zero_vim_language_servers or vim.empty_dict()
)

local merge_language_servers = function()
    local servers = vim.g.zero_vim_language_servers
    for name, server in pairs(vim.g.zero_vim_language_servers) do
        if vim.fn.has_key(vim.g.zero_vim_available_language_servers, name) == 1 then
            local default = vim.g.zero_vim_available_language_servers[name]
            if type(server) == "table" and vim.islist(server) then
                servers[name] = vim.tbl_extend("force", default, { cmd = server })
            elseif type(server) == "table" then
                servers[name] = vim.tbl_extend("force", default, server)
            elseif type(server) == "string" then
                servers[name] = vim.tbl_extend("force", default, { cmd = vim.fn.split(server) })
            end
        end
    end
    vim.g.zero_vim_language_servers = servers
end

merge_language_servers()

-- Enabled Language Servers
vim.g.zero_vim_enabled_language_servers = vim.tbl_filter(function(name)
    return vim.fn.has_key(vim.g.zero_vim_language_servers, name) == 1
end, vim.g.zero_vim_enabled_language_servers or {})

if Plugged("nvim-lspconfig") then
    -- https://github.com/williamboman/mason-lspconfig.nvim
    require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
    })

    -- https://github.com/neovim/nvim-lspconfig
    -- Signs
    vim.fn.sign_define("DiagnosticSignError", { text = vim.g.zero_vim_lsp_signs.error, texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = vim.g.zero_vim_lsp_signs.warning, texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define(
        "DiagnosticSignInfo",
        { text = vim.g.zero_vim_lsp_signs.information, texthl = "DiagnosticSignInfo" }
    )
    vim.fn.sign_define("DiagnosticSignHint", { text = vim.g.zero_vim_lsp_signs.hint, texthl = "DiagnosticSignHint" })

    -- Diagnostic Config
    if vim.g.zero_vim_lsp_diagnostics == 1 then
        vim.diagnostic.config({
            underline = true,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                -- severity = { min = vim.diagnostic.severity.WARN },
                prefix = vim.g.zero_vim_lsp_signs.virtual_text,
            },
            signs = true,
            update_in_insert = false,
            severity_sort = vim.g.zero_vim_lsp_diagnostics_severity_sort or false,
        })
    elseif type(vim.diagnostic.disable) == "function" then
        vim.diagnostic.disable()
    else
        vim.diagnostic.config(false)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
        group = "MyAutoCmd",
        callback = function(evt)
            vim.api.nvim_buf_set_option(evt.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

            -- Mappings
            local opts = { buffer = evt.buf, silent = true }
            vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<Leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "g<CR>", vim.lsp.buf.code_action, opts)
            vim.keymap.set("x", "g<CR>", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "g=", vim.lsp.buf.format, opts)
            vim.keymap.set("x", "g=", vim.lsp.buf.format, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "g]", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "g[", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "gm", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "go", vim.lsp.buf.document_symbol, opts)
            vim.keymap.set("n", "gO", vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "g{", vim.lsp.buf.incoming_calls, opts)
            vim.keymap.set("n", "g}", vim.lsp.buf.outgoing_calls, opts)
            vim.keymap.set("n", "gL", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "L", function()
                vim.diagnostic.set_loclist({ severity_limit = "Warning" })
            end, opts)
            vim.keymap.set("n", "[g", function()
                vim.diagnostic.goto_prev({ severity_limit = "Warning" })
            end, opts)
            vim.keymap.set("n", "]g", function()
                vim.diagnostic.goto_next({ severity_limit = "Warning" })
            end, opts)
            vim.keymap.set("n", "[k", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]k", vim.diagnostic.goto_next, opts)
        end,
    })

    -- ruby-lsp: textDocument/diagnostic support until 0.10.0 is released
    _timers = {}

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            if vim.tbl_isempty(vim.g.zero_vim_enabled_language_servers) then
                return
            end

            local make_client_capabilities = function()
                -- https://github.com/hrsh7th/cmp-nvim-lsp
                local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

                -- https://github.com/ms-jpq/coq_nvim
                local has_coq, coq = pcall(require, "coq")

                -- https://github.com/nvimdev/epo.nvim
                local has_epo, epo = pcall(require, "epo")

                if has_cmp_nvim_lsp then
                    return cmp_nvim_lsp.default_capabilities()
                elseif has_coq then
                    return coq.lsp_ensure_capabilities().capabilities
                elseif has_epo then
                    return vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), epo.register_cap())
                else
                    -- https://github.com/hrsh7th/vim-vsnip/issues/140
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true
                    capabilities.textDocument.completion.completionItem.preselectSupport = true
                    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
                    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
                    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
                    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
                    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
                    capabilities.textDocument.completion.completionItem.resolveSupport = {
                        properties = {
                            "documentation",
                            "detail",
                            "additionalTextEdits",
                        },
                    }
                    return capabilities
                end
            end

            local capabilities = make_client_capabilities()

            local lspconfig = require("lspconfig")
            local configs = require("lspconfig/configs")

            -- ruby-lsp: textDocument/diagnostic support until 0.10.0 is released
            local setup_diagnostics = function(client, buffer)
                if require("vim.lsp.diagnostic")._enable then
                    return
                end

                local diagnostic_handler = function()
                    local params = vim.lsp.util.make_text_document_params(buffer)
                    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
                        if err then
                            local err_msg = string.format("Diagnostics Error: %s", vim.inspect(err))
                            vim.lsp.log.error(err_msg)
                        end

                        local diagnostic_items = {}
                        if result then
                            diagnostic_items = result.items
                        end

                        vim.lsp.diagnostic.on_publish_diagnostics(
                            nil,
                            vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
                            { client_id = client.id }
                        )
                    end)
                end

                diagnostic_handler() -- to request diagnostics on buffer when first attaching

                vim.api.nvim_buf_attach(buffer, false, {
                    on_lines = function()
                        if _timers[buffer] then
                            vim.fn.timer_stop(_timers[buffer])
                        end
                        _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
                    end,
                    on_detach = function()
                        if _timers[buffer] then
                            vim.fn.timer_stop(_timers[buffer])
                        end
                    end,
                })
            end

            -- Map server name to lspconfig name
            local nvim_lspconfig_mappings = {
                ["bash-language-server"] = "bashls",
                deno = "denols",
                ["docker-langserver"] = "dockerls",
                ["efm-langserver"] = "efm",
                ["elixir-ls"] = "elixirls",
                ["erlang-ls"] = "erlangls",
                ["golangci-lint-langserver"] = "golangci_lint_ls",
                ["graphql-lsp"] = "graphql",
                ["lua-language-server"] = "lua_ls",
                ["pyright-langserver"] = "pyright",
                ["ruby-lsp"] = "ruby_ls",
                ["rust-analyzer"] = "rust_analyzer",
                ["terraform-ls"] = "terraformls",
                ["terraform-lsp"] = "terraform_lsp",
                ["typescript-language-server"] = "tsserver",
                ["vim-language-server"] = "vimls",
            }

            for _, name in ipairs(vim.g.zero_vim_enabled_language_servers) do
                local server = vim.g.zero_vim_language_servers[name]
                local lspconfig_name = nvim_lspconfig_mappings[name] or name
                local on_attach = function(client, buffer)
                    if lspconfig_name == "ruby_ls" then
                        setup_diagnostics(client, buffer)
                    end
                end
                lspconfig[lspconfig_name].setup({
                    cmd = server.cmd,
                    filetypes = server.filetypes,
                    on_attach = on_attach,
                    capabilities = capabilities,
                    init_options = server.initialization_options or {
                        usePlaceHolders = true,
                    },
                })
            end
        end,
    })
end

if Plugged("vim-vsnip") then
    -- https://github.com/hrsh7th/vim-vsnip
    vim.g.vsnip_snippet_dir = vim.fn.expand("~/.vim/vsnip")
    vim.g.vsnip_snippet_dirs = vim.fn.glob("~/.vim/vsnip/*/", 0, 1)
    vim.g.vsnip_filetypes = {
        ruby = { "rdoc", "rake", "rails" },
        javascript = { "javascriptreact" },
        typescript = { "typescriptreact" },
    }

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
        return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or ""
    end, { remap = true, expr = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or ""
    end, { remap = true, expr = true })

    vim.keymap.set("i", "<C-b>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<C-b>"
    end, { remap = true, expr = true })

    vim.keymap.set("s", "<C-b>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or ""
    end, { remap = true, expr = true })

    vim.keymap.set("s", "<CR>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<CR>"
    end, { remap = true, expr = true })

    vim.keymap.set("s", "<Tab>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Tab>"
    end, { remap = true, expr = true })

    vim.keymap.set("s", "<S-Tab>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<S-Tab>"
    end, { remap = true, expr = true })

    vim.keymap.set({ "i", "s" }, "<C-g><C-e>", function()
        return vim.fn["vsnip#available"](1) == 1 and "<Plug>(vsnip-expand-or-jump)" or ""
    end, { remap = true, expr = true })

    vim.keymap.set({ "i", "s" }, "<C-g><C-n>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or ""
    end, { remap = true, expr = true })

    vim.keymap.set({ "i", "s" }, "<C-g><C-p>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or ""
    end, { remap = true, expr = true })
end

if Plugged("LuaSnip") then
    -- https://github.com/L3MON4D3/LuaSnip
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set(
        { "i", "s" },
        "<C-k>",
        [[luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : ""]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set(
        { "i", "s" },
        "<C-j>",
        [[luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : ""]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set(
        "i",
        "<C-b>",
        [[luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<C-b>"]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set(
        "s",
        "<C-b>",
        [[luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : ""]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set(
        "s",
        "<CR>",
        [[luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : "<CR>"]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set(
        "s",
        "<Tab>",
        [[luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : "<Tab>"]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set(
        "s",
        "<S-Tab>",
        [[luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<S-Tab>"]],
        { remap = true, expr = true, replace_keycodes = false }
    )

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            -- require("luasnip.loaders.from_vscode").load()
        end,
    })
end

if Plugged("nvim-cmp") then
    -- https://github.com/hrsh7th/nvim-cmp
    local build_cmp_sources = function()
        local sources = {
            { name = "buffer" },
            { name = "path" },
        }

        if Plugged("cmp-nvim-lsp") then
            -- https://github.com/hrsh7th/cmp-nvim-lsp
            table.insert(sources, { name = "nvim_lsp" })
            table.insert(sources, { name = "nvim_lsp_signature_help" })
        end

        if Plugged("cmp_luasnip") then
            -- https://github.com/saadparwaiz1/cmp_luasnip
            table.insert(sources, { name = "luasnip" })
        elseif Plugged("cmp-vsnip") then
            -- https://github.com/hrsh7th/cmp-vsnip
            table.insert(sources, { name = "vsnip" })
        end

        return sources
    end

    vim.g.cmp_sources = build_cmp_sources()

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            local cmp = require("cmp")
            local expand_snippet
            local has_luasnip, luasnip = pcall(require, "luasnip")
            if has_luasnip then
                expand_snippet = function(args)
                    luasnip.lsp_expand(args.body)
                end
            else
                expand_snippet = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            end

            local check_back_space = function()
                local col = vim.fn.col(".") - 1
                if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
                    return true
                else
                    return false
                end
            end

            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end

            -- https://github.com/windwp/nvim-autopairs
            local has_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
            if has_autopairs then
                require("nvim-autopairs").setup({
                    map_cr = false,
                })
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end

            cmp.setup({
                completion = {
                    completeopt = table.concat(vim.opt.completeopt:get(), ","),
                },
                snippet = {
                    expand = expand_snippet,
                },
                mapping = {
                    -- ["<C-p>"] = cmp.mapping.select_prev_item(),
                    -- ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-g><C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-g><C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-x><C-x>"] = cmp.mapping.complete(),
                    -- ["<C-e>"] = cmp.mapping.close(),
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ["<CR>"] = cmp.mapping.confirm({
                        -- behavior = cmp.ConfirmBehavior.Insert,
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif check_back_space() then
                            vim.fn.feedkeys(t("<Tab>"), "n")
                        else
                            fallback()
                        end
                    end,
                    ["<S-Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            vim.fn.feedkeys(t("<C-h>"), "n")
                        end
                    end,
                },
                sources = cmp.config.sources(vim.g.cmp_sources, {
                    { name = "buffer" },
                }),
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        require("cmp-under-comparator").under,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "buffer" },
                }),
            })
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "lua",
        callback = function()
            -- nvim-lua source is only enabled in Lua filetype
            local sources = vim.deepcopy(vim.g.cmp_sources)
            table.insert(sources, { name = "nvim_lua" })

            local cmp = require("cmp")
            cmp.setup.buffer({
                sources = cmp.config.sources(sources),
            })
        end,
    })
end

if Plugged("coq_nvim") then
    -- https://github.com/ms-jpq/coq_nvim
    vim.g.coq_settings = {
        auto_start = "shut-up",
        keymap = {
            recommended = not Plugged("nvim-autopairs"),
            manual_complete = "",
            bigger_preview = "<C-k>",
            jump_to_mark = "",
        },
        clients = {
            tmux = {
                enabled = false,
            },
        },
    }

    -- <CR>: accept completion when popup menu is visible
    -- Use vim function to work around for https://github.com/tpope/vim-eunuch
    vim.cmd([[
    function! CleverCR() abort
        if pumvisible()
            if complete_info(['selected']).selected == -1
                return "\<C-e>\<CR>"
            else
                return "\<C-y>"
            endif
        else
            return "\<CR>"
        endif
    endfunction
    ]])

    vim.keymap.set("i", "<CR>", "CleverCR()", { expr = true })

    -- Show autocomplete popup manually
    vim.keymap.set("i", "<C-x><C-x>", function()
        return vim.fn.pumvisible() == 1 and "<C-e><C-x><C-u>" or "<C-x><C-u>"
    end, { expr = true })

    -- Jump to mark
    vim.keymap.set({ "i", "v" }, "<C-j>", [[<C-\><C-n><Cmd>lua COQ.Nav_mark()<CR>]])

    if not vim.g.coq_settings.keymap.recommended then
        vim.keymap.set("i", "<Esc>", function()
            return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
        end, { expr = true })
        vim.keymap.set("i", "<C-c>", function()
            return vim.fn.pumvisible() == 1 and "<C-e><C-c>" or "<C-c>"
        end, { expr = true })
        vim.keymap.set("i", "<BS>", function()
            return vim.fn.pumvisible() == 1 and "<C-e><BS>" or "<BS>"
        end, { expr = true })
        vim.keymap.set("i", "<C-w>", function()
            return vim.fn.pumvisible() == 1 and "<C-e><C-w>" or "<C-w>"
        end, { expr = true })
        vim.keymap.set("i", "<C-u>", function()
            return vim.fn.pumvisible() == 1 and "<C-e><C-u>" or "<C-u>"
        end, { expr = true })
        vim.keymap.set("i", "<Tab>", function()
            return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
        end, { expr = true })
        vim.keymap.set("i", "<S-Tab>", function()
            return vim.fn.pumvisible() == 1 and "<C-p>" or "<BS>"
        end, { expr = true })

        -- https://github.com/windwp/nvim-autopairs
        local autopairs = require("nvim-autopairs")
        autopairs.setup({
            map_cr = false,
            map_bs = false,
        })

        -- <CR>: accept completion with autopairs
        vim.cmd([[
        function! CleverCR() abort
            if pumvisible()
                if complete_info(['selected']).selected == -1
                    return "\<C-e>" . v:lua.require'nvim-autopairs'.autopairs_cr()
                else
                    return "\<C-y>"
                endif
            else
                return v:lua.require'nvim-autopairs'.autopairs_cr()
            endif
        endfunction
        ]])

        -- <BS>: Backspace with autopairs
        vim.keymap.set("i", "<BS>", function()
            if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "mode" }).mode == "eval" then
                vim.fn.feedkeys(autopairs.esc("<C-e>") .. autopairs.autopairs_bs(), "n")
            else
                vim.fn.feedkeys(autopairs.autopairs_bs(), "n")
            end
            return ""
        end, { expr = true })
    end

    -- https://github.com/ms-jpq/coq.thirdparty
    require("coq_3p")({
        { src = "nvimlua" },
    })
end

if Plugged("vim-mucomplete") then
    -- https://github.com/lifepillar/vim-mucomplete
    vim.g["mucomplete#enable_auto_at_startup"] = 1
    vim.g["mucomplete#completion_delay"] = 0
    vim.g["mucomplete#reopen_immediately"] = 1
    vim.g["mucomplete#minimum_prefix_length"] = 1
    vim.g["mucomplete#no_mappings"] = 1

    vim.g["mucomplete#chains"] = {
        default = { "omni", "vsnip", "keyn", "c-n", "dict", "uspl", "path" },
        vim = { "cmd", "vsnip", "keyn", "c-n", "path" },
    }

    -- Show autocomplete popup manually
    vim.keymap.set("i", "<C-x><C-x>", function()
        return vim.fn.pumvisible() == 1 and "<Plug>(MUcompleteCycFwd)" or "<Plug>(MUcompleteFwd)"
    end, { expr = true, remap = true })

    -- CTRL-J: snippet jump forward or go to next completion chain
    vim.keymap.set("i", "<C-j>", function()
        if vim.fn["vsnip#jumpable"](1) == 1 then
            return "<Plug>(vsnip-jump-next)"
        elseif vim.fn.pumvisible() == 1 then
            return "<Plug>(MUcompleteCycFwd)"
        end
        return ""
    end, { expr = true, remap = true })

    -- CTRL-K: go to previous completion chain or expand snippet
    vim.keymap.set("i", "<C-k>", function()
        if vim.fn.pumvisible() == 1 then
            if vim.fn.empty(vim.v.completed_item) == 1 or vim.fn.complete_info({ "selected" }).selected == -1 then
                return "<Plug>(MUcompleteCycBwd)"
            elseif vim.fn["vsnip#available"](1) == 1 then
                return "<Plug>(vsnip-expand-or-jump)"
            else
                return "<Plug>(MUcompleteCycBwd)"
            end
        elseif vim.fn["vsnip#available"](1) == 1 then
            return "<Plug>(vsnip-expand-or-jump)"
        else
            return ""
        end
    end, { expr = true, remap = true })

    -- <CR>: accept completion when popup menu is visible
    vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { expr = true })

    -- <Tab>: completion
    vim.keymap.set("i", "<Tab>", function()
        return vim.fn["vsnip#jumpable"](1) == 1 and "<Plug>(vsnip-jump-next)" or "<Plug>(MUcompleteFwd)"
    end, { expr = true, remap = true })

    -- <S-Tab>: completion back
    vim.keymap.set("i", "<S-Tab>", function()
        return vim.fn["vsnip#jumpable"](-1) == 1 and "<Plug>(vsnip-jump-prev)" or "<Plug>(MUcompleteBwd)"
    end, { expr = true, remap = true })

    -- CTRL-Y: Extend completion
    -- vim.keymap.set("i", "<C-y>", [[mucomplete#extend_fwd("\<C-y>")]], { expr = true, remap = true })

    -- Integrate with vim-visual-multi / vim-multiple-cursors plugin
    vim.cmd([[
    function! MultipleCursorsStart() abort
        silent! MUcompleteAutoOff
    endfunction

    function! MultipleCursorsExit() abort
        silent! MUcompleteAutoOn
    endfunction
    ]])
end

if Plugged("VimCompletesMe.vim") then
    -- https://git.sr.ht/~ackyshake/VimCompletesMe.vim
    -- Disable vim-lsp's async completion
    vim.g.lsp_async_completion = 0

    -- <CR>: accept completion when popup menu is visible
    vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], { expr = true })
end

if Plugged("mason.nvim") then
    -- https://github.com/williamboman/mason.nvim
    require("mason").setup({})
end

if Plugged("none-ls.nvim") then
    -- https://github.com/nvimtools/none-ls.nvim
    require("null-ls").setup({})
end

if Plugged("formatter.nvim") then
    -- https://github.com/mhartington/formatter.nvim
    require("formatter").setup({
        logging = false,
        filetype = {
            ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
            json = { require("formatter.filetypes.json").jq },
            lua = { require("formatter.filetypes.lua").stylua },
            ruby = { require("formatter.filetypes.ruby").rubocop },
            go = { require("formatter.filetypes.go").goimports },
            rust = { require("formatter.filetypes.rust").rustfmt },
            elixir = { require("formatter.filetypes.elixir").mixformat },
            terraform = { require("formatter.filetypes.terraform").terraformfmt },
        },
    })

    vim.keymap.set({ "n", "x" }, "<Leader>b=", ":FormatWrite<CR>", { silent = true })
    vim.keymap.set({ "n", "x" }, "<Leader>bu", ":FormatWrite<CR>", { silent = true })
end

if Plugged("conform.nvim") then
    -- https://github.com/stevearc/conform.nvim
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            fish = { "fish_indent" },
            sh = { "shfmt" },
            -- ["_"] = { "trim_whitespace" },
        },
        -- format_on_save = {
        --     timeout_ms = 500,
        --     lsp_fallback = true,
        -- },
        -- format_after_save = {
        --     lsp_fallback = true,
        -- },
        log_level = vim.log.levels.ERROR,
        notify_on_error = true,
    })

    -- require("conform").formatters.injected = {
    --     options = {
    --         ignore_errors = false,
    --     },
    -- }

    vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
            }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatInjected", function(args)
        local range = nil
        if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
            }
        end
        require("conform").format({ formatters = { "injected" }, async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.keymap.set({ "n", "x" }, "<Leader>b=", "<Cmd>Format<CR>", { silent = true })
    vim.keymap.set({ "n", "x" }, "<Leader>bu", "<Cmd>Format<CR>", { silent = true })
end

if Plugged("neomake") then
    -- https://github.com/neomake/neomake
    vim.g.neomake_open_list = 2
    vim.g.neomake_cursormoved_delay = 200

    vim.g.neomake_highlight_lines = vim.g.neomake_highlight_lines or 0
    vim.g.neomake_highlight_columns = vim.g.neomake_highlight_lines == 1 and 0 or 1

    vim.g.neomake_error_sign = { text = vim.g.zero_vim_signs.error }
    vim.g.neomake_warning_sign = { text = vim.g.zero_vim_signs.warning }
    vim.g.neomake_info_sign = { text = vim.g.zero_vim_signs.information }
    vim.g.neomake_message_sign = { text = vim.g.zero_vim_signs.message }

    vim.g.neomake_virtualtext_prefix = vim.g.zero_vim_signs.virtual_text .. " "

    if vim.g.zero_vim_autolint == 1 then
        vim.g.neomake_open_list = 0
        vim.fn["neomake#configure#automake"]("w")
    end

    vim.g.neomake_ruby_enabled_makers = { "mri", "rubocop", "reek" }
    vim.g.neomake_ruby_rubocop_exe = "bundle"
    vim.g.neomake_ruby_rubocop_args = { "exec", "rubocop", "--format", "emacs" }
    vim.g.neomake_ruby_reek_exe = "bundle"
    vim.g.neomake_ruby_reek_args = { "exec", "reek", "--no-color", "--single-line" }

    vim.cmd([[
    function! NeomakeRubyBrakemanMakerInitForJob(jobinfo) dict abort
        let maker = deepcopy(self)
        if a:jobinfo.file_mode
            let maker.args += ['--only-files']
        endif
        return maker
    endfunction

    function! NeomakeRubyBrakemanMakerProcessJSON(context) abort
        let l:entries = []
        for l:warning in get(a:context.json, 'warnings', [])
            call add(l:entries, {
                        \ 'maker_name': 'brakeman',
                        \ 'filename':   l:warning.file,
                        \ 'text':       l:warning.warning_type . ' ' . l:warning.message . ' (' . l:warning.confidence . ') ' . l:warning.link,
                        \ 'lnum':       l:warning.line != v:null ? l:warning.line : 1,
                        \ 'type':       'W',
                        \ })
        endfor
        return l:entries
    endfunction

    let g:neomake_ruby_brakeman_maker = {
                \ 'exe':           'bundle',
                \ 'args':          ['exec', 'brakeman', '-f', 'json', '-q'],
                \ 'errorformat':   '%m',
                \ 'apppend_file':  1,
                \ 'output_stream': 'stdout',
                \ 'InitForJob':    function('NeomakeRubyBrakemanMakerInitForJob'),
                \ 'process_json':  function('NeomakeRubyBrakemanMakerProcessJSON'),
                \ }
    ]])

    vim.keymap.set("n", "<Leader>bc", ":Neomake<CR>:echo neomake#statusline#LoclistStatus()<CR>", { silent = true })

    vim.cmd([[
    function! NeomakeSetMakers(bang, ...) abort
        if a:bang
            for ft in neomake#utils#get_config_fts(&filetype)
                unlet! b:neomake_{ft}_enabled_makers
            endfor
        elseif a:0 > 0
            for ft in neomake#utils#get_config_fts(&filetype)
                let b:neomake_{ft}_enabled_makers = a:000
            endfor
        endif
    endfunction

    function! NeomakeRun(bang, sh_command, ...) abort
        let maker = neomake#utils#MakerFromCommand(a:sh_command)
        let maker.name = 'sh: ' . a:sh_command
        let maker.errorformat = '%f:%l:%c: %t: %m,%f:%l:%c: %m,%E%f:%l: %m'
        let maker.default_entry_type = 'M'
        let options = { 'enabled_makers': [maker], 'file_mode': 1 }
        call neomake#ShCommand(a:bang, a:sh_command, options)
    endfunction
    ]])

    vim.api.nvim_create_user_command("NeomakeSetMarkers", "call NeomakeSetMakers(<bang>0, <f-args>)", {
        bar = true,
        bang = true,
        nargs = "*",
        complete = "customlist,neomake#cmd#complete_makers",
    })

    vim.api.nvim_create_user_command("NeomakeRun", "call NeomakeRun(<bang>0, <q-args>)", {
        bar = true,
        bang = true,
        nargs = "+",
        complete = "shellcmd",
    })

    vim.keymap.set("n", "[g", "<Cmd>NeomakePrevLoclist<CR>", { silent = true })
    vim.keymap.set("n", "]g", "<Cmd>NeomakeNextLoclist<CR>", { silent = true })
end

if Plugged("ale") then
    -- https://github.com/dense-analysis/ale
    vim.g.ale_lint_on_text_changed = 0
    vim.g.ale_lint_on_insert_leave = 0
    vim.g.ale_lint_on_enter = vim.g.zero_vim_autolint
    vim.g.ale_lint_on_save = vim.g.zero_vim_autolint
    vim.g.ale_lint_on_filetype_changed = vim.g.zero_vim_autolint
    vim.g.ale_open_list = vim.g.zero_vim_autolint == 1 and 0 or 1
    vim.g.ale_fix_on_save = vim.g.zero_vim_autofix

    vim.g.ale_floating_preview = vim.g.ale_floating_preview or 1
    vim.g.ale_cursor_detail = vim.g.ale_floating_preview
    vim.g.ale_virtualtext_cursor = vim.g.ale_floating_preview == 1 and 0 or 1
    vim.g.ale_echo_delay = 200
    vim.g.ale_echo_cursor = vim.g.ale_virtualtext_cursor
    vim.g.ale_set_highlights = vim.g.ale_set_highlights or vim.g.ale_virtualtext_cursor

    vim.g.ale_close_preview_on_insert = 1
    vim.g.ale_floating_window_border = { "│", "─", "╭", "╮", "╯", "╰", "│", "─" }

    vim.g.ale_sign_error = vim.g.zero_vim_signs.error
    vim.g.ale_sign_warning = vim.g.zero_vim_signs.warning
    vim.g.ale_sign_style_error = vim.g.zero_vim_signs.style_error
    vim.g.ale_sign_style_warning = vim.g.zero_vim_signs.style_warning
    vim.g.ale_sign_info = vim.g.zero_vim_signs.information
    vim.g.ale_virtualtext_prefix = vim.g.zero_vim_signs.virtual_text .. " "

    vim.g.ale_linters = {
        ruby = { "ruby", "rubocop", "reek" },
    }

    vim.g.ale_fixers = {
        ["*"] = { "remove_trailing_lines", "trim_whitespace" },
    }

    vim.g.ale_ruby_brakeman_executable = "bundle"
    vim.g.ale_ruby_rubocop_executable = "bundle"
    vim.g.ale_ruby_reek_executable = "bundle"
    vim.g.ale_ruby_reek_show_context = 1
    vim.g.ale_ruby_reek_show_wiki_link = 0

    -- Don't auto-format files inside `node_modules`, minified files and jquery
    vim.g.ale_pattern_options_enabled = 1
    vim.g.ale_pattern_options = {
        ["\\.min\\.(js\\|css)$"] = {
            ale_linters = {},
            ale_fixers = {},
        },
        ["jquery.*"] = {
            ale_linters = {},
            ale_fixers = {},
        },
        ["node_modules/.*"] = {
            ale_linters = {},
            ale_fixers = {},
        },
        ["package.json"] = {
            ale_fixers = { "remove_trailing_lines", "trim_whitespace" },
        },
    }

    vim.keymap.set("n", "<Leader>bc", "<Cmd>ALELint<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>b=", "<Cmd>ALEFix<CR>", { silent = true })

    vim.cmd([[
    function! ListALELinters(...) abort
        try
            if exists('b:ale_linters') | let b:current_ale_linters = b:ale_linters | endif
            unlet! b:ale_linters
            return join(map(copy(ale#linter#Get(&filetype)), 'v:val.name'), "\n")
        finally
            if exists('b:current_ale_linters') | let b:ale_linters = b:current_ale_linters | endif
            unlet! b:current_ale_linters
        endtry
    endfunction

    function! ALESetLinters(bang, ...) abort
        if a:bang
            unlet! b:ale_linters
        elseif a:0 > 0
            let b:ale_linters = a:000
        endif
    endfunction
    ]])

    vim.api.nvim_create_user_command("ALESetLinters", "call ALESetLinters(<bang>0, <f-args>)", {
        bar = true,
        bang = true,
        nargs = "*",
        complete = "custom,ListALELinters",
    })

    vim.keymap.set("n", "[g", "<Plug>(ale_previous_wrap)", { remap = true })
    vim.keymap.set("n", "]g", "<Plug>(ale_next_wrap)", { remap = true })
end

if Plugged("nvim-lint") then
    -- https://github.com/mfussenegger/nvim-lint
    vim.g.zero_vim_linters = vim.g.zero_vim_linters or vim.empty_dict()

    if vim.g.zero_vim_autolint == 1 then
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = "MyAutoCmd",
            pattern = "*",
            callback = function()
                require("lint").try_lint()
            end,
        })
    end

    vim.api.nvim_create_autocmd("VimEnter", {
        group = "MyAutoCmd",
        pattern = "*",
        callback = function()
            local lint = require("lint")
            lint.linters_by_ft = vim.tbl_extend("force", lint.linters_by_ft, vim.g.zero_vim_linters)
            lint.linters.rubocop = vim.tbl_extend("force", lint.linters.rubocop, {
                cmd = "bundle",
                args = {
                    "exec",
                    "rubocop",
                    "--format",
                    "json",
                    "--force-exclusion",
                    "--stdin",
                    function()
                        return vim.api.nvim_buf_get_name(0)
                    end,
                },
            })
        end,
    })
end

if Plugged("nvim-dap") then
    -- https://github.com/mfussenegger/nvim-dap

    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    require("mason-nvim-dap").setup({
        ensure_installed = {},
        automatic_installation = false,
    })
end

-- https://github.com/vim-test/vim-test
-- vim.g["test#neovim#term_position"] = "botright"
-- vim.g["test#neovim#term_position"] = "vertical"
-- vim.g["test#neovim#term_position"] = "tab"
vim.g["test#neovim#term_position"] = "botright 15"
vim.g["test#neovim#start_normal"] = 1
vim.g["test#strategy"] = "neovim"

if Plugged("vim-tmuxify") then
    vim.g["test#preserve_screen"] = 0
    vim.g["test#strategy"] = "tmuxify"
end

vim.keymap.set("n", "<Leader>tt", "<Leader>tf", { remap = true })
vim.keymap.set("n", "<Leader>tn", "<Cmd>TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tf", "<Cmd>TestFile<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tl", "<Cmd>TestLast<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ts", "<Cmd>TestSuite<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tv", "<Cmd>TestVisit<CR>", { silent = true })

if Plugged("vim-fugitive") then
    -- https://github.com/tpope/vim-fugitive
    vim.g.fugitive_legacy_commands = 0

    vim.keymap.set("n", "<Leader>gi", "<Cmd>Git add -p %<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>ga", "<Cmd>Git add -p<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gs", "<Cmd>Git<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gd", "<Cmd>Gdiffsplit<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gc", "<Cmd>Git commit -v<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gb", "<Cmd>Git blame<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>ge", ":Gedit<Space>")
    vim.keymap.set("n", "<Leader>gr", "<Cmd>Gread<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gw", "<Cmd>Gwrite<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gx", "<Cmd>Gwq <Bar> redraw<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gf", "<Cmd>Git fetch<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gp", "<Cmd>Git push<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gu", "<Cmd>Git pull --rebase<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>go", "<Cmd>GBrowse<CR>", { silent = true })
    vim.keymap.set("x", "<Leader>go", ":GBrowse<CR>", { silent = true })

    vim.keymap.set(
        "n",
        "<Leader>gy",
        [[:Gwrite <Bar> Git commit -m <C-r>=printf("'Update: %s'", strftime('%a, %d %b %Y %H:%M:%S %z'))<CR><CR>]],
        { silent = true }
    )

    vim.api.nvim_create_autocmd("BufReadPost", {
        group = "MyAutoCmd",
        pattern = "fugitive://*",
        callback = function()
            vim.bo.bufhidden = "delete"
        end,
    })

    -- Disable rhubarb#Complete
    vim.api.nvim_create_autocmd("BufEnter", {
        group = "MyAutoCmd",
        pattern = { "*.git/*MSG" },
        callback = function()
            vim.bo.omnifunc = ""
        end,
    })
end

if Plugged("gv.vim") then
    -- https://github.com/junegunn/gv.vim
    vim.keymap.set("n", "<Leader>gl", "<Cmd>GV<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>gv", "<Cmd>GV!<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>g?", "<Cmd>GV?<CR>", { silent = true })
end

if Plugged("git-messenger.vim") then
    -- https://github.com/rhysd/git-messenger.vim
    vim.g.git_messenger_always_into_popup = true
    vim.g.git_messenger_no_default_mappings = true

    vim.keymap.set("n", "<Leader>gm", "<Plug>(git-messenger)", { remap = true })
end

if Plugged("gitsigns.nvim") then
    -- https://github.com/lewis6991/gitsigns.nvim
    require("gitsigns").setup({
        update_debounce = 250,
        max_file_length = 1000,
        signcolumn = true,
        attach_to_untracked = false,
        current_line_blame = false,
        on_attach = function(bufnr)
            local gitsigns = package.loaded.gitsigns

            vim.keymap.set("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                else
                    vim.schedule(function()
                        gitsigns.next_hunk()
                    end)
                    return "<Ignore>"
                end
            end, { expr = true })

            vim.keymap.set("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                else
                    vim.schedule(function()
                        gitsigns.prev_hunk()
                    end)
                    return "<Ignore>"
                end
            end, { expr = true })
        end,
    })

    vim.keymap.set("n", "yog", "<Cmd>Gitsigns toggle_signs<CR>", { silent = true })
end

if Plugged("which-key.nvim") then
    -- https://github.com/folke/which-key.nvim
    local wk = require("which-key")
    wk.setup({
        icons = {
            -- separator = "»",
            separator = "→ ",
        },
        key_labels = {
            ["<space>"] = "SPC",
            ["<tab>"] = "TAB",
            ["<CR>"] = "RET",
        },
    })
    wk.add({
        { "<Leader>n", desc = "open-selected-region" },
        { "<Leader>S", desc = "search-prompt" },
        { "<Leader>B", desc = "buffer-search-prompt" },
        { "<Leader>R", desc = "replace-prompt" },
        { "<Leader>a", desc = "all-files" },
        { "<Leader>f", desc = "files" },
        { "<Leader>p", desc = "buffer-project" },
        { "<Leader>o", desc = "mru-in-cwd-and-opening-buffers" },
        { "<Leader>O", desc = "recent-files" },
        { "<Leader>d", desc = "files-in-buffer-dir" },
        { [[<Leader>\]], desc = "tags" },
        { "<Leader>;", desc = "command-palette" },
        { "<Leader>:", desc = "command-history" },
        { "<Leader>?", desc = "search-history" },
        { "<Leader>l", desc = "location-list" },
        { "<Leader>q", desc = "quickfix" },
        { "<Leader>/", desc = "live-grep" },
        {
            "<Leader><Enter>",
            desc = "toggle-zen-mode",
            cond = function()
                return Plugged("true-zen.nvim") or Plugged("zen-mode.nvim")
            end,
        },
        {
            "<Leader>L",
            desc = "toggle-hyperfocus-writing",
            cond = function()
                return Plugged("true-zen.nvim") or Plugged("zen-mode.nvim")
            end,
        },
        {
            "<Leader>U",
            desc = "toggle-undo-tree",
            cond = function()
                return Plugged("undotree")
            end,
        },
        {
            "<Leader>T",
            desc = "toggle-tags-tree",
            cond = function()
                return Plugged("tagbar")
            end,
        },
    })

    if Plugged("oil.nvim") then
        wk.add({
            { "<Leader>E", desc = "open-explorer-in-cwd" },
        })
    elseif Plugged("carbon.nvim") or Plugged("neo-tree.nvim") then
        wk.add({
            { "<Leader>E", desc = "toggle-floating-explorer" },
        })
    else
        wk.add({
            { "<Leader>E", desc = "toggle-netrw-explorer" },
        })
    end

    if Plugged("telescope.nvim") or Plugged("fzf-lua") or Plugged("fzf") then
        wk.add({
            { "<Leader>'", desc = "marks" },
            { "<Leader>Y", desc = "registers" },
        })
    end

    wk.add({
        { "<Leader>b", group = "buffer" },
        { "<Leader>bw", desc = "save-buffer" },
        { "<Leader>bx", desc = "save-and-close-buffer" },
        { "<Leader>bu", desc = "save-and-format-buffer" },
        { "<Leader>bk", desc = "delete-buffer" },
        { "<Leader>by", desc = "copy-buffer-to-clipboard" },
        { "<Leader>bn", desc = "open-selected-region" },
        { "<Leader>bb", desc = "opening-buffers" },
        { "<Leader>bd", desc = "files-in-buffer-dir" },
        { "<Leader>bp", desc = "buffer-project" },
        { "<Leader>bt", desc = "buffer-tags" },
        { "<Leader>bo", desc = "buffer-outline" },
        { "<Leader>bl", desc = "buffer-lines" },
        { "<Leader>ba", desc = "buffer-alternative" },
        { "<Leader>br", desc = "buffer-related" },
        { "<Leader>b;", desc = "buffer-search-cword-prompt" },
        { "<Leader>bs", desc = "buffer-search-cword" },
        { "<Leader>b.", desc = "buffer-search-word" },
        { "<Leader>bg", desc = "buffer-git-grep-cword" },
        {
            "<Leader>bs",
            desc = "maximize-buffer",
            cond = function()
                return Plugged("ZoomWin")
            end,
        },
        {
            "<Leader>bi",
            desc = "toggle-indent-guide",
            cond = function()
                return Plugged("indentmini.nvim") or Plugged("indent-blankline.nvim") or Plugged("mini.nvim")
            end,
        },
    })

    if Plugged("oil.nvim") or Plugged("carbon.nvim") or Plugged("nvim-tree.lua") or Plugged("neo-tree.nvim") then
        wk.add({
            { "<Leader>e", desc = "toggle-explorer" },
            { "<Leader>bf", desc = "find-buffer-in-explorer" },
        })
    else
        wk.add({
            { "<Leader>e", desc = "netrw-explorer" },
            { "<Leader>bf", desc = "open-buffer-dir-in-netrw-explorer" },
        })
    end

    if Plugged("formatter.nvim") or Plugged("conform.nvim") then
        wk.add({
            { "<Leader>b=", desc = "format-buffer" },
            { "<Leader>bu", desc = "format-buffer" },
        })
    end

    if Plugged("nvim-treesitter") then
        wk.add({
            { "<Leader>bh", desc = "toggle-buffer-highlight" },
        })
    end

    wk.add({
        { "<Leader>s", group = "search/replace" },
        { "<Leader>s;", desc = "search-cword-prompt" },
        { "<Leader>ss", desc = "search-cword" },
        { "<Leader>s.", desc = "search-word" },
        { "<Leader>sd", desc = "search-cword-in-buffer-dir" },
        { "<Leader>sg", desc = "git-grep-cword" },
        { "<Leader>si", desc = "search-fuzzy" },
        { "<Leader>sc", desc = "search-cword-fuzzy-interactive" },
        { "<Leader>sr", desc = "replace-cword-prompt" },
        { "<Leader>sx", desc = "replace-cword-boundary-prompt" },
    })

    if Plugged("ctrlsf.vim") then
        wk.add({
            { "<Leader>F", desc = "ctrlsf-search-prompt" },
            { "<Leader>sf", desc = "ctrlsf-search-cword" },
            { "<Leader>sw", desc = "ctrlsf-search-word" },
            { "<Leader>sp", desc = "ctrlsf-search-cword-in-project" },
            { "<Leader>su", desc = "ctrlsf-search-update" },
            { "<Leader>so", desc = "toggle-ctrlsf-search-result" },
        })
    end

    if Plugged("any-jump.vim") then
        wk.add({
            { "<Leader>sa", desc = "any-jump" },
            { "<Leader>sb", desc = "any-jump-back" },
            { "<Leader>sl", desc = "any-jump-last-results" },
        })
    end

    if Plugged("vim-abolish") then
        wk.add({
            { "<Leader>V", desc = "subvert-prompt" },
            { "<Leader>sv", desc = "subvert-cword-prompt" },
        })
    end

    if Plugged("vim-tmuxify") then
        wk.add({
            { "<Leader>m", group = "+tmuxify" },
            { "<Leader>mb", desc = "send-<ctrl-c>" },
            { "<Leader>mc", desc = "send-<ctrl-l>" },
            { "<Leader>mn", desc = "create-and-associate-with-pane" },
            { "<Leader>mp", desc = "associate-with-existing-pane" },
            { "<Leader>mq", desc = "close-associated-pane" },
            { "<Leader>mr", desc = "run-command" },
            { "<Leader>mt", desc = "set-run-command" },
            { "<Leader>mi", desc = "send-text-prompt" },
            { "<Leader>ms", desc = "send-paragraph" },
            { "<Leader>ml", desc = "send-line" },
            { "<Leader>mv", desc = "send-linewise-visual" },
            { "<Leader>mw", desc = "send-word" },
            { "<Leader>mk", desc = "send-key-prompt" },
            { "<Leader>ma", desc = "send-last-text" },
            { "<Leader>mf", desc = "send-clear" },
            { "<Leader>md", desc = "send-quit" },
        })
    end

    wk.add({
        { "<Leader>t", group = "test" },
        { "<Leader>tt", desc = "run-test-nearest-to-current-cursor" },
        { "<Leader>tn", desc = "run-test-nearest-to-current-cursor" },
        { "<Leader>tf", desc = "run-all-tests-in-current-file" },
        { "<Leader>tl", desc = "run-last-test" },
        { "<Leader>ts", desc = "run-whole-test-suite" },
        { "<Leader>tv", desc = "visit-last-test" },
    })

    wk.add({
        { "<Leader>g", desc = "git" },
    })

    if Plugged("vim-fugitive") then
        wk.add({
            { "<Leader>gi", desc = "stage-current-file-interactive" },
            { "<Leader>ga", desc = "stage-all-files-interactive" },
            { "<Leader>gs", desc = "status" },
            { "<Leader>gd", desc = "diff" },
            { "<Leader>gc", desc = "commit" },
            { "<Leader>gb", desc = "blame" },
            { "<Leader>ge", desc = "edit-prompt" },
            { "<Leader>gr", desc = "reset-file" },
            { "<Leader>gw", desc = "save-and-stage-current-file" },
            { "<Leader>gx", desc = "save-and-stage-current-file-and-quit" },
            { "<Leader>gf", desc = "fetch" },
            { "<Leader>gp", desc = "push" },
            { "<Leader>gu", desc = "pull-and-rebase" },
            { "<Leader>go", desc = "open-in-browser" },
        })
    end

    if Plugged("gv.vim") then
        wk.add({
            { "<Leader>gl", desc = "commit-browser" },
            { "<Leader>gv", desc = "commit-browser-for-current-file" },
            { "<Leader>g?", desc = "current-file-revisions" },
        })
    end

    if Plugged("git-messenger.vim") then
        wk.add({
            { "<Leader>gm", desc = "git-messenger" },
        })
    end
end

if Plugged("neorg") then
    -- https://github.com/nvim-neorg/neorg
    require("neorg").setup({
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/Dropbox/phongnh/notes",
                    },
                },
            },
        },
    })
end

if Plugged("orgmode") then
    -- https://github.com/nvim-orgmode/orgmode
    -- Load custom treesitter grammar for org filetype
    require("orgmode").setup_ts_grammar()

    require("orgmode").setup({})
end

if Plugged("emmet-vim") then
    -- https://github.com/mattn/emmet-vim
    vim.g.emmet_install_only_plug = 1
    vim.g.user_emmet_mode = "i"

    vim.keymap.set("i", "<C-x>,", "<Plug>(emmet-expand-abbr)", { remap = true, silent = true })
    vim.keymap.set("i", "<C-x>;", "<Plug>(emmet-expand-word)", { remap = true, silent = true })
    vim.keymap.set("i", "<C-x>a", "<Plug>(emmet-anchorize-url)", { remap = true, silent = true })
    vim.keymap.set("i", "<C-x>A", "<Plug>(emmet-anchorize-summary)", { remap = true, silent = true })
end

-- https://github.com/tpope/vim-markdown
vim.g.markdown_fenced_languages = {
    "bash=sh",
    "sass",
    "scss",
    "css",
    "html",
    "xml",
    "erb=eruby",
    "ruby",
    "javascript",
    "js=javascript",
    "json=javascript",
    "python",
    "sql",
    "vim",
}

-- https://github.com/pangloss/vim-javascript
vim.g.javascript_plugin_jsdoc = 1
vim.g.javascript_plugin_flow = 1

-- Ruby speedup
-- vim.g.ruby_no_expensive = 1
vim.g.rubycomplete_buffer_loading = 0
vim.g.rubycomplete_classes_in_global = 0
vim.g.rubycomplete_rails = 0

-- Disable custom rails syntax highlighting
-- vim.g.rails_syntax = 0

-- Opererator syntax highlighting
-- vim.g.ruby_operators = 1

if Plugged("vim-projectionist") then
    -- https://github.com/tpope/vim-projectionist
    vim.g.projectionist_ignore_ = 1
end

if Plugged("vim-rake") then
    -- https://github.com/tpope/vim-rake
    vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "Rake",
        callback = function()
            vim.keymap.set("n", "<Leader>ba", "<Cmd>AE<CR>", { buffer = true, silent = true })
            vim.keymap.set("n", "<Leader>br", "<Cmd>RE<CR>", { buffer = true, silent = true })
        end,
    })
end

if Plugged("vim-rails") then
    -- https://github.com/tpope/vim-rails
    vim.g.Tlist_Ctags_Cmd = vim.g.zero_vim_ctags_bin

    vim.g.rails_projections = {
        ["app/controllers/*_controller.rb"] = {
            alternate = {
                "spec/requests/{}_spec.rb",
                "spec/requests/{}_request_spec.rb",
                "spec/requests/{}_controller_spec.rb",
                "spec/controllers/{}_controller_spec.rb",
            },
        },
        ["app/scopes/*_scopes.rb"] = {
            command = "scope",
            template = { "class {camelcase|capitalize|colons}Scopes", "end" },
            related = {
                "app/models/{}.rb",
            },
            test = {
                "spec/scopes/{}_scopes_spec.rb",
                "spec/models/{}_spec.rb",
            },
        },
        ["spec/requests/*_request_spec.rb"] = {
            alternate = {
                "app/controllers/{}_controller.rb",
            },
        },
        ["spec/requests/*_spec.rb"] = {
            alternate = {
                "app/controllers/{}.rb",
                "app/controllers/{}_controller.rb",
            },
        },
        ["spec/routing/*_routing_spec.rb"] = {
            alternate = {
                "app/controllers/{}_controller.rb",
            },
        },
        ["spec/routing/*_spec.rb"] = {
            alternate = {
                "app/controllers/{}.rb",
                "app/controllers/{}_controller.rb",
            },
        },
    }

    vim.api.nvim_create_autocmd("User", {
        group = "MyAutoCmd",
        pattern = "Rails",
        callback = function()
            vim.keymap.set("n", "<Leader>ba", "<Cmd>AE<CR>", { buffer = true, silent = true })
            vim.keymap.set("n", "<Leader>br", "<Cmd>RE<CR>", { buffer = true, silent = true })
        end,
    })
end

if Plugged("vim-rubocop") then
    -- https://github.com/phongnh/vim-rubocop
    vim.g.vimrubocop_keymap = 0

    vim.keymap.set("n", "<Leader>rp", "<Cmd>RuboCopProject<CR>", { silent = true })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "ruby",
        command = "nnoremap <buffer> <silent> <Leader>ru :<C-u>RuboCop<CR>",
    })
end

if Plugged("vim-reek") then
    -- https://github.com/phongnh/vim-reek
    vim.g.reek_always_show = 1
    vim.g.reek_line_limit = 1000
    vim.g.reek_on_loading = 0

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "ruby",
        command = "nnoremap <buffer> <silent> <Leader>re :<C-u>RunReek<CR>",
    })
end

-- https://github.com/vim-crystal/vim-crystal
vim.g.crystal_enable_completion = 0

if Plugged("vim-go") then
    -- https://github.com/fatih/vim-go
    vim.g.go_fmt_command = vim.g.go_fmt_command or "gopls" -- goimports
    vim.g.go_fmt_fail_silently = 1

    -- Toggle more highlight options
    vim.g.go_highlights_enabled = 0

    -- These highlights are enabled by default
    -- vim.g.go_highlight_string_spellcheck   = 1
    -- vim.g.go_highlight_format_strings      = 1
    -- vim.g.go_highlight_diagnostic_errors   = 1
    -- vim.g.go_highlight_diagnostic_warnings = 1
    -- vim.g.go_highlight_debug               = 1

    vim.api.nvim_create_user_command("ToggleGoHighlights", function(opts)
        vim.g.go_highlights_enabled = 1 - vim.g.go_highlights_enabled
        -- vim.g.go_highlight_array_whitespace_error    = vim.g.go_highlights_enabled
        -- vim.g.go_highlight_chan_whitespace_error     = vim.g.go_highlights_enabled
        vim.g.go_highlight_extra_types = vim.g.go_highlights_enabled
        -- vim.g.go_highlight_space_tab_error           = vim.g.go_highlights_enabled
        -- vim.g.go_highlight_trailing_whitespace_error = vim.g.go_highlights_enabled
        -- vim.g.go_highlight_operators                 = vim.g.go_highlights_enabled
        vim.g.go_highlight_functions = vim.g.go_highlights_enabled
        vim.g.go_highlight_function_parameters = vim.g.go_highlights_enabled
        vim.g.go_highlight_function_calls = vim.g.go_highlights_enabled
        vim.g.go_highlight_fields = vim.g.go_highlights_enabled
        vim.g.go_highlight_types = vim.g.go_highlights_enabled
        vim.g.go_highlight_build_constraints = vim.g.go_highlights_enabled
        vim.g.go_highlight_generate_tags = vim.g.go_highlights_enabled
        -- vim.g.go_highlight_variable_assignments      = vim.g.go_highlights_enabled
        -- vim.g.go_highlight_variable_declarations     = vim.g.go_highlights_enabled
        vim.cmd("confirm edit")
        vim.cmd("redraw!")
        print(string.format("%s highlights!", vim.g.go_highlights_enabled == 1 and "Enabled" or "Disabled"))
    end, {})

    vim.cmd([[
    function! BuildGoFiles() abort
        let l:file = expand("%")
        if l:file =~# "^\f\+_test\.go$"
            call go#test#Test(0, 1)
        elseif l:file =~# "^\f\+\.go$"
            call go#cmd#Build(0)
        end
    endfunction
    ]])

    vim.api.nvim_create_autocmd("BufEnter", {
        group = "MyAutoCmd",
        pattern = "go.mod",
        callback = function()
            if vim.bo.filetype == "lprolog" then
                vim.bo.filetype = "gomod"
            end
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "gomod",
        callback = function()
            vim.keymap.set("n", "<Leader>bu", "<Cmd>update<CR><Cmd>GoModFmt<CR>", { buffer = true, silent = true })
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "go",
        callback = function()
            local bufnr = vim.api.nvim_get_current_buf()

            vim.api.nvim_buf_create_user_command(
                bufnr,
                "A",
                "call go#alternate#Switch(<bang>0, 'edit')",
                { bang = true }
            )

            vim.api.nvim_buf_create_user_command(
                bufnr,
                "AV",
                "call go#alternate#Switch(<bang>0, 'vsplit')",
                { bang = true }
            )

            vim.api.nvim_buf_create_user_command(
                bufnr,
                "AS",
                "call go#alternate#Switch(<bang>0, 'split')",
                { bang = true }
            )

            vim.api.nvim_buf_create_user_command(
                bufnr,
                "AT",
                "call go#alternate#Switch(<bang>0, 'tabedit')",
                { bang = true }
            )

            vim.keymap.set(
                "n",
                "<Plug>(go-smart-build)",
                ":<C-u>call BuildGoFiles()<CR>",
                { buffer = bufnr, silent = true }
            )

            if vim.fn.empty(vim.fn.mapcheck("<Plug>(go-run-split)")) == 1 then
                vim.keymap.set(
                    "n",
                    "<Plug>(go-run-split)",
                    ":<C-u>GoRun!<CR>:redraw<CR>",
                    { buffer = bufnr, silent = true }
                )
            end

            vim.keymap.set("n", "<Leader>ru", "<Plug>(go-run)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rs", "<Plug>(go-run-split)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rb", "<Plug>(go-smart-build)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rt", "<Plug>(go-test)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rf", "<Plug>(go-test-func)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rc", "<Plug>(go-coverage-toggle)", { buffer = bufnr, remap = true })

            vim.keymap.set("n", "<Leader>ri", "<Plug>(go-info)", { buffer = bufnr, remap = true })

            vim.keymap.set("n", "<Leader>re", "<Plug>(go-rename)", { buffer = bufnr, remap = true })

            if Plugged("fzf.vim") then
                vim.keymap.set("n", "<Leader>ro", "<Plug>(go-decls-dir)", { buffer = bufnr, remap = true })
            end

            vim.keymap.set("n", "<Leader>r]", "<Plug>(go-def)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>r[", "<Plug>(go-def-type)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rd", "<Plug>(go-doc-vertical)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rx", "<Plug>(go-doc-split)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rg", "<Plug>(go-doc-browser)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>rl", "<Plug>(go-metalinter)", { buffer = bufnr, remap = true })

            vim.keymap.set("n", "<Leader>ra", "<Plug>(go-alternate-edit)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>ba", "<Plug>(go-alternate-edit)", { buffer = bufnr, remap = true })
            vim.keymap.set("n", "<Leader>b=", "<Plug>(go-imports)", { buffer = bufnr, remap = true })

            vim.keymap.set("n", "g<", ":GoImport<Space>", { buffer = bufnr })
            vim.keymap.set("n", "g>", ":GoDrop<Space>", { buffer = bufnr })

            vim.keymap.set("n", "<Leader>rk", ":GoDocBrowser<Space>", { buffer = bufnr })
            vim.keymap.set("n", "<Leader>rh", ":ToggleGoHighlights<Space>", { buffer = bufnr, silent = true })
        end,
    })
end

if Plugged("rust.vim") then
    -- https://github.com/rust-lang/rust.vim
    vim.g.rustfmt_autosave = vim.g.rustfmt_autosave or 0

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "rust",
        callback = function()
            vim.keymap.set("n", "<Leader>bu", ":RustFmt <Bar> update<CR>", { buffer = true, silent = true })
        end,
    })
end

if Plugged("vim-elixir") then
    -- https://github.com/elixir-editors/vim-elixir
end

if Plugged("vim-textobj-elixir") then
    -- https://github.com/andyl/vim-textobj-elixir
    vim.g.textobj_elixir_no_default_key_mappings = 1

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "elixir",
        callback = function()
            vim.keymap.set({ "x", "o" }, "ae", "<Plug>(textobj-elixir-any-a)", { buffer = true, remap = true })
            vim.keymap.set({ "x", "o" }, "ie", "<Plug>(textobj-elixir-any-i)", { buffer = true, remap = true })
        end,
    })
end

if Plugged("vim-terraform") then
    -- https://github.com/hashivim/vim-terraform
    vim.g.terraform_fold_sections = 1
    vim.g.hcl_fold_sections = 1

    vim.api.nvim_create_autocmd("FileType", {
        group = "MyAutoCmd",
        pattern = "terraform",
        callback = function()
            vim.keymap.set("n", "<Leader>bu", "<Cmd>TerraformFmt<CR><Cmd>update<CR>", { buffer = true, silent = true })
        end,
    })
end

-- Filetype Settings
vim.api.nvim_create_augroup("ZeroVimFiletypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = { "vimrc.local", "*.vimrc.bundles", "*.vimrc.local" },
    command = "setfiletype vim",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = { "init.lua.local", ".init.lua.bundles", ".init.lua.local", "*.editor.lua.bundles", "*.editor.lua.local" },
    command = "setfiletype lua",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = "*.inky-haml",
    command = "setfiletype haml",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = "*.html.inky",
    command = "setlocal filetype=eruby.html",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = ".gemrc",
    command = "setfiletype yaml",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = { "tigrc", "*.tigrc" },
    command = "setfiletype tigrc",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = "ZeroVimFiletypes",
    pattern = "*.tmux.conf",
    command = "setfiletype tmux",
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = { "qf" },
    callback = function()
        vim.opt_local.cursorline = true
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = { "help" },
    callback = function()
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "fugitiveblame",
    callback = function()
        vim.opt_local.cursorline = true
        vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = true, silent = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.cursorline = true
        vim.opt_local.textwidth = 72
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "gitrebase",
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "gitconfig",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 8
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "pullrequest",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.cursorline = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "tigrc",
    callback = function()
        vim.opt_local.commentstring = "# %s"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "ZeroVimFiletypes",
    pattern = "json",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

if vim.fn.executable("jq") == 1 then
    vim.api.nvim_create_autocmd("FileType", {
        group = "ZeroVimFiletypes",
        pattern = "json",
        callback = function()
            vim.api.nvim_buf_create_user_command(0, "FormatJSON", ":%!jq -e -M <args> .", { bar = true, nargs = "?" })
        end,
    })
elseif vim.fn.executable("python3") == 1 then
    vim.api.nvim_create_autocmd("FileType", {
        group = "ZeroVimFiletypes",
        pattern = "json",
        callback = function()
            vim.api.nvim_buf_create_user_command(
                0,
                "FormatJSON",
                ":%!python3 -m json.tool <args>",
                { bar = true, nargs = "?" }
            )
        end,
    })
elseif vim.fn.executable("python") == 1 then
    vim.api.nvim_create_autocmd("FileType", {
        group = "ZeroVimFiletypes",
        pattern = "json",
        callback = function()
            vim.api.nvim_buf_create_user_command(
                0,
                "FormatJSON",
                ":%!python -m json.tool <args>",
                { bar = true, nargs = "?" }
            )
        end,
    })
end

if vim.fn.executable("xmllint") == 1 then
    vim.api.nvim_create_autocmd("FileType", {
        group = "ZeroVimFiletypes",
        pattern = "xml",
        callback = function()
            vim.api.nvim_buf_create_user_command(0, "FormatXML", function()
                local cmd = string.format(
                    [[silent! :%%!env XMLLINT_INDENT="%s" xmllint --format --recover - 2>/dev/null]],
                    string.rep(
                        " ",
                        vim.fn.exists("*shiftwidth") == 1 and vim.fn.shiftwidth() or vim.opt_local.shiftwidth
                    )
                )
                vim.cmd(cmd)
            end, { bar = true })
        end,
    })
end

vim.api.nvim_create_autocmd("FileType", {
    group = "MyAutoCmd",
    pattern = "*",
    callback = function()
        vim.api.nvim_create_augroup("ZeroVimFiletypesOnVimEnter", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = "ZeroVimFiletypesOnVimEnter",
            pattern = "ruby",
            callback = function()
                if vim.bo.omnifunc == "syntaxcomplete#Complete" then
                    vim.bo.omnifunc = ""
                end
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = "ZeroVimFiletypesOnVimEnter",
            pattern = { "sql" },
            callback = function()
                vim.bo.omnifunc = ""
            end,
        })
    end,
})

vim.api.nvim_exec_autocmds("User", { pattern = "ZeroVimSetup", modeline = false })

-- Zero Vim Profile settings
if not vim.g.zero_vim_profile and not vim.g.zero_vim_colorscheme then
    if vim.fn.empty(vim.env.ZERO_VIM_PROFILE) == 0 then
        vim.g.zero_vim_profile = vim.env.ZERO_VIM_PROFILE
    elseif vim.fn.empty(vim.env.TERM_PROFILE) == 0 then
        vim.g.zero_vim_profile = vim.env.TERM_PROFILE
    elseif vim.fn.empty(vim.env.ITERM_PROFILE) == 0 then
        vim.g.zero_vim_profile = vim.env.ITERM_PROFILE
    end
end

if vim.g.zero_vim_profile ~= nil then
    vim.g.zero_vim_profile = string.lower(vim.g.zero_vim_profile)

    vim.g.zero_vim_background = vim.g.zero_vim_background
        or (string.match(vim.g.zero_vim_profile, "light") and "light" or "dark")

    if string.match(vim.g.zero_vim_profile, "neosolarized") then
        vim.g.zero_vim_colorscheme = "NeoSolarized"
    elseif string.match(vim.g.zero_vim_profile, "osaka") then
        vim.g.solarized_style = vim.g.solarized_style or "storm"
        vim.g.zero_vim_colorscheme = "solarized-osaka"
    elseif string.match(vim.g.zero_vim_profile, "selenized") then
        vim.g.solarized_palette = "selenized"
        vim.g.solarized_theme = vim.g.solarized_theme or "neo"
        vim.g.zero_vim_colorscheme = "solarized"
    elseif string.match(vim.g.zero_vim_profile, "solarized") then
        vim.g.solarized_palette = "solarized"
        vim.g.solarized_theme = vim.g.solarized_theme or "neo"
        vim.g.zero_vim_colorscheme = "solarized"
    elseif string.match(vim.g.zero_vim_profile, "gruvbox") then
        vim.g.zero_vim_colorscheme = "gruvbox-material"
    elseif string.match(vim.g.zero_vim_profile, "everforest") then
        vim.g.zero_vim_colorscheme = "everforest"
    end
end

-- Transparent Colorschemes
vim.g.zero_vim_transparent_colorschemes = vim.g.zero_vim_transparent_colorschemes or vim.empty_dict()

-- https://github.com/ishan9299/nvim-solarized-lua
vim.g.solarized_italics = 1
vim.g.solarized_termtrans = vim.g.solarized_termtrans
    or vim.g.zero_vim_transparent_colorschemes["solarized"]
    or vim.g.zero_vim_transparent_background
vim.g.solarized_statusline = "flat"

if Plugged("solarized.nvim") then
    -- https://github.com/maxmx03/solarized.nvim
    require("solarized").setup({
        transparent = (vim.g.zero_vim_transparent_colorschemes["solarized"] or vim.g.zero_vim_transparent_background)
            > 0,
        palette = vim.g.solarized_palette, -- `solarized` | `selenized`
        theme = vim.g.solarized_theme, -- `neo` | `default`
        enables = {
            editor = true,
            syntax = true,
            bufferline = true,
            cmp = true,
            dashboard = true,
            diagnostic = true,
            gitsign = true,
            hop = true,
            indentblankline = true,
            lsp = true,
            lspsaga = true,
            mini = true,
            navic = true,
            neogit = true,
            neotree = true,
            noice = true,
            notify = true,
            semantic = true,
            telescope = true,
            todo = true,
            tree = true,
            treesitter = true,
            whichkey = true,
        },
    })
end

-- https://github.com/craftzdog/solarized-osaka.nvim
vim.g.solarized_osaka_transparent = (
    vim.g.zero_vim_transparent_colorschemes["solarized-osaka"] or vim.g.zero_vim_transparent_background
) > 0
require("solarized-osaka").setup({
    style = vim.g.solarized_style, -- `storm` | `moon` | `night` | `day`
    transparent = vim.g.solarized_osaka_transparent,
    terminal_colors = false,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = vim.g.solarized_osaka_transparent and "transparent" or "normal", -- "dark" | "transparent" | "normal"
        floats = vim.g.solarized_osaka_transparent and "transparent" or "normal", -- "dark" | "transparent" | "normal"
    },
    sidebars = {},
    on_colors = function(colors)
        -- Work-around for https://github.com/craftzdog/solarized-osaka.nvim/issues/18
        colors.terminal_black = colors.terminal_black or colors.bg
        colors.fg_dark = colors.fg_dark or colors.fg
    end,
})

-- https://github.com/Tsuzat/NeoSolarized.nvim
require("NeoSolarized").setup({
    style = vim.g.zero_vim_background or "dark",
    transparent = (vim.g.zero_vim_transparent_colorschemes["NeoSolarized"] or vim.g.zero_vim_transparent_background)
        > 0,
    terminal_colors = false,
    on_highlights = function(highlights, colors)
        -- Work-around for missing g:terminal_color_6
        if vim.o.background == "light" then
            colors.cyan = colors.cyan or 0x2aa198
        else
            colors.cyan = colors.cyan or 0x2aa198
        end
    end,
})

-- https://github.com/ellisonleao/gruvbox.nvim
require("gruvbox").setup({
    terminal_colors = false,
    bold = true,
    contrast = vim.g.gruvbox_constrast or "hard", -- "hard", "soft" or empty string
    transparent_mode = (
        vim.g.gruvbox_transparent_background
        or vim.g.zero_vim_transparent_colorschemes["gruvbox"]
        or vim.g.zero_vim_transparent_background
    ) > 0,
})

-- https://github.com/f4z3r/gruvbox-material.nvim
require("gruvbox-material").setup({
    contrast = vim.g.gruvbox_material_background or "hard",
    background = {
        transparent = (
            vim.g.gruvbox_material_transparent_background
            or vim.g.zero_vim_transparent_colorschemes["gruvbox-material"]
            or vim.g.zero_vim_transparent_background
        ) > 0,
    },
})

-- https://github.com/neanias/everforest-nvim
require("everforest").setup({
    background = vim.g.everforest_background or "hard",
    transparent_background_level = (
        vim.g.everforest_transparent_background
        or vim.g.zero_vim_transparent_colorschemes["everforest"]
        or vim.g.zero_vim_transparent_background
    ),
    italics = true,
    disable_italic_comments = false,
})

-- https://github.com/folke/tokyonight.nvim
require("tokyonight").setup({ style = "moon" })

-- https://github.com/catppuccin/nvim
require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = (
        vim.g.zero_vim_transparent_colorschemes["catppuccin"] or vim.g.zero_vim_transparent_background
    ) > 0,
    term_colors = false,
    integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
            enabled = true,
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
    },
})

-- https://github.com/EdenEast/nightfox.nvim
require("nightfox").setup({
    options = {
        transparent_mode = (
            vim.g.zero_vim_transparent_colorschemes["nightfox"] or vim.g.zero_vim_transparent_background
        ) > 0,
        terminal_colors = 0,
    },
})

-- Transparent WinSeparator
vim.api.nvim_create_autocmd("ColorScheme", {
    group = "MyAutoCmd",
    pattern = "*",
    command = "highlight WinSeparator ctermbg=NONE guibg=NONE",
})

-- Default colorscheme
local set_colorscheme = function()
    if vim.g.zero_vim_colorscheme ~= nil then
        if vim.g.zero_vim_background ~= nil then
            vim.o.background = vim.g.zero_vim_background
        end
        vim.cmd("colorscheme " .. vim.g.zero_vim_colorscheme)
    elseif vim.o.termguicolors then
        vim.g.gruvbox_material_palette = "original"
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox-material")
    else
        vim.o.background = "dark"
        vim.cmd("colorscheme habamax")
    end
end

if not pcall(set_colorscheme) then
    vim.o.background = "dark"
    vim.cmd("colorscheme habamax")
end

vim.o.secure = true

