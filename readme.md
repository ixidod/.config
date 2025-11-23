# Dotfiles and CLI Toolkit

This directory holds the configuration that keeps my terminal-centric workflow consistent across machines. Everything is meant to live inside `~/.config`, so restoring the environment usually only requires cloning this repo (or syncing the files) and symlinking the folders that matter on a new host.

## Quick Start

1. Clone or copy this directory into place: `git clone <repo> ~/.config`.
2. For each tool you care about, symlink its subdirectory into the location the tool expects (most utilities already read directly from `~/.config/<tool>`).
3. Launch the app (Neovim, tmux, zsh, etc.) and verify nothing errors. Missing binaries will be called out in the relevant section below.
4. For Neovim, follow the `nvim/plugins.txt` instructions once to install plugins, then run the update loop in that file whenever you want to refresh them.

## Repository Layout

| Path | Purpose |
| --- | --- |
| `gh/` | GitHub CLI defaults such as protocol, aliasing (`gh co` → `gh pr checkout`), and host profile. |
| `nvim/` | Lua-based Neovim configuration with plugins, LSP/autocompletion, and formatting rules. |
| `tmux/` | tmux 3.2+ configuration that remaps the prefix, adjusts status styling, and defines pane helpers. |
| `zsh/` | Zsh dotfiles (`.zshrc`, completion caches, history, session files). |

## Neovim (`nvim/`)

- Core options (`init.lua`) enable the Rose Pine colorscheme, relative numbers, 2-space indentation, a low `timeoutlen`, netrw tweaks, and clipboard integration.
- Plugins are managed manually via `nvim/plugins.txt`; run the `git clone …` block once and revisit the `for d in *; do …` loop to update. Key plugins:
  - UI/quality: `rose-pine/neovim`, `nvim-treesitter`, `nvim-telescope`, `windwp/nvim-autopairs`.
  - LSP/completion: `nvim-lspconfig`, `nvim-cmp` plus `cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, and `LuaSnip`.
  - Formatting/tooling: `stevearc/conform.nvim`, `vim-terraform`, `vim-go`, `vim-closetag`, `plenary.nvim`.
- `after/plugin/*.lua` files configure each plugin:
  - `cmp.lua` wires up `<C-Space>` for completion, `<CR>` to confirm, and bordered completion/doc popups.
  - `autopairs.lua` integrates Treesitter-aware pairing and hooks into `cmp` confirmations.
  - `telescope.lua` exposes `<leader>pf`, `<C-p>`, and `<leader>ps` search bindings.
  - `treesitter.lua` enables highlighting with automatic parser installation.
  - `rose-pine.lua` customizes palette groups so StatusLine, CursorLine, etc. feel cohesive.
  - `conform.lua` defines formatters per filetype with format-on-save (2s timeout, fallback to LSP). External tools you’ll want installed: `prettierd`, `prettier`, `stylua`, `isort`, `black`, `tofu_fmt`, `sqlfluff`.
  - `lsp.lua` declaratively registers servers (`yamlls`, `pyright`, `gopls`, `lua_ls`, `terraformls`, `helm_ls`, `html`, `sqls`) and attaches buffer-local keymaps (`gd`, `gr`, `<F2>` rename, `<F3>` format, `<F4>` code action, `<leader>e` diagnostics, etc.).
- Additional binaries that improve the experience: `gopls`, `terraform-ls`/`opentofu` formatter, `helm_ls`, `sqls`, and `sqlfluff`. See the comments at the bottom of `plugins.txt` for Homebrew/Go install hints.

## tmux (`tmux/tmux.conf`)

- Prefix is remapped to `Ctrl-a`; `Ctrl-a` sends the prefix twice if needed (`bind-key C-a send-prefix`).
- Reload quickly via `prefix + r`, which also pops a “reload!!” message.
- Pane management mirrors Vim: `prefix + h/j/k/l` to move, `H/J/K/L` (repeatable) to resize by 5 cells.
- Splits use `prefix + -` (horizontal) and `prefix + |` (vertical). Pane indexes start at 1 with `mode-keys vi`.
- Visual tweaks set a minimal statusline (`status-left/right` empty) using orange-on-black accents, and enable RGB support via `default-terminal "tmux-256color"` plus `terminal-features`.
- Extra niceties: escape-time lowered to 1ms for snappy key chords, popup window bound to `prefix + p` and centered at 80% size.

## GitHub CLI (`gh/`)

- Global `git_protocol` is HTTPS for compatibility on locked-down networks.
- Prompting is enabled (no editor-based prompt), spinner stays on, and color labels are disabled for consistent output across terminals.
- `aliases.co` shortens `gh pr checkout`, and `hosts.yml` keeps tokens scoped to the `ixidod` GitHub account.

## Zsh (`zsh/.zshrc`)

- Targets macOS with Homebrew in `/opt/homebrew`, so it sources `brew shellenv` **before** running `compinit`.
- Python tooling is configured through `pyenv`; the init snippets ensure shims precede other PATH entries.
- Editor defaults to Neovim (`EDITOR=nvim`), `bindkey -v` enables vi-style line editing, and `vi` is aliased to `nvim`.
- Useful aliases: `snowsql` points to the GUI install, and `nvim-update` loops through every plugin repo under `~/.local/share/nvim/site/pack`.
- PATH includes Homebrew, Go (`GOPATH/bin`), pyenv shims, and user-specific bins; `NO_CASE_GLOB` keeps filename matches case-insensitive.
- Completion setup loads native `compinit`, then `bashcompinit` for Terraform, while `fzf` keybindings are sourced via `source <(fzf --zsh)` and `complete -C /opt/homebrew/bin/terraform terraform` wires terraform completions.

---

When in doubt, read the Lua files next to the tool you’re tweaking; they’re short by design and heavily commented where behavior is not obvious. Pull requests and notes-to-self about why a specific choice was made are welcome—document them here to keep future migrations easy.
