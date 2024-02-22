vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.backup = false
opt.clipboard = ""
opt.cmdheight = 1
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.cursorline = true
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --no-heading --smart-case"
opt.guifont = "JetBrainsMono Nerd Font:h15"
opt.history = 100
opt.hlsearch = true
opt.ignorecase = true
opt.iskeyword:append({ "-", "_" })
opt.number = true
opt.numberwidth = 4
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 1
opt.shiftwidth = 4
opt.shiftround = true
opt.shortmess:append({ a = true, W = true, s = true, S = true })
opt.showmode = false
opt.showtabline = 1
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 500
opt.undofile = true
opt.updatetime = 1000
opt.whichwrap:append("<,>,[,],h,l")
opt.wrap = false
opt.writebackup = false
opt.splitkeep = "cursor"

vim.filetype.add({
    extension = {
        env = "sh",
        hurl = "hurl",
    },
})
