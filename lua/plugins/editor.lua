
return {
	{
    	"slugbyte/lackluster.nvim",
    	lazy = false,
    	priority = 1000,
    	init = function()
    	    vim.cmd.colorscheme("lackluster-night")
    	    -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    	    -- vim.cmd.colorscheme("lackluster-mint")
    	end,
	},

	{
	    'nvim-lualine/lualine.nvim', priority = 911, opts = {options = {
		    component_separators = {left = "", right = ""},
		    section_separators = {left = "", right = ""}
	    }},
	    dependencies = { 'nvim-tree/nvim-web-devicons' },
	    lazy = false,
	    opts = {
			options = {theme = "lackluster"}
		}
	},
	 {
	  "kdheepak/lazygit.nvim",
	  cmd = {
	    "LazyGit",
	    "LazyGitConfig",
	    "LazyGitCurrentFile",
	    "LazyGitFilter",
	    "LazyGitFilterCurrentFile",
	  },
	  -- optional for floating window border decoration
	  dependencies = {
	    "nvim-lua/plenary.nvim",
	  },
	  -- setting the keybinding for LazyGit with 'keys' is recommended in
	  -- order to load the plugin when the command is run for the first time
	  keys = {
	    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	  }
	},

	{'romgrk/barbar.nvim',
	    dependencies = {
	      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
	      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	    },
	    init = function() vim.g.barbar_auto_setup = false end,
	    opts = {},
	    version = '^1.0.0', -- optional: only update when a new 1.x version is released
	  },
	{
    	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
    	config = function ()
    	  local configs = require("nvim-treesitter.configs")

    	  configs.setup({
    	      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "zig"},
    	      sync_install = false,
    	      highlight = { enable = true },
    	      indent = { enable = true },
    	    })
    	end
 	},
}
