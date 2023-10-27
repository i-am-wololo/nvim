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
	use {
    		"nvim-neorg/neorg",
    		run = ":Neorg sync-parsers", -- This is the important bit!
    		config = function()
        	require("neorg").setup {
			load = {
        			["core.defaults"] = {}
    			}
        	}
    		end,
	}
	use 'wbthomason/packer.nvim'
	use 'andweeb/presence.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'lewis6991/gitsigns.nvim'
	use 'romgrk/barbar.nvim'
	use({
    		"kdheepak/lazygit.nvim",
    		-- optional for floating window border decoration
    		requires = {
    		    "nvim-lua/plenary.nvim",
    },
})
	use {
		'numToStr/Comment.nvim',
		config = function()
		require('Comment').setup()
    		end
	}
	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		config = function()
		require"startup".setup()
  	end
}
	use 'ms-jpq/chadtree'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'folke/tokyonight.nvim'
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
