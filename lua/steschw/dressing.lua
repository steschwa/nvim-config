local dressing = require("dressing")

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
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
                ["<Up>"] = "HistoryPrev",
                ["<Down>"] = "HistoryNext",
            }
        }
    },
    select = {
        enabled = true,
        backend = {"nui", "builtin"},
        nui = {
            relative = "editor",
            position = "50%",
            border = {
                style = "rounded",
                padding = { 1, 2 }
            }
        },
        mappings = {
            n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-c>"] = "Close",
            }
        }
    }
})
