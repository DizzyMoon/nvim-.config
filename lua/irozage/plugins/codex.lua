return {
    "johnseth97/codex.nvim",
    lazy = true,
    cmd = { "Codex", "CodexToggle" },
    keys = {
        {
            "<leader>cc",
            function()
                require("codex").toggle()
            end,
            desc = "Toggle Codex",
            mode = { "n", "t" },
        },
    },
    opts = {
        keymaps = {
            toggle = nil,
        },
    },
}
