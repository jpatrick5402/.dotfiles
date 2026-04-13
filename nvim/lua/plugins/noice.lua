return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			views = {
				notify = {
					merge = true,
					timeout = 3000,
					stages = "fade",
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
