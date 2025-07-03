# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages shell configuration, development tools, and terminal environment setup. The architecture follows a symlink-based approach with automated installation and backup systems.

## Installation and Setup

The main installation command is:
```bash
bash bootstrap
```

This script handles:
- Homebrew installation and package management via `brew/Brewfile`
- Tool version management setup (mise)
- ZSH configuration with ZIM framework
- Symlink creation for all dotfiles with automatic backup

## Architecture

### Configuration Structure
- **Shell (ZSH)**: Main config in `.zshrc`, modular setup in `.zsh/` directory
- **Git**: Configuration in `.gitconfig` with custom aliases and workflow integration
- **Tmux**: Main config in `.tmux.conf` with macOS-specific overrides in `.tmux.mac.conf`
- **Editors**: Vim configuration split across multiple files in `vim/` directory, minimal Neovim setup
- **Package Management**: Homebrew managed via `brew/Brewfile`

### Key Components
- `.zsh/functions.zsh`: Contains tmux session management and Git workflow functions
- `.zsh/aliases.zsh`: Command aliases for modern CLI tools
- `bootstrap`: Main installation script with robust error handling and logging
- `.github/workflows/tests.yml`: CI pipeline for testing bootstrap process

## Development Workflow

### Tmux-Centric Approach
The setup is optimized for tmux-based development with functions that integrate Git repository management:
- `tmux_select_git_repo()`: FZF-based repository selection with tmux session creation
- `tmux_select_work()`: Work directory navigation
- `git_worktree_dir_of()`: Git worktree directory resolution

### Git Integration
Custom Git aliases and functions for:
- Worktree management (`gWd` alias for retrieving worktree paths)
- GitHub CLI integration
- Repository cloning and management via ghq

## Tool Stack
- **Shell Framework**: ZIM for ZSH with modules for completion, fzf, syntax highlighting
- **Prompt**: Starship
- **Package Management**: Homebrew + mise for tool versions
- **Modern CLI Tools**: eza, bat, fzf, ghq, GitHub CLI

## Testing
The repository includes automated testing via GitHub Actions that verifies the bootstrap process on macOS.

## File Editing Restrictions

- **Scope Limitation**: Only edit files within this dotfiles repository directory. 
- **No External Edits**: Never edit files in `/tmp/`, home directory, or any other locations outside this repository.
- **Temporary Files**: If temporary files are needed, create them in `./tmp/` within the repository.

## Common Tasks
- **Update packages**: Run `brew bundle` from `brew/` directory
- **Test installation**: The bootstrap script can be run multiple times safely
- **Add new dotfile**: Place in repository root, re-run bootstrap to create symlink