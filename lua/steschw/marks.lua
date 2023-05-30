local marks = require("marks")

marks.setup({
    default_mappings = false,
    cyclic = true,
    refresh_interval = 500,
    mappings = {
        set_next = "mm",
        delete_line = "md",
        next = "m;",
        prev = "m,",
    },
})
