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

-- Make sure treesitter textobjects are installed and configured
-- Then, set gD in normal mode to jump to the next class
vim.keymap.set('n', 'gD', function()
    require'nvim-treesitter.textobjects.move'.goto_next_start('@class.outer')
end, { desc = 'Jump to next class start' })


vim.keymap.set("n", "<leader>pp", function()
    require("telescope").extensions.projects.projects()
end, {noremap = true, silent = true})
