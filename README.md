# AstroNvim User Configuration

**NOTE:** This configuration is for AstroNvim v5+.

A personal [AstroNvim](https://github.com/AstroNvim/AstroNvim) user config with Lazy.nvim, AstroCommunity packs, and custom plugins.

## Structure

- **`init.lua`** — Bootstraps Lazy.nvim, then loads `lazy_setup` and `polish`.
- **`lua/lazy_setup.lua`** — Plugin specs and lazy.nvim setup.
- **`lua/community.lua`** — AstroCommunity imports (Lua, TypeScript, Biome, oxlint, lazydocker, vim-tmux-navigator, ts-error-translator).
- **`lua/plugins/`** — Plugin configs (astrocore, astroui, astrolsp, mason, treesitter, none-ls, cursorcli, cursortab, blink, etc.).
- **`lua/polish.lua`** — Final polish and user preferences.

## Installation

#### Back up existing Neovim data

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone this repo

```shell
git clone https://github.com/suiramdev/astronvim-config.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

On first run, Lazy.nvim will install plugins. Restart Neovim if prompted.

## Requirements

- Neovim 0.10+ (for AstroNvim v5)
- Git
