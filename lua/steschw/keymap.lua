local opts = { noremap = true, silent = true }

local keymap = function(mode, keys, cmd)
    vim.keymap.set(mode, keys, cmd, opts)
end

-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<S-h>", "<cmd>BufferPrevious<cr>")
keymap("n", "<S-l>", "<cmd>BufferNext<cr>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("v", "p", '"_dP')

-- Toggleterm
keymap("n", "<C-n>", "<cmd>lua _NODE_TOGGLE()<cr>")

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

local normalKeymaps = {
    ["<leader>w"] = {
        l = { "<C-w>v", "Split window to the right" },
        q = { "<C-w>q", "Close window" }
    },
    ["<leader>"] = {
        p = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
        c = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Find text under cursor" },
        f = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find text" },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Show help tags" },
        r = { "<cmd>lua require('telescope.builtin').registers()<cr>", "Show registers" },
        k = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "Show keymaps" },
        s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Show document symbols" },
        o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Show recently opened files" },
        d = { "<cmd>lua require('telescope.builtin').diagnostics({ bufnr=0 })<cr>", "Show buffer diagnostics" },
        ["<leader>"] = { "<cmd>Telescope resume<cr>", "Reopen last picker" }
    },
    ["<leader>n"] = { "<cmd>noh<cr>", "No highlight" },
    ["<leader>e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Reveil in explorer" },
    ["<leader>b"] = {
        h = { "<cmd>BufferPrevious<cr>", "Open previous buffer" },
        l = { "<cmd>BufferNext<cr>", "Open next buffer" },
        ["$"] = { "<cmd>BufferLast<cr>", "Open last buffer" },
        p = { "<cmd>BufferPick<cr>", "Pick buffer" },
        a = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all but current buffer" },
        q = { "<cmd>BufferClose<cr>", "Close buffer" },
        ch = { "<cmd>BufferCloseBuffersLeft<cr>", "Close buffers left" },
        cl = { "<cmd>BufferCloseBuffersRight<cr>", "Close buffers right" },
        ["1"] = { "<cmd>BufferGoto 1<cr>", "Goto buffer 1" },
        ["2"] = { "<cmd>BufferGoto 2<cr>", "Goto buffer 2" },
        ["3"] = { "<cmd>BufferGoto 3<cr>", "Goto buffer 3" },
        ["4"] = { "<cmd>BufferGoto 4<cr>", "Goto buffer 4" },
        ["5"] = { "<cmd>BufferGoto 5<cr>", "Goto buffer 5" },
        ["6"] = { "<cmd>BufferGoto 6<cr>", "Goto buffer 6" },
        ["7"] = { "<cmd>BufferGoto 7<cr>", "Goto buffer 7" },
        ["8"] = { "<cmd>BufferGoto 8<cr>", "Goto buffer 8" },
        ["9"] = { "<cmd>BufferGoto 9<cr>", "Goto buffer 9" },
    },
    ["<leader>m"] = {
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file to harpoon" },
        f = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Find harpooned files" },
        j = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Open next harpooned file" },
        k = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Open previous harpooned file" },
    },
    ["<leader>g"] = {
        h = { "<cmd>DiffviewFileHistory %<cr>", "Open Git file history" },
        q = { "<cmd>DiffviewClose<cr>", "Close Git diff" },
    },
    g = {
        d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", "LSP goto definition" },
        h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP signature" },
        --[[ TODO Check what implementation() actually means ]] --
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP implementation" },
        R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP rename symbol" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP code actions" },
        H = { "<cmd>lua vim.diagnostic.open_float()<CR>", "LSP help float" },
        f = { lsp_formatting, "LSP formatting" },
        o = { "<cmd>OrganizeImports<cr>", "Organize imports (TS)" },
        r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "LSP references" }
    }
}
local insertKeymaps = {
    ["<D>"] = {
        v = { "<C-r>+<cr>", "Paste" },
    },
    jk = { "<Esc>", "Switch to normal mode" },
}

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
    return
end

whichkey.register(normalKeymaps, {
    mode = "n"
})
whichkey.register(insertKeymaps, {
    mode = "i"
})
