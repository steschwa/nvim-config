local dressing = require("dressing")
local window = require("steschw.utils.window")

dressing.setup({
    input = {
        enabled = true,
        default_prompt = "Input:",
        title_pos = "left",
        insert_only = false,
        start_in_insert = true,
        border = "rounded",
        relative = "cursor",
        mappings = {
            n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-q>"] = "Close",
                ["<CR>"] = "Confirm",
            },
        },
    },
    select = {
        enabled = true,
        backend = { "nui" },
        nui = {
            relative = "editor",
            position = "50%",
            max_width = window.calc_width({ percent = 0.8 }),
            border = {
                style = "rounded",
                padding = { 1, 2 },
            },
        },
        mappings = {
            n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-q>"] = "Close",
            },
        },
        get_config = function(opts)
            if opts.kind == "codeaction" then
                return {
                    backend = "nui",
                    nui = {
                        min_width = window.calc_width({ percent = 0.4 }),
                        max_width = window.calc_width({ percent = 0.8 }),
                    },
                }
            end
        end,
    },
})
