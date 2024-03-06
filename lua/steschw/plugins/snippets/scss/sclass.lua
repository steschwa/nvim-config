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
.<F> {
    <>
}
]],
    {
        F = f(function()
            return Format.to_kebab_case(Fs.filename())
        end),
        i(0),
    }
)
-- stylua: ignore end

return s("sclass", snip)
