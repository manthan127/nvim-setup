-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

if jit then
    if jit.os == "OSX" then
        vim.fn.system("brew bundle --file=~/.config/nvim/Brewfile")
    elseif jit.os == "Linux" then
        print("This is Linux")
    elseif jit.os == "Windows" then
        print("This is Windows")
    end
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'

    use {
        'nvim-telescope/telescope.nvim', version = '*',
        requires = { {'nvim-lua/plenary.nvim'} },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        build = ':TSUpdate',
    }
    use {
        "mason-org/mason.nvim",
        requires = {
            "mason-org/mason-lspconfig.nvim"
        },
        opts = {}
    }
end)
