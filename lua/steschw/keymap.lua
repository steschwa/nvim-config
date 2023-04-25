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

local function n_keymap(keys, cmd)
    keymap("n", keys, cmd)
end
local function i_keymap(keys, cmd)
    keymap("i", keys, cmd)
end
local function v_keymap(keys, cmd)
    keymap("v", keys, cmd)
end

local function set_normal_keymaps()
    n_keymap("<C-h>", "<C-w>h")
    n_keymap("<C-j>", "<C-w>j")
    n_keymap("<C-k>", "<C-w>k")
    n_keymap("<C-l>", "<C-w>l")
    n_keymap("<leader>q", "@q<cr>")
    n_keymap("<C-d>", "<C-d>zz")
    n_keymap("<C-u>", "<C-u>zz")
    n_keymap("n", "nzz")
    n_keymap("<leader>n", "<cmd>noh<cr>")
    n_keymap("&", "<cmd>:&&<cr>")
    n_keymap("`", "^")
    n_keymap("gs", "<cmd>:w<cr>")

    -- Window management
    n_keymap("<leader>wl", "<C-w>v") -- vertical split
    n_keymap("<leader>wq", "<C-w>q") -- close window

    -- Fzf
    local fzf = require("fzf-lua")
    n_keymap("<leader>p", fzf.files)
    n_keymap("<leader>f", fzf.live_grep)
    n_keymap("<leader>s", function()
        fzf.lsp_document_symbols({ fzf_cli_args = "--with-nth -1.." })
    end)
    n_keymap("<leader>o", fzf.oldfiles)
    n_keymap("<leader><leader>", fzf.resume)

    -- Trouble
    n_keymap("<leader>dd", "<cmd>Trouble document_diagnostics<cr>")
    n_keymap("<leader>dw", "<cmd>Trouble workspace_diagnostics<cr>")
    n_keymap("<leader>t", "<cmd>TodoTrouble<cr>")

    -- Nvim Tree
    n_keymap("<leader>e", vim.cmd.NvimTreeFindFileToggle)

    -- Buffer management
    n_keymap("<S-h>", vim.cmd.BufferPrevious)
    n_keymap("<S-l>", vim.cmd.BufferNext)
    n_keymap("<leader>bp", vim.cmd.BufferPick)
    n_keymap("<leader>ba", vim.cmd.BufferCloseAllButCurrent)
    n_keymap("<leader>bq", vim.cmd.BufferClose)
    n_keymap("<leader>bch", vim.cmd.BufferCloseBuffersLeft)
    n_keymap("<leader>bcl", vim.cmd.BufferCloseBuffersRight)
    n_keymap("<leader>b1", "<cmd>BufferGoto 1<cr>")
    n_keymap("<leader>b2", "<cmd>BufferGoto 2<cr>")
    n_keymap("<leader>b3", "<cmd>BufferGoto 3<cr>")

    -- Harpoon
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")
    n_keymap("<leader>h", harpoon_ui.toggle_quick_menu)
    n_keymap("<leader>a", harpoon_mark.add_file)

    -- Marks
    n_keymap("<leader>m", "<cmd>MarksListBuf<cr>")

    -- Git
    n_keymap("<leader>g", "<cmd>GitMessenger<cr>")
    -- Disable default <Space>gm binding to prevent delay for <Space>g
    vim.g.git_messenger_no_default_mappings = true

    -- LSP
    n_keymap("gd", function()
        fzf.lsp_definitions({ jump_to_single_result = true })
    end)
    n_keymap("gh", vim.lsp.buf.hover)
    n_keymap("gH", vim.diagnostic.open_float)
    n_keymap("gR", vim.lsp.buf.rename)
    n_keymap("ga", vim.lsp.buf.code_action)
    n_keymap("gf", utils_formatting.format)
    n_keymap("gu", "<cmd>:TypescriptRemoveUnused<cr>")
    n_keymap("go", "<cmd>:TypescriptOrganizeImports<cr>")

    -- Trouble
    n_keymap("gr", "<cmd>Trouble lsp_references<cr>")
end

local function set_insert_keymaps()
    i_keymap("jk", "<Esc>")

    -- Trouble
    local trouble = require("trouble")
    i_keymap("<C-n>", function()
        trouble.next({ jump = true })
    end)
    i_keymap("<C-p>", function()
        trouble.previous({ jump = true })
    end)
    i_keymap("<C-q>", "<cmd>TroubleClose<cr>")
end

local function set_visual_keymaps()
    v_keymap("<", "<gv")
    v_keymap(">", ">gv")
    v_keymap("p", '"_dP')
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

set_normal_keymaps()
set_insert_keymaps()
set_visual_keymaps()
