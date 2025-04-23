require("bufferline").setup({
	options = {
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = nil,
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 10,
		diagnostics = false,
		custom_filter = function(bufnr)
			-- if the result is false, this buffer will be shown, otherwise, this
			-- buffer will be hidden.

			-- filter out filetypes you don't want to see
			local exclude_ft = { "qf", "fugitive", "git" }
			local cur_ft = vim.bo[bufnr].filetype
			local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

			if should_filter then
				return false
			end

			return true
		end,
		show_buffer_icons = false,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "bar",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "id",
		offsets = {
			{
				filetype = "NvimTree",
				text = "FILE EXPLORER",
				highlight = "Directory",
				text_align = "center",
			},
		},
	},
	components = {
		{
			text = function(buffer)
				return " " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.unique_prefix
			end,
			fg = get_hex("Comment", "fg"),
			italic = true,
		},
		{
			text = function(buffer)
				return buffer.filename .. " "
			end,
			underline = function(buffer)
				return buffer.is_hovered and not buffer.is_focused
			end,
		},
		{
			text = "",
			on_click = function(_, _, _, _, buffer)
				buffer:delete()
			end,
		},
		{
			text = " ",
		},
	},
})
