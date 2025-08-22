-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Remove auto comment on new lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

----------------------------<{ Line Breaking }
-- Enable break indent
vim.o.breakindent = true
-- Enable wrapping (natural by default)
vim.opt.wrap = true
-- Don't break words in the middle
vim.opt.linebreak = true
-- Make it break at spaces or punctuation nicely
vim.opt.breakat = " \t;:,!?"
-- Optional: visually indicate a wrapped line
vim.opt.showbreak = " ↳ " -- Or use '⤷ ', '… ', '-> ', etc.
----------------------------<{ END: Line Breaking }

-- Set default indentation settings
vim.opt.tabstop = 2 -- Number of visual spaces per TAB
vim.opt.shiftwidth = 2 -- Number of spaces to use for each autoindent
vim.opt.softtabstop = 2 -- Number of spaces Neovim uses when you hit <Tab>
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart autoindenting on new lines
vim.opt.autoindent = true -- Copy indent from current line when starting a new one

-- Folds
vim.opt.foldtext = ""
vim.opt.foldlevel = 99

-- Save and load folds automatically
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		local bufname = vim.api.nvim_buf_get_name(0)
		if bufname ~= "" and vim.bo.buftype == "" then
			vim.cmd("mkview")
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	command = "silent! loadview",
})

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 13

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
