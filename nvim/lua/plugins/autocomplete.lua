return {
            {
            "williamboman/mason.nvim",
            lazy = false,
            config = function() require("mason").setup() end,
        },

        {
            "williamboman/mason-lspconfig.nvim",
            lazy = false,
            opts = {
                ensure_installed = { 'lua_ls' },
                auto_install = true,
            },
        },
        {
            "hrsh7th/cmp-nvim-lsp"
        },
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets",
            },
        },
        {
            "hrsh7th/nvim-cmp",
            version = false,
            config = function()
                local cmp = require("cmp")
                require("luasnip.loaders.from_vscode").lazy_load()

                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    }
                    ),
                    sources = cmp.config.sources({
                            { name = "nvim_lsp" },
                            {name = "cmdline" },
                            { name = "luasnip" }, -- For luasnip users.
                        },
                        {
                            { name = "buffer" },
                        }
                    ),
                }
                )
            end,
        },

        {
            "neovim/nvim-lspconfig",
            lazy = false,
            config = function()
                local cmp_nvim_lsp = require("cmp_nvim_lsp")
                local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
                    cmp_nvim_lsp.default_capabilities())
            end
        },
}