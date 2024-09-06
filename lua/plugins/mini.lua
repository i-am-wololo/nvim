-- config for mini.nvim modules --
minigit_opts = -- No need to copy this inside `setup()`. Will be used automatically.
{
  -- General CLI execution
  job = {
    -- Path to Git executable
    git_executable = 'git',

    -- Timeout (in ms) for each job before force quit
    timeout = 30000,
  },

  -- Options for `:Git` command
  command = {
    -- Default split direction
    split = 'auto',
  },
}

indentscope_opts = {
  draw = {
    delay = 100,

    priority = 2,
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Textobjects
    object_scope = 'ii',
    object_scope_with_border = 'ai',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '[i',
    goto_bottom = ']i',
  },

  -- Options which control scope computation
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent.
    -- Useful to see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,
    try_as_border = false,
  },

  -- Which character to use for drawing scope indicator
  symbol = '╎',
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
			{"<leader>ff", "<cmd>Pick files <cr>"},
			{"<leader>fg", "<cmd>Pick grep_live <cr>"}

		},
		config = function()
			require("mini.files").setup()
			require('mini.indentscope').setup()
			require('mini.git').setup()
			require("mini.pairs").setup()
			require('mini.pick').setup()
			require('mini.surround').setup()
			require('mini.sessions').setup()
		end,
	},
}
