--[[ local function setup_catppuccin() ]]
--[[     local catppuccin = require("catppuccin") ]]
--[[]]
--[[     vim.g.catppuccin_flavour = "macchiato" ]]
--[[]]
--[[     catppuccin.setup({ ]]
--[[         term_colors = true, ]]
--[[         integrations = { ]]
--[[             barbar = true, ]]
--[[             cmp = true, ]]
--[[             nvimtree = true, ]]
--[[             treesitter_context = true, ]]
--[[             treesitter = true, ]]
--[[             telescope = true, ]]
--[[             which_key = true ]]
--[[         } ]]
--[[     }) ]]
--[[]]
--[[     vim.cmd("colorscheme catppuccin") ]]
--[[ end ]]

--[[ local function setup_nvim_nord() ]]
--[[     vim.g.nord_contrast = true ]]
--[[     vim.g.nord_borders = true ]]
--[[     vim.g.nord_disable_background = false ]]
--[[     vim.g.nord_cursorline_transparent = true ]]
--[[     vim.g.nord_italic = true ]]
--[[     vim.g.nord_bold = false ]]
--[[]]
--[[     local status_nord_ok, nord = pcall(require, "nord") ]]
--[[     if not status_nord_ok then ]]
--[[         vim.notify("colorscheme nord not found!") ]]
--[[         return ]]
--[[     end ]]
--[[]]
--[[     nord.set() ]]
--[[ end ]]

local function setup_nord()
    local nord = require("nord")

    nord.setup({
        diff = { mode = "bg" },
        borders = true,
        errors = { mode = "bg" },
    })

    vim.cmd("colorscheme nord")
end

--[[ setup_catppuccin() ]]
setup_nord()
