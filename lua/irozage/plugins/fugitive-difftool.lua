return {
    "jecaro/fugitive-difftool.nvim",
    config = function()
        local fd = require("fugitive-difftool")

        local function has_difftool_context(index)
            local qf = vim.fn.getqflist({ context = 0, size = 0 })
            local context = qf.context
            return context
                and context.items
                and context.items[index]
                and context.items[index].diff
        end

        local function run_difftool(fn, index)
            if not has_difftool_context(index) then
                vim.notify(
                    "No Fugitive difftool entry at this quickfix position",
                    vim.log.levels.WARN
                )
                return
            end
            fn()
        end

        vim.api.nvim_create_user_command("Gcfir", function()
            run_difftool(fd.git_cfir, 1)
        end, {})
        vim.api.nvim_create_user_command("Gcla", function()
            run_difftool(fd.git_cla, vim.fn.getqflist({ size = 0 }).size)
        end, {})
        vim.api.nvim_create_user_command("Gcn", function()
            run_difftool(fd.git_cn, vim.fn.getqflist({ idx = 0 }).idx + 1)
        end, {})
        vim.api.nvim_create_user_command("Gcp", function()
            run_difftool(fd.git_cp, vim.fn.getqflist({ idx = 0 }).idx - 1)
        end, {})
        vim.api.nvim_create_user_command("Gcc", function()
            run_difftool(fd.git_cc, vim.fn.getqflist({ idx = 0 }).idx)
        end, {})
        vim.api.nvim_create_user_command("Gcdiff", function()
            local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
            local base = vim.fn.system({ "git", "symbolic-ref", "--quiet", "--short", "refs/remotes/origin/HEAD" })
                :gsub("\n", "")
                :gsub("^origin/", "")
            if vim.v.shell_error ~= 0 then
                for _, candidate in ipairs({ "main", "master" }) do
                    vim.fn.system({ "git", "rev-parse", "--verify", "--quiet", candidate })
                    if vim.v.shell_error == 0 then
                        base = candidate
                        break
                    end
                end
            end
            if base == "" then
                vim.notify("Could not determine this repository's default branch", vim.log.levels.WARN)
                return
            end
            vim.cmd("Git! difftool --name-status " .. base .. "..." .. branch)
            run_difftool(fd.git_cfir, 1)
        end, { desc = "Diff current branch against the default branch" })
    end,
}
