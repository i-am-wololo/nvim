vim.g.mapleader = ','

-- jklm on azerty --
vim.keymap.set({'n','v',},'j', '<Left>')
vim.keymap.set({'n','v'}, 'k','<Down>')
vim.keymap.set({'n','v'},'l', '<Up>')
vim.keymap.set({'n','v'},'m', '<Right>')

-- moving window focus --
vim.keymap.set({'n','v',},'<S-j>', '<C-w>h')
vim.keymap.set({'n','v'}, '<S-k>','<C-w>j')
vim.keymap.set({'n','v'},'<S-l>', '<C-w>k')
vim.keymap.set({'n','v'},'<S-m>', '<C-w>l')
-- moving windows --
vim.keymap.set({'n','v'}, '<A-j>', '<C-W><S-h>')
vim.keymap.set({'n','v'}, '<A-k>', '<C-W><S-j>')
vim.keymap.set({'n','v'}, '<A-l>', '<C-W><S-k>')
vim.keymap.set({'n','v'}, '<A-m>', '<C-W><S-l>')

-- CHADtree
vim.keymap.set({'n','v'}, '<Leader>n', "<cmd>CHADopen<cr>")

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- lazygit --
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>')

-- docs view --
vim.keymap.set('n', '<leader>ds', '<cmd>DocsViewToggle<CR>')
