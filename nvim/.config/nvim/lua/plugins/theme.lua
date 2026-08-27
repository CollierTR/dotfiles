return {
	{ "rebelot/kanagawa.nvim" },
	{ "luisiacc/the-matrix.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "xero/miasma.nvim" },
	{ "xero/evangelion.nvim" },
	{ "thallada/farout.nvim" },
	{ "ptdewey/darkearth-nvim" },
	{ "mrpbennett/vault" },
	{ "CollierTR/specter.nvim" },
	{ "folke/tokyonight.nvim" },
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
