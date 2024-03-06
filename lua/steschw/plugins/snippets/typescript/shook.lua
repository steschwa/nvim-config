local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local Fs = require("steschw.plugins.snippets.fs")
local Format = require("steschw.plugins.snippets.format")

-- stylua: ignore start
local snip = fmta(
[[
type <F>Return = {};

export function <>(): <F>Return {
    <>
}
]],
    {
        F = f(function ()
           return Format.to_title_case(Fs.filename())
        end),
        f(Fs.filename),
        i(0),
    }
)
-- stylua: ignore end

return s("shook", snip)
