return {
	"johnpgr/bible-reader.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("bible-reader").setup({
			format = {
				max_line_length = 80, -- Maximum line length for text wrapping (default: 80)
				indent_size = 0, -- Number of spaces to indent wrapped lines (default: 0)
				verse_spacing = 0, -- Number of lines between verses (default: 0)
				chapter_header = true, -- Whether to show chapter headers (default: true)
				break_verses = true, -- Whether to start each verse on a new line (default: true)
			},
			-- Default translation (e.g., 'en_kjv' for King James Version)
			default_translation = "en_kjv",
			-- UI language (default: 'en')
			language = "en",
		})
	end,
}
