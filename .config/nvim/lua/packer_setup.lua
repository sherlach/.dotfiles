-- Bootstrap Snippet thanks to @Iron-E and @khuedoan
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

    -- Plugin Manager (crucial)
    -- https://github.com/wbthomason/packer.nvim
    -- Packer facilitates all this plugin goodness.
    use {
        'wbthomason/packer.nvim',
        run = ':PackerSync'
    }

    -- Important Stuff (dependencies)
    --
    -- https://github.com/nvim-lua/plenary.nvim
    -- Plenary provides useful functions that other Plugins depend on.
    use 'nvim-lua/plenary.nvim'

    -- https://github.com/nvim-treesitter/nvim-treesitter
    -- Treesitter gives other Plugins an intelligent way to "understand" text structure.
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- https://github.com/p00f/nvim-ts-rainbow
    -- Rainbow delimiters helps with nested functions 
    -- especially lisp
    use {
	    'p00f/nvim-ts-rainbow',
	    requires = 'nvim-treesitter/nvim-treesitter'
    }

    -- TODO - Set up the LSP
    -- https://github.com/neovim/nvim-lspconfig

    -- Git Integration:
    --
    -- https://github.com/TimUntersberger/neogit
    -- Negoit is Magit for Neovim, allowing us to interact
    -- easily with git.
    use { 
	'TimUntersberger/neogit', 
	requires = 'nvim-lua/plenary.nvim' 
    }

    -- https://github.com/lewis6991/gitsigns.nvim
    -- Gitsigns adds git decorations.
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
             require('gitsigns').setup()
        end
    }
    --
    --
    -- Utilities:
    --
    -- https://github.com/numToStr/Comment.nvim
    -- Comment allows for blocks and comments to be quickly added.
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    --
    -- Movement utilities:
    -- https://github.com/nvim-telescope/telescope.nvim
    -- Telescope allows for some fuzzy finding magic
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'}}
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'cljoly/telescope-repo.nvim'

    -- https://github.com/ggandor/lightspeed.nvim
    -- Intuitive movement motions with Lightspeed!
    use 'ggandor/lightspeed.nvim'

    --
    -- TODO Completion:
    -- https://github.com/hrsh7th/nvim-cmp
    --
    --
    --
    --
    -- Cosmetics 
    --
    -- https://github.com/folke/tokyonight.nvim
    -- TokyoNight is a dark colour scheme and theme.
    use 'folke/tokyonight.nvim'
    
    -- https://github.com/nvim-lualine/lualine.nvim
    --
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

--
-- https://github.com/elihunter173/dirbuf.nvim (if bad, replace with other filesystem interactor)
--
--
--
-- Goyo replacement:
-- https://github.com/pocco81/truezen.nvim
--
--
--
-- DOUBTFUL
-- https://github.com/f-person/git-blame.nvim 
-- https://github.com/lewis6991/gitsigns.nvim
-- ^(dpeends on neogit quality)
--
-- Org Modey stuff:
-- https://github.com/nvim-orgmode/orgmode
-- https://github.com/jubnzv/mdeval.nvim
-- ^ doesnt support lazy load
