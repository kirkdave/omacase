return {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
        style = "night",
        styles = {
            functions = {},
        },
    },
    init = function()
        vim.cmd.colorscheme "tokyonight-night"
        vim.cmd.hi "Comment gui=none"
    end,
}
