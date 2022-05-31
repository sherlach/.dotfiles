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

-- TODO
-- keybinding to display date + battery level (shell script needed?)
-- want full timedate info + "81 Charging" for battery
map("n", "<Leader><Leader>", '<cmd>!date "%a %d %b @ %H:%M" & cat /sys/class/power_supply/BAT1/capacity<CR>')

--map("n", "<Leader>fp", "<cmd>lua require'telescope'.extensions.project.project{}<CR>")
