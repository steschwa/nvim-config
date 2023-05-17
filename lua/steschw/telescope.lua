local telescope = require("telescope")

local actions = require("telescope.actions")
local transform_mod = require("telescope.actions.mt").transform_mod

local mod_qflist = {}
mod_qflist.smart_send_to_qflist = function(bufnr)
    actions.smart_send_to_qflist(bufnr)
end
mod_qflist.open_qflist = function()
    vim.cmd("Trouble quickfix")
end
mod_qflist = transform_mod(mod_qflist)

local action_qflist = mod_qflist.smart_send_to_qflist + mod_qflist.open_qflist

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        multi_icon = " ",
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
        path_display = { "tail" },
        dynamic_preview_title = true,
        cache_picker = false,
        layout_config = {
            vertical = {
                width = 0.5,
            },
        },
        mappings = {
            n = {
                ["q"] = actions.close,
                ["<C-q>"] = action_qflist,
            },
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = action_qflist,
            },
        },
    },
    pickers = {
        find_files = {
            layout_strategy = "vertical",
            previewer = false,
            find_command = {
                "fd",
                "--color=never",
                "--hidden",
                "--exclude",
                "node_modules",
                "--exclude",
                ".git",
                "--type",
                "f",
                "--strip-cwd-prefix",
            },
        },
        live_grep = {
            max_results = 20,
            disable_coordinates = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 10,
            },
        },
        lsp_document_symbols = {
            layout_strategy = "vertical",
            previewer = false,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
        },
    },
})

telescope.load_extension("fzf")
