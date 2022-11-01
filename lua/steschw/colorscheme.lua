local colorscheme = "catppuccin"
--[[ local colorscheme = "nord" ]]
--[[ local colorscheme = "poimandres" ]]

local setup_catppuccin = function()
    vim.g.catppuccin_flavour = "macchiato"

    local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
    if not catppuccin_status_ok then
        return
    end

    catppuccin.setup({
        term_colors = true,
        integrations = {
            barbar = true,
            cmp = true,
            nvimtree = true,
            treesitter_context = true,
            treesitter = true,
            telescope = true,
            which_key = true
        }
    })
end

--[[ local setup_nord = function() ]]
--[[     vim.g.contrast = true ]]
--[[     vim.g.nord_borders = true ]]
--[[     vim.g.nord_cursorline_transparent = true ]]
--[[     vim.g.nord_italic = true ]]
--[[ end ]]

--[[ local setup_poimandres = function() ]]
--[[     local poimandres_ok, poimandres = pcall(require, "poimandres") ]]
--[[     if not poimandres_ok then ]]
--[[         return ]]
--[[     end ]]
--[[]]
--[[     poimandres.setup({ ]]
--[[         bold_vert_split = true, ]]
--[[         dim_nc_background = true, ]]
--[[         disable_float_background = true, ]]
--[[         disable_italics = true ]]
--[[     }) ]]
--[[ end ]]

setup_catppuccin()
--[[ setup_nord() ]]
--[[ setup_poimandres() ]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
