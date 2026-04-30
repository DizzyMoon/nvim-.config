return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	config = function()
		require("irozage/configs/nvim-cmp")
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",     -- LSP source
		"hrsh7th/cmp-buffer",       -- Buffer words
		"hrsh7th/cmp-path",         -- File paths
		"saadparwaiz1/cmp_luasnip", -- Snippets (optional)
		"L3MON4D3/LuaSnip"          -- Snippet engine
	}
}
