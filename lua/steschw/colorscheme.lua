local function setup_catppuccin()
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

    local status_ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
    if not status_ok then
        vim.notify("colorscheme catppuccin not found!")
        return
    end
end

--[[ local function setup_nord() ]]
--[[     vim.g.contrast = true ]]
--[[     vim.g.nord_borders = true ]]
--[[     vim.g.nord_cursorline_transparent = true ]]
--[[     vim.g.nord_italic = true ]]
--[[]]
--[[     local status_ok, _ = pcall(vim.cmd, "colorscheme nord") ]]
--[[     if not status_ok then ]]
--[[         vim.notify("colorscheme nord not found!") ]]
--[[         return ]]
--[[     end ]]
--[[ end ]]

--[[ local function setup_poimandres() ]]
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
--[[]]
--[[     local status_ok, _ = pcall(vim.cmd, "colorscheme poimandres") ]]
--[[     if not status_ok then ]]
--[[         vim.notify("colorscheme poimandres not found!") ]]
--[[         return ]]
--[[     end ]]
--[[ end ]]

setup_catppuccin()
--[[ setup_nord() ]]
--[[ setup_poimandres() ]]
