return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
            "nushell/tree-sitter-nu",
        },
        config = function()
            -- wait for https://github.com/nushell/tree-sitter-nu/issues/76 to be fixed
            -- vim.filetype.add({
            --     extension = {
            --         nu = "nu",
            --     },
            -- })
            --
            -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            -- parser_config.nu = {
            --     filetype = "nu",
            --     install_info = {
            --         url = "https://github.com/nushell/tree-sitter-nu",
            --         files = { "src/parser.c" },
            --         branch = "main",
            --     },
            -- }

            local configs = require("nvim-treesitter.configs")

            ---@diagnostic disable-next-line: missing-fields
            configs.setup({
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                -- TODO: investigate what this does
                indent = {
                    enable = true,
                    disable = { "yaml" },
                },
                autotag = {
                    enable = true,
                    enable_close_on_slash = false,
                },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ["sl"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["sh"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["[f"] = "@function.outer",
                        },
                        goto_previous_start = {
                            ["]f"] = "@function.outer",
                        },
                    },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "vv",
                        node_incremental = "[v",
                        node_decremental = "]v",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "windwp/nvim-ts-autotag",
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require("ts_context_commentstring").setup()
        end,
    },
}
