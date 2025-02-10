return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        log_level = vim.log.levels.DEBUG,
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disabled_onsave_filetypes = {
                c = true,
                cpp = true,
            }
            local lsp_format_opt

            if disabled_onsave_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = "never"
            else
                lsp_format_opt = "fallback"
            end

            return {
                timeout_ms = 500,
                lsp_format = lsp_format_opt,
            }
        end,
        formatters_by_ft = {
            css = { "prettier" },
            html = { "prettier" },
            lua = { "stylua" },
            javascript = { "prettier" },
            json = { "prettier" },
            typescript = { "prettier" },
        },
        formatters = {
            prisma_format = {
                command = "npx prisma format",
                stdin = false,
                tmpfile_format = ".conform.$RANDOM.$FILENAME",
                condition = function(_, ctx)
                    return vim.fs.basename(ctx.filename) ~= ".prisma"
                end,
            },
        },
    },
}
