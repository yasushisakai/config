local cmp = require'cmp'
cmp.setup({

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },

  mapping = {
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<Tab>'] = function(fallback)
      if cmp.visible()  then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
  },

  sources = {
    {name = 'nvim_lsp'},
    {name = 'vsnip'},
    {name = 'path'},
    {name = 'buffer'},
  }

})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig');

-- lua
nvim_lsp.sumneko_lua.setup{
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim', 'use'
				}
			},
			telemetry = {
				enable = false,
			}
		}
	}
}

-- typescript
nvim_lsp.tsserver.setup {
	capabilities = capabilities,
	init_options = require('nvim-lsp-ts-utils'),
	on_attach = function(client, bufnr)
		local ts_utils = require('nvim-lsp-ts-utils');
		-- client.resolved_capabilities.document_formatting = false
		-- client.resolved_capabilities.document_range_formatting = false
		ts_utils.setup()
		ts_utils.setup_client(client)
	end
}

local null_ls = require('null-ls')
local typescript_filetypes = {"typescript", "javascript", "tsx", "jsx" }
local sources = {
	null_ls.builtins.formatting.prettier.with({
		filetypes = typescript_filetypes
	}),
	null_ls.builtins.code_actions.eslint.with({
		filetypes = typescript_filetypes
	}),
	null_ls.builtins.diagnostics.eslint.with({
		filetypes = typescript_filetypes
	})
}

null_ls.setup({sources = sources})

-- rust
nvim_lsp.rust_analyzer.setup {
	capabilities = capabilities
}

local rust_tools = require('rust-tools')

rust_tools.setup({
	tools = {
		autoSetHints = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = ""
		}
	},
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {command = "clippy"}
			}
		}
	}
})

