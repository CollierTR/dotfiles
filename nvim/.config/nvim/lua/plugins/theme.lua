return {
	{ "rebelot/kanagawa.nvim" },
	{ "luisiacc/the-matrix.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "sainnhe/gruvbox-material" },
	{ "xero/miasma.nvim" },
	{ "xero/evangelion.nvim" },
	{ "thallada/farout.nvim" },
	{ "ptdewey/darkearth-nvim" },
	{ "mrpbennett/vault" },
	{
		dir = "/home/tristan/projects/nvim-theme",
		name = "tenebris.nvim",
	},
	{
		"CollierTR/specter.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme specter")
		end,
	},

	{ "folke/tokyonight.nvim" },
}
