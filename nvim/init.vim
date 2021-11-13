
" nice refs:
" https://sharksforarms.dev/posts/neovim-rust/
" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim

call plug#begin('~/.config/nvim/plugged')

" official configurations for neovim LSP client
Plug 'neovim/nvim-lspconfig'

" This doesn't give auto complete by itself....

" we need a completion engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip' " and a snippet engine

" we need this engine to work with neovims lsp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
" we also want to autocomplete within buffers and file paths
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" rust
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" fuzzy finder
Plug 'nvim-telescope/telescope.nvim'

" root dir is project root
Plug 'airblade/vim-rooter'

" modelines
Plug 'ciaranm/securemodelines'

" start with 's' to initiate sneak
Plug 'justinmk/vim-sneak'

" show what was yanked
Plug 'machakann/vim-highlightedyank'

" gui enhancements
Plug 'shaunsingh/nord.nvim'
Plug 'hoob3rt/lualine.nvim' 

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""
" LSP

" letting rust-tools do it's thing for LSP
lua <<EOF
local nvim_lsp = require'lspconfig'

local options = {
	tools = {
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = ""
		},
	},

	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {command = "clippy"}
			}
		}
	},
}

require('rust-tools').setup(options)

EOF

" completion
lua <<EOF

local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = {
		['<S-Tab>'] = 
		function(fallback) 
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		['<Tab>'] = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
		end,
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'buffer' }
	}
})

EOF

""""""""""""""""""""""""""""""""""""""""""""
" general
filetype plugin indent on
set encoding=utf-8
set timeoutlen=300
set updatetime=300
set autoindent
set signcolumn=yes
set hidden
set splitright
set splitbelow
set mouse=a
set number

" file for undo
set undodir=~/.vimdid
set undofile

" set guifont=HackGenNerd:h10
set guifont=HackGenNerd:h18

""""""""""""""""""""""""""""""""""""""""""""
" key bindings
let mapleader = "\<Space>"
map ; :
noremap ;; ;
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" code navigation
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> [g <cmd>lua vim.lsp.buf.diagnostic.goto_prev()<cr>
nnoremap <silent> ]g <cmd>lua vim.lsp.buf.diagnostic.goto_next()<cr>
nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<cr>

au CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})

nnoremap <leader>m <cmd>lua vim.lsp.buf.rename()<cr>

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

nnoremap <leader><leader> <c-^>

map H ^
map L $

""""""""""""""""""""""""""""""""""""""""""""
" tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

""""""""""""""""""""""""""""""""""""""""""""
" search
set incsearch
set ignorecase
set smartcase
set gdefault

" search results in the middle
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> g* g*zz

""""""""""""""""""""""""""""""""""""""""""""
" auto complete
set completeopt=menuone,noinsert,noselect
set shortmess+=c

""""""""""""""""""""""""""""""""""""""""""""
" appearance

colorscheme nord

lua <<EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = {'|'},
    section_separators = {''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
  }
EOF

let g:nord_contrast = v:true
let g:nord_borders = v:true


" nvui
if exists('g:nvui')
  " Configure nvui
  NvuiCmdFontFamily HackGenNerd
  NvuiCmdFontSize 30
  NvuiScrollAnimationDuration 0.2
endif
