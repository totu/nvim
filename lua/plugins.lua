-- Packer shit
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use {'luisiacc/gruvbox-baby', branch = 'main'}

    use {
        "morhetz/gruvbox",
        as = "gruvbox",
        config = function()
            --vim.cmd("colorscheme gruvbox")
        end
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            --vim.cmd('colorscheme rose-pine')
        end
    })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use "mbbill/undotree"
    use "tpope/vim-fugitive"

    -- zero LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use "christoomey/vim-tmux-navigator"
    use "ntpeters/vim-better-whitespace"

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use "tpope/vim-commentary"
    use "xiyaowong/nvim-transparent"
    use "totu/robotframework-vim"
    use "totu/vim-log-highlighting"
    use "github/copilot.vim"
end)
