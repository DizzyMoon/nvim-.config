return {
    "jecaro/fugitive-difftool.nvim",
    config = function()
        local fd = require("fugitive-difftool")
        vim.api.nvim_create_user_command("Gcfir", fd.git_cfir, {})
        vim.api.nvim_create_user_command("Gcla", fd.git_cla, {})
        vim.api.nvim_create_user_command("Gcn", fd.git_cn, {})
        vim.api.nvim_create_user_command("Gcp", fd.git_cp, {})
        vim.api.nvim_create_user_command("Gcc", fd.git_cc, {})
        vim.api.nvim_create_user_command("Gcdiff", function()
            local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
            vim.cmd("Git! difftool --name-status master..." .. branch)
            fd.git_cfir()
        end, { desc = "Diff current branch against master" })
    end,
}
