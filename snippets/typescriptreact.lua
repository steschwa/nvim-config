local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function filename()
    local path = vim.fn.expand("%")
    return vim.fn.fnamemodify(path, ":t:r")
end

return {
    s("comp", {
        t("type "),
        f(filename),
        t("Props = {};"),
        t({ "", "" }),

        t({ "", "export function " }),
        f(filename),
        t("(props: "),
        f(filename),
        t("Props) {"),

        t({ "", "\t" }),
        t("return "),
        i(0, "null"),
        t(";"),

        t({ "", "}" }),
    }),
    s("cprops", {
        t("type "),
        f(filename),
        t("Props = {"),
        t({ "", "\t" }),
        i(0),
        t({ "", "};" }),
    }),
}
