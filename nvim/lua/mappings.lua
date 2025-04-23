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

vim.keymap.set("n", "<space>bx", "<cmd>bdelete<CR>", {
	desc = "close buffer",
})
vim.keymap.set("n", "<space>bn", "<cmd>enew<CR>", {
	desc = "new buffer",
})

vim.keymap.set("n", "<space>qq", "<cmd>qa<CR>", {
	desc = "quit all",
})
