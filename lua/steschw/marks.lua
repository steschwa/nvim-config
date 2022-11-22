local status_ok, marks = pcall(require, "marks")
if not status_ok then
    return
end

marks.setup({
    default_mappings = false,
    cyclic = true,
    refresh_interval = 500,
    mappings = {
        set_next = "mm",
        delete_line = "md",
        next = "m,",
        prev = "m;"
    }
})
