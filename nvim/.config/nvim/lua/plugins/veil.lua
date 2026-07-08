return {
	"Gentleman-Programming/veil.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("veil").setup({
			auto_enable = true,
			keymaps = {
				toggle = "<leader>tv",
				peek = "<leader>tp",
			},
		})
	end,
}
