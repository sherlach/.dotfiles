-- set numbering
vim.opt.number = true
vim.opt.relativenumber = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- better tabbing
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
