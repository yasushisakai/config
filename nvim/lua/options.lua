vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- I don't know why this is not working with 'vim.opt'
vim.cmd[[set noexpandtab]]

vim.opt.encoding = 'utf-8'
vim.opt.timeoutlen=300
vim.opt.updatetime=300
vim.opt.autoindent=true
vim.opt.signcolumn="yes"
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse="a"
vim.opt.number = true
vim.opt.undodir= vim.fn.getenv("HOME") .. "/.vimdid"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.relativenumber = true
vim.opt.number = true
