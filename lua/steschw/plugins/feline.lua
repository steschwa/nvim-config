local utils_diagnostics = require("steschw.utils.diagnostics")
local utils_hl = require("steschw.utils.hl")
local utils_statusline = require("steschw.utils.statusline")

local S = {}

--- @class SeparatorParams
--- @field inset? boolean
--- @field color string

--- @param params SeparatorParams
function S.get_separator_left(params)
    local c = require("nord.colors").palette

    local bg = c.polar_night.brighter
    local fg = params.color

    if params.inset then
        bg = params.color
        fg = c.polar_night.brighter
    end

    return {
        str = "",
        hl = { bg = bg, fg = fg },
    }
end

--- @param params SeparatorParams
function S.get_separator_right(params)
    local c = require("nord.colors").palette

    local bg = c.polar_night.brighter
    local fg = params.color

    if params.inset then
        bg = params.color
        fg = c.polar_night.brighter
    end

    return {
        str = "",
        hl = { bg = bg, fg = fg },
    }
end

local M = {}

function M.provider_vi_mode()
    local p_vi_mode = require("feline.providers.vi_mode")

    local c = require("nord.colors").palette

    return {
        provider = function()
            return string.format(" %s ", p_vi_mode.get_vim_mode())
        end,
        hl = {
            bg = c.frost.artic_ocean,
            fg = c.snow_storm.origin,
        },
        right_sep = S.get_separator_right({ color = c.frost.artic_ocean }),
    }
end

function M.provider_filename()
    local c = require("nord.colors").palette

    return {
        provider = function()
            local path = vim.api.nvim_buf_get_name(0)
            if path == "" then
                return " [No Name] "
            end

            local parts = vim.split(path, "/")
            local folder = parts[#parts - 1]
            local filename = parts[#parts]

            return string.format(" %s/%s ", folder, filename)
        end,
        hl = {
            bg = c.polar_night.brightest,
            fg = c.snow_storm.origin,
        },
        left_sep = S.get_separator_left({ color = c.polar_night.brightest }),
    }
end

function M.provider_macro()
    local c = require("nord.colors").palette

    --- @return string
    local function provider()
        local recording_register = vim.fn.reg_recording()
        if #recording_register == 0 then
            return ""
        end

        return string.format(" @%s ", recording_register)
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = c.frost.artic_water,
            fg = c.polar_night.origin,
        },
        left_sep = S.get_separator_right({ inset = true, color = c.frost.artic_water }),
        right_sep = S.get_separator_right({ color = c.frost.artic_water }),
    }
end

function M.provider_lazy_updates()
    local c = require("nord.colors").palette

    --- @return string
    local function provider()
        local ls = require("lazy.status")

        if not ls.has_updates() then
            return ""
        end

        return string.format(" %s ", ls.updates())
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = c.aurora.purple,
            fg = c.polar_night.origin,
        },
        left_sep = S.get_separator_left({ color = c.aurora.purple }),
        right_sep = S.get_separator_left({ inset = true, color = c.aurora.purple }),
    }
end

function M.provider_search_count()
    local c = require("nord.colors").palette

    --- @return string
    local function provider()
        if vim.v.hlsearch == 0 then
            return ""
        end

        local result = vim.fn.searchcount()
        if result.incomplete == 1 then
            return ""
        end

        return string.format(" %d/%d ", result.current, result.total)
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = c.frost.ice,
            fg = c.polar_night.origin,
        },
        left_sep = S.get_separator_right({ inset = true, color = c.frost.ice }),
        right_sep = S.get_separator_right({ color = c.frost.ice }),
    }
end

function M.provider_changes()
    local c = require("nord.colors").palette

    --- @return string
    local function provider()
        local buf_info = vim.fn.getbufinfo("%")
        if #buf_info ~= 1 then
            return ""
        end

        if buf_info[1].changed == 1 then
            return " ● "
        end

        return ""
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = c.snow_storm.origin,
            fg = c.polar_night.origin,
        },
    }
end

--- @param severity number
function M.create_diagnostics_provider(severity)
    local function provider()
        local sign = utils_diagnostics.get_sign_by_severity(severity)
        local sign_prefix = vim.trim(sign and sign.text or "")

        local diagnostics = vim.diagnostic.get(0, { severity = severity })
        if #diagnostics == 0 then
            return ""
        end

        return string.format(" %s:%d ", sign_prefix, #diagnostics)
    end

    return function()
        return {
            provider = provider,
            enabled = function()
                return provider() ~= ""
            end,
            hl = {
                fg = utils_hl.get_hl_fg(utils_diagnostics.get_hl_name_by_severity(severity)),
            },
        }
    end
end

M.provider_diagnostics_error = M.create_diagnostics_provider(vim.diagnostic.severity.ERROR)
M.provider_diagnostics_warn = M.create_diagnostics_provider(vim.diagnostic.severity.WARN)
M.provider_diagnostics_info = M.create_diagnostics_provider(vim.diagnostic.severity.INFO)
M.provider_diagnostics_hint = M.create_diagnostics_provider(vim.diagnostic.severity.HINT)

function M.provider_grapple()
    local c = require("nord.colors").palette

    local function provider()
        local g = require("grapple")

        if not g.exists() then
            return ""
        end

        return string.format("  %s ", g.key())
    end

    local bg = c.polar_night.brightest

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = c.snow_storm.origin,
        },
        left_sep = S.get_separator_left({ color = bg }),
        right_sep = S.get_separator_left({ inset = true, color = bg }),
    }
end

return {
    "freddiehaddad/feline.nvim",
    deps = { "gbprod/nord.nvim", "cbochs/grapple.nvim" },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyCheck",
            callback = utils_statusline.update_statusline,
        })
    end,
    config = function()
        local f = require("feline")
        local c = require("nord.colors").palette

        -- TODO: git hunks component
        -- TODO: maybe git changes component

        local components = {
            active = {
                {
                    M.provider_vi_mode(),
                    M.provider_macro(),
                    M.provider_search_count(),
                    M.provider_diagnostics_error(),
                    M.provider_diagnostics_warn(),
                    M.provider_diagnostics_info(),
                    M.provider_diagnostics_hint(),
                    {},
                },
                {
                    M.provider_lazy_updates(),
                    M.provider_grapple(),
                    M.provider_filename(),
                    M.provider_changes(),
                },
            },
            inactive = {
                {
                    {},
                },
                {
                    M.provider_grapple(),
                    M.provider_filename(),
                    M.provider_changes(),
                },
            },
        }

        f.setup({
            components = components,
            theme = {
                bg = c.polar_night.brighter,
                fg = c.polar_night.brighter,
            },
            disable = {
                filetypes = {
                    "^NvimTree$",
                    "^help$",
                    "^Trouble$",
                    "^qf$",
                },
            },
        })
    end,
}
