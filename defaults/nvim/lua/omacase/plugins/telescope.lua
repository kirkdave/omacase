return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        local km = vim.keymap

        km.set("n", "<leader>sf", builtin.git_files, { desc = "Search files in Git index" })
        km.set("n", "<leader>sa", builtin.find_files, { desc = "Search all files" })
        km.set("n", "<leader>sw", builtin.grep_string, { desc = "Grep for current word" })
        km.set("n", "<leader>sg", builtin.live_grep, { desc = "Find by Grep" })
        km.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
        km.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
        km.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
    end,
}
