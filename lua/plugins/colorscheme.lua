return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add solarized
  { "maxmx03/solarized.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
}
