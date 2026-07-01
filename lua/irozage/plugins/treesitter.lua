return 
{
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require('irozage.configs.treesitter')
	end
}
