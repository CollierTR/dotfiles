return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = "./.imgs",
      relative_to_current_file = true,
      use_absolute_path = false,
      prompt_for_file_name = false,
      insert_mode_after_paste = false,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
