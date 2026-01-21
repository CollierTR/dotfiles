-- NVIM tree

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "right",
        width = 40,
      },
      filters = {
        git_ignored = false,
        dotfiles = false,
      },
    })
  end,
}
