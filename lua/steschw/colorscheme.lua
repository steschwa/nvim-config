local nord = require("nord")

nord.setup({
    diff = { mode = "bg" },
    borders = true,
    errors = { mode = "bg" },
})

vim.cmd("colorscheme nord")
