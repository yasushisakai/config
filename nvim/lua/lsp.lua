
vim.cmd[[
set cot=menuone,noinsert,noselect
set shortmess+=c
]]

local nvim_lsp = require'lspconfig'

-- common 'on_attach' function
function on_attach(client, bufnr)
		local options = {noremap=true, silent = true}
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', options)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', options)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', options)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<cr>', options)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', options)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<cr>', options)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<cr>', options)

		vim.cmd[[
			au CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
		]]
end

-- rust
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

-- cmp
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
		  behavior = cmp.ConfirmBehavior.Insert,
		  select = true,
		})
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
})
