-- packer bootstrap --
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- packer packages
require('packer').reset()
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	}
	use 'andweeb/presence.nvim'
	use {'kaarmu/typst.vim', ft = {'typst'}}
	use 'mfussenegger/nvim-dap'
	use 'nvim-tree/nvim-web-devicons'
	use 'elkowar/yuck.vim'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use 'romgrk/barbar.nvim'
	use 'lewis6991/gitsigns.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use{
    		"kdheepak/lazygit.nvim",
    		-- optional for floating window border decoration
    		requires = {
    		    "nvim-lua/plenary.nvim",
    		},
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
		require('Comment').setup()
    		end
	}
	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
		}
	use 'ms-jpq/chadtree'
	use {
 		 "amrbashir/nvim-docs-view",
 		 opt = true,
 		 cmd = { "DocsViewToggle" },
 		 config = function()
 		   require("docs-view").setup {
 		     position = "right",
 		     width = 60,
 		   }
 		 end
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {'ms-jpq/coq_nvim', branch = 'coq'}
	use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
	use {'ms-jpq/coq.thirdparty', branch = '3p'}
	use 'neovim/nvim-lspconfig'
    	use {
      		'stevearc/oil.nvim',
		config = function() require('oil').setup() end
		}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
