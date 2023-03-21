-- from https://github.com/NvChad/base46/blob/master/lua/base46/themes/nord.lua
local colors_nord = {
    white = "#abb2bf",
    black = "#2E3440", --  nvim bg
    grey = "#4b515d",
    blue = "#7797b7",
}

-- https://github.com/NvChad/base46/blob/master/lua/base46/integrations/cmp.lua
local cmp_hl = {
    CmpItemAbbr = { fg = colors_nord.white },
    CmpItemAbbrMatch = { fg = colors_nord.blue, bold = true },
    CmpBorder = { fg = colors_nord.grey },
    CmpDocBorder = { fg = colors_nord.grey, bg = colors_nord.black },
}

-- https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/profiles/telescope.lua#L34
local fzf_hl = {
    TelescopeSelection = { bg = colors_nord.grey },
    TelescopeNormal = { bg = colors_nord.black }
}

local highlights = vim.tbl_extend("force", cmp_hl, fzf_hl)

for hl, col in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, col)
end
