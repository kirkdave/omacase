return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        delay = 0, --show mappings instantly
        icons = {
            mappings = true,
            keys = {},
            spec = {},
        },
    },
}
