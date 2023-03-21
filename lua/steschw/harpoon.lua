local harpoon = require("harpoon")

local neovide_fullwidth_columns = 213

harpoon.setup({
    menu = {
        width = neovide_fullwidth_columns - 2 * 16,
    }
})
