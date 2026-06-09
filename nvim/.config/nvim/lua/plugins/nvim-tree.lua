-- NVIM tree

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				side = "right",

				-- Dynamically resizes the tree window based on longest file name
				adaptive_size = true,

				-- Hard coded size
				-- width = 40,
			},
			filters = {
				git_ignored = false,
				dotfiles = false,
			},
		})
	end,
}
