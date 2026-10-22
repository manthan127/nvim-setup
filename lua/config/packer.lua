-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', version = '*',
		requires = { {'nvim-lua/plenary.nvim'} },
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		branch = "main",
		build = ':TSUpdate',
	}

	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use {
		"mason-org/mason.nvim",
		requires = { "mason-org/mason-lspconfig.nvim" },
		opts = {}
	}
end)
