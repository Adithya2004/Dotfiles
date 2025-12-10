return {
    {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local config = require("nvim-treesitter.configs")
                config.setup({
                    auto_install = true,
                    ensure_installed = {
                        "bash", "html", "css", "json", "lua", "c", "vim",
                        "vimdoc", "query", "markdown", "markdown_inline", "python",
                    },
                    highlight = { enable = true },
                    indent = { enable = false },
                })
            end
        },
}