-- config for mini.nvim modules --

local minisessions_opts = {
		directory = "~/.config/nvim/sessions"
}



return {
	{
		'echasnovski/mini.nvim', version = false, lazy = false,
		keys = {
			{"<leader>n", function()
				MiniFiles.open()
			end
			, desc = "open mini.files"
			},
			{"<leader>fg", "<cmd>Pick grep_live <cr>"},
			{"<leader>ff", "<cmd>Pick file <cr>"},
			{"<leader>mk", function() MiniSessions.write(vim.fn.input("Session Name > ")) end}

		},
		config = function()
			require("mini.files").setup()
			require('mini.indentscope').setup()
			require("mini.sessions").setup(minisessions_opts)
			require("mini.starter").setup()
			require('mini.git').setup()
			require("mini.pairs").setup()
			require('mini.pick').setup()
			require('mini.surround').setup()
		end,
	},
}
