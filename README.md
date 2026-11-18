# Gruvbox Material Dark Custom

Personal variant of [Gruvbox Material](https://github.com/sainnhe/gruvbox-material-vscode) by [sainnhe](https://github.com/sainnhe) — only the **Dark** theme (medium contrast), with custom workbench and syntax colors baked in, so no `workbench.colorCustomizations` are needed in `settings.json`.

## Structure

- `themes/gruvbox-material-dark.base.json` — upstream theme (v6.5.2, generated output, medium contrast)
- `themes/overrides.json` — personal changes (`colors` + `tokenColors`)
- `themes/gruvbox-material-dark-custom.json` — merged theme (generated, do not edit by hand)

## Edit colors

1. Edit `themes/overrides.json`
2. `npm run package` → produces `gruvbox-material-custom-x.y.z.vsix`
3. Install: Command Palette → **Extensions: Install from VSIX...** (or `antigravity --install-extension <file>.vsix`)

## Credits

Based on Gruvbox Material © 2020 sainnhe, MIT License.

## Dart notes

When a Dart file opens, VS Code first colors it with the TextMate grammar and then, a few seconds later, the Dart analysis server applies semantic tokens. The overrides make the grammar colors match the semantic ones (types, keywords, annotations, doc references) to minimize color changes on load.

Import/export URIs are green while other strings stay yellow, even with semantic highlighting on. Semantic `string` tokens resolve against the generic `string` selector, so `overrides.json` → `replaceScopes` swaps it for specific selectors (`string.quoted`, `string.interpolated`, …). Semantic strings then get no theme color and keep the grammar's color.
