# nvim-config

![](./you-know.jpg)

## Requirements

- Neovim v0.8
- [Nerd Font](https://github.com/ryanoasis/nerd-fonts)

## Setup

1. `mkdir -p ~/.config`
2. `cd ~/.config`
3. `git clone git@github.com:steschwa/nvim-config.git nvim`
4. `nvim ~/.config/nvim/lua/steschw/plugins.lua`
5. (Inside Neovim): `:PackerSync`
6. Close and reopen Neovim

### LSP

LSP related stuff like language servers, linters and formatters are installed using [Mason](https://github.com/williamboman/mason.nvim).
Type `:Mason` inside Neovim to view, install, update and delete LSP stuff.
For convenience `sumneko_lua`, `tsserver`, `jsonls` and `cssls` are setup to be installed automatically.
