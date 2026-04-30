return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        require("toggleterm").setup({
            direction = "float",
            open_mapping = [[<c-t>]],
            float_opts = {
                border = "curved", -- single | double | shadow | curved
                width = 100,
                height = 25,
                winblend = 3,
            },
        })
    end
}
