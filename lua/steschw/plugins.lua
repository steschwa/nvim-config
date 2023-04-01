local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "kyazdani42/nvim-web-devicons"
    use "romgrk/barbar.nvim"
    use "numToStr/Comment.nvim"
    use "nvim-lualine/lualine.nvim"
    use "ThePrimeagen/harpoon"
    use "chentoast/marks.nvim"
    use "rhysd/git-messenger.vim"
    use "kylechui/nvim-surround"

    use "MunifTanjim/nui.nvim"
    use "stevearc/dressing.nvim"

    -- Colorscheme
    use "gbprod/nord.nvim"

    -- File tree
    use "kyazdani42/nvim-tree.lua"

    -- Cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "onsails/lspkind.nvim"

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig" -- enable LSP
    use "jose-elias-alvarez/typescript.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "folke/trouble.nvim"
    use "folke/todo-comments.nvim"
    use "windwp/nvim-autopairs"

    -- Telescope
    use "ibhagwan/fzf-lua"

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "windwp/nvim-ts-autotag"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
