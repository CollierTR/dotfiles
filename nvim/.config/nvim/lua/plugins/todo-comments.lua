return
-- Highlight todo, notes, etc in comments
{
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    keywords = {
      SECT = { icon = "🔷", color = "section", alt = { "SECTION", "sect", "section" } },
    },
    colors = {
      section = { "Section", "#0074ba" },
    },
  },
}
