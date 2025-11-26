return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		},

		config = function()
			local cmp = require('cmp')
			local luasnip = require('luasnip')

			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- ["<Tab>"] = cmp.mapping.select_next_item(),
					-- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
					{ name = 'path' },
				})
			})
		end,
	},
	{
		'zbirenbaum/copilot.lua',
		cmd = 'Copilot',
		event = "InsertEnter",

		config = function()
			require('copilot').setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-Space>",
					},
				},
				panel = { enabled = true },
				filetypes = {
					javascript = true,
					json = true,
					css = true,
					html = true,
					ejs = true,
				}
			})
		end
	},
	{
		'rafamadriz/friendly-snippets',
		dependencies = { 'L3MON4D3/LuaSnip' },

		config = function()
			require('luasnip').filetype_extend('ejs', { 'html' })
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	}
}
