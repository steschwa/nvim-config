if vim.g.vscode == nil then
    require "steschw.options"
    require "steschw.plugins"
    require "steschw.colorscheme"
    require "steschw.hl-groups"
    require "steschw.cmp"
    require "steschw.lsp"
    require "steschw.treesitter"
    require "steschw.trouble"
    require "steschw.fzf"
    require "steschw.autopairs"
    require "steschw.comment"
    require "steschw.nvim-tree"
    require "steschw.harpoon"
    require "steschw.barbar"
    require "steschw.lualine"
    require "steschw.marks"
    require "steschw.todo-comments"
    require "steschw.surround"
    require "steschw.dressing"
    require "steschw.glow"
    require "steschw.keymap"
else
    require "steschw.vscode"
end
