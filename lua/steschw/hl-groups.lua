-- from https://github.com/NvChad/base46/blob/master/lua/base46/themes/nord.lua
local colors_nord = {
    white = "#abb2bf",
    black = "#2E3440", --  nvim bg
    grey = "#4b515d",
    blue = "#7797b7",
}

-- from https://github.com/NvChad/base46/blob/master/lua/base46/integrations/cmp.lua
local cmp_hl = {
  -- nvim cmp
    CmpItemAbbr = { fg = colors_nord.white },
    CmpItemAbbrMatch = { fg = colors_nord.blue, bold = true },
    CmpBorder = { fg = colors_nord.grey },
    CmpDocBorder = { fg = colors_nord.grey, bg = colors_nord.black },
}

for hl, col in pairs(cmp_hl) do
    vim.api.nvim_set_hl(0, hl, col)
end
