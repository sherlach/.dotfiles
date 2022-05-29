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
map("n", "<Leader>w", "<cmd>w!<CR>")

-- clear highlighted searches quickly with <leader>/
map("n", "<Leader>/", "<cmd>let @/ = ''<CR>")

-- quickly open the terminal with <leader>t
map("n", "<Leader>t", "<cmd>terminal<CR>")


-- Refresh Packer (plugin manager)
-- :PackerSync binding
map("n", "<Leader>ps", "<cmd>PackerSync<CR>")

-- Neogit commands
-- :Neogit (neogit status)
map("n", "<Leader>g", "<cmd>Neogit<CR>")
-- :Neogit commit (open commit popup)
map("n", "<Leader>c", "<cmd>Neogit commit<CR>")

-- Telescope commands
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fw", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")


--map("n", "<Leader>fp", "<cmd>lua require'telescope'.extensions.project.project{}<CR>")
