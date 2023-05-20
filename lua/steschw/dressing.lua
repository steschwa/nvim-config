local dressing = require("dressing")
local window = require("steschw.utils.window")
local debug_print = require("steschw.utils.debug").debug_print

dressing.setup({
    input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left",
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
        backend = { "nui", "builtin" },
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
                    },
                }
            end
        end,
    },
})
