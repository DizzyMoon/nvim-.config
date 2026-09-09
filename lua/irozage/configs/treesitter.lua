local treesitter = require('nvim-treesitter')

treesitter.setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- Keep the existing parsers and include both Markdown parsers for rendering.
local languages = {
  'c', 'cpp', 'lua', 'python', 'javascript', 'rust', 'java',
  'cmake', 'csv', 'hyprlang', 'ini', 'make', 'yaml', 'vimdoc',
  'markdown', 'markdown_inline',
}
local initial_install = treesitter.install(languages)

local function attach(buf, lang)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end
  local current_lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
  if current_lang ~= lang then
    return
  end
  if pcall(vim.treesitter.start, buf, lang) then
    if vim.treesitter.query.get(lang, 'indents') then
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('IrozageTreesitter', { clear = true }),
  callback = function(event)
    local lang = vim.treesitter.language.get_lang(event.match)
    if not lang or not vim.list_contains(treesitter.get_available(), lang) then
      return
    end
    if vim.list_contains(treesitter.get_installed(), lang) then
      attach(event.buf, lang)
      return
    end
    -- Preserve automatic installation for newly encountered filetypes.
    local task = vim.list_contains(languages, lang) and initial_install
      or treesitter.install({ lang })
    task:await(function()
      vim.schedule(function()
        attach(event.buf, lang)
      end)
    end)
  end,
})
