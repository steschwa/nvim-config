local harpoon = require("harpoon")
local utils_window = require("steschw.utils.window")

harpoon.setup({
    menu = {
        width = utils_window.calc_width({ padding = 16 }),
    },
})
