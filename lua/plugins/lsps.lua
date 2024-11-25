

local servers = {
	"zls",
	"lua_ls",
	"somesass_ls",
	"emmet_language_server",
	"ast_grep",
	"rust_analyzer",
	"tinymist",
	"mesonlsp",
	"clangd",
	"black",
	"python-lsp-server"


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
			local coq = require("coq")
			local lspconf = require("lspconfig")
			require("mason").setup()
			require("mason-lspconfig").setup(mason_lspconfig_opts)
			require("mason-lspconfig").setup_handlers {
				function (server_name)
					lspconf[server_name].setup(coq.lsp_ensure_capabilities{})
				end,

				["tinymist"] = function ()
					lspconf.tinymist.setup(coq.lsp_ensure_capabilities{
						offset_encoding = "utf-8",
						settings = {
							exportPdf = "onType",
							outputPath = "$root/$dir/target/$name"

						}

					})
				end

			}




		end
	},

	{"folke/trouble.nvim",
	  opts = {}, -- for default options, refer to the configuration section for custom setup.
	  cmd = "Trouble",
	  keys = {
	    {
	      "<leader>xx",
	      "<cmd>Trouble diagnostics toggle<cr>",
	      desc = "Diagnostics (Trouble)",
	    },
	    {
	      "<leader>xX",
	      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	      desc = "Buffer Diagnostics (Trouble)",
	    },
	    {
	      "<leader>cs",
	      "<cmd>Trouble symbols toggle focus=false<cr>",
	      desc = "Symbols (Trouble)",
	    },
	    {
	      "<leader>cl",
	      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	      desc = "LSP Definitions / references / ... (Trouble)",
	    },
	    {
	      "<leader>xL",
	      "<cmd>Trouble loclist toggle<cr>",
	      desc = "Location List (Trouble)",
	    },
	    {
	      "<leader>xQ",
	      "<cmd>Trouble qflist toggle<cr>",
	      desc = "Quickfix List (Trouble)",
	    },
	  },
	}


}
