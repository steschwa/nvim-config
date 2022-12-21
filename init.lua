if vim.g.vscode == nil then
    require "steschw.options"
    require "steschw.plugins"
    require "steschw.colorscheme"
    require "steschw.cmp"
    require "steschw.lsp"
    require "steschw.telescope"
    require "steschw.treesitter"
    require "steschw.autopairs"
    require "steschw.comment"
    require "steschw.nvim-tree"
    require "steschw.toggleterm"
    require "steschw.harpoon"
    require "steschw.barbar"
    require "steschw.lualine"
    require "steschw.marks"
    -- Load keymaps after whichkey was initialized
    require "steschw.keymap"
else
    require "steschw.vscode"
end
