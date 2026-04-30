return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters.pyrefly = {
            cmd = "pyrefly",
            stdin = false,
            args = {},
            stream = "stdout",
            parser = require("lint.parser").from_pattern(
                [[(.+):(%d+):(%d+): (.+)]],
                { "file", "lnum", "col", "message" }
            ),
        }

        lint.linters_by_ft = {
            python = { "pyrefly" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
