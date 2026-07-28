# Copilot Instructions

## Commands

- There is no repository-level build, lint, or automated test runner in this repo, so there is no full-suite or single-test command to run.
- Start Neovim with `nvim`. On first launch, `lazy.nvim` bootstraps itself and installs specs from `lua/plugins/`.
- Sync plugin changes with `nvim --headless "+Lazy! sync" +qa`.
- Refresh Treesitter parsers with `nvim --headless "+TSUpdate" +qa`.
- Use `:Mason` inside Neovim to inspect Mason-managed tools and `:ConformInfo` to inspect which formatter will run for the current buffer.

## High-level architecture

- `init.lua` requires `config.lazy` first so plugin bootstrap and leader setup happen before the rest of the config, then applies a local Neovim 0.12-dev LSP workaround, global editor options, the colorscheme, and universal keymaps.
- `lua/config/lazy.lua` bootstraps `lazy.nvim`, disables `netrw`, sets `mapleader` and `maplocalleader`, and imports every plugin spec from `lua/plugins/`.
- Most behavior lives directly in `lua/plugins/*.lua`. There is no extra abstraction layer for plugin config, so cross-cutting behavior is assembled by coordinating multiple plugin spec files.
- Language tooling is intentionally split and needs to stay aligned across several files:
  - `mason.lua` installs external executables such as `stylua`, `debugpy`, `prettier`, and `prettierd`.
  - `nvim-lspconfig.lua` installs and auto-enables `lua_ls`, `pyright`, `r_language_server`, and `taplo`.
  - `conform.lua` maps filetypes to formatters and enables format-on-save.
  - `treesitter.lua` owns parser installation plus Treesitter highlighting and indent behavior.
  - `dap.lua` configures debugging UI and Python DAP integration on top of `debugpy`.
- Completion is also split by concern: `cmp.lua` defines sources and mappings, `snip.lua` loads snippets and the LuaSnip build hook, and `lspkind.lua` formats completion items.
- AI/editor assistant features are intentionally separate instead of centralized: `copilot.lua` configures Copilot plus `sidekick.nvim`, `codecompanion.lua` routes chat and inline actions through Gemini, and `aider.lua` wires both `nvim-aider` and the active file explorer (`neo-tree`).
- The repo keeps old or alternate integrations commented out in-place (`tree.lua`, `gemini.lua`, parts of `cmp.lua`, CopilotChat in `copilot.lua`). Treat those as reference configurations, not dead code to delete by default.
- R support is a special-case workflow in `r.lua` and assumes a Windows Scoop install through a hardcoded `R_path`.

## Key conventions

- Keep new behavior modular by editing or adding files under `lua/plugins/`; leave `init.lua` for editor-wide defaults and truly global mappings.
- Follow the existing lazy.nvim spec style: most files return a single `plugin` or `plugins` table directly.
- Prefer plugin-local mappings in each spec's `keys` field. Global `vim.keymap.set` calls are mostly reserved for universal editor behavior.
- When adding or changing a language, update every relevant layer together: Treesitter parser, Mason package, LSP server, formatter, and DAP support if the language should be debuggable.
- The active file explorer is `neo-tree` configured in `aider.lua`; `tree.lua` is only a commented legacy `nvim-tree` setup.
- Keymap namespaces are already crowded: `<leader>a` is shared by Aider and Sidekick, `<leader>c` is used by CodeCompanion, and `<F5>` toggles Neo-tree. Check for collisions before adding new mappings.
- External tooling is part of the contract. `setup.md` expects `git`, `curl`, `unzip`, `ripgrep`, `fd`, Node.js, Python, R, and a C compiler; many apparent config bugs are really missing runtime dependencies.
- Machine-specific assumptions matter here: `snip.lua` uses the Windows PowerShell build hook in `luasnip_jsregexp_build.ps1`, `codecompanion.lua` expects `GEMINI_API_KEY` plus a `gemini` CLI on `PATH`, and `r.lua` hardcodes the local R installation path.
- Keep the existing 2-space indentation and preserve the repo's habit of leaving alternate plugin setups commented out for later reuse.
