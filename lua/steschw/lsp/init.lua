require("steschw.lsp.mason")
require("steschw.lsp.handlers").setup()
require("steschw.lsp.servers")
require("steschw.lsp.null-ls")

local nvimTsAutotag = require("nvim-ts-autotag")
nvimTsAutotag.setup()
