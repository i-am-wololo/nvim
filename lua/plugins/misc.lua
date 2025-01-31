return {
	{
		"nanotee/zoxide.vim",
		lazy = false,

	},

	{
	  "j-hui/fidget.nvim",
	  qpts = {
	    -- options
	  },
		lazy = false,
		priority = 992

	},
	-- {
	--   "folke/noice.nvim",
	--
	--   event = "VeryLazy",
	--   opts = {
	--     -- add any options here
	--   },
	--   dependencies = {
	--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--     "MunifTanjim/nui.nvim",
	--     -- OPTIONAL:
	--     --   `nvim-notify` is only needed, if you want to use the notification view.
	--     --   If not available, we use `mini` as the fallback
	--     "rcarriga/nvim-notify",
	--     }
	-- },
	--
	{
		'vyfor/cord.nvim',
	  	build = './build || .\\build',
	  	event = 'VeryLazy',
	  	opts = {
			display = {
				workspace_blacklist = {"mehdi"}
			}
		},
	},

}
