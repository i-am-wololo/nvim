require("oil").setup()
require('plugins')
require('keybinds');
require('indent');
require('tabs');
require('richpresence');
require('bar');
require('lsp');
require('start');
require('theme');
require('neovide');
require('gui');



vim.wo.number = true
vim.o.clipboard = "unnamedplus"
vim.opt.ignorecase = true

require('gitsigns').setup()
require('Comment').setup()
vim.cmd("colorscheme tokyonight")


-- hack to disable semantics for every lsp
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args) local client = vim.lsp.get_client_by_id(args.data.client_id) client.server_capabilities.semanticTokensProvider = nil end, });

-- packer bootstrap --

-- packer packages
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

