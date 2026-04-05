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

require("irozage.remap")

-- ⚡ Pass git.url_format here!
require("lazy").setup("irozage.plugins")

require("irozage.configs.colors")
print("Hello")
