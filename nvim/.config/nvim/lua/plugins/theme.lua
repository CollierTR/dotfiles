return {
	{ "rebelot/kanagawa.nvim" },
	{ "luisiacc/the-matrix.nvim" },
	{ "AlexvZyl/nordic.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		init = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
