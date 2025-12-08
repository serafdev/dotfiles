vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Package Manager
    -- NOTE: Run ':PackerSync' after modifying (add/modify/delete) packages
    use 'wbthomason/packer.nvim'

    use {
        -- Files fuzzy finder (<leader>pf)
        'nvim-telescope/telescope.nvim',
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
    use { 'TimUntersberger/neogit', tag = 'v0.0.1', requires = 'nvim-lua/plenary.nvim' } -- Pin for 0.9.x

    -- LSP and completion (using built-in vim.lsp instead of lspconfig)
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    
    -- Autocompletion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lua' }

    -- Snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }

    use { 'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup {}
    end
    }

    use({
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup()
        end,
    })
end)
