return require('packer').startup(function()
-- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
