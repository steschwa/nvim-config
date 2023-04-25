local nord = require("steschw.colors.nord")

local cmp_hl = {
    CmpItemAbbr = { fg = nord.snow_storm.origin },
    CmpItemAbbrMatch = { fg = nord.frost.artic_water, bold = true },
    CmpBorder = { link = "TelescopeBorder" },
}

local fzf_hl = {
    TelescopeSelection = { bg = nord.polar_night.brighter },
    TelescopeNormal = { bg = nord.polar_night.origin },
}

local harpoon_hl = {
    HarpoonCurrentFile = { link = "CursorLine" },
    HarpoonBorder = { link = "TelescopeBorder" },
}

local highlights = vim.tbl_extend("force", cmp_hl, fzf_hl, harpoon_hl)

for hl, col in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, col)
end
