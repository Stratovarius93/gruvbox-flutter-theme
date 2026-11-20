# Gruvbox Flutter Theme

Personal variant of [Gruvbox Material](https://github.com/sainnhe/gruvbox-material-vscode) by [sainnhe](https://github.com/sainnhe) — only the **Dark** theme (medium contrast), with custom workbench and syntax colors baked in, so no `workbench.colorCustomizations` are needed in `settings.json`.

## Structure

- `themes/gruvbox-material-dark.base.json` — upstream theme (v6.5.2, generated output, medium contrast)
- `themes/overrides.json` — personal changes (`colors` + `tokenColors`)
- `themes/gruvbox-flutter-theme.json` — merged theme (generated, do not edit by hand)
- `iconthemes/gruvbox-material-icons.json` + `icons/` — file icon theme **Gruvbox Flutter Icons**, copied from [gruvbox-material-icons](https://github.com/navernoedenis/gruvbox-material-icons) v4.7.0 (only the SVGs it references)

## Edit colors

1. Edit `themes/overrides.json`
2. `npm run package` → produces `gruvbox-flutter-theme-x.y.z.vsix`
3. Install: Command Palette → **Extensions: Install from VSIX...** (or `antigravity --install-extension <file>.vsix`)

## Use the icons

The extension ships two independent themes; pick each one separately:

- Color theme: Command Palette → **Preferences: Color Theme** → **Gruvbox Flutter Theme**
- File icons: Command Palette → **Preferences: File Icon Theme** → **Gruvbox Flutter Icons**

Or in `settings.json`:

```jsonc
"workbench.colorTheme": "Gruvbox Flutter Theme",
"workbench.iconTheme": "gruvbox-flutter-icons"
```

If you had the original `navernoedenis.gruvbox-material-icons` installed, you can uninstall it; the icons look the same.

## Update the icons

The icons are a static copy of the original extension's generated `dist/material-icons.json`. The settings and commands that the original extension offers for customizing its icons do not apply here. To refresh them from a newer release:

1. Install the latest `navernoedenis.gruvbox-material-icons` temporarily
2. Copy its `dist/material-icons.json` to `iconthemes/gruvbox-material-icons.json`
3. Replace `icons/` with only the SVGs referenced by that JSON (paths are `./../icons/<file>.svg`)
4. Update the version noted under **Structure**, bump `package.json`, `npm run package`, reinstall and uninstall the original again

## Neovim

The same colors are available as a Neovim colorscheme (Neovim 0.10+, `termguicolors`). The repo root is a Neovim plugin; the VS Code package excludes these files.

- `lua/gruvbox-flutter/init.lua` — palette and highlight groups (UI, Treesitter, LSP semantic tokens, diagnostics, common plugins)
- `colors/gruvbox-flutter.lua` — `:colorscheme gruvbox-flutter`
- `queries/dart/highlights.scm` — extra Dart captures so Treesitter matches the VS Code grammar (green import URIs, red `void`, orange `is`, grey `.`)

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "Stratovarius93/gruvbox-flutter-theme",
  lazy = false,
  priority = 1000,
  config = function() vim.cmd.colorscheme("gruvbox-flutter") end,
}
```

For the closest match with VS Code, enable Treesitter highlighting with the `dart` parser and the Dart LSP (`dart language-server`), whose semantic tokens color methods, variables and enum members. The palette is maintained by hand: when you change a color in `themes/overrides.json`, update `M.palette` too.

## Warp

`warp/gruvbox_flutter.yaml` is a [Warp](https://www.warp.dev) terminal theme with the same background, foreground, cursor and ANSI colors as the VS Code terminal. Bright colors use classic Gruvbox so bold/bright text stands out, and ANSI black is `#3c3836` so it stays visible on the background.

```sh
mkdir -p ~/.warp/themes
cp warp/gruvbox_flutter.yaml ~/.warp/themes/
```

Then pick **Gruvbox Flutter** in Warp → Settings → Appearance → Themes.

## Credits

- Color theme based on Gruvbox Material © 2020 sainnhe, MIT License (`LICENSE`).
- File icons from gruvbox-material-icons © 2025 navernoedenis, MIT License (`THIRD_PARTY_LICENSE-gruvbox-material-icons.txt`).

## Dart notes

When a Dart file opens, VS Code first colors it with the TextMate grammar and then, a few seconds later, the Dart analysis server applies semantic tokens. The overrides make the grammar colors match the semantic ones (types, keywords, annotations, doc references) to minimize color changes on load.

Import/export URIs are green while other strings stay yellow, even with semantic highlighting on. Semantic `string` tokens resolve against the generic `string` selector, so `overrides.json` → `replaceScopes` swaps it for specific selectors (`string.quoted`, `string.interpolated`, …). Semantic strings then get no theme color and keep the grammar's color.
