return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 100,

		config = function ()
			require('kanagawa').setup({
				compile = false,             -- enable compiling the colorscheme
				undercurl = true,            -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true},
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false,         -- do not set background color
				dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
				terminalColors = true,       -- define vim.g.terminal_color_{0,17}
				colors = {                   -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave",              -- Load "wave" theme
				background = {               -- map the value of 'background' option to a theme
					dark = "dragon",           -- try "dragon" !
					light = "lotus"
				},
			})

		vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate",

		config = function ()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					'lua',
					'html',
					'css',
					'javascript'
				},

				auto_install = true,
				highlight = { enable = true },
			})

			vim.filetype.add({
				extension = {
					ejs = 'html',
				},
			})
		end,
	},
}
