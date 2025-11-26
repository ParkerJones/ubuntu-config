-- Set leader key to space
vim.g.mapleader = ' ';
vim.g.maplocalleader = ' ';

-- Tab navigation
	-- Goto next/prev tab
	vim.keymap.set('n', '<leader>k', ':tabnext<CR>', { noremap = true, silent = true })
	vim.keymap.set('n', '<leader>j', ':tabprevious<CR>', { noremap = true, silent = true })
	-- Move tab left/right
	vim.keymap.set('n', '<leader><S-k>', ':tabmove +1<CR>', { noremap = true, silent = true })
	vim.keymap.set('n', '<leader><S-j>', ':tabmove -1<CR>', { noremap = true, silent = true })

-- LSP actions
	vim.keymap.set('n', '<leader>d', function()
		vim.diagnostic.open_float(nil, { focus = false })
	end, { desc = 'Show diagnostics in float' })

vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = 'LSP Hover' })

-- File browser (Telescope extension, replaces netrw)
	-- Open file browser in current file's directory, in the current tab
	vim.keymap.set('n', '<leader>e', function()
		local fb = require('telescope').extensions.file_browser.file_browser
		local path = vim.fn.expand('%:p:h')
		fb({ path = path, })
	end, { noremap = true, silent = true })

	-- Open file browser in current file's directory, in a new tab
	vim.keymap.set('n', '<leader>E', function()
		local fb = require('telescope').extensions.file_browser.file_browser
		local path = vim.fn.expand('%:p:h')

		vim.cmd('tabnew')
		fb({ path = path, })
	end, { noremap = true, silent = true })
