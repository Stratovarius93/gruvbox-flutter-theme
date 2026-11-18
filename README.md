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

## Credits

- Color theme based on Gruvbox Material © 2020 sainnhe, MIT License (`LICENSE`).
- File icons from gruvbox-material-icons © 2025 navernoedenis, MIT License (`THIRD_PARTY_LICENSE-gruvbox-material-icons.txt`).

## Dart notes

When a Dart file opens, VS Code first colors it with the TextMate grammar and then, a few seconds later, the Dart analysis server applies semantic tokens. The overrides make the grammar colors match the semantic ones (types, keywords, annotations, doc references) to minimize color changes on load.

Import/export URIs are green while other strings stay yellow, even with semantic highlighting on. Semantic `string` tokens resolve against the generic `string` selector, so `overrides.json` → `replaceScopes` swaps it for specific selectors (`string.quoted`, `string.interpolated`, …). Semantic strings then get no theme color and keep the grammar's color.
