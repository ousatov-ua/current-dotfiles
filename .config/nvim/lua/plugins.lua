
vim.api.nvim_command("packadd packer.nvim")
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- use 'EdenEast/nightfox.nvim' -- syntax coloring
    -- use 'sainnhe/everforest' -- syntax coloring
    -- use 'ousatov-ua/everforest' -- syntax coloring
    -- use 'sainnhe/edge' -- syntax coloring
    -- use 'folke/tokyonight.nvim' -- syntax coloring
    use 'rmehri01/onenord.nvim' -- syntax coloring
    -- use 'projekt0n/github-nvim-theme' -- syntax coloring
    -- use 'doums/darcula' -- syntax coloring
    -- use 'savq/melange'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'tpope/vim-fugitive'
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-jdtls'

    -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'
end)

