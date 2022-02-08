require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use {'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/plenary.nvim'}},
		config = function()
			vim.cmd [[
				nnoremap <leader>f :Telescope find_files<cr>
				nnoremap <leader>r :Telescope live_grep<cr>
				nnoremap <leader>b :Telescope buffers<cr>
				nnoremap <leader>h :Telescope help_tags<cr>
			]]
		end,
		keys = { 
			{"n", "<leader>f"}, 
			{"n", "<leader>r"}, 
			{"n", "<leader>b"}, 
			{"n", "<leader>h"}
		},
	}

	-- per language settings can be found in lspconfig.lua
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'

	use 'simrat39/rust-tools.nvim'

	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'

	use {'arcticicestudio/nord-vim',
	config = function() 
		vim.cmd[[colorscheme nord]]
	end
	}

end)
