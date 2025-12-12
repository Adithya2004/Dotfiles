return {
    {
            "nvim-telescope/telescope.nvim",
            tag = "v0.2.0",
            dependencies = {
                "nvim-lua/plenary.nvim",

                -- Extensions
                "debugloop/telescope-undo.nvim",
                "nvim-telescope/telescope-ui-select.nvim",
            },

            keys = {
                { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
                { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live grep" },
                { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
                { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help tags" },

                -- Undo Tree
                { "<leader>u",  "<cmd>Telescope undo<cr>",                                desc = "Undo History" },
            },

            opts = {
                extensions = {
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                    },
                },
            },

            config = function(_, opts)
                local telescope = require("telescope")
                telescope.setup(opts)

                -- Load all Telescope extensions safely
                local extensions = { "undo", "ui-select" }
                for _, ext in ipairs(extensions) do
                    pcall(telescope.load_extension, ext)
                end
            end,
        },

}