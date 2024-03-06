local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

local Fs = require("steschw.plugins.snippets.fs")
local Format = require("steschw.plugins.snippets.format")

local snip = {
    f(function()
        return Format.to_kebab_case(Fs.filename())
    end),
}

return s("sclass", snip)
