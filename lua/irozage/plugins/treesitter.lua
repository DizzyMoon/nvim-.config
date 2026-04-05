return 
{
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	sync_install = false,
	auto_install = true,
	highlight = {enable = true, additional_vim_regex_highlighting = false},
	indent = {enable = true},
	playground = {enable = true, disable = {}, updatetime = 25},
	config = function()
		require('irozage.configs.treesitter')
	end
}
