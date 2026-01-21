return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "tokyonight",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = " indestructible" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_last_session = true,
      fmt = {
        -- your format settings
      },
    },
    sections = {
      -- your section settings
    },
    inactive_sections = {
      -- your inactive section settings
    },
    tabline = {
      -- your tabline settings
    },
    extensions = { "fugitive", "nvim-tree", "lazy" },
  },
}
