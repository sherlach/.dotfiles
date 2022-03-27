-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- make space the leader key
vim.g.mapleader = ' '

-- faster save with <leader>w
map("n", "<Leader>w", ":w!<CR>")

-- Refresh Packer (plugin manager)
-- :PackerSync binding
map("n", "<Leader>p", ":PackerSync<CR>")

-- Neogit commands
-- :Neogit (neogit status)
map("n", "<Leader>g", ":Neogit<CR>")
-- :Neogit commit (open commit popup)
map("n", "<Leader>c", ":Neogit commit<CR>")
