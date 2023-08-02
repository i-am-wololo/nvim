require('keybinds');
require('indent');
require('richpresence');
require('bar');
require('lsp');
require('start');


vim.wo.number = true
vim.o.clipboard = "unnamedplus"


require('Comment').setup()
vim.cmd("colorscheme tokyonight-night")


-- hack to disable semantics for every lsp
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args) local client = vim.lsp.get_client_by_id(args.data.client_id) client.server_capabilities.semanticTokensProvider = nil end, });

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
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'andweeb/presence.nvim'
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
	
	use 'ms-jpq/coq_nvim'
	use 'neovim/nvim-lspconfig'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
