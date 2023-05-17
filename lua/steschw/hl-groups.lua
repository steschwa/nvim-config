local nord = require("steschw.colors.nord")

local cmp_hl = {
    CmpItemAbbr = { fg = nord.snow_storm.origin },
    CmpItemAbbrMatch = { fg = nord.frost.artic_water, bold = true },
    CmpBorder = { link = "TelescopeBorder" },
    CmpDocBorder = { link = "TelescopeBorder" },
}

local harpoon_hl = {
    HarpoonCurrentFile = { fg = nord.frost.artic_water },
    HarpoonBorder = { link = "TelescopeBorder" },
}

local highlights = vim.tbl_extend("force", cmp_hl, harpoon_hl)

for hl, col in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, col)
end
