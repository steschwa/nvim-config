local status_ok, barbar = pcall(require, "bufferline")
if not status_ok then
    return
end

barbar.setup({
    animation = false,
    auto_hide = false,  --[[ Do not hide if there is only a single buffer ]]--
    tabpages = false,
    closeable = false,
    clickable = false,
    icons = "both",
})
