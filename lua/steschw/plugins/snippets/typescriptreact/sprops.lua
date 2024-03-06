local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.plugins.snippets.fs")

-- stylua: ignore start
local snip = fmta(
[[
type <F>Props = {
    <>
};
]],
    {
        F = f(Fs.filename),
        i(0),
    }
)
-- stylua: ignore end

return s("sprops", snip)
