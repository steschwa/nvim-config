--- @class PreviewManager
--- @field preview_win_id number?
--- @field origin_buf_id number?
local M = {}

--- @return PreviewManager
function M:new()
    --- @type PreviewManager
    local this = {}
    setmetatable(this, self)
    self.__index = self

    return this
end

function M:open()
    local files = {
        "/Volumes/Projekte/FarmAct/farmact-app/packages/web-app/src/main/common/components/FarmActModal/FarmActModal.tsx",
        "/Volumes/Projekte/FarmAct/farmact-app/packages/web-app/src/main/common/styles/shared/photoUploadModal.scss",
        "/Volumes/Projekte/FarmAct/farmact-app/packages/web-app/src/main/common/components/orders/OrdersAdministration/EditOrderPage/analytics/Resources/resources.utils.ts",
    }

    local items = {}
    for _, file in ipairs(files) do
        table.insert(items, {
            filename = file,
            lnum = 1,
            type = "I",
        })
    end

    self.preview_win_id = vim.api.nvim_get_current_win()
    self.origin_buf_id = vim.api.nvim_get_current_buf()

    vim.fn.setqflist(items, "r")
    vim.cmd("copen")

    self:_setup_autocmds()
    self:_setup_keymaps()

    self:preview_current()
end

function M:_setup_keymaps()
    local km_opts = {
        buffer = vim.api.nvim_get_current_buf(),
        remap = false,
    }

    local function keymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, km_opts)
    end

    keymap("n", "q", function()
        if self.preview_win_id ~= nil and self.origin_buf_id ~= nil then
            vim.api.nvim_win_set_buf(self.preview_win_id, self.origin_buf_id)
        end
        vim.cmd("cclose")
    end)
end

function M:_setup_autocmds()
    local group = vim.api.nvim_create_augroup("_steschw_preview", {
        clear = true,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
        group = group,
        buffer = vim.api.nvim_get_current_buf(),
        callback = function()
            self:preview_current()
        end,
    })
end

function M:preview_current()
    local line = vim.api.nvim_get_current_line()
    local parts = vim.split(line, "|")
    if #parts == 0 then
        return
    end

    local file = parts[1]
    self:preview(file)
end

--- @param file string
function M:preview(file)
    if not self.preview_win_id then
        vim.notify(
            "failed to preview file. preview_win_id is not set " .. file,
            vim.log.levels.WARN
        )
        return
    end

    local buf_id = self:_find_buf_id(file)
    if buf_id == nil then
        buf_id = self:_create_buf(file)
    end

    if not buf_id then
        vim.notify(
            "failed to preview file. could not create buffer for preview file " .. file,
            vim.log.levels.WARN
        )
        return
    end

    vim.api.nvim_win_set_buf(self.preview_win_id, buf_id)
end

--- @param file string
--- @return number?
function M:_find_buf_id(file)
    local buf_ids = vim.api.nvim_list_bufs()
    for _, buf_id in ipairs(buf_ids) do
        local buf_name = vim.fn.bufname(buf_id)
        if buf_name == file then
            return buf_id
        end
    end
end

--- @param file string
function M:_create_buf(file)
    local buf_id = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_set_name(buf_id, file)
    vim.api.nvim_buf_call(buf_id, vim.cmd.edit)
end

local m = M:new()
m:open()
