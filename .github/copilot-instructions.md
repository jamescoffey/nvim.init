# Copilot Instructions

## Build, test, and lint commands

- This repository is a Neovim config and does **not** provide a project-level build, lint, or test runner.
- Full suite: **N/A**
- Single test: **N/A**
- Bootstrap/sync plugins after plugin-spec edits:
  - `nvim --headless "+Lazy! sync" +qa`
- Refresh Treesitter parsers:
  - `nvim --headless "+TSUpdate" +qa`
- In-editor diagnostics/verification:
  - `:Mason` to inspect installed external tools
  - `:ConformInfo` to see active formatter resolution for the current buffer

## High-level architecture

- Startup flow is intentional: `init.lua` loads `config.lazy` first, then applies global options/keymaps/colorscheme plus a local Neovim 0.12-dev LSP save workaround.
- `lua/config/lazy.lua` bootstraps `lazy.nvim`, sets leaders, disables `netrw`, and imports every plugin spec from `lua/plugins/`.
- Most behavior is assembled across independent plugin spec files (no extra orchestration layer), so cross-cutting changes typically touch multiple files.
- Language support is distributed and must stay aligned:
  - `mason.lua` manages external binaries (`stylua`, `debugpy`, `eslint_d`, `prettier`, `prettierd`, etc.).
  - `nvim-lspconfig.lua` configures LSP enablement (`lua_ls`, `pyright`, `taplo`) and custom/manual `r_language_server` startup.
  - `conform.lua` maps filetypes to formatters and enables format-on-save.
  - `treesitter.lua` manages parser install/highlight/indent behavior.
  - `dap.lua` provides DAP UI plus Python debug adapter wiring.
- AI integrations are intentionally separate:
  - `copilot.lua` (`copilot.lua` + `sidekick.nvim`)
  - `codecompanion.lua` (Gemini adapter + CLI agent integration)
  - `aider.lua` (`nvim-aider` plus `neo-tree` integration)

## Key conventions

- Add/modify features in `lua/plugins/*.lua`; keep `init.lua` focused on global editor defaults and universal mappings.
- Follow existing lazy.nvim spec style (single returned `plugin` or `plugins` table; plugin-local mappings in each spec’s `keys`).
- Preserve commented alternate integrations unless asked to remove them (`tree.lua`, `avante.lua`, commented CopilotChat/cmp-r blocks, etc.); these are retained as reusable reference setups.
- When adding or changing a language/toolchain, update all relevant surfaces together: Mason package(s), LSP setup, formatter mapping, Treesitter parser, and DAP support (if debugging is expected).
- Watch keymap collisions before adding mappings: `<leader>a` is shared by Aider/Sidekick, `<leader>c` by CodeCompanion, and `<F5>` toggles Neo-tree.
- Environment assumptions are part of expected behavior:
  - Windows-focused setup and PowerShell-based LuaSnip build hook (`luasnip_jsregexp_build.ps1`)
  - `codecompanion.lua` expects `GEMINI_API_KEY` and `gemini` CLI on `PATH`
  - R tooling may rely on Scoop-style paths/fallbacks in LSP/R plugin config
