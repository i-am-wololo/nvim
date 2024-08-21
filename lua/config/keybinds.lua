
-- hklm on azerty --
vim.keymap.set({'n','v',},'h', '<Left>')
vim.keymap.set({'n','v'}, 'j','<Down>')
vim.keymap.set({'n','v'},'k', '<Up>')
vim.keymap.set({'n','v'},'l', '<Right>')

-- moving window focus --
vim.keymap.set({'n','v',},'<S-h>', '<C-w>h')
vim.keymap.set({'n','v'}, '<S-j>','<C-w>j')
vim.keymap.set({'n','v'},'<S-k>', '<C-w>k')
vim.keymap.set({'n','v'},'<S-l>', '<C-w>l')
-- moving windows --
vim.keymap.set({'n','v'}, '<A-h>', '<C-W><S-h>')
vim.keymap.set({'n','v'}, '<A-j>', '<C-W><S-j>')
vim.keymap.set({'n','v'}, '<A-k>', '<C-W><S-k>')
vim.keymap.set({'n','v'}, '<A-l>', '<C-W><S-l>')
