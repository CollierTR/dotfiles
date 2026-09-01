return --- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do
{ -- Adds git related signs to the gutter, as well as utilities for managing changes
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, lhs, rhs, opts)
        vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { buffer = bufnr }, opts or {}))
      end

      map("n", "<leader>ga", gitsigns.stage_hunk, { desc = "Git stage hunk" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git reset hunk" })
      map("v", "<leader>ga", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Git stage hunk" })
      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Git reset hunk" })
      map("n", "<leader>gA", gitsigns.stage_buffer, { desc = "Git stage buffer" })
      map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Git undo stage hunk" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git reset buffer" })
      map("n", "<leader>gP", gitsigns.preview_hunk, { desc = "Git preview hunk" })
      map("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "Git toggle line blame" })
      map("n", "<leader>gD", gitsigns.diffthis, { desc = "Git diff buffer" })
      map("n", "<leader>gB", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Git blame line" })
    end,
  },
}
