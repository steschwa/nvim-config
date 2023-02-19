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
