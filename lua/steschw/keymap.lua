local trouble = require("trouble")
local utils_formatting = require("steschw.utils.formatting")

local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local function keymap(mode, keys, cmd)
    vim.keymap.set(mode, keys, cmd, opts)
end

local function n(keys, cmd)
    keymap("n", keys, cmd)
end
local function i(keys, cmd)
    keymap("i", keys, cmd)
end
local function v(keys, cmd)
    keymap("v", keys, cmd)
end

local function set_normal_keymaps()
    n("<C-h>", "<C-w>h")
    n("<C-j>", "<C-w>j")
    n("<C-k>", "<C-w>k")
    n("<C-l>", "<C-w>l")
    n("<leader>q", "@q<cr>")
    n("<C-d>", "<C-d>zz")
    n("<C-u>", "<C-u>zz")
    n("n", "nzz")
    n("<leader>n", "<cmd>noh<cr>")
    n("&", "<cmd>:&&<cr>")
    n("`", "^")
    n("gs", "<cmd>:w<cr>")

    -- Window management
    n("<leader>wl", "<C-w>v") -- vertical split
    n("<leader>wq", "<C-w>q") -- close window

    -- Fzf
    local fzf = require("fzf-lua")
    n("<leader>p", fzf.files)
    n("<leader>f", fzf.live_grep)
    n("<leader>s", function()
        fzf.lsp_document_symbols({ fzf_cli_args = "--with-nth -1.." })
    end)
    n("<leader>o", fzf.oldfiles)
    n("<leader><leader>", fzf.resume)

    -- Trouble
    n("<leader>dd", "<cmd>Trouble document_diagnostics<cr>")
    n("<leader>dw", "<cmd>Trouble workspace_diagnostics<cr>")
    n("<leader>t", "<cmd>TodoTrouble<cr>")
    n("gr", "<cmd>Trouble lsp_references<cr>")
    n("gd", "<cmd>Trouble lsp_definitions<cr>")
    n("<C-n>", function()
        trouble.next({ jump = true })
    end)
    n("<C-p>", function()
        trouble.previous({ jump = true })
    end)
    n("<C-q>", "<cmd>TroubleClose<cr>")

    -- Nvim Tree
    n("<leader>e", vim.cmd.NvimTreeFindFileToggle)

    -- Buffer management
    n("<S-h>", vim.cmd.BufferPrevious)
    n("<S-l>", vim.cmd.BufferNext)
    n("<leader>bp", vim.cmd.BufferPick)
    n("<leader>ba", vim.cmd.BufferCloseAllButCurrent)
    n("<leader>bq", vim.cmd.BufferClose)
    n("<leader>bch", vim.cmd.BufferCloseBuffersLeft)
    n("<leader>bcl", vim.cmd.BufferCloseBuffersRight)
    n("<leader>b1", "<cmd>BufferGoto 1<cr>")
    n("<leader>b2", "<cmd>BufferGoto 2<cr>")
    n("<leader>b3", "<cmd>BufferGoto 3<cr>")

    -- Harpoon
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")
    n("<leader>h", harpoon_ui.toggle_quick_menu)
    n("<leader>a", harpoon_mark.add_file)

    -- Marks
    n("<leader>m", "<cmd>MarksListBuf<cr>")

    -- Git
    n("<leader>g", "<cmd>GitMessenger<cr>")
    -- Disable default <Space>gm binding to prevent delay for <Space>g
    vim.g.git_messenger_no_default_mappings = true

    -- LSP
    n("gh", vim.lsp.buf.hover)
    n("gH", vim.diagnostic.open_float)
    n("gR", vim.lsp.buf.rename)
    n("ga", vim.lsp.buf.code_action)
    n("gf", utils_formatting.format)
    n("gu", "<cmd>:TypescriptRemoveUnused<cr>")
    n("go", "<cmd>:TypescriptOrganizeImports<cr>")
    n("[e", function()
        vim.diagnostic.goto_next({ float = false })
    end)
    n("]e", function()
        vim.diagnostic.goto_prev({ float = false })
    end)
end

local function set_insert_keymaps()
    i("jk", "<Esc>")

    -- Trouble
    i("<C-n>", function()
        trouble.next({ jump = true })
    end)
    i("<C-p>", function()
        trouble.previous({ jump = true })
    end)
    i("<C-q>", "<cmd>TroubleClose<cr>")
end

local function set_visual_keymaps()
    v("<", "<gv")
    v(">", ">gv")
    v("p", '"_dP')
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

set_normal_keymaps()
set_insert_keymaps()
set_visual_keymaps()
