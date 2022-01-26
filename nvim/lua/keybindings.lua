local keymap = vim.api.nvim_set_keymap
local opts = {noremap=true}

local function nkeymap (key, target)
	keymap('n', key, target, opts)
end

vim.g.mapleader = " "
keymap('i', 'jk', '<Esc>', opts)

-- in/out terminal
nkeymap('<leader>t','<cmd>termainal<cr>',{})
keymap('t', 'jk', '<c-\\><c-n>', {})

