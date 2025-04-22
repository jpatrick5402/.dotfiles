vim.keymap.set("n", "<space>e", require("nvim-tree.api").tree.toggle, {
	silent = true,
	desc = "toggle nvim-tree",
})

vim.keymap.set("n", "<space>bp", "<cmd>BufferLinePick<CR>", {
	desc = "pick a buffer",
})

vim.keymap.set("n", ";", ":", {
	desc = "command mode",
})
