-- focus mode
-- close all windows that contain buffers which are of specific filetypes

local closable_ts = {
    "help",
    "qf",
}

local wins = vim.api.nvim_tabpage_list_wins(0)

for _, win_id in ipairs(wins) do
    local buf_id = vim.api.nvim_win_get_buf(win_id)
    local buf_ft = vim.bo[buf_id].filetype

    if vim.tbl_contains(closable_ts, buf_ft) then
        vim.api.nvim_win_close(win_id, false)
    end
end
