vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Package Manager
    -- NOTE: Run ':PackerSync' after modifying (add/modify/delete) packages
    use 'wbthomason/packer.nvim'

    use {
        -- Files fuzzy finder (<leader>pf)
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        -- Theme
        'rmehri01/onenord.nvim',
        as = "onenord",
        config = function()
            vim.cmd.colorscheme('onenord')
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    })

    use(
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    )

    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup {}
    end
    }
end)
