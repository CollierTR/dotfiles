return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New File", ":ene <bar> startinsert <CR>"),
      dashboard.button("r", "  Recently Opened", ":Telescope oldfiles <CR>"),
      dashboard.button("h", " confusing  Help", ":h <CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }
    return dashboard.opts
  end,
}
