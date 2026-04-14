return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', "ahmedkhalf/project.nvim", build = 'make' },
	},
	lazy = false,  -- load immediately
	config = function()
		-- 1️⃣ Set up Telescope defaults to avoid previewer crashes
		require('telescope').setup{
			defaults = {
				layout_strategy = 'horizontal',
				layout_config = {
					width = 0.9,
					height = 0.85,
					preview_width = 0.6,
				},
			},
		}

        require("telescope").load_extension("projects")
		-- 2️⃣ Keymaps
		local builtin = require('telescope.builtin')
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { noremap = true, silent = true })
	end,
}
