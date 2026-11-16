vim.cmd [[packadd packer.nvim]]

-- Auto-sync on first run (no packer_compiled.lua yet)
local first_run = not vim.loop.fs_stat(
    vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
)

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	"rose-pine/neovim",
	as = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('lervag/vimtex')
  use('RRethy/vim-illuminate')
  use('nvim-tree/nvim-tree.lua')
  use('shellRaining/hlchunk.nvim')
  use {
      'nvim-lualine/lualine.nvim',
      require = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
      'OXY2DEV/markview.nvim',
      requires = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-tree/nvim-web-devicons',
      },
  }

  if first_run then
      require('packer').sync()
  end
end)
