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
      REFACTOR = { icon = "🔧", color = "refactor", alt = { "refactor" } },
    },
    colors = {
      section = { "Section", "#0074ba" },
      refactor = { "Refactor", "#c9783e" },
    },
  },
  keys = {
    {
      "<leader>st",
      function()
        local config = require("todo-comments.config")
        local exclude = { SECT = true, NOTE = true, REFACTOR = true }
        local include = {}
        for kw, main in pairs(config.keywords) do
          if not exclude[main] then
            include[#include + 1] = kw
          end
        end
        require("todo-comments.search").setloclist({ keywords = table.concat(include, ",") })
      end,
      desc = "[S]earch [T]odos (loclist)",
    },
    {
      "<leader>sr",
      function()
        require("todo-comments.search").setloclist({ keywords = "REFACTOR" })
      end,
      desc = "[S]earch [R]efactor (loclist)",
    },
  },
}
