vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>ef', ':Explore<CR>')
vim.keymap.set({ 'n', 'v' }, "<leader>y", [["+y]])
vim.keymap.set({ 'n', 'v' }, "<leader>yy", [["+yy]])
vim.keymap.set({ 'n' }, '<leader>Y', [["+Y]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

