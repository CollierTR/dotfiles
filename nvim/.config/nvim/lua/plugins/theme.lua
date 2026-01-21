return {
  { "rebelot/kanagawa.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
}
