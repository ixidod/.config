vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'hashivim/vim-terraform'
  use 'nvim-treesitter/nvim-treesitter'
  use 'fatih/vim-go'
  use 'windwp/nvim-autopairs'
  use 'alvan/vim-closetag'
  use 'mattn/emmet-vim'

  use { 'rose-pine/neovim', as = 'rose-pine' }

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

      -- Snippets
      { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
      { 'mlaursen/vim-react-snippets' },
      { 'SirVer/ultisnips' },
    },
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
end)
