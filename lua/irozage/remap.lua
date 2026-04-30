vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)   

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Paste over voids removed
vim.keymap.set("n", "<leader>p", "\"_dP")

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Change project
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Floating diagnostic
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
    desc = "Show full diagnostic"
})

-- Toggle Claude Code
vim.keymap.set("n", "<leader>cc", '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })

-- Force normal mode (Claude is an evil bitch who will steal my cursor)
vim.keymap.set("t", "<C-,>", [[<C-\><C-n>]])

-- Make sure treesitter textobjects are installed and configured
-- Then, set gD in normal mode to jump to the next class
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration) 
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)


-- Rename variable
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
-- Switch project
vim.keymap.set("n", "<leader>pp", function()
    require("telescope").extensions.projects.projects()
end, {noremap = true, silent = true})
