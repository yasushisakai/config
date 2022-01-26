require('packer').startup(function()

	use 'wbthomason/packer.nvim'

	use 'shaunsingh/nord.nvim'

	use {
	  'goolord/alpha-nvim',
	  requires = { 'kyazdani42/nvim-web-devicons' },
	  config = function ()
	      require'alpha'.setup(require'alpha.themes.startify'.config)
	      vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', {noremap = true})
	  end
	}
	use 'nvim-treesitter/nvim-treesitter'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'airblade/vim-rooter'
	use 'ciaranm/securemodelines'
	use 'machakann/vim-highlightedyank'

	-- language specific --
	-- rust
	use 'simrat39/rust-tools.nvim'
	use 'rust-lang/rust.vim'

	-- typescript
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	use 'jose-elias-alvarez/null-ls.nvim'

	use {'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require'lualine'.setup{
				options={theme='nord'}
			}
		end
		}
end)

vim.cmd[[colorscheme nord]]
