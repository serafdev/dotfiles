vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Package Manager
  -- NOTE: Run ':PackerSync' after modifying (add/modify/delete) packages
  use 'wbthomason/packer.nvim'

  use {
	  -- Files fuzzy finder (<leader>pf)
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

 use ({
	 -- Theme
	 'rmehri01/onenord.nvim',
	 as = "onenord",
	 config = function()
		vim.cmd.colorscheme('onenord')
		vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
	 end
 })

 use ( 
	 'nvim-treesitter/nvim-treesitter',
	 {	 run = ':TSUpdate' }
 )

 use ( 	 'nvim-treesitter/playground')
 use ( 	 'mbbill/undotree' )
 use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }


end)
