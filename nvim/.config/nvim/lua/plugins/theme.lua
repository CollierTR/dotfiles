return {
	{ "rebelot/kanagawa.nvim" },
	{ "luisiacc/the-matrix.nvim" },
	{ "AlexvZyl/nordic.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "sainnhe/gruvbox-material" },
	{ "trapd00r/neverland-vim-theme" },
	{ "zabanaa/neuromancer.vim" },
	{ "ayaz-amin/cyberpunk.nvim" },
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
