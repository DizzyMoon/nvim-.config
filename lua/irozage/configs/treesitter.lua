require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "python", "javascript", "rust", "java"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,  -- optional
    disable = {},
    updatetime = 25, -- debounced time for highlighting nodes in playground from source code
  }
}
