-- Set tab length
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- Set relative line numbers
vim.opt.number = true;
vim.opt.relativenumber = true;

-- Set scroll offset
vim.opt.scrolloff = 8;
