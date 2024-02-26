local function provider_severity(item)
    local placeholder = string.rep(" ", 6)

    local severity = vim.diagnostic.severity[item.type]
    if not severity then
        return { text = placeholder }
    end

    local severity_name = vim.diagnostic.severity[severity]
    if type(severity_name) ~= "string" or severity_name == "" then
        return { text = placeholder }
    end

    local hl = ({
        [vim.diagnostic.severity.ERROR] = "FixmeSeverityError",
        [vim.diagnostic.severity.WARN] = "FixmeSeverityWarn",
        [vim.diagnostic.severity.INFO] = "FixmeSeverityInfo",
        [vim.diagnostic.severity.HINT] = "FixmeSeverityHint",
    })[severity]

    return {
        text = string.format("%s ", severity_name:sub(1, 4):upper()),
        hl = hl,
    }
end

local function provider_lnum(item)
    local lnum = item.line_start or item.line_end

    return {
        text = string.format(" %s", lnum),
        hl = "Comment",
    }
end

local function provider_filename(item)
    local filename = vim.fn.fnamemodify(item.filepath, ":t")

    return {
        text = filename,
        hl = "FixmeFilepath",
    }
end

local function provider_text(item)
    if item.text == "" then
        return { text = "" }
    end

    return {
        text = string.format("  %s", vim.trim(item.text)),
        hl = "FixmeText",
    }
end

--- @param cols number[]
local function expand_columns(cols)
    return function(line_builders)
        --- @type number[]
        local line_width = {}
        local max_col_width = 0

        for i, line_builder in ipairs(line_builders) do
            local cols_width = 0

            for _, column in ipairs(cols) do
                local component = line_builder:at(column)
                if component ~= nil then
                    cols_width = cols_width + #component.text
                end
            end

            line_width[i] = cols_width
            max_col_width = math.max(max_col_width, cols_width)
        end

        local insert_after_index = cols[#cols] + 1

        for i, line_builder in ipairs(line_builders) do
            local padding = max_col_width - line_width[i]

            line_builder:add({
                text = string.rep(" ", padding),
            }, insert_after_index)
        end
    end
end

return {
    dir = "/Volumes/Projekte/fixme.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
        require("fixme").setup({
            selectors = {
                {
                    use = function(qf_id)
                        local context = vim.fn.getqflist({
                            id = qf_id,
                            context = true,
                        }).context

                        return context == "diagnostics"
                    end,
                    providers = {
                        provider_severity,
                        provider_filename,
                        provider_lnum,
                        provider_text,
                    },
                    layout = expand_columns({ 1, 2, 3 }),
                },
                {
                    providers = {
                        provider_filename,
                        provider_lnum,
                        provider_text,
                    },
                    layout = expand_columns({ 1, 2 }),
                },
            },
            column_separator = "  ",
        })
    end,
}
