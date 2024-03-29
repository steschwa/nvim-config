local utils_diagnostics = require("steschw.utils.diagnostics")

local s = vim.diagnostic.severity

--- @class StatuslineFactory
--- @field active boolean
local M = {}

--- @param active boolean
--- @return StatuslineFactory
function M:new(active)
    local this = {
        active = active,
    }
    setmetatable(this, self)
    self.__index = self

    return this
end

--- @return string
function M:get_bg()
    local c = require("nord.colors").palette

    -- slightly darker c.polar_night.bright
    local darker_bright = "#323946"

    return self.active and c.polar_night.bright or darker_bright
end

--- @class SeparatorParams
--- @field inset? boolean
--- @field color string

--- @param params SeparatorParams
function M:get_separator_left(params)
    return {
        str = "",
        hl = {
            bg = params.inset and params.color or self:get_bg(),
            fg = params.inset and self:get_bg() or params.color,
        },
    }
end

--- @param params SeparatorParams
function M:get_separator_right(params)
    return {
        str = "",
        hl = {
            bg = params.inset and params.color or self:get_bg(),
            fg = params.inset and self:get_bg() or params.color,
        },
    }
end

local function filename_quickfix()
    local res = vim.fn.getqflist({
        title = true,
    })

    if res.title == "" or res.title == ":setqflist()" then
        return " Quickfix "
    end

    return string.format(" %s ", res.title)
end

local function filename_help()
    return " Help "
end

local function filename_buf()
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        return " [No Name] "
    end

    local parts = vim.split(path, "/")
    local folder = parts[#parts - 1]
    local filename = parts[#parts]

    return string.format(" %s/%s ", folder, filename)
end

function M:component_filename()
    local c = require("nord.colors").palette

    local bg = self.active and c.frost.artic_ocean or c.polar_night.brightest
    local fg = c.snow_storm.origin

    return {
        provider = function()
            local ft = vim.bo.filetype
            if ft == "qf" then
                return filename_quickfix()
            elseif ft == "help" then
                return filename_help()
            end

            return filename_buf()
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_lazy_updates()
    local c = require("nord.colors").palette

    local bg = c.frost.polar_water
    local fg = c.polar_night.origin

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
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_left({ color = bg }),
    }
end

function M:component_search_count()
    local c = require("nord.colors").palette

    local bg = c.frost.ice
    local fg = c.polar_night.origin

    --- @return string
    local function provider()
        if vim.v.hlsearch == 0 then
            return ""
        end

        local ok, result = pcall(vim.fn.searchcount)
        if not ok then
            return ""
        end
        if result.incomplete == 1 then
            return ""
        elseif result.incomplete == 2 then
            return string.format(" %d/%d+ ", result.current, result.total)
        end

        if result.total == 0 then
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
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_right({ inset = true, color = bg }),
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_file_changes()
    local c = require("nord.colors").palette

    local bg = c.snow_storm.origin
    local fg = c.polar_night.origin

    --- @return string
    local function provider()
        ---@diagnostic disable-next-line: param-type-mismatch
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
            bg = bg,
            fg = fg,
        },
    }
end

--- @param severity number
function M:component_diagnostics(severity)
    local c = require("nord.colors").palette

    local function provider()
        local sign = utils_diagnostics.get_sign_by_severity(severity)
        local sign_prefix = vim.trim(sign and sign.text or "")

        local diagnostics = vim.diagnostic.get(0, { severity = severity })
        if #diagnostics == 0 then
            return ""
        end

        return string.format(" %s:%d ", sign_prefix, #diagnostics)
    end

    local fg = ({
        [vim.diagnostic.severity.ERROR] = c.aurora.red,
        [vim.diagnostic.severity.WARN] = c.aurora.yellow,
        [vim.diagnostic.severity.INFO] = c.frost.ice,
        [vim.diagnostic.severity.HINT] = c.frost.artic_water,
    })[severity]

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = function()
            return {
                bg = self:get_bg(),
                fg = fg,
            }
        end,
    }
end

function M:component_grapple()
    local c = require("nord.colors").palette

    local bg = c.frost.artic_water
    local fg = c.polar_night.origin

    local function provider()
        local g = require("grapple")

        if not g.exists() then
            return ""
        end

        return string.format("  %s ", g.name_or_index())
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_right({ inset = true, color = bg }),
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_qf()
    local c = require("nord.colors").palette

    local bg = self.active and c.frost.artic_water or c.polar_night.bright
    local fg = self.active and c.polar_night.origin or c.snow_storm.origin

    --- @return string
    local function provider()
        local ft = vim.bo.filetype
        if ft ~= "qf" then
            return ""
        end

        local res = vim.fn.getqflist({
            idx = 0,
            size = true,
        })

        return string.format(" %d of %d ", res.idx, res.size)
    end

    return {
        provider = provider,
        enabled = function()
            return provider() ~= ""
        end,
        hl = {
            bg = bg,
            fg = fg,
        },
        left_sep = self:get_separator_right({ inset = true, color = bg }),
        right_sep = self:get_separator_right({ color = bg }),
    }
end

function M:component_gap()
    return {
        hl = {
            bg = self:get_bg(),
        },
    }
end

return {
    "freddiehaddad/feline.nvim",
    deps = { "gbprod/nord.nvim", "cbochs/grapple.nvim" },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyCheck",
            callback = function()
                vim.cmd("redrawstatus!")
            end,
        })
    end,
    config = function()
        local f = require("feline")

        local active_factory = M:new(true)
        local inactive_factory = M:new(false)

        -- TODO: git hunks component
        -- TODO: maybe git changes component

        local components = {
            active = {
                {
                    active_factory:component_file_changes(),
                    active_factory:component_filename(),
                    active_factory:component_qf(),
                    active_factory:component_grapple(),
                    active_factory:component_search_count(),
                    active_factory:component_diagnostics(s.ERROR),
                    active_factory:component_diagnostics(s.WARN),
                    active_factory:component_diagnostics(s.INFO),
                    active_factory:component_diagnostics(s.HINT),
                    active_factory:component_gap(),
                },
                {
                    active_factory:component_lazy_updates(),
                },
            },
            inactive = {
                {
                    inactive_factory:component_file_changes(),
                    inactive_factory:component_filename(),
                    inactive_factory:component_qf(),
                    inactive_factory:component_grapple(),
                    inactive_factory:component_gap(),
                },
            },
        }

        f.setup({
            components = components,
            disable = {
                filetypes = {
                    "^NvimTree$",
                },
            },
            force_inactive = {},
        })
    end,
}
