-- lua/plugins/disable-tabline.lua
return {
  { "akinsho/bufferline.nvim", enabled = false },
  -- { "nvim-lualine/lualine.nvim", enabled = false }, -- not sure what this does....
  { "folke/noice.nvim", enabled = false },
  -- { "folke/snacks.nvim", enabled = false },
  { "nvim-mini/mini.animate", enabled = false },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
}
