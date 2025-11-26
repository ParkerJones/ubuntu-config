require("config.options")
require("config.keymap")
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local argv = vim.fn.argv()
		if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
			local fb = require('telescope').extensions.file_browser.file_browser
			fb({
				path = argv[1],
				initial_mode = 'normal',
			})
		end
	end,
})

