return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-g>"] = require("telescope.actions").close,
            -- ["<C-j>"] = require("telescope.actions").move_selection_next,
            -- ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "file", "--color", "never", "--hidden" },
          },
        },
      },
    },
  },
}
