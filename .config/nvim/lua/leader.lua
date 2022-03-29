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
map("n", "<Leader>ps", ":PackerSync<CR>")

-- Neogit commands
-- :Neogit (neogit status)
map("n", "<Leader>g", ":Neogit<CR>")
-- :Neogit commit (open commit popup)
map("n", "<Leader>c", ":Neogit commit<CR>")


-- Telescope commands
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>fr", ":Telescope repo list<CR>")

