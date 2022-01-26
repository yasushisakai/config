local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
keymap('i', 'jk', '<Esc>', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- normal mode keymap
local function nkm(key, target)
  keymap('n', key, target, opts)
end

nkm('gd', ':lua vim.lsp.buf.definition()<cr>')
nkm('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkm('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkm('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkm('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkm('gr', ':lua vim.lsp.buf.references()<cr>')
nkm('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkm('ga', ':lua vim.lsp.buf.code_action()<cr>')
nkm('g[', ':lua vim.lsp.buf.diagnostic.goto_prev()<cr>')
nkm('g]', ':lua vim.lsp.buf.diagnostic.goto_next()<cr>')
nkm('gf', ':lua vim.lsp.buf.formatting()<cr>')
nkm('K', ':lua vim.lsp.buf.hover()<cr>')
nkm('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkm('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nkm('j', 'gj')
nkm('k', 'gk')

-- autocommand for line_diagnostics
vim.cmd[[au CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focusable=false})]]

-- Telescope
nkm('<leader>f', ':Telescope find_files<cr>');
nkm('<leader>r', ':Telescope live_grep<cr>');
nkm('<leader>b', ':Telescope buffers<cr>');
nkm('<leader>h', ':Telescope help_tags<cr>');

-- exit from termianal with jk
keymap('n', '<leader>t', '<cmd>terminal<cr>', {})
keymap('t', 'jk', '<c-\\><c-n>', {})
