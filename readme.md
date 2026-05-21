# dotfiles

Personal config tracked in `~/.config`. No install script — everything is set up manually and intentionally.

## Structure

```
~/.config/
├── nvim/           # Neovim config (plugin-free, built-in LSP)
├── zsh/            # Shell config (.zshrc lives here, not ~/.zshrc)
   └── completion/ # Custom zsh completions

```

## Neovim

No plugin manager. Uses Neovim's built-in LSP (`vim.lsp`) and native completion (`vim.lsp.completion`). Theme is nord.

**LSP setup** (`nvim/lua/lsp/`):

| File | Server | Language |
|------|--------|----------|
| `go.lua` | gopls | Go |
| `java.lua` | jdtls | Java |
| `kb.lua` | shared | keymaps + completion wired on LspAttach |

**Keymaps** (active when LSP attaches):

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `gr` | References |
| `<C-Space>` | Trigger completion |

**On save:**
- Go: format + organize imports via gopls
- Java: format via jdtls, organize imports via `saveActions`

**jdtls** expects the server jar at `~/.local/share/jdtls/`. Workspace data is isolated per project root (`stdpath("data")/jdtls/<project-name>`).

## Shell

zsh with vi mode. Config lives at `~/.config/zsh/.zshrc` (set via `ZDOTDIR`).

**PATH order:** `/usr/local/go/bin` → `~/.local/bin` → `~/.go/bin` → system

**Completions** in `~/.config/zsh/completion/`: gh, helm, kind, ko, kubebuilder, kubectl, pip, podman, spring

Compinit runs with a 24-hour cache check to keep startup fast.

## Go

Installed at `/usr/local/go`. `GOPATH` is `~/.go`, binaries land in `~/.go/bin`.

## Java

Managed via [SDKMAN](https://sdkman.io/) — sourced at the end of `.zshrc` as required. Spring CLI also installed via SDKMAN.

## Binaries

No Homebrew. Binaries installed manually to `~/.local/bin` via curl or SDKMAN. Current residents: claude, duckdb, ffmpeg, fzf, gcloud, gh, helm, jdtls, jq, kind, ko, kubebuilder, kubectl, node, nvim, podman, protoc, rg, terraform, tree, uv, yt-dlp.
