vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'hashivim/vim-terraform'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'fatih/vim-go'
  use 'windwp/nvim-autopairs'
  use 'alvan/vim-closetag'

  use { 'rose-pine/neovim', as = 'rose-pine' }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-cmdline'

  use {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup()
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
end)
