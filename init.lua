require('plugins');
require('oilconfig');
-- require('neorgcfg');
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
require('latex');
require('vimtexconfig');

vim.wo.number = true
vim.o.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.cmd("au BufWritePost * lua require('lint').try_lint()")
require('Comment').setup()
-- require('gitsigns').setup()

vim.opt = {
	tabstop = 1
}

-- hack to disable semantics for every lsp
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args) local client = vim.lsp.get_client_by_id(args.data.client_id) client.server_capabilities.semanticTokensProvider = nil end, });



