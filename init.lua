if vim.g.vscode == nil then
    require "steschw.options"
    require "steschw.plugins"
    require "steschw.colorscheme"
    require "steschw.cmp"
    require "steschw.lsp"
    require "steschw.treesitter"
    require "steschw.telescope"
    require "steschw.autopairs"
    require "steschw.comment"
    require "steschw.nvim-tree"
    require "steschw.harpoon"
    require "steschw.barbar"
    require "steschw.lualine"
    require "steschw.marks"
    require "steschw.todo-comments"
    require "steschw.dressing"
    -- Load keymaps after whichkey was initialized
    require "steschw.keymap"
else
    require "steschw.vscode"
end
