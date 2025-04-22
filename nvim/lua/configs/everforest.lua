require("everforest").setup({
	background = "medium",
	transparent_background_level = 1,
	italics = true,
	disable_italic_comments = false,
	on_highlights = function(hl, _)
		hl["@string.special.symbol.ruby"] = { link = "@field" }
	end,
})
