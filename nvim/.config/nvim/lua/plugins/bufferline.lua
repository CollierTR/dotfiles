return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "tabs", -- set to "tabs" to make bufferline show a tab-like interface
      numbers = "none", -- disable buffer visible numbers
      indicator = {
        icon = "▎",
        style = "icon",
      },
      buffer_close_icon = "Dispose",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_average_window_width = 100,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      always_show_bufferline = true,
      separator_style = "thin",
      enforce_regular_tabs = true,
      -- offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left" } },
    },
  },
}
