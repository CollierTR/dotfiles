return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gs", "<cmd>Gstatus<CR>", desc = "Git [s]tatus" },
    { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git [c]ommit" },
    { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git [d]iff" },
    { "<leader>gl", "<cmd>Gclog<CR>", desc = "Git [l]og (file)" },
    { "<leader>gp", "<cmd>Git push<CR>", desc = "Git [p]ush" },
  },
}
