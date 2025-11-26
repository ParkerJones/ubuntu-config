return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        defaults = {
			hidden = true,
			initial_mode = 'normal',
			scroll_strategy = 'limit',
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
            },
			n = {
              ["<C-h>"] = "which_key",
			},
          },
        },
		extensions = {
			file_browser = {
				hijack_netrw = true,
				initial_mode = 'normal',

				hidden = true,
				grouped = true,
				sorting_strategy = 'ascending',
				scroll_strategy = 'limit',
			},
		},
      }
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
