
return {
	{
		"rose-pine/neovim", name = "rose-pine", opts = rosepine_opts,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	{
	    'nvim-lualine/lualine.nvim', priority = 911, opts = {options = {
		    component_separators = {left = "", right = ""},
		    section_separators = {left = "", right = ""}
	    }},
	    dependencies = { 'nvim-tree/nvim-web-devicons' },
	    lazy = false
	},
}
