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

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("OmacaseLspAttach", {}),
            callback = function(event)
                local keymap = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                keymap("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
                keymap("gr", require("telescope.builtin").lsp_references, "Goto References")
                keymap("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
                keymap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
                keymap("<leader>rn", vim.lsp.buf.rename, "Rename")
                keymap("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                local highlight_group = vim.api.nvim_create_augroup("OmacaseLspHighlightGroup", { clear = false })

                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_group,
                        callback = vim.lsp.buf.document_highlight
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_group,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = highlight_group,
                        callback = function(detach_event)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = detach_event.buf })
                        end
                    })
                end
            end
        })
    end,
}
