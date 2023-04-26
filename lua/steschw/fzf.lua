local fzf = require("fzf-lua")
local utils_window = require("steschw.utils.window")

local prompt = "  "
local pointer = "  "

fzf.setup({
    "telescope",
    winopts_fn = function()
        local width = utils_window.width()
        if width <= 150 then
            width = utils_window.calc_width({ padding = 4 })
        else
            width = utils_window.calc_width({ padding = 16 })
        end

        return {
            width = width,
        }
    end,
    fzf_opts = {
        ["--delimiter"] = "/",
        ["--with-nth"] = "-2..",
        ["--info"] = "hidden",
        ["--no-scrollbar"] = "",
        ["--pointer"] = pointer,
        ["--padding"] = "1%,2%",
    },
    files = {
        prompt = prompt,
        fd_opts = "--color=never --type f --hidden --exclude node_modules --exclude .git",
    },
    grep = {
        prompt = prompt,
    },
    lsp = {
        prompt = prompt,
        sync = true,
        symbols = {
            prompt = prompt,
            symbol_style = 3,
        },
    },
    oldfiles = {
        prompt = prompt,
    },
})
