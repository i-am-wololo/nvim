

local servers = {
	"zls",
	"lua_ls",
	"somesass_ls",
	"emmet_language_server"

}

local mason_lspconfig_opts = {
	ensure_installed = servers
}

return {
	{
		  "neovim/nvim-lspconfig",
		  lazy = false,
		  dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{"williamboman/mason.nvim", lazy = false, priority = 900,
			opts = {},
			},
			{"williamboman/mason-lspconfig.nvim",
				opts = mason_lspconfig_opts,
			},
		    { "ms-jpq/coq.artifacts", branch = "artifacts" },

		    { 'ms-jpq/coq.thirdparty', branch = "3p" }
		  },
		  init = function()
		    vim.g.coq_settings = {
		        auto_start = 'shut-up', -- if you want to start COQ at startup
		        -- Your COQ settings here
		    }
		  end,
		  	config = function()
				local lspconfig = require('lspconfig')
			   	for _, lsp in ipairs(servers) do
	  				lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({}))
					end
				end,
			},
}
