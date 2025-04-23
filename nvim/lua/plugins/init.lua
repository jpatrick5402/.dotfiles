-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("configs.everforest")
		end,
	},

	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
		lazy = false,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = function()
			require("configs.toggleterm")
		end,
	},

	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for v0.4.0+
			"nvim-tree/nvim-web-devicons", -- If you want devicons
			"stevearc/resession.nvim", -- Optional, for persistent history
		},
		config = function()
			require("configs.cokeline")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("configs.nvim-tree")
		end,
	},
}
