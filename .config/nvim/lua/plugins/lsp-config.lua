return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup({
					ensure_installed = { "ts_ls", "lua_ls", "html" },
					automatic_installation = true,
			})

			local servers = {
				ts_ls = {
					cmd = { "typescript-language-server", "--stdio" },
					filetypes = { "javascript", "typescript" },
					root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
				},
				lua_ls = {
					cmd = { "lua-language-server" },
					filetypes = { "lua" },
					settings = {
						Lua = { diagnostics = { globals = { "vim" } } }
					},
					root_dir = vim.fs.root(0, { '.git' })
				},
				html = {
					cmd = { "vscode-html-language-server", "--stdio" },
					filetypes = { "html", "ejs" },
					root_dir = vim.fs.root(0, { ".git", }),
				}
			}

			for name, opts in pairs(servers) do
				opts.name = name
				opts.capabilities = capabilities
				vim.lsp.start(opts)
			end
		end,
	},
	{
			"neovim/nvim-lspconfig",
	},
}
