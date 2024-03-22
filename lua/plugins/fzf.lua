return {
  {
    "ibhagwan/fzf-lua",
    enabled = true,
    dependencies = {
      "junegunn/fzf",
      build = "./install --bin",
    },
    cmd = "FzfLua",
    keys = {
      {
        "<Leader>,",
        "<Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>",
        desc = "Switch Buffer",
      },
      { "<Leader>/", "<Cmd>FzfLua live_grep<CR>", desc = "Grep (root dir)" },
      { "<Leader>:", "<Cmd>FzfLua command_history<CR>", desc = "Command History" },
      { "<Leader><space>", "<Cmd>FzfLua files<CR>", desc = "Find Files (root dir)" },
      -- find
      { "<Leader>fb", "<Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR>", desc = "Buffers" },
      { "<Leader>fc", [[<Cmd>FzfLua files cwd=vim.fn.stdpath("config")<CR>]], desc = "Find Config File" },
      { "<Leader>ff", "<Cmd>FzfLua files<CR>", desc = "Find Files (root dir)" },
      { "<Leader>fF", "<Cmd>FzfLua files<CR>", desc = "Find Files (cwd)" },
      { "<Leader>fg", "<Cmd>FzfLua git_files<CR>", desc = "Find Files (git-files)" },
      { "<Leader>fr", "<Cmd>FzfLua oldfiles<CR>", desc = "Recent" },
      { "<Leader>fR", "<Cmd>FzfLua oldfiles cwd_only=true<CR>", desc = "Recent (cwd)" },
      -- git
      { "<Leader>gc", "<Cmd>FzfLua git_commits<CR>", desc = "commits" },
      { "<Leader>gs", "<Cmd>FzfLua git_status<CR>", desc = "status" },
      -- search
      { '<Leader>s"', "<Cmd>FzfLua registers<CR>", desc = "Registers" },
      { "<Leader>sa", "<Cmd>FzfLua autocmds<CR>", desc = "Auto Commands" },
      { "<Leader>sb", "<Cmd>FzfLua grep_curbuf<CR>", desc = "Buffer" },
      { "<Leader>sc", "<Cmd>FzfLua command_history<CR>", desc = "Command History" },
      { "<Leader>sC", "<Cmd>FzfLua commands<CR>", desc = "Commands" },
      { "<Leader>sd", "<Cmd>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
      { "<Leader>sD", "<Cmd>FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics" },
      { "<Leader>sg", "<Cmd>FzfLua live_grep", desc = "Grep (root dir)" },
      { "<Leader>sG", "<Cmd>FzfLua live_grep", desc = "Grep (cwd)" },
      { "<Leader>sh", "<Cmd>FzfLua help_tags<CR>", desc = "Help Pages" },
      { "<Leader>sH", "<Cmd>FzfLua highlights<CR>", desc = "Search Highlight Groups" },
      { "<Leader>sk", "<Cmd>FzfLua keymaps<CR>", desc = "Key Maps" },
      { "<Leader>sM", "<Cmd>FzfLua man_pages<CR>", desc = "Man Pages" },
      { "<Leader>sm", "<Cmd>FzfLua marks<CR>", desc = "Jump to Mark" },
      -- { "<Leader>so", "<Cmd>FzfLua vim_options<CR>", desc = "Options" },
      { "<Leader>sR", "<Cmd>FzfLua resume<CR>", desc = "Resume" },
      {
        "<Leader>sp",
        ":FzfLua grep_project search=<C-r><C-w><CR>",
        desc = "Word (root dir)",
      },
      { "<Leader>sw", "<Cmd>FzfLua grep_cword<CR>", desc = "Word (root dir)" },
      { "<Leader>sW", "<Cmd>FzfLua grep_cWORD<CR>", desc = "Word (cwd)" },
      { "<Leader>sw", "<Esc>:FzfLua grep_visual<CR>", mode = "v", desc = "Selection (root dir)" },
      { "<Leader>sW", "<Esc>:FzfLua grep_visual<CR>", mode = "v", desc = "Selection (cwd)" },
      { "<Leader>uC", "<Cmd>FzfLua colorschemes<CR>", desc = "Colorscheme with preview" },
    },
    opts = {
      "default",
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
        cmd = "fd --type file --color never --hidden --follow",
      },
      grep = {
        rg_opts = "--color always -H --no-heading --line-number --smart-case --hidden --max-columns=4096 --follow",
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
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "FzfLua files",                                             desc = " Find file",       icon = " ", key = "f" },
            { action = "enew | startinsert",                                       desc = " New file",        icon = " ", key = "n" },
            { action = "FzfLua oldfiles",                                          desc = " Recent files",    icon = " ", key = "r" },
            { action = "FzfLua live_grep",                                         desc = " Find text",       icon = " ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
