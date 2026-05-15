-- Save all and close all buffers
vim.api.nvim_set_keymap("n", "<F2>", ":wa<CR>:qa<CR>", { noremap = true })

-- Switch between toggleterm terminals
vim.api.nvim_set_keymap("n", "<C-1>", ":ToggleTerm 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-2>", ":ToggleTerm 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-3>", ":ToggleTerm 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-4>", ":ToggleTerm 4<CR>", { noremap = true, silent = true })

-- example using cokeline's `bufswitch` command (adjust to your setup)
--
