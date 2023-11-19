return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "bash",
                    "css",
                    "dockerfile",
                    "fish",
                    "gitignore",
                    "go",
                    "gomod",
                    "html",
                    "javascript",
                    "json",
                    "jsonc",
                    "lua",
                    "python",
                    "scss",
                    "sql",
                    "tsx",
                    "typescript",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
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
    { "nvim-treesitter/nvim-treesitter-textobjects" },
}
