# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Structure

This is a personal dotfiles repository containing configuration files for various development tools:

- `fish/` - Fish shell configuration and functions
- `vim/` - Neovim configuration using Lazy.nvim plugin manager
- `ghostty/` - Ghostty terminal emulator configuration
- `bin/` - Custom utility scripts
- `misc/` - Miscellaneous configuration files

## Architecture

### Neovim Configuration
- Uses Lazy.nvim as the plugin manager (`vim/lua/config/lazy.lua`)
- Modular configuration split across `vim/lua/config/` directory
- LSP setup supports multiple languages: Python (pyright + ruff), Go (gopls), TypeScript/JavaScript (ts_ls), Lua (lua_ls), C/C++ (clangd), HTML, JSON, and Zig (zls)
- Plugin configurations are in `vim/lua/plugins/` with each plugin in its own file

### Fish Shell Setup
- Environment variables and aliases in `fish/config.fish`
- Custom prompt with git integration in `fish/functions/fish_prompt.fish`
- Uses fzf with ripgrep for file searching
- Configured for Python virtual environment isolation

### Development Environment
- Editor: Neovim (aliased as vim/vi)
- Shell: Fish
- Terminal: Ghostty with Nord theme and SF Mono font
- Package managers: Bun (JavaScript), asdf (version management)
- Go development path: `$HOME/src/go`

## Common Commands

### Linking dotfiles
```bash
ln -s /path/to/dotfiles/fish ~/.config/fish
ln -s /path/to/dotfiles/vim ~/.config/nvim
ln -s /path/to/dotfiles/ghostty ~/.config/ghostty
```

### Neovim Plugin Management
- `:Lazy` - Open Lazy.nvim plugin manager
- `:LspInfo` - Show LSP client information

### Utility Scripts
- `bin/fixdc.sh` - Remove DC offset from audio files using sox
- `bin/fsyn.sh` - Audio synthesis utility  
- `bin/youdl.sh` - YouTube download utility

## Key Features

- LSP configurations with diagnostics displayed via signs (no virtual text)
- Fish prompt shows current directory, git status, and command exit status
- FZF integration for file searching with ripgrep
- Python development with virtual environment enforcement
- Multi-language support with consistent LSP setup patterns