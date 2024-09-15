

local servers = {
	"zls",
	"lua_ls",
	"somesass_ls",
	"emmet_language_server",
	"ast_grep",
	"rust_analyzer",
	"tinymist"


}



local mason_lspconfig_opts = {
	ensure_installed = servers
}


return {
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		priority = 990,
		dependencies = {
			{"williamboman/mason.nvim"},
			{"neovim/nvim-lspconfig"},
			{"ms-jpq/coq_nvim", branch = "coq" },
    			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ 'ms-jpq/coq.thirdparty', branch = "3p" }
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = "shut-up"
			}
		end,

		config = function()
			coq = require("coq")
			require("mason").setup()
			require("mason-lspconfig").setup(mason_lspconfig_opts)

			require("mason-lspconfig").setup_handlers {
				function (server_name)
					require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities{})
				end

			}




		end
	}



}
