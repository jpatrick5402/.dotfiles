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
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
		},
	},

	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("configs.bufferline")
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
