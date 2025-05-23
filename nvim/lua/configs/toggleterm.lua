require("toggleterm").setup({
	-- size can be a number or function which is passed the current terminal
	function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = "15", -- the percentage by which to lighten dark terminal background, default: -30
	shading_ratio = "1", -- the ratio of shading factor for light/dark terminal background, default: -3
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
	-- Change the default shell. Can be a string or a function returning a string
	shell = vim.o.shell,
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved",
		-- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
		row = 20,
		title_pos = "center",
	},
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
	responsiveness = {
		-- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
		-- instead of next to each other
		-- default = 0 which means the feature is turned off
		horizontal_breakpoint = 135,
	},
})
