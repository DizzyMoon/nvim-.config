require("project_nvim").setup {
      -- manually specify where your projects live (optional)
      -- you can also auto-detect Git roots
      manual_mode = false,
      detection_methods = { "pattern", "git" },
      patterns = { ".git", "Makefile", "package.json" },
    }
