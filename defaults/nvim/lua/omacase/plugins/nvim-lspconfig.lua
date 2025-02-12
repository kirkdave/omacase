return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            },
            ts_ls = {},
            cssls = {},
            html = {},
            tailwindcss = {},
        }

       local tools_ensure_installed = {
            "stylua",
            "prettier",
        }

        require("mason-tool-installer").setup({ ensure_installed = tools_ensure_installed })

        local ensure_installed = vim.tbl_keys(servers or {})
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}

                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
