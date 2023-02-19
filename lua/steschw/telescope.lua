local telescope = require("telescope")
local actions = require("telescope.actions")

local ignore = { "node_modules" }

telescope.setup({
    defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = ignore,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
            n = {
                ["<Esc>"] = actions.close,
                ["<CR>"] = actions.select_default,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,

                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
})
