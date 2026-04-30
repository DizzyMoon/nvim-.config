-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"git@github.com:folke/lazy.nvim.git", -- bootstrap SSH
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- Set 
require("irozage.set")
-- Setup plugins
require("lazy").setup("irozage.plugins")

-- Key remaps
require("irozage.remap")

-- Setup theme
require("irozage.configs.colors")
