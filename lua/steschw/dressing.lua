local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
    return
end

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
        backend = {"nui", "telescope", "builtin"},
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
